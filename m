Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E7EC982CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 01:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=; b=t/M0s2subzzu5lDbOxwp7IBf7G
	gWXwJW7FPdjQ8eZV55ElootzXalNFYY4UIFBMyuoL0HlIf5YrHce3x2GT110n1/QAigaPpaPC139C
	TyMnFh799GGo17UVZnZTHvPDbsVUrxLnn8kKhhh0yyfbp7/704mb5BphDiIzQXlLEpXFEhNAndvaR
	ZjuiVzQfiS1/7Lyijidx+N3xIgkcj3ow1NbKbJuty3i4l6UdRwNqjL2lpfvX24E2OR+2+I9t4ZXhJ
	bgVLKYBof4+Txxsh3CvUlSMBWGerPAFGHFge0ft1Q+KeOaxlg0BFKhsmzpb3srRcXl9Uqv/pH0M6F
	y8CpWudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70dQ-0000000AOPM-13F1;
	Thu, 17 Sep 2026 01:09:56 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70dM-0000000AOOB-3W0Z
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 01:09:55 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-85469b2e1d7so213298b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 18:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607391; x=1790212191; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=;
        b=pgcFPWCjOISjuZRQx+WG4wXhX7LNevtDs2cT+ux14AwPaB/3o8xaxW1CFICtHpdWpC
         0oGSePGLIxr8T85tJWk8TUN2ghsG0BPdIecHObRmhB/YZbTEgfaVwonpwfehj1/6EbmR
         AP6gG07OVyUYA2pdgZj6Aaalb8CuPaYW32q2MsFAW7wgVmVTLt7ttaCxWaVYfsu5yyL6
         jS0A/LKnMVQ2O9chZ51p8HpMC8EwOMiy5forgpCd8JBISF4BesYc4yt9KBmgW8YB8Egf
         MVUzdTznPnMIc4rIALj23Xk6StwxQ4AfkCdHN3T54uJLFYHmrCuH2JBquMkgVQF//wwp
         t+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607391; x=1790212191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nonWuzicTCeYBkiKvjrnS+sct50ruoIlfuFduwj3gS8=;
        b=ZWQP4KbmIjNxSg0+VwqxgI5GQAtTbJJxDqhqMygmcx29iZMJTqHYshEYRcOBK8G+7J
         82HF/ECkZZOg4DFfWKbUBPtxLspHkkPlYt1nWAUcUI1iGtCeeYFARKAbNDjbPMkHDp1R
         g7S54rSD0kaDgLm6sDRnKJFmcF6Mv93b8AJsUcKCVsfYwHr9pBGBDku1EUem8diixnxD
         pHVsOpzW2kStMyq1tZabR7UGyS2N+dodq2cYBFcYCybJoS37u2AvStlTDV7aiHDUEks5
         PVs5LG9hbVzHq37sPl954Zm4EHpkrUzRiiSbf90ayp+g3Icna2Oj0REZv9QLLVos89j8
         fxJw==
X-Gm-Message-State: AFuF++kqVSx27338+XfOcNGUxRjEO/ZsUklEzUd9BQzv/AEUYqV4upbg
	4UsDFEa/Twlbt3hppUYpcOYpbdH4J/9EBIjfhsl96T+SQzQ7Qwmx2vkT
X-Gm-Gg: AYBFou1LUEDaHHb+IMaGog73RvrxZr1Fuw2qdiRg2yVDN1RN/OAdeWt1m62rJ/UVIN9
	SbDFptLXQsarTE0auYnqVcnC2AgD0vsSSVUTYEVYK6C9GsI2i6ARjgIHDUCy17xxCEqltSGfV20
	Xc81LpHRkqAx9f9mQlOyb37PBKmZ9V8m2d/PW9J0G9ZkXSIycQ7AKRdBhq+QBo2UAioidewW9Xl
	70ojRfGcmYMCP9jxSeu5Zz6RXOaUL92aTVKtnrnuIzRf0IF40lGy0G/GvawsdepN0Hp8dy6lCMp
	ICNA/kRT/qFnhVcAeHYDx1lVECajycPoElAxk/HKOfGypa/BYPGHggwDHaRio0CPkDQSb61L3JV
	VqZp7ER2s/L8HwQJcg4r3Ygzlz87joNUzVgPTZlSGkIuhSSnUD5zqZM3stwE4ByW61n8M8HDbOu
	upusCT7lcQuTOaZb3uL3N3jC2Ab9Y4rdnBWJo7nZkQzlbEkROpx7yxL9lR0sgLLcBpt3fLBpoUt
	vL0eUrAAbz+
X-Received: by 2002:a17:90b:2c88:b0:39e:26a7:7aca with SMTP id 98e67ed59e1d1-39e26a77cefmr11932602a91.23.1789607391606;
        Wed, 16 Sep 2026 18:09:51 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395cfb0b1sm8545272c88.5.2026.09.16.18.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:09:51 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:09:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/8] dt-bindings: watchdog: Add compatible for
 MediaTek mt8167
Message-ID: <f0ceff89-4fdc-4d93-8e0a-26137e1f4279@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-4-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_180952_881601_BA05A794 
X-CRM114-Status: GOOD (  11.12  )
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

On Tue, Sep 08, 2026 at 07:38:30PM +0200, Luca Leonardo Scorcia wrote:
> Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
> which in turn falls back on mt6589-wdt. However according to the data
> sheet mt8167 toprgu is not actually compatible with mt6589 (it has 14 sw
> resets instead of 12, and its reset bit map table is different from
> mt6589).
> 
> Update the mtk-wdt binding to add a dedicated compatible for mt8167 and
> add the IDs that can be used in device trees to identify subsystem resets.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

