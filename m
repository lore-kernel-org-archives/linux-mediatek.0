Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9554AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 14:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FOAf7xgoLm//nhOGTaSgSHylt3+KBZ9Bv/8hMT61H+0=; b=3zWRW1kEVVLjQ8
	tUyHKlHDAocTns857hREI1hgFJ5SaCLvPezaqRiw36lFDxFg61oVunaWRQSXnJMkInT4NvdegR9JZ
	iml/W7OcAzIRpiomudwPKL5kPB4l40jPwkAl30hi8arIKWAqwu8V5uRA3vJukN4hjfeLNgCtdLLdi
	IhvFmEJUQIiB0PcZZW0vEBY2FXexO6qRnxRciAPOGHvq33O/v6RP2A4AOyvopzns4mU9UbEdgzahb
	rnGc54vUhpuvH7xZ7grlymE/muyyMzQIb67llrQHDifXL+86VFdUYZ5mb/FP+MqsOMQ49jSVQsark
	6LEJ4NR1ds3yyu993qWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLz3-00Evmw-Ox; Tue, 26 Apr 2022 14:16:05 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLxa-00EvEv-RT
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 14:14:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id s21so10978838wrb.8
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=GwSgZwLnSWAbv/vQtx67c0Kb1Ry/IzNsMNgoWh4uXl8=;
 b=IARE7tZf/CAKvRS/bt45+YUtxGqCyjJjhWtw0Vbp6Vg5QPk2iv3VU9yjvc5SMIiD5K
 Nl0Tfd8Tb0GFQcpoTjdLjp/gqFaNwtBbH+pHf6B/xB3DVgcFnL4WqprDkvdwtD4ELuvx
 6cdmN4wCoe8sR/qk+ddpsMv1fncw7JuRs1NeSqHLjHfFwpHhIMo0gnxIxYSZB/eK0/0z
 dWCm1yK12E0p4ixIXMrVchwSC6ZBBO3CMlyFh/jOAxxbEqjRtKeovTSQdH5ZDYtas+BP
 C+22pagTmMagJeUfEhaRU4ouPvSyT46oRDmxceJj84b/4c0LBbwqa3akR5DpVv+ZIpSW
 M7gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GwSgZwLnSWAbv/vQtx67c0Kb1Ry/IzNsMNgoWh4uXl8=;
 b=3Zv6SU709M3L9WHHdcB3ItTV1ZerwUqKNhSqqD5iN/0V+xn6G9d46IWvXtPjCY1ewk
 PM1H7oWn2a0eqQJbX9/+XJxJeSff7onCncz3hEAWxNCsXl+FI9vAtZsOBvD38hFDFwgV
 jFmHJbXtj+X05CFDVaxB7HYYPehUmAy6V9uz9KsOiXNz7nUfnqXVz+rO4veTUX7lyzug
 J+TMVepCcroz7sgpX7WM7Ub2uKqeGgTAP9qBOgHeBsEWOY3yNsxPqCZPwqiGilY/msI4
 Dh++DAAgN9YiRFQPkhgesDZ7Cppoe58d4KR0oghrah1pmIdusltpjo8bL6G7bXXsE+oL
 sypg==
X-Gm-Message-State: AOAM533xFFZc/fK5ouQKkj4hCj8RpOdkbN7xZQMySy5JzeoqjTHojR+y
 0NAvCO5fhThhA4dgzanSaAkIFQ==
X-Google-Smtp-Source: ABdhPJxBszac5Q9wXycZub3pRwL1M5/pzhYNR0BDWKWENX2tuqHVlvW1EsJG1wll4vQcTgMnYQ5onQ==
X-Received: by 2002:a5d:64cb:0:b0:20a:903f:5d70 with SMTP id
 f11-20020a5d64cb000000b0020a903f5d70mr18365199wri.138.1650982472624; 
 Tue, 26 Apr 2022 07:14:32 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net.
 [86.27.177.88]) by smtp.gmail.com with ESMTPSA id
 r3-20020a5d6c63000000b0020a94e82a3dsm11962437wrz.64.2022.04.26.07.14.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 07:14:32 -0700 (PDT)
Date: Tue, 26 Apr 2022 15:14:30 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] mfd: add missing defines necessary for mtk-pmic-keys
 support
Message-ID: <Ymf+RuFUqtyzHeQA@google.com>
References: <20220415153629.1817202-1-fparent@baylibre.com>
 <20220415153629.1817202-3-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220415153629.1817202-3-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_071434_948177_0D0B8E0A 
X-CRM114-Status: GOOD (  10.04  )
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

T24gRnJpLCAxNSBBcHIgMjAyMiwgRmFiaWVuIFBhcmVudCB3cm90ZToKCj4gQWRkIDIgbWlzc2lu
ZyBNVDYzNTkgcmVnaXN0ZXJzIHRoYXQgYXJlIG5lZWRlZCB0byBpbXBsZW1lbnQKPiB0aGUga2V5
Ym9hcmQgZHJpdmVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRA
YmF5bGlicmUuY29tPgo+IC0tLQo+ICBpbmNsdWRlL2xpbnV4L21mZC9tdDYzNTkvcmVnaXN0ZXJz
LmggfCAyICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCkkgZml4ZWQgdGhl
IHN1YmplY3QgbGluZSBmb3IgeW91IGFuZCBhcHBsaWVkLCB0aGFua3MuCgotLSAKTGVlIEpvbmVz
IFvmnY7nkLzmlq9dClByaW5jaXBhbCBUZWNobmljYWwgTGVhZCAtIERldmVsb3BlciBTZXJ2aWNl
cwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJtIFNvQ3MKRm9sbG93
IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
