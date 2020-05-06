Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E90CC28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 13:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02BC1206DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 13:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ga4TeqQr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4dRvoo6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02BC1206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XFPyAWcpkvYVCT+GeQA8Z4/zaE92kpfLBGTnzJAPRBo=; b=Ga4TeqQr5EQPz2
	FcGsDUu8X3pP1S4qBZM3usRDHdgeYxCWGn/Y0NSwpJi/MH+nBGIt3PcxbmXMcEY096X/01SiDr3hn
	T9c5cCvhpI6ojE4gLpEKZ++x6q+Yu1g5tVkTCdcQxNMiUTCNdwzshbc7c1HslyvmSQ0c7j5T4nFev
	991N43JfM8ptQdKXaL5c8Q2PppowXwEz+OMtQfjsRQLIt5vUQO+3EJBVdkZCRAyq19HFEocMmfBx4
	qit5dH36FyTk7bQTWGVOnsuzKRPxZevQmbjvrrK6XCityz82JO/GwUZkkVOwVDwIh3aY3ZGxMxOMb
	LADbJSRo2XrOtbdgjZOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWJgR-0006wr-Ko; Wed, 06 May 2020 13:01:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWJgH-0006lP-EK; Wed, 06 May 2020 13:01:46 +0000
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D78E5206DD;
 Wed,  6 May 2020 13:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588770105;
 bh=sQPtx1IaJT17mYcGEwphgUj7Th54XCa2l0rTr5A6suc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d4dRvoo6myiw+4TGn6t+D3ZiwSj4ULil+cbsBGYjE7NzgGwmn3LSudeZGa3rVUVNo
 Q/7BO5jc29DtgPLDymu8hPMrA9iuC6YfpUjlC4oB/2X/ujB6bqKCPg+nIxR2+eeW0X
 8wpt+LXVS+Vn8MlY294ANKu5qUATl6utH+qt9y8w=
Received: by mail-ej1-f53.google.com with SMTP id re23so1246945ejb.4;
 Wed, 06 May 2020 06:01:44 -0700 (PDT)
X-Gm-Message-State: AGi0PubLqFg3xf1YL3JQHUk4sQlKBhtjD6Crt/8Y+/el600InAlf8C0i
 Xl3jaK7ehsR+Z3k9yyEO5LoBIkcu/H8CdA9Ztw==
X-Google-Smtp-Source: APiQypIHqZadC3nzIvFXNOEse7bTp7FzDlJqNyxZvrk+cHMRB9Tyvtfrxw7SwuI3j/qcSFHHZBwidZxx5VwL3Ns5Qwg=
X-Received: by 2002:a17:906:2503:: with SMTP id
 i3mr6776180ejb.293.1588770103283; 
 Wed, 06 May 2020 06:01:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200506123356.9147-1-bernard@vivo.com>
In-Reply-To: <20200506123356.9147-1-bernard@vivo.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 6 May 2020 21:01:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9Cuc40zaDF83m7sJiok35x3oqDCr4JQRJyvLCBZ4U_FA@mail.gmail.com>
Message-ID: <CAAOTY_9Cuc40zaDF83m7sJiok35x3oqDCr4JQRJyvLCBZ4U_FA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: cleanup coding style in mediatek a bit
To: Bernard Zhao <bernard@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_060145_500403_567F0B1D 
X-CRM114-Status: GOOD (  13.02  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, opensource.kernel@vivo.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEJlcm5hcmQ6CgpCZXJuYXJkIFpoYW8gPGJlcm5hcmRAdml2by5jb20+IOaWvCAyMDIw5bm0
NeaciDbml6Ug6YCx5LiJIOS4i+WNiDg6MzTlr6vpgZPvvJoKPgo+IFRoaXMgY29kZSBjaGFuZ2Ug
aXMgdG8gbWFrZSBjb2RlIGJpdCBtb3JlIHJlYWRhYmxlLgo+CgpSZXZpZXdlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+IFNpZ25lZC1vZmYtYnk6IEJlcm5h
cmQgWmhhbyA8YmVybmFyZEB2aXZvLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19oZG1pLmMgfCAxMiArKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfaGRt
aS5jCj4gaW5kZXggZmY0M2EzZDgwNDEwLi40M2U5ODc2ZmQ1MGMgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19oZG1pLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2hkbWkuYwo+IEBAIC0zMTEsMTQgKzMxMSwxMCBAQCBzdGF0aWMgdm9pZCBt
dGtfaGRtaV9od19zZW5kX2luZm9fZnJhbWUoc3RydWN0IG10a19oZG1pICpoZG1pLCB1OCAqYnVm
ZmVyLAo+ICAgICAgICAgdTggY2hlY2tzdW07Cj4gICAgICAgICBpbnQgY3RybF9mcmFtZV9lbiA9
IDA7Cj4KPiAtICAgICAgIGZyYW1lX3R5cGUgPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9
IDE7Cj4gLSAgICAgICBmcmFtZV92ZXIgPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9IDE7
Cj4gLSAgICAgICBmcmFtZV9sZW4gPSAqYnVmZmVyOwo+IC0gICAgICAgYnVmZmVyICs9IDE7Cj4g
LSAgICAgICBjaGVja3N1bSA9ICpidWZmZXI7Cj4gLSAgICAgICBidWZmZXIgKz0gMTsKPiArICAg
ICAgIGZyYW1lX3R5cGUgPSAqYnVmZmVyKys7Cj4gKyAgICAgICBmcmFtZV92ZXIgPSAqYnVmZmVy
Kys7Cj4gKyAgICAgICBmcmFtZV9sZW4gPSAqYnVmZmVyKys7Cj4gKyAgICAgICBjaGVja3N1bSA9
ICpidWZmZXIrKzsKPiAgICAgICAgIGZyYW1lX2RhdGEgPSBidWZmZXI7Cj4KPiAgICAgICAgIGRl
dl9kYmcoaGRtaS0+ZGV2LAo+IC0tCj4gMi4yNi4yCj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51
eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
