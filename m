Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C122C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 23:19:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0EDA2072D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 23:19:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZmM8jwT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="BlTi57WW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0EDA2072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zvEOJRvnbW+HZwothqo286N3Jdw8R+fvCcDScF0UgM4=; b=dZmM8jwTq4bvcz
	z2kMNQOsYXaI0BRln4snZf7gzJg1qq8Kh4xFs0HhQ1PPGDuQ+QOZ0c3/rOzqqIN1SLe9vltBJMMXZ
	Mb5pC1J1aOXH+2MvJwbMGSxPpbJcqZPZQdnPk/em26y9PoYd4aXjYXwzJRuT/R6mn5Uy7HUcsZkDU
	B3HtTeMdPmI1/EJB/5QpIa2dNBLsnV/dUitgzmf5KPdIIIRaDiCCGVUaMsUsrW3408Yz544t0kBZz
	RihRSlvJhagBfrfLqjzp6w69tkueqKPxapYdIJ3Y8LBexDQ5j7hwCs9ePNeTlx/2LRv+DBQCNosXd
	oLfbjJ8NBaTSfEmKfbSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOUpW-0006Bg-Q2; Tue, 14 Apr 2020 23:18:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOUpP-000646-2F; Tue, 14 Apr 2020 23:18:52 +0000
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7FEF420768;
 Tue, 14 Apr 2020 23:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586906330;
 bh=TIDIviyEYvN23MqFWk6rl7nwsfElsevepgo9cj0fDa0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=BlTi57WWPhRfW7sJMv5MxtonFNkCoY3uTo3bX4GCktl3OJfOEMkXo/jFDOgJC3Xhx
 YYZwkDurIo88TwaWUqFS6rvVSLyvaJpZb+mYFSf0te1Mrgh938AILR0wS/rK6kk+wG
 zu0wwxVhweZhfP5OXayIki3MMJ01LkvWJNk014kg=
Received: by mail-ed1-f53.google.com with SMTP id c7so2011578edl.2;
 Tue, 14 Apr 2020 16:18:50 -0700 (PDT)
X-Gm-Message-State: AGi0PubhgNgFf02GGbsjZSvEqforf1ouH4NTA95pjp4vBLVM2emHgcC8
 ySxiAAv8ib7R2M6VxnMSPvQ3GIhRf3mO2OyXmQ==
X-Google-Smtp-Source: APiQypLlqRYq43AAFMZg/IO4wBtIyFmNe19LoGBoUzW3+lEwF9tJ5dD9i42daP7Zkk0pVFZPG7mhoy00oQKf+v9hKRU=
X-Received: by 2002:aa7:c649:: with SMTP id z9mr8144084edr.288.1586906328844; 
 Tue, 14 Apr 2020 16:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200414030815.192104-1-hsinyi@chromium.org>
 <20200414030815.192104-2-hsinyi@chromium.org>
In-Reply-To: <20200414030815.192104-2-hsinyi@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 15 Apr 2020 07:18:37 +0800
X-Gmail-Original-Message-ID: <CAAOTY__oL1LxFxmBSp+cC__ZcGVifQ3f+gPKSWFZKJV4aRCDJw@mail.gmail.com>
Message-ID: <CAAOTY__oL1LxFxmBSp+cC__ZcGVifQ3f+gPKSWFZKJV4aRCDJw@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: mtk-mdp: Use correct aliases name
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_161851_124095_ADC5EECF 
X-CRM114-Status: GOOD (  13.46  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEhzaW4tWWk6CgpIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJvbWl1bS5vcmc+IOaWvCAyMDIw
5bm0NOaciDE05pelIOmAseS6jCDkuIrljYgxMTowOOWvq+mBk++8mgo+Cj4gYWxpYXNlcyBwcm9w
ZXJ0eSBuYW1lIG11c3QgaW5jbHVkZSBvbmx5IGxvd2VyY2FzZSBhbmQgJy0nLiBGaXggaW4gZHRz
Cj4gYW5kIGRyaXZlci4KPgoKUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPgoKPiBTaWduZWQtb2ZmLWJ5OiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJv
bWl1bS5vcmc+Cj4gUmV2aWV3ZWQtYnk6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0Bn
bWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLW1kcC9tdGtfbWRw
X2NvbXAuYyB8IDggKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwg
NCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1tZHAvbXRrX21kcF9jb21wLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRr
X21kcF9jb21wLmMKPiBpbmRleCAxNDk5MTY4NWFkYjcuLjU4YWJmYmRmYjgyZCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21wLmMKPiArKysg
Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1tZHAvbXRrX21kcF9jb21wLmMKPiBAQCAtMTUs
MTAgKzE1LDEwIEBACj4KPgo+ICBzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10a19tZHBfY29t
cF9zdGVtW01US19NRFBfQ09NUF9UWVBFX01BWF0gPSB7Cj4gLSAgICAgICAibWRwX3JkbWEiLAo+
IC0gICAgICAgIm1kcF9yc3oiLAo+IC0gICAgICAgIm1kcF93ZG1hIiwKPiAtICAgICAgICJtZHBf
d3JvdCIsCj4gKyAgICAgICAibWRwLXJkbWEiLAo+ICsgICAgICAgIm1kcC1yc3oiLAo+ICsgICAg
ICAgIm1kcC13ZG1hIiwKPiArICAgICAgICJtZHAtd3JvdCIsCj4gIH07Cj4KPiAgc3RydWN0IG10
a19tZHBfY29tcF9tYXRjaCB7Cj4gLS0KPiAyLjI2LjAuMTEwLmcyMTgzYmFmMDljLWdvb2cKPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
