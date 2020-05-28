Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50E1C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:57:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7C420888
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:57:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="orqyWeap";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="DTZmwKCR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7C420888
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwnjvYCaCo5wG9wCcWoa9nG3oNEOOQmegPST7wCOswc=; b=orqyWeapX9p+tK
	uw5dYt7tabo6vfE7T29a0OhfKmpvoe/C/mzyAClRzgGRftHvy2MSUD7MN/GNmGx8FqiHd+1yhGZPw
	w74TvUIHsTZQ+tTafRkB3CDMn6rV/qjNj/ZTm+PVoNFODagA3Wtyqf3n+WwxMRuvTmVLSHxmF093p
	aA0yxtsSCmp80cL5Bfv+B2JeKOSsQ9JTuZG/SCGSn2UABw0dRcUMdt1IVjeDoaVJVlraPWi2cLkcG
	Yk0Twm9GJkvSHYoHRz+lgH0yPvRAI9yUS6GP2YKzN7MdBTvDzS21IhejnlEGwLq/0U5L8kXlgxnNR
	z2fiNtM5dOa6yf47tlMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJ2Q-00084K-NT; Thu, 28 May 2020 13:57:38 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJ2N-00081u-S5
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 13:57:37 +0000
Received: by mail-io1-xd44.google.com with SMTP id y18so9602430iow.3
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UjZuoVgOlAA2kTVO/8YMAq4g+uCFT1z5qrdClOZg5xA=;
 b=DTZmwKCR4ekoBMQbgF98VezGQAaJUqzcUPcTLqzEOk97y7hIN1ih08J1Bmvh5GFOQH
 qIfMbduWKyvcTUWj7p/KqqP0TmgtmZ0jpCa7P6dotvleAkJ1hagecaJ9alBmuP6vbcMP
 5aaqPqo9jrIHnpkagd1Qbkvqzqc6b58tprkfmSRcPsg8yNdjsCoC4q/8bSCDNAsQHqns
 8JHrAq1PMSpwdCwaElyr1wJTJOC4GtK9IH0QwCua6VK5HGLM2xKPVD52sOHRUndZ7NkI
 DDPOPWpRzUMOf1dKXTDe1mbMtEREzBPsxxJC9ia7xa1Ky8uMFkaq7l7w8RoCAPepY5L6
 btiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UjZuoVgOlAA2kTVO/8YMAq4g+uCFT1z5qrdClOZg5xA=;
 b=mPGyQK+uEkg4rFzmLtjDiEe0rqCxLdh9F8xC9SEaM+Iybe/bLKXUFnNQoh7m1HxvWB
 6lzWR41jO9O7bcK1ui7SULd697F+cjUpli7Fb7ThDQ2ksqYM1HBbPvbL466MvOypDH70
 7bOX4T7y/IElI5PlTYPq6RZwwtCO2qfOXaTml5TqiAqYmpYDNomVSXVpOwEWmWYwACkg
 5FPMfA3Pskd7PepGeghdV/DBk3t2kL18usSIvbJy3yp6MgHVhpwuFszSBmHkaZh+m7SZ
 AlNNYDvnIZZJnSttLU/rLJDSHTTyBpunRBV8HGI1n/OEoMf60ONvL2IY4RyVi6+T4gNV
 hDtQ==
X-Gm-Message-State: AOAM530WQ/i0NoPJOhK7FDJlfFweu+velFYctSh6qWkQTTATi0xluJRK
 TnJ/MOxXNhvy5Z7rUs2Ocd+ZleAYu/cgojMhG11DaQ==
X-Google-Smtp-Source: ABdhPJzQW8lIGLBPiATGOcgXj5v+CggE9v61MrxTSOTkP57BU/mh8b7hB7ruXavpQvozs6X3Thlkzu1OTQMUtqwGRc8=
X-Received: by 2002:a6b:5c19:: with SMTP id z25mr2382470ioh.119.1590674255097; 
 Thu, 28 May 2020 06:57:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200528123459.21168-1-brgl@bgdev.pl>
 <20200528123459.21168-2-brgl@bgdev.pl>
 <20200528132938.GC3606@sirena.org.uk>
 <CAMRc=MejeXv6vd5iRW_EB3XqBtdCWDcV=4BOCDDFd4D0-y9LUA@mail.gmail.com>
 <20200528134802.GE3606@sirena.org.uk>
In-Reply-To: <20200528134802.GE3606@sirena.org.uk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 May 2020 15:57:24 +0200
Message-ID: <CAMRc=MdL5dkJ+BPzvYXTnLQ_sGtU_7n=8jeSa5=hf8u9Pm+0FQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] regmap: provide helpers for simple bit operations
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_065735_957805_648F8744 
X-CRM114-Status: GOOD (  11.27  )
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
Cc: Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Y3p3LiwgMjggbWFqIDIwMjAgbyAxNTo0OCBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+
IG5hcGlzYcWCKGEpOgo+Cj4gT24gVGh1LCBNYXkgMjgsIDIwMjAgYXQgMDM6MzI6NDBQTSArMDIw
MCwgQmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IGN6dy4sIDI4IG1haiAyMDIwIG8gMTU6
MjkgTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPiBuYXBpc2HFgihhKToKPgo+ID4gPiBX
aHkgbWFjcm9zIGFuZCBub3Qgc3RhdGljIGlubGluZXM/Cj4KPiA+IFRoZSBleGlzdGluZyByZWdt
YXBfdXBkYXRlX2JpdHNfKigpIGhlbHBlcnMgYXJlIG1hY3JvcyB0b28sIHNvIEkgdHJpZWQKPiA+
IHRvIHN0YXkgY29uc2lzdGVudC4gQW55IHJlYXNvbiB3aHkgdGhleSBhcmUgbWFjcm9zIGFuZCBu
b3Qgc3RhdGljCj4gPiBpbmxpbmVzPyBJZiB0aGVyZSdzIG5vbmUsIHRoZW4gd2h5IG5vdCBjb252
ZXJ0IHRoZW0gdG9vPyBPdGhlcndpc2UKPiA+IHdlJ2QgaGF2ZSBhIHN0YXRpYyBpbmxpbmUgZXhw
YW5kaW5nIGEgbWFjcm8gd2hpY2ggaW4gdHVybiBpcyBjYWxsaW5nIGEKPiA+IGZ1bmN0aW9uIChy
ZWdtYXBfdXBkYXRlX2JpdHNfYmFzZSgpKS4KPgo+IE5vdCByZWFsbHksIEkgdGhpbmsgaXQgd2Fz
IGp1c3QgdGhhdCB0aGV5J3JlIGFyZ3VtZW50IHRhYmxlcy4gIEl0J2QgYmUKPiBnb29kIHRvIGNv
bnZlcnQgdGhlbS4KCk9rLiBTbyBJJ20gc2VlaW5nIHRoZXJlIGFyZSBhIGxvdCBvZiBtYWNyb3Mg
aW4gcmVnbWFwLmggdGhhdCBjb3VsZApiZWNvbWUgc3RhdGljIGlubGluZXMgYnV0IGdpdmVuIHRo
ZSBhbW91bnQgb2YgcmVnbWFwIHVzZXJzOiBob3cgYWJvdXQKd2UgZG8gaXQgc2VwYXJhdGVseSBh
bmQgaW4gdGhlIG1lYW50aW1lIEknbGwganVzdCBtb2RpZnkgdGhpcyBzZXJpZXMKdG8gdXNlIHN0
YXRpYyBpbmxpbmVzPwoKQmFydG9zegoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
