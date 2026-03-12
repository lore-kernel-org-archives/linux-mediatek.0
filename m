Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A2E106ACE4
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 20:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=; b=hXdY1O4oKljV7nYHLvjiOblEJi
	RRqCJxDSTSigYRooMXvHGX2bbKLpj3LJkmd67Q08BH2NqZajzcZN/ir+E4enyg+5SiTLGZHePXRuw
	qvLKsaQ5Eh5Zn/kX6I47zJtpIRw/F/3FrJ/SytQzlJsVVXqJ9QKGa7bafFX8fvhzt27n2SindR2ji
	qMeHFZ1L3TdHLx9275oLruhfxkhmTgkTTnl0fFVJPF5DOFAqnfvaRwTpamGpAl1fAtZ17NFjXHVmj
	BhhL69Z/l8R4kspKi8JnEMph8jlWY0rnuAJ2j0I9Qmg4yU2cmUn3Ppq2EQIl7D9Np1LTpad6kgBMl
	otdlczag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJW-0000000FDaH-0Dj4;
	Thu, 12 Mar 2026 20:07:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJP-0000000FDVw-3pU8
	for linux-mediatek@bombadil.infradead.org;
	Thu, 12 Mar 2026 20:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=; b=FYUXW5RLjPo5Ef9/14lNnPw1vF
	IIXGyjoyVM8y93ofuga+1sZ8cKaIgPP/TOwhPOr59Vg+oSVuZ5dlVAhWxPAky7LIIJz1cgyWN+Twy
	y1mKWCo9rGThD+vhAiI6JWwbi9hzkhIV91SDC4X3vft6ATJmHL7Fun4w44b6ii32cweCj92lIRdkq
	yBjakd9iNl05qV3XGAQn8IrYYyCN4V9gxqi95426xde+8Hbg5XB0bfbENW3dod4RfRDXBbCkf9j8j
	M6xgsYJjwVJx6ACVmpbD8QEE8jn1Qs+pSOwr5vgk4fXkfo4fkhJiBmlMOI/+IM3ox8jf+Wx7CMPlp
	cIIfUrfA==;
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJM-00000001xja-0HJt
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 20:07:14 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-40438e0cba6so975269fac.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 13:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346029; x=1773950829; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=;
        b=vdtt4xJihXgFFp7ZLHA3ONiS3WfWy9dMv+fC/O4v29o3IxYh9cMzS+rG1oq1PbsPtr
         AcFpUwTCqH9fTrfXEkDUVAx9pQoV1308LHuTaSK6a03h5WzgYVkb19pEt2VBq+MmOJKA
         N6XaLwGkJAw9QppGasl7DGMXCj0X9wtWVtfUEMBQvl9S8RJlVBdesBhc7ej4geoykDzR
         o1saxbXlW5ErgozWha+XgnvgpLOKvzxH6euueISIV6Y8SX67ogRPKnMVrjaH0iPqzF5X
         DN6AKaRxPPLNbEpZCIFzy0kFw06MfuJtI2mo8C3ZKrFE7ERP1qK5NeEWUBLFPKPLgLos
         vA4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346029; x=1773950829;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XrfqSRvy369yVc6mkzBE9cxk9/iWVTONTSjcJTlQJR0=;
        b=a2MrVVj2Tv+gKKjhyiQQtkXTsdx7F5Fu2PW8jTynJ3eV0HmsJdprcmKCVDq1JhqjCU
         RDXSmfL+yyuqXXVESf8mubYQiB02gBrSyZWXJ/+9tZ9SWgtwao6Q+V0KC93emELOVU9D
         YS+HYXd1tSGNVrLXXpMyyRKF1MATvCkU615d8+4tO63a4z8tqMaegKthfpj1Wuso3/Ge
         422FnVcx8jurGwbmTe8R1hU/hjF6etNGXwe7eD0btiE5XYp413crVBs0ghLEIV167f1x
         UGE2l6/22EBv7Z3E6S4mrOwxmSbgFuFFlSqB4f2qm1FFpwvcpwaW7hFE0IMLkSlK3Xnl
         psKg==
