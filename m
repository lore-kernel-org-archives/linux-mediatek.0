Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A99EC433E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:43:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4456B2065C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 06:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HO9NcN/Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqqVBJtH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4456B2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=joxV+rXb3g2msvZEXkAO4zYp+sUfLbVfreRVOM45IOw=; b=HO9NcN/QLBr1/6nqjWkZaBd1M
	LZUmksIP1UVoFjrSD0vutmLTKUmsX5Qk/LSeBL2ySn2p2oYmtgBClQeYZ0GaiwRj4llPLDRGZb2Ko
	9tfbNr9ay2SlocFaIlmWhHZBLj8n1hzcAucJlmXOBEbyWlXVNikatWY1TK9IBa9Y8eWOca5ohAG/q
	dB8jPlqnb/Rc8PPdPoSX0DXTUqJVMsnvq45uRSxdnbEhG9jbyjjWHxV/ZtYY3yB5KAoJ1AqYSohCP
	ewJmCpMa46W039VRqtafv6PDqdIlyU8vW4Co2HtGBCkPyxa3llVsiGasuFnAXSqqvKyzWM8Qvohcx
	ygdOgzCbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0JKR-00020S-8i; Tue, 28 Jul 2020 06:43:11 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0JKJ-0001xw-Ea
 for linux-mediatek@lists.infradead.org; Tue, 28 Jul 2020 06:43:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id a15so17092109wrh.10
 for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2020 23:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=PEyyokjjuIzOHJWToJ1uYDFOw2ElGPDs1QjI31k7aZU=;
 b=aqqVBJtHEPmeTQzyQPzuQVXHHoQ/pNis//A6zal8T2xtUi7xxxqnfU5nNtf4ke4PRi
 QvDnYrEvKYr2f/Is8c4qbGMPgH1ZrtOQckOLMMq2fhTb49RRkeu7aY0HxKZey/tgJhLC
 9tVcwNBtxaay1c2W41OeoLzmG8jptIJ8O6IUpg+u54rnVP71N3Tw09pWAxjVJFjefPmW
 a0LHf22hKKUWn7tRVyZHwwjhNCDL4eAMiHsxO/GF8LY3b06VW28+2Esol7/LmCtJGBrf
 HIDBN4cMbPgyePRzFdqr4naUQY5mdQrjBXFyzkTQIcTyJlEtZx5J8JRIl81jHCK/nnbI
 Oi9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PEyyokjjuIzOHJWToJ1uYDFOw2ElGPDs1QjI31k7aZU=;
 b=dd3yC9o/FoT+DS/PU1WmGtj7wH3G+AwlCMtNLRJ0H+4uHCnCH9KrW7NOZxwHkKAuJl
 IylOgcaXlyFoPy564j2zbhyHSELsP3mU1YWKcDoYJZGwRe7ADqLYvWotU2+fUCGvhuOG
 bCv55+dnRXczzxCb4+5k/+TS8gL+YUYSDoqrZo+8I2YdjsInCcOfA1uTJNfcg0thzzf9
 ubA4k+thWvqaqLE91J7LXMC4nDI3m+ea8L2YFAMwV98GLvX7YfjpBxTCwZjAfelWXzWE
 7nHleU0KJb5vLiEQmiM9swR0Cijxu35z1j5u8BVBZ3YOR19QmR7MJbJWd2i/JZ4lDuzm
 32Pw==
X-Gm-Message-State: AOAM531NX+PwiH+FbmQMex2S4qlIlr4rZZilYgozO7Kut28XxAgnNiGQ
 bFuLx7w2DIAMYNK5dLDng2LAZw==
X-Google-Smtp-Source: ABdhPJwVXoe0UeXSn+WViV0QpvvtjaE0lw5j1emPz6pC149EibUoc72LkGlOlwSQmhQzUMbw+5N9lQ==
X-Received: by 2002:a5d:664e:: with SMTP id f14mr23509500wrw.6.1595918582237; 
 Mon, 27 Jul 2020 23:43:02 -0700 (PDT)
Received: from dell ([2.27.167.73])
 by smtp.gmail.com with ESMTPSA id g7sm15800842wrv.82.2020.07.27.23.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jul 2020 23:43:01 -0700 (PDT)
Date: Tue, 28 Jul 2020 07:42:59 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 4/8] mfd: Add support for the MediaTek MT6359 PMIC
Message-ID: <20200728064259.GA1850026@dell>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595509133-5358-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_024303_533412_C2A0CCF9 
X-CRM114-Status: GOOD (  16.35  )
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVGh1LCAyMyBKdWwgMjAyMCwgSHNpbi1Ic2l1bmcgV2FuZyB3cm90ZToKCj4gVGhpcyBhZGRz
IHN1cHBvcnQgZm9yIHRoZSBNZWRpYVRlayBNVDYzNTkgUE1JQy4gVGhpcyBpcyBhCj4gbXVsdGlm
dW5jdGlvbiBkZXZpY2Ugd2l0aCB0aGUgZm9sbG93aW5nIHN1YiBtb2R1bGVzOgo+IAo+IC0gUmVn
dWxhdG9yCj4gLSBDb2RlYwo+IC0gSW50ZXJydXB0Cj4gCj4gSXQgaXMgaW50ZXJmYWNlZCB0byB0
aGUgaG9zdCBjb250cm9sbGVyIHVzaW5nIFNQSSBpbnRlcmZhY2UKPiBieSBhIHByb3ByaWV0YXJ5
IGhhcmR3YXJlIGNhbGxlZCBQTUlDIHdyYXBwZXIgb3IgcHdyYXAuCj4gTVQ2MzU5IE1GRCBpcyBh
IGNoaWxkIGRldmljZSBvZiB0aGUgcHdyYXAuCj4gCj4gU2lnbmVkLW9mZi1ieTogSHNpbi1Ic2l1
bmcgV2FuZyA8aHNpbi1oc2l1bmcud2FuZ0BtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
bWZkL210NjM1OC1pcnEuYyAgICAgICAgICAgICB8ICAyNCArKwo+ICBkcml2ZXJzL21mZC9tdDYz
OTctY29yZS5jICAgICAgICAgICAgfCAgMjMgKysKPiAgaW5jbHVkZS9saW51eC9tZmQvbXQ2MzU5
L2NvcmUuaCAgICAgIHwgMTMzICsrKysrKysrKwo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNTkv
cmVnaXN0ZXJzLmggfCA1MjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
aW5jbHVkZS9saW51eC9tZmQvbXQ2Mzk3L2NvcmUuaCAgICAgIHwgICAxICsKPiAgNSBmaWxlcyBj
aGFuZ2VkLCA3MTAgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9s
aW51eC9tZmQvbXQ2MzU5L2NvcmUuaAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9saW51
eC9tZmQvbXQ2MzU5L3JlZ2lzdGVycy5oCgpMb29rcyBva2F5LCBpbiBnZW5lcmFsLgoKRm9yIG15
IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMgYXMtaXMgdG8geW91ciBzaWduLW9mZiBibG9jayk6
CgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cgot
LSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3Bl
ciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNv
Q3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
