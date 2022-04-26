Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BC8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 14:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNotHG8cqHS5F83aarLLOF1BjHzvgjc/c4kxzU3E4/M=; b=h8Q8KRPStwx/Kn
	j4uzPMXUNnlaVqT+ATfm6JGM2pGCzaJXrzYHuSViRLyWQXOBnPEfzCDRTjPLpK4BhBQt0RSRuWs/+
	eGEAEs0hXSg1XK+U0qPahrZHu5EaYCwr2fAwx8QF25Nhwq2uu07sU2RV701uFPp1j2GeH00netnJE
	Mxv4K6T4EzRRp29ifonX/7uf0gn1qayg6YG6rQWfCwtIDp83RQF4ghuAleP7Rwl1hEDoO3558FqXE
	nKWgkPLANdxTAjxCFxti1+75yaBrbE6lGiml70OL2SIEM1P/7uBaV8IrUPoe8ogWiyy7jp8qxBGWG
	Q6RzoR7Jd1nhrk8Emcxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLz5-00Evnn-Fk; Tue, 26 Apr 2022 14:16:07 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLy0-00EvNj-PS
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 14:15:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id k2so5245205wrd.5
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 07:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=YH+GE7ibZOz8nvgUaj8COsFNcJ+TqdF6V4nk1yzCsxw=;
 b=ZL5cLQCqZYNS4CQLi0TWfPze2PRkgMiFgpQCIR5G7x9xisLoTRW1a8c7Ku9DjlEzsX
 Tk/uuczf6Ky8A/j1sLSr8QiBp/JjZS3Kiq/cg0Ehk9VT3lxZXfxtyIzB/+qNMOnxjaaZ
 ORPWowT9HtlBzS6XU2VHjzLWUsICQDB0huvZ1pYb6Wr2/S+ga5/cl00avyGqyxadrslA
 0nHb1PT1zIA82mD2JEx/lLwmLeicLCkZPK0bay1jqK9lYAnXSs5KNCqZr+ejYhsUIX/6
 GeRmf4PXE/gaIJYVLk0VNgvLfmCVYY6M+MOKlA2Sw+WMOPsjkPQGvGniSEsp2oFL1i1D
 cnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=YH+GE7ibZOz8nvgUaj8COsFNcJ+TqdF6V4nk1yzCsxw=;
 b=XnRASv75oKWhmcGSjIu2Az680TW/yFaQfCBQjVppnPZlZA68UHq7AhWoqO1Rdfdwcy
 K3iJhMPyDGQHgydGpPDEd2WcOM0h4IHjFNBq4Qo8tr4EncAwzudTURDYcNum5ExWaOtg
 RLX7PZ1adPqjcgPNJu+7LP22G4CyCiFo4VSUOcxiwYlbWSabLb/Ipyd4eEwb8vF60Q2V
 hpdmBPQq2Dgp56tdTyCdjZhw2gddtk1w1cVqh8HNSLDVgRPI+uJQIlQsBCvbjsXw+nx8
 2hqZNkArNKPcK2RnT7wYNXZ9eyHOxqMEHaKvHbDhYA58b5ju8YTvC/MR11G+CRljKePx
 13oA==
X-Gm-Message-State: AOAM532RXDybLkbClLL/I1ISFh6T/0o/HEMzJn09rbfeLTymCzKUaglO
 DrK9K6i8rZ4m+axqvvzdiTLJOg==
X-Google-Smtp-Source: ABdhPJx7hmR/kuTWZnYQXz7AudGSpe6GTBSsqt6Wp5WE7bP0xS0edDJhbuesOs65Rcdrp4zXq78k3w==
X-Received: by 2002:adf:f946:0:b0:1f0:62c3:ea2e with SMTP id
 q6-20020adff946000000b001f062c3ea2emr18309739wrr.348.1650982496973; 
 Tue, 26 Apr 2022 07:14:56 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 d17-20020adfa351000000b0020adbfb586fsm6086115wrb.117.2022.04.26.07.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:14:56 -0700 (PDT)
Date: Tue, 26 Apr 2022 15:14:54 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] mfd: mt6397-core: add resources for PMIC keys for
 MT6359
Message-ID: <Ymf+XudxaqucHdAB@google.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
 <20220415153629.1817202-4-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220415153629.1817202-4-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_071500_898149_07F4CBFC 
X-CRM114-Status: GOOD (  10.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNSBBcHIgMjAyMiwgRmFiaWVuIFBhcmVudCB3cm90ZToKCj4gQWRkIHRoZSBNRkQg
cmVzb3VyY2VzIGluIG9yZGVyIHRvIGJlIGFibGUgdG8gcHJvYmUgYW5kIHVzZSB0aGUga2V5Ym9h
cmQKPiBkcml2ZXIgZm9yIHRoZSBNVDYzNTkgUE1JQy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBGYWJp
ZW4gUGFyZW50IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9tZmQvbXQ2
Mzk3LWNvcmUuYyB8IDEzICsrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2Vy
dGlvbnMoKykKCkFwcGxpZWQsIHRoYW5rcy4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KUHJp
bmNpcGFsIFRlY2huaWNhbCBMZWFkIC0gRGV2ZWxvcGVyIFNlcnZpY2VzCkxpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBcm0gU29DcwpGb2xsb3cgTGluYXJvOiBGYWNlYm9v
ayB8IFR3aXR0ZXIgfCBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW1lZGlhdGVrCg==