X-Forwarded-Encrypted: i=1; AJvYcCUYAmBAyd7IME9Vem84YE6psUjfL6ltr+atWjnj0Ny1T2c1qOrnLjmGygWlJtTVtG1zNjz/rpUhA6KhW2mSKw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxSQ6ME7XMnXtA5ZqGD94iJroBpUWZxQ6gW0igWTivK89aLaLJp
	qpQFRBaUNl8AXKvmd4fY1VhGrG6mOlpn8E+Vw+1RQMTQ24ynJ58GCRYWe4wFO6y9L44=
X-Gm-Gg: ATEYQzwE34wEZ/775h23Ph5KvSJnlWSGSwRE7Ge0ipwQOU3Ymq5PfAnnwQ1mi2Z500A
	vAGyNHYwPAYdJdA6EVXdi8VwOH/rLqwd+2gZRGf4aNsoGIR65E05OKcoX9DYr+xLwZmz5IZmefv
	jQbZ1NXkDCbhYmDfcK9Rm8p8nx6obnevRQYLICEIuho/W3ZI9z10APSsC9LiZ+3gjWBizB0So1B
	iZR8nDlo/fNQsjtsuMOJcYVP21FRJjLRZMGsHSUlwsYoqGqVRjbvWDlNA+PgMB1DP7KrSNc8vUG
	1Ei4xdOFQSx9AERoTyruJA+Xfu3JUQrBtQWi+m842qgxN5B4z7WfwutjhQLunq8n6noJbawt+0m
	hJ4PNIU3y6FWFOWp6RuomnbCsFugh+JmNAo6wm+uSn3VPNx8OuesaQ9Xz0BDSbXR4LgrUCpkP0B
	0Umgepe8sEdI/obzk0Fs/jMKorHGIOzhWaJt8mSrE=
X-Received: by 2002:a05:6871:5292:b0:417:482c:5c0e with SMTP id 586e51a60fabf-417b93fd827mr366324fac.43.1773346029164;
        Thu, 12 Mar 2026 13:07:09 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:08 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 01/18] dt-bindings: clock: Add MediaTek MT8189 clock
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-2-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-2-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.9130759829438828661@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=520; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=tkQxE/WaHOTyLw9z/sp813AJR6zA4pd2NdpV7fP6+0M=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzWwLcwCiJ8Z4K49ki7iVfChNgBVHE7qCgpm
 Y/2/Iw4lzGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMc1gAKCRDCzCAB/wGP
 wC7SB/0fcJl+IqsMtJ0KbpayFuuIWaEoKx2Y+kspgWFvDk3ZZN5eiVoAGyzSde4TNg8/MKEDTzR
 zssxuG27VwnhdKRK5hXY3KyVuHfvUo+Q+l1vWWM6d47IkLLuJIESKy+aV6ajhGZD5ExQkBpqLUf
 /vCSyDwGMkE9rkFHUQ9p6WuFUFifDb0HOWvcvuM9MQ36kTfp9Ub0ufAYs4MbrMujowXIBE5YR5K
 5KfOPmbBOw6gtvbrhPFp8Jcwft/caJjstn4wz3XNF9+w6So2N7A2xaO+U+M3NrKjgHLBAscD6wX
 SU78NqGacCN8wXbg9BmNJJebWwHSdHSmXbCCXImCwsfnHKTq
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_200712_359744_7699FFD8 
X-CRM114-Status: UNSURE (   8.35  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 09 Mar 2026 20:04:43 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> Add dt schema and IDs for the clocks of MediaTek MT8189 SoC.
> The MT8189 clock IP provide clock control for main system
> (apmixedsys, topcksys and vlpcksys) and
> subsys (eg. peri, mfg, venc/vdec ...).
> 

...

> +#define CLK_TOP_DRAMULP_CK_EN				205

This one does not appear to be referenced anywhere.

Should it be added to `static const struct mtk_gate top_clks[]`?

-- 
David Lechner <dlechner@baylibre.com>

