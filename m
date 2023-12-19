Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6005BC41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 08:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHZZ1qBFLYk5D7ybnvL0vNBwkKCdL+WfKJkMFR2G4jQ=; b=woV+BBpK7rZzyMmJZn1+WJpFkp
	NHCt0pR698/GPVat0hPj9ogHZ5CPa727VIEGvwiyzRk1Sk5Oit8xN4c5z0+R4HbB/OhnBaQAXuirX
	LjWuE9H3UXqrJ08yfszSJzfTjlqR5WDk96PxTKooHNVXuuCMrUm+9hGJvSpjWBUUD2lXfhAT/8+iA
	EJpQF2Mq8Mq36VSdUcYka+n+7esjiQWJyPg+QYmjFtBr83sN8IIeDTzuREZReIqZbqgnErvfoUBA+
	ZJY/VldC7g90mMg29Mjbuytrru9qhUjRS7wCJ5We+0TfEd6Wy+1t8AfnQAoxqdtErMoni5YESTwQj
	IrZ6TrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFV7O-00DF4y-1E;
	Tue, 19 Dec 2023 08:06:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFV7L-00DF3y-1f
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Dec 2023 08:06:21 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-54ba86ae133so3732497a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Dec 2023 00:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702973177; x=1703577977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zHZZ1qBFLYk5D7ybnvL0vNBwkKCdL+WfKJkMFR2G4jQ=;
        b=BJKywgd4mmnSdDs6PT0qQxRbECiPltqzZXROlXYGIWhQJaEbhTUoa+mhwldnQqNs6r
         l5AH2ZyecwzOjssFok0V3UbH9zV+nnS2xC/O/G00elo/NKeArPeD3r3UspLXreeVrcC2
         AnAWg3vz33Z8eiAWPTsQECxMGLDCFc1wj/sEovenddN5I6OI4Ab6PzrOA03gj/yelpUI
         zAuCh4H9V8BlU4RUbs1UUF1AHDSnr6STF8odl9KbMVjSm+aiqQ+MvmyLuGIZANBshiWa
         H9HluqdBGpNwawAZIgHMdk4P5RMNXUY6ZxgfbyYsdIqwIyPB0pLsjXOZlX4oxb4QqpJH
         9+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702973177; x=1703577977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zHZZ1qBFLYk5D7ybnvL0vNBwkKCdL+WfKJkMFR2G4jQ=;
        b=vWimuEp9L3T2zprOUTzoMPde07kZ6iWzVaS69BTT4VfN6BHP64QRGzcZxEESnsYPJc
         sWhVNzZQn8aTUCn7TZxyb6T7QVUktmEcxghzwrs96iSrpNSwAiyJy/BCu24OqFN3ZjsA
         H9XrC/66DPy66lkt9GAmsVhIN+EX1ct9zgoP+lfAlRD5ZgpQAF/36YOYO1dja71Cyrkt
         yM1tsDI7so4eh6Olk+XFN6ZRAPeXPWyvduN8NEkfIomh/om43QYsxttjBzP0jUgDeC1v
         CIz0h1HxeMwjI+NjRm94a4OQ0cjKLga730cl97ZUiSn51O2F0bQqSqt25IaRLq3Mafrf
         D49A==
X-Gm-Message-State: AOJu0Yxb2nXtKwjwhXIKNuYkURlrCYo2a76jD0TXlmhVV1xmtPTMzAa3
	qcSC4OHObuGpO36ZDxP55xSy5g==
X-Google-Smtp-Source: AGHT+IFk7nCwJ3Cgygcv0PPxf8Nmoq++kFT+oSJXnVr98jtfa/yztBLisAU2VWlBWmsiTo2oa5jg+Q==
X-Received: by 2002:a50:cbc7:0:b0:54c:5d34:980c with SMTP id l7-20020a50cbc7000000b0054c5d34980cmr8989833edi.82.1702973176885;
        Tue, 19 Dec 2023 00:06:16 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id t16-20020aa7d710000000b00553533738f0sm1667914edq.57.2023.12.19.00.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 00:06:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel@pengutronix.de,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	linux-mips@vger.kernel.org,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-omap@vger.kernel.org,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	linux-tegra@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 00/15] memory: Convert to platform remove callback returning void
Date: Tue, 19 Dec 2023 09:06:12 +0100
Message-Id: <170297316309.10063.8435852209780151651.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
References: <cover.1702822744.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_000619_551194_72359865 
X-CRM114-Status: GOOD (  11.25  )
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


On Sun, 17 Dec 2023 15:29:26 +0100, Uwe Kleine-König wrote:
> this series converts the platform drivers below drivers/memory to make
> use of .remove_new. See commit 5c5a7680e67b ("platform: Provide a remove
> callback that returns no value") for an extended explanation and the
> eventual goal. The TL;DR; is to make it harder for driver authors to
> leak resources without noticing.
> 
> This is merge window material. All patches are pairwise independent of
> each other so they can be applied individually. Still it would be great
> to let them go in all together.
> 
> [...]

Applied, thanks!

[01/15] memory: brcmstb_dpfe: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/431187eadbc7b0f2650d4e55111b3fff4720f867
[02/15] memory: brcmstb_memc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/f7754712ad6094de5be18674777b265ed4db2f45
[03/15] memory: emif: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/c8a53461990cb697ca494d6671fab9e196d20ce4
[04/15] memory: fsl-corenet-cf: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/021d044b0f9c9a09aa2f778e876e467a8810fb4a
[05/15] memory: fsl_ifc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/f17130855d51f24563a24cd957add769ad59eee9
[06/15] memory: jz4780-nemc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/9024fbbd77b4d73279bbbe2c748a4e4b414d50cc
[07/15] memory: mtk-smi: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/08c1aeaa45ce0fd18912e92c6705586c8aa5240f
[08/15] memory: omap-gpmc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/6a4edb1a4f61e28cc127cd06c470ce3599ee0d9c
[09/15] memory: renesas-rpc-if: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/961abc9f7d6771e8f13db1f4d8b0ffff3f0f41a4
[10/15] memory: exynos5422-dmc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/8013408e4912fb7e469bb8b14fd3a5c956257eec
[11/15] memory: stm32-fmc2-ebi: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/1455b6b0c83132960826d0e527a79a355e096a80
[12/15] memory: tegra186-emc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/dcefa0368458e9e20642dbd2608adae6b22e6464
[13/15] memory: tegra210-emc: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/622fa819a2f0f3e6d8322a0b6d3177302ae937b6
[14/15] memory: ti-aemif: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/7852eb8c8ac7e0164b43cc5f8d8245cc3a037620
[15/15] memory: ti-emif-pm: Convert to platform remove callback returning void
        https://git.kernel.org/krzk/linux-mem-ctrl/c/365fcc03b6321f36eb7cbda8baa737238c387907

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

