Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60943C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 19:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E82B20774
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 19:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gu24El+n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EhpM/xsx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E82B20774
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EjE6tBiFhlXIq/6TYHUssIkxsLX9Pu+S/J06j7r8Z68=; b=Gu24El+nHLMZ6P
	4jouMC7/v3aFamXDayPZyHnUrVM6A3WOUCqCiZ7J0jszMG/UbPOcOFnwzdzjavLhSy6NRTP/IKnOQ
	mq3iesGBk1gaxkg9LuOTy2EkSutf1Pd32RUVVllMQsGTQYVrnizqtbT2/sOifTkzZuEtlUrHnpJ+w
	Op/lenf+ar8pRo7L9zHjcqG077Vu7vulX2oFusIA3b5wB2K6+aiLOyXOjGnbZN7MePviNzqiyUZi/
	39O2nN0AI+PJWHaPscCz5MUT5EpDjO0o20ufwCfKmgvjolGmlvYQMvpoM1gZ7jdhv1RiqedxVmsq7
	xU/XjIo9NWA7cLp2fkQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiNTm-0007TH-CO; Mon, 08 Jun 2020 19:30:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiNRg-0003Ea-Rm
 for linux-mediatek@lists.infradead.org; Mon, 08 Jun 2020 19:28:34 +0000
Received: by mail-wr1-x443.google.com with SMTP id e1so18738045wrt.5
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2020 12:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nNfoDipJXnYq7VJ5hMTMW93JkoBjEN3XF2dENorzijs=;
 b=EhpM/xsxL6PmflZhqLC1Kz1772OJH/9mtEZ9xvB5MG7h4Ta7W8GwdjMKzhPwwup78R
 x3NA7CMImhUeJzDJe9tz2HDD/hiYzRWRRaKGwDP8i+/GAq80GTqev0yKjj1z05GzJxnI
 XQzU5YBbvUTu+7LTSog2YHO4eGxNjwO0t4X5IugL9GgaXjArxsvt4eEncBh8F5yg753d
 V2ViUW1FvckLJChRrKKE6sPjS9fQKVOTbxH7pszf+DYjMfBM+1Hc5KsGKFzXoRuMCHdq
 qcIog949KsxfTcnLMEjp/n5ZzR92+H2nxE/UzteEtxPNVswUgdyHEkmFQJO9wL+foEcN
 CXXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nNfoDipJXnYq7VJ5hMTMW93JkoBjEN3XF2dENorzijs=;
 b=URO9eJ3zGNJ3djPHTxH0AS93AnIp6gnil7UJyFiGrTXQuZiU268gEgFCZHZ2XMw02G
 jQY5dcfbUEBJVmxzBPrOgArmxo51GtagJ5vUdqM/jO0PHSj9CJoMpT1+gjOIcKlOemUv
 1NZHu50p8BDAW2SgepLwTG+0yWOlR3mxmgzEuHas5rDVx58FDzWau9YAyva7aCcKNWkN
 F/UHd57LmtTpf0JrT5Q7wAuQgQGgHbIxEIpHp3zBHMzod6gMI9MoWNnnH76PSVi6fC65
 6r+VSSJdXRYkEjKUeXxX74pOBA6+djAcjyq44jS4BEtNSpzewD69WWZPpYHEE3wkgnNB
 3RHQ==
X-Gm-Message-State: AOAM531vid9+HMNnz71u9FsMKy34nj2qM/6+GLRD1nlWTgikT0IMpyWO
 lmdI2USYwkuUXPXvbuyEpF8LYw==
X-Google-Smtp-Source: ABdhPJwFT/4AGR1g3XBLbVOb2Lb1zJ42emgmqdFC7+HcborRvYs9taXcrKFmaFuvTjXIcnZBJadnAA==
X-Received: by 2002:adf:9d8e:: with SMTP id p14mr347943wre.236.1591644511323; 
 Mon, 08 Jun 2020 12:28:31 -0700 (PDT)
Received: from dell ([95.147.198.92])
 by smtp.gmail.com with ESMTPSA id c70sm473889wme.32.2020.06.08.12.28.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 12:28:30 -0700 (PDT)
Date: Mon, 8 Jun 2020 20:28:29 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH] mfd: mt6360: Fix register driver NULL pointer by add
 driver name
