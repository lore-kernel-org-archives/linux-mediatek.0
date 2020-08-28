Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78297C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:14:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DAE82078A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E6zLRTSY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OG1w4BWn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DAE82078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Yu2eRx3QZtd/pAL6CPLJ8zq9MYyeH57wDvc36j40fjs=; b=E6zLRTSYsI4kf6guTpvV8zJYE
	+wQg84oJraYwUnw229p0ztjm86nSQySN5ekLs6Z5OvQzXRFvgyIy9nOtG3dfeZrEBFW7zHKZsTBhN
	txGdKX5DY3m/7RTc+WHJPJUtghdHSz4F9B1++1lHUtWICM4XJNAn1SMg9i90O3K3dIjpmMvX/hr0z
	rVi8NiFhggunhjwYMG0XhYodGOX+CSRatdFbFAFoZqfba/nmHU8EsdZLGjQ2nqgRhY6d9WuMm8Nk3
	wTJmSeWTLQu8nDC01bXUpNrxJw3Tu2W4YjNf872a9L+xcs0KCNhmINahIlB3kGXj4bRndkz8uIhQk
	7qt/8bTvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBbOT-0004KU-3p; Fri, 28 Aug 2020 10:14:01 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBbOO-0004Il-FX
 for linux-mediatek@lists.infradead.org; Fri, 28 Aug 2020 10:13:57 +0000
Received: by mail-wr1-x442.google.com with SMTP id k15so758908wrn.10
 for <linux-mediatek@lists.infradead.org>; Fri, 28 Aug 2020 03:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=h1Z8yKolwImpBZm4vZoh56lMtH1TA77Qyt7l6P6U/eU=;
 b=OG1w4BWn9/mHkTCU/pdvp5aB/I6aCQXuHdeLIlWpfqZHTvMTF/z8I1Il8SLyfPc1B/
 cnWOpmrN6ZzX0khvczpQlZNh/aOxpRKL1V0cDaI+Mn6HEifROUoGTjxHjvVIJ3ykQcxi
 V1pUWUhfB2pKjxPrrO7aLImW7dOGVAEMxnnYyvXdLppSUf7V7J4bpJoA6mY72w3BbzrU
 BQKi8r3GLolgGp6XHyG4K3XRFCKnOBRKjnR2kv+ziiZVA3ccY8TxN6uHfG3i7NPGHgwB
 OMLjN0wcfwYubu1NQVGL2WFISnF6+fk5awmW2dBcMf4xY82D88UToVsOGxTygDdzU2ZC
 TYnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h1Z8yKolwImpBZm4vZoh56lMtH1TA77Qyt7l6P6U/eU=;
 b=srB4DRkh3AM8psCvSMAsignHTIMP1kkscKLLJtdLxVYHVAMQ0mCoEwtL0klPy37G+h
 XXyZITCOdKYLb61n1czUqP6HjyixPjSxrc9jcpl3es1F/qUqCVR1MPM4pplXoT/lJ9dG
 MAvF8LP2sGEmXGx4T7KjJArmLVfXmTd7B5WI8sE/91zJyKVcsrNEskO6aFns68aPqBhd
 j4KUj1nTg06EMMSQtXCPu6KRUG6w33j9UwiynpyI7A39lG1TSSTLvpAKJ2OAgeWesNIz
 G3yUABCbLOGqmtBLsun3KR0tIqSrYFNjr5saJcbltSB/65q/Lha9SV8S0wxpNYpH1Y5N
 ryfQ==
X-Gm-Message-State: AOAM5330vfDV1dQlIAAvlnCCMo+nlCFNWxDuXyjKM781d47eep/D3hYv
 /PUHb3vJF/lF5AwyNyhzRuz73A==
X-Google-Smtp-Source: ABdhPJwO3pB7agtO7zGGl8nx+0MCselqiJliucfcqBvORbTlQ1UsgZtj/ZpMZRgbSBgmUf5NPSuOsQ==
X-Received: by 2002:a5d:42cc:: with SMTP id t12mr822722wrr.214.1598609635277; 
 Fri, 28 Aug 2020 03:13:55 -0700 (PDT)
Received: from dell ([91.110.221.141])
 by smtp.gmail.com with ESMTPSA id v29sm1178001wrv.51.2020.08.28.03.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:13:54 -0700 (PDT)
Date: Fri, 28 Aug 2020 11:13:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v4 8/9] mfd: mt6360: Fix flow which is used to check ic
 exist
Message-ID: <20200828101352.GL1826686@dell>
References: <1597661277-27862-1-git-send-email-gene.chen.richtek@gmail.com>
 <1597661277-27862-9-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597661277-27862-9-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_061356_577604_85D5B445 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCAxNyBBdWcgMjAyMCwgR2VuZSBDaGVuIHdyb3RlOgoKPiBGcm9tOiBHZW5lIENoZW4g
PGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiAKPiBGaXggZmxvdyB3aGljaCBpcyB1c2VkIHRvIGNo
ZWNrIGljIGV4aXN0Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEdlbmUgQ2hlbiA8Z2VuZV9jaGVuQHJp
Y2h0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL21mZC9tdDYzNjAtY29yZS5jIHwgMzIgKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlv
bnMoKyksIDExIGRlbGV0aW9ucygtKQoKRm9yIG15IG93biByZWZlcmVuY2UgKGFwcGx5IHRoaXMg
YXMtaXMgdG8geW91ciBzaWduLW9mZiBibG9jayk6CgogIEFja2VkLWZvci1NRkQtYnk6IExlZSBK
b25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNl
bmlvciBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBP
cGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sg
fCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
