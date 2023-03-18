Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F76C74A5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 07:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCrLidp4OVEXWIbXwYSJK83G0PQpXkPRHVsrJ8zeqyc=; b=LdTMHsxI8GvGD/tHeJsu1fUgvu
	8vhSPh5kxZnbXNyIynsa308DunBmk4nd3MPhxp5UpuVkDfJgTN55Ym2CYgwaH2lkT0lN3Bm9khrUJ
	Pz1shnVyzKGPQWt3oBuU7dpKWA1yfQIMc44IFaCcfP4UyrJ759ngBdhBQzrWtiTLmEvTWdxNpPsCy
	nwcW74doaN4Gy7O9T1A3Es90rd/iLD4izRALYrluoL91sFzcTx0biMWGax/MmU2fUaQSi+QL/UPX2
	+JvdUUxlhOMmcyoJxxeOdFDh90hEaYJSag1qPMIbuYWHogDjJ+LNVojz/rHoxftZQT3NTXDrIfx7c
	XOIUucuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRRD-004Mwg-1e;
	Sat, 18 Mar 2023 07:57:15 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRR9-004Mva-1Y;
	Sat, 18 Mar 2023 07:57:12 +0000
Received: by mail-ed1-x532.google.com with SMTP id y4so28653005edo.2;
        Sat, 18 Mar 2023 00:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679126229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCrLidp4OVEXWIbXwYSJK83G0PQpXkPRHVsrJ8zeqyc=;
        b=gn2IS9EeMuuN2iJYYd/yuXLOvz9qmg4U/sRPP40yWOvsWVZbeFifHw4f2weg80aGCC
         tLvYsdGIoe+NWqDIrMT7h9Iv2tUJP028uUZtEOUI29xEqBu1bO17Ct98eRg5F4+E4PUo
         BuwKY38VUfAMTJMzL9VL8IvtDVbj0aa8mdo677TtnT+9AitEy4hmWH81wjyW1DMSGCrf
         45U5Uh8eTLf9neZoSFsOeXK30Za/TzDdtGT7GW7refAg45BgltukIbCQEQiSwCduEPPu
         fY3XhiVCrA+Z4hjixcvvQGNcxGYuKKo04EgyflcVtlQFuOt7eF8zRwftYoAdGSAtjuZ4
         Cv7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679126229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wCrLidp4OVEXWIbXwYSJK83G0PQpXkPRHVsrJ8zeqyc=;
        b=NAAcqzvPrvJVM/gNHAMqT0mDBga2E8jnMuWW/MulG8EXcFGaK1rGIZXHOBtYgdlIbc
         OXGoUEy0kpKdh1ari8Ue+Z/v70Sst9xtocQ9wC3nsWw+NOPdKzfBcS8GU4qjyI5nrzaC
         BbATA1Ad7SPSHUW1NwyqB1En9jkaee/mf3dIXLJHjmpWGNtdvl3QUvbUmUF/OhOgGpks
         hRa+GKrpjgyDfPXxbEYy1UJeE5KstzrPkIpz97dXG2NkRjowST5je1MLqyk4eBhpClaw
         rZ/SbIlxE8WZUu3AmBWQ35wlNbXTRJtcrqL//gp82C/fivExi2fZVOXzLh4Aa37BYLlB
         YA2w==
X-Gm-Message-State: AO0yUKX6nmfv+q6Y8wW6ha9VELLXWB54tH+ITI2fuEpCfqZVpmWO0Z0v
	aKYCLoCSnGGHzT5DqRyI/pQ=
X-Google-Smtp-Source: AK7set+ZpTCTkVBDtoYBzI61rbVWTHWDTXRpYAoEc8uSO+dGa58EHpp0+H/L9Ew3/QTlDkVyPDgPGw==
X-Received: by 2002:aa7:c9d5:0:b0:4fb:e9b8:ca56 with SMTP id i21-20020aa7c9d5000000b004fbe9b8ca56mr4490833edt.41.1679126229004;
        Sat, 18 Mar 2023 00:57:09 -0700 (PDT)
Received: from jernej-laptop.localnet (89-212-118-115.static.t-2.net. [89.212.118.115])
        by smtp.gmail.com with ESMTPSA id c25-20020a50f619000000b004bd6e3ed196sm2002916edn.86.2023.03.18.00.57.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 00:57:08 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: nvmem: Drop unneeded quotes
Date: Sat, 18 Mar 2023 08:57:06 +0100
Message-ID: <5656590.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230317233640.3968821-1-robh@kernel.org>
References: <20230317233640.3968821-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_005711_539064_0B7AD298 
X-CRM114-Status: UNSURE (   9.60  )
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

Dne sobota, 18. marec 2023 ob 00:36:39 CET je Rob Herring napisal(a):
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml      | 2 +-

For Allwinner:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

>  Documentation/devicetree/bindings/nvmem/apple,efuses.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/brcm,nvram.yaml         | 2 +-
>  Documentation/devicetree/bindings/nvmem/fsl,layerscape-sfp.yaml | 2 +-
>  Documentation/devicetree/bindings/nvmem/imx-iim.yaml            | 2 +-
>  Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml          | 2 +-
>  .../devicetree/bindings/nvmem/ingenic,jz4780-efuse.yaml         | 2 +-
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/mxs-ocotp.yaml          | 2 +-
>  Documentation/devicetree/bindings/nvmem/nintendo-otp.yaml       | 2 +-
>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml        | 2 +-
>  Documentation/devicetree/bindings/nvmem/qcom,spmi-sdam.yaml     | 2 +-
>  Documentation/devicetree/bindings/nvmem/rmem.yaml               | 2 +-
>  Documentation/devicetree/bindings/nvmem/rockchip-efuse.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/socionext,uniphier-efuse.yaml     | 2 +-
>  Documentation/devicetree/bindings/nvmem/st,stm32-romem.yaml     | 2 +-
>  .../devicetree/bindings/nvmem/sunplus,sp7021-ocotp.yaml         | 2 +-
>  18 files changed, 18 insertions(+), 18 deletions(-)