Message-ID: <20200608192829.GG4106@dell>
References: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_122832_946058_553DEDC8 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAwOCBKdW4gMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBhY2NpZGVudGFsbHkgcmVtb3ZlIGRyaXZlciBu
YW1lIHdoZW4KPiByZXBsYWNlIHByb2JlIGJ5IHByb2JlX25ldyBpbiBhZGQgbXQ2MzYwIG1mZCBk
cml2ZXIgcGF0Y2ggdjQKPiAKPiBbICAxMjEuMjQzMDEyXSBFQVg6IGMyYThiYzY0IEVCWDogMDAw
MDAwMDAgRUNYOiAwMDAwMDAwMCBFRFg6IDAwMDAwMDAwCj4gWyAgMTIxLjI0MzAxMl0gRVNJOiBj
MmE4YmM3OSBFREk6IDAwMDAwMDAwIEVCUDogZTU0YmRlYTggRVNQOiBlNTRiZGVhMAo+IFsgIDEy
MS4yNDMwMTJdIERTOiAwMDdiIEVTOiAwMDdiIEZTOiAwMDAwIEdTOiAwMDAwIFNTOiAwMDY4IEVG
TEFHUzogMDAwMTAyODYKPiBbICAxMjEuMjQzMDEyXSBDUjA6IDgwMDUwMDMzIENSMjogMDAwMDAw
MDAgQ1IzOiAwMmVjMzAwMCBDUjQ6IDAwMDAwNmIwCj4gWyAgMTIxLjI0MzAxMl0gQ2FsbCBUcmFj
ZToKPiBbICAxMjEuMjQzMDEyXSAga3NldF9maW5kX29iaisweDNkLzB4YzAKPiBbICAxMjEuMjQz
MDEyXSAgZHJpdmVyX2ZpbmQrMHgxNi8weDQwCj4gWyAgMTIxLjI0MzAxMl0gIGRyaXZlcl9yZWdp
c3RlcisweDQ5LzB4MTAwCj4gWyAgMTIxLjI0MzAxMl0gID8gaTJjX2Zvcl9lYWNoX2RldisweDM5
LzB4NTAKPiBbICAxMjEuMjQzMDEyXSAgPyBfX3Byb2Nlc3NfbmV3X2FkYXB0ZXIrMHgyMC8weDIw
Cj4gWyAgMTIxLjI0MzAxMl0gID8gY2h0X3djX2RyaXZlcl9pbml0KzB4MTEvMHgxMQo+IFsgIDEy
MS4yNDMwMTJdICBpMmNfcmVnaXN0ZXJfZHJpdmVyKzB4MzAvMHg4MAo+IFsgIDEyMS4yNDMwMTJd
ICA/IGludGVsX2xwc3NfcGNpX2RyaXZlcl9pbml0KzB4MTYvMHgxNgo+IFsgIDEyMS4yNDMwMTJd
ICBtdDYzNjBfcG11X2RyaXZlcl9pbml0KzB4Zi8weDExCj4gWyAgMTIxLjI0MzAxMl0gIGRvX29u
ZV9pbml0Y2FsbCsweDMzLzB4MWEwCj4gWyAgMTIxLjI0MzAxMl0gID8gcGFyc2VfYXJncysweDFl
Yi8weDNkMAo+IFsgIDEyMS4yNDMwMTJdICA/IF9fbWlnaHRfc2xlZXArMHgzMS8weDkwCj4gWyAg
MTIxLjI0MzAxMl0gID8ga2VybmVsX2luaXRfZnJlZWFibGUrMHgxMGEvMHgxN2YKPiBbICAxMjEu
MjQzMDEyXSAga2VybmVsX2luaXRfZnJlZWFibGUrMHgxMmMvMHgxN2YKPiBbICAxMjEuMjQzMDEy
XSAgPyByZXN0X2luaXQrMHgxMTAvMHgxMTAKPiBbICAxMjEuMjQzMDEyXSAga2VybmVsX2luaXQr
MHhiLzB4MTAwCj4gWyAgMTIxLjI0MzAxMl0gID8gc2NoZWR1bGVfdGFpbF93cmFwcGVyKzB4OS8w
eGMKPiBbICAxMjEuMjQzMDEyXSAgcmV0X2Zyb21fZm9yaysweDE5LzB4MjQKPiBbICAxMjEuMjQz
MDEyXSBNb2R1bGVzIGxpbmtlZCBpbjoKPiBbICAxMjEuMjQzMDEyXSBDUjI6IDAwMDAwMDAwMDAw
MDAwMDAKPiBbICAxMjEuMjQzMDEyXSByYW5kb206IGdldF9yYW5kb21fYnl0ZXMgY2FsbGVkIGZy
b20gaW5pdF9vb3BzX2lkKzB4M2EvMHg0MCB3aXRoIGNybmdfaW5pdD0wCj4gWyAgMTIxLjI0MzAx
Ml0gLS0tWyBlbmQgdHJhY2UgMzhhODAzNDAwZjFhMmJlZSBdLS0tCj4gWyAgMTIxLjI0MzAxMl0g
RUlQOiBzdHJjbXArMHgxMS8weDMwCgpIb3cgZGlkIHRoaXMgZHJpdmVyIGV2ZXIgd29yayBmb3Ig
eW91PwoKPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4K
PiAtLS0KPiAgZHJpdmVycy9tZmQvbXQ2MzYwLWNvcmUuYyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvbXQ2MzYwLWNv
cmUuYyBiL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiBpbmRleCBkYjhjZGY1Li5lOWNhY2My
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWZkL210NjM2MC1jb3JlLmMKPiArKysgYi9kcml2ZXJz
L21mZC9tdDYzNjAtY29yZS5jCj4gQEAgLTQxMiw2ICs0MTIsNyBAQCBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBtdDYzNjBfcG11X29mX2lkKTsKPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgaTJjX2RyaXZl
ciBtdDYzNjBfcG11X2RyaXZlciA9IHsKPiAgCS5kcml2ZXIgPSB7Cj4gKwkJLm5hbWUgPSAibXQ2
MzYwX3BtdSIsCj4gIAkJLnBtID0gJm10NjM2MF9wbXVfcG1fb3BzLAo+ICAJCS5vZl9tYXRjaF90
YWJsZSA9IG9mX21hdGNoX3B0cihtdDYzNjBfcG11X29mX2lkKSwKPiAgCX0sCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNl
cwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
