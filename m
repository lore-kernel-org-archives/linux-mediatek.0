Return-Path: <SRS0=VhZj=D4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66011C388F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:53:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B62852173E
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Oct 2020 16:53:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nlxNpbzy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nd2u+8mc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B62852173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1wEmkjIJ5rJd5Agyk/4iLqcpleopoW3cnCOPGfrGZDs=; b=nlxNpbzy5ZGFL0HPDLfpiHGBC
	j4cTArcuN0cENMdR9zwnsk0pI+mH5AIcOQIAPI7VzIhkEUHxF4fgVAcNH7LtxXFNvzt72KymkctOs
	xA9BKwr0ivsJk0DH69uK+ewGM7DLzPlxGBirDZnLnWMON+clf736YOBqHOq/J27MjRSHoEibm/85X
	9LgsYOK3x885KoLxXAv1gpxUUSdp6ysQDqVHllw97ETIdDK2+0txQldrxSIc6WhXPfjLfFYWTX/xD
	cbkob52QPD3tIbev+6REpY7rX+rc00qAhdhvnqRCYI5S2Un8IdSRcERi8DqyLvCtEC4tR0XWKIaIO
	kw41y/PTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVHMq-0008D4-Kr; Wed, 21 Oct 2020 16:53:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVHMl-0008BX-0a; Wed, 21 Oct 2020 16:53:36 +0000
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25417223C6;
 Wed, 21 Oct 2020 16:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603299213;
 bh=tysafz95EGrDRAd4koiebqQvSihPyKOlLcDwNX9+/pI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Nd2u+8mcPJFj67p+FKZqC9bf8zyoXyKNuleNaz2o3D31Mb+PFWuxazOaqZBcAmSKG
 /lUrkLr5YixxzONPBEsAAduba0ND2P5zQy2SVOVui0KddeRU/uuJUzhgbapF6BUjkE
 rGxxTL3kEyG1x8l0t+f7XznXMBvd3PvqxopdMV0g=
Received: by mail-ej1-f41.google.com with SMTP id h24so4231176ejg.9;
 Wed, 21 Oct 2020 09:53:33 -0700 (PDT)
X-Gm-Message-State: AOAM532D9vLDP1FiA4PRPkz3UzfVN4XBA+lY4yCn+xRZ4hul1zS18Zqs
 B+oZ3FlN8zdy9935KQpqb3fOkzjUUHQkG61A9Q==
X-Google-Smtp-Source: ABdhPJxYbs5q0DLX41jjFeTCIyysgme2FgAo9xaY3pF7NcxvbRkwTiWrHViLgF5ogY6yUTJoIVQ1f8qIeUuK06BO6Ek=
X-Received: by 2002:a17:906:7fd7:: with SMTP id
 r23mr4284124ejs.310.1603299211543; 
 Wed, 21 Oct 2020 09:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201020152639.21950-1-matthias.bgg@kernel.org>
In-Reply-To: <20201020152639.21950-1-matthias.bgg@kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 22 Oct 2020 00:53:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY__MegNwaUGphYNpnKrC_y8SX-_rDNXGxsaBJ6FDBKsQ_w@mail.gmail.com>
Message-ID: <CAAOTY__MegNwaUGphYNpnKrC_y8SX-_rDNXGxsaBJ6FDBKsQ_w@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: change mediatek wiki page
To: matthias.bgg@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_125335_168546_7F39C123 
X-CRM114-Status: GOOD (  18.52  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: kuohong.wang@mediatek.com, yh.chen@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Miles.Chen@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe.Chen@mediatek.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIE1hdHRoaWFzOgoKPG1hdHRoaWFzLmJnZ0BrZXJuZWwub3JnPiDmlrwgMjAyMOW5tDEw5pyI
MjDml6Ug6YCx5LqMIOS4i+WNiDExOjI35a+r6YGT77yaCj4KPiBGcm9tOiBNYXR0aGlhcyBCcnVn
Z2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPgo+Cj4gVGhlIG9sZCB3aWtpIHBhZ2UgdW5mb3J0
dW5hdGVseSBnb3QgbG9zdCBieSBzZXJ2ZXIgY3Jhc2guCj4gVGhlIG5ldyB3aWtpIGNhbiBiZSBm
b3VuZCBvbiB0aGUga2VybmVsLm9yZyBpbmZyYXN0cnVjdHVyZQo+CgpSZXZpZXdlZC1ieTogQ2h1
bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IE1h
dHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+Cj4gLS0tCj4gIE1BSU5UQUlO
RVJTIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCj4gaW5kZXggMTRi
OGVjMGJiNThiLi43ZDAwODg3ODJhOWYgMTAwNjQ0Cj4gLS0tIGEvTUFJTlRBSU5FUlMKPiArKysg
Yi9NQUlOVEFJTkVSUwo+IEBAIC0yMDY3LDcgKzIwNjcsNyBAQCBNOiAgICAgICAgTWF0dGhpYXMg
QnJ1Z2dlciA8bWF0dGhpYXMuYmdnQGdtYWlsLmNvbT4KPiAgTDogICAgIGxpbnV4LWFybS1rZXJu
ZWxAbGlzdHMuaW5mcmFkZWFkLm9yZyAobW9kZXJhdGVkIGZvciBub24tc3Vic2NyaWJlcnMpCj4g
IEw6ICAgICBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIChtb2RlcmF0ZWQgZm9y
IG5vbi1zdWJzY3JpYmVycykKPiAgUzogICAgIE1haW50YWluZWQKPiAtVzogICAgIGh0dHBzOi8v
bXRrLmJjbmZzLm9yZy8KPiArVzogICAgIGh0dHBzOi8vbXRrLndpa2kua2VybmVsLm9yZy8KPiAg
QzogICAgIGlyYzovL2NoYXQuZnJlZW5vZGUubmV0L2xpbnV4LW1lZGlhdGVrCj4gIEY6ICAgICBh
cmNoL2FybS9ib290L2R0cy9tdDYqCj4gIEY6ICAgICBhcmNoL2FybS9ib290L2R0cy9tdDcqCj4g
LS0KPiAyLjI4LjAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
