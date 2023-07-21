Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD51C001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 12:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BWpxgzm4YyqLL1nxw3+KtSqa8xTPS4Bh1HLxz27Ca48=; b=UkCvWXO7jQQRJppcd1qanrxg1L
	/njX9n7C8MxVk/2xS9OAspHDYf0V8sMuyT11IPwbeni7twtOphbvo1PTvSM1GkN6IoHZuD/ZrdBJh
	R8UTsHrPPioLpC3Uxoo6ADy5dsDi79km0rxFDc/VdaPjnWEbaPOWTQmVzoC5cQMywLtNCj2uKnCZi
	8nIFjHMYKEzaX1i8xh6MeJUhG+YFyOox3BgtaQvLJl2uJE0pWbGmBJEgs8r469nYefm+tGqLzQnjo
	WMueubXzykf9N7OgqtdlB3gcKBbfEFRBxBQytNhTjKZkBfrdpW9yHCPIluQ/RXkKW1g4fPtoMj5Rn
	b94zfRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMp9C-00E2O6-0S;
	Fri, 21 Jul 2023 12:22:14 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMp9A-00E2NC-0z
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 12:22:13 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so2577011a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 05:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689942129; x=1690546929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BWpxgzm4YyqLL1nxw3+KtSqa8xTPS4Bh1HLxz27Ca48=;
        b=A0cs1EZJ3USdSwmD8Zmh3BHe8ECUz3i/LDYB6rwgMenjXjzKol6h9cQafGd3mIi/N8
         KDogdbP7gvOQK1svPbOI6mX7JR7l19JqTN97JPSpqhLrjOUlknE3puy0ugR0398ZLYo8
         naxgj7qN3ZGNjf5lbDutUFiPL5qXCYetmt9kl5B2AWKvU4VWJ/ZZd9h5YVosYSWqiRjt
         W8cq6p8Jyrf5Xrr+g9tereb1+qx1zhbITLmoTVBuYFWR/UOP1naRde+doexBATL0CiJj
         TIqszl/alN3axDgU8rNVOlfgYsyyEbTRdlyyC/Wk2EnMo63bLN3ekuvj+bMT0APDQZgu
         1btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689942129; x=1690546929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWpxgzm4YyqLL1nxw3+KtSqa8xTPS4Bh1HLxz27Ca48=;
        b=cZsKu9lwrCd1Sobr+P7xXcqYgvBPBw3MrueA07lTySw5J8hnAu0kygB3ffVGb7K7Hk
         AJzQTQrreb4WwmCHry1l+ywl2a84p2h5GYwYY/shpFML5K4g3Pwjty9sBNc52lA7+GRl
         9JAA4egfIqmKWu41p7N0MjWqyv8/sdIren17gotLF1UW/AzxvuHNkd99bOkYoZiyzRYC
         rblFqxjK9cbtWfE60hlaJqQ+oLKATsNnZWqouP0q0SnNrUbvOaH4uSQ4e/d4lf6/Nufn
         1gwL2KNz6UqMkmwKUZSsEZS6gPDlhF6tBrySCCTAWaqij8Cc25KNGZlfIaEEgcN5oqlG
         NT3w==
X-Gm-Message-State: ABy/qLa7DN044UW+QOYIoSgh2eHbrHYl32TmPmVPFPsjHAYdNYfhHqDu
	Al8yI09R28VGRoD5j7zfVEep1g==
X-Google-Smtp-Source: APBJJlEgrr+oqGqdLHlHtx6ewGfVXW3b8XDYFP7oP/kY1KKgiXY6CgYY6m3yXZcmQOqvbmIY53YC/Q==
X-Received: by 2002:a05:6402:7c9:b0:51d:98d1:5337 with SMTP id u9-20020a05640207c900b0051d98d15337mr1478707edy.37.1689942129328;
        Fri, 21 Jul 2023 05:22:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402064b00b0051dfa2e30b2sm2042298edx.9.2023.07.21.05.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 05:22:08 -0700 (PDT)
Message-ID: <c3ea2edb-1b3e-2c39-ccf6-333e3c8b9020@linaro.org>
Date: Fri, 21 Jul 2023 14:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Content-Language: en-US
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20230721081948.1185360-1-alexander.stein@ew.tq-group.com>
 <20230721081948.1185360-2-alexander.stein@ew.tq-group.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721081948.1185360-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_052212_370387_AFA40B31 
X-CRM114-Status: GOOD (  10.19  )
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

On 21/07/2023 10:19, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in v3:
> * Rebased to next-20230721
> * Split from bindings patch

I think you wanted to split it per subsystem, right? That's why you
resent/v3? But the split did not happen. If you decide not to split,
then try to figure out: who should pick up this patchset?

Best regards,
Krzysztof


