Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AB0C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 11:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsWeZKTMRUjS4UGWGKXKi/F6OhLV9oNlEr0sqKPjdhY=; b=vTG+MK4pXl96D52+PgbpOG0rss
	gzkcLTJoiEuPUKJH+relyOtHA7Yyv9UuAwt6nA8RvVN6S5X1zMQIpEe7FaMemfCqIJQQ+w23Buqhp
	5RkfUT6L8GnvPKH80hfnQd/3hk7YOeCpJpX5xWOSzFr6IGssAhC6w43jp1jqLsyOI/YN+qz2Ajlg6
	7LM6TnYBAnJIrzEqHus7EuL1QwZPEwK4dJzHLxJXZvlWlbm6El8oVEf/ECyCjr9bIaMenGZggnRJk
	KNCGrra4Md1kiH1yPxjsJy0p0FLmKOYp90dv/8GugywNeCxBgqPAdHpjZcGur20jDZykHi1jEjssY
	sOR3pkOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3yAu-00A42H-Ex; Wed, 22 Jun 2022 11:05:32 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3yAh-00A3yL-B9; Wed, 22 Jun 2022 11:05:20 +0000
Received: by mail-ed1-x52a.google.com with SMTP id e40so10811911eda.2;
        Wed, 22 Jun 2022 04:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=BsWeZKTMRUjS4UGWGKXKi/F6OhLV9oNlEr0sqKPjdhY=;
        b=goSSVIS2xMmIt8+zQ+4MnTruyoXO+gM/WRoEM6Cuo0Prstx1aOOwxieSEas175GI/Y
         pR2Ri8ptjhMZM/G7BHcC7rgqDl7INoPAriq7bsCHGZaWu/qkjeRlUw4V0ROTlGdz8Jsz
         ZGNVA9rlMFvvpoELJv0Gr/0V7oP28iDObt/v/9fSfFXohainHuDFWRfYpz0WhcPFSn5v
         TZkEbd++U+4Lt5ORaWDswJ87h+OTBxqy3lfL3eFCaJcKfpk3IXE4l8eYzXXW4G6vNZaq
         /7L3bJjNz22oFeOw74YdcXFiGlAiK/Hpa+Ha3pZuSu6M0TMMTi0rSX0YXOE9lEsDAZtb
         l3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BsWeZKTMRUjS4UGWGKXKi/F6OhLV9oNlEr0sqKPjdhY=;
        b=S637LoltonVAN2eRGtfhvAT8oJqTkcDikDn9PsKXDH7pFL6hEVZ6Rpmh2ACAovIKxA
         Q09t2N01Mf9GUFwAzmg2VY6EQcoptfliamwCJpQVOPb4yLUoxQyqvGqsX6KSjcQbBkRP
         NWtyT1mPYb6/f2sjnhh2zAf6AFLTtbfbn5mN0Wz3WwpqV/A5/KV+TJHIFDGeYo7zMwCZ
         66iWRen9gNxNrUfPnvuUjixXWfeRkRHX9JjT7Y8vNBI0HgE32g/Dul4oyOT0Gj0LX8GT
         N9KfLTIqaZiTidu3jHbQYEVfX/kEUfcXEmU0xpybo1sPeTC4y3IzDP2iWnfDKCAhN/2k
         YGmQ==
X-Gm-Message-State: AJIora+GrlcqAtFLWBDRPr0YLGrWvddZZUYDstlpNY6oIYjfvP8sKZFP
	ylKTQfoOtsvunLBg5yU0WMA=
X-Google-Smtp-Source: AGRyM1s9nDUowq9+/oNlBIcMXsoZizGRGfHc6q9TiQd5vkG3V7Wuhzig5PXTkxlYtZVA2ciTT6f/JA==
X-Received: by 2002:a05:6402:4385:b0:435:9104:955b with SMTP id o5-20020a056402438500b004359104955bmr3470937edc.45.1655895915755;
        Wed, 22 Jun 2022 04:05:15 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
        by smtp.gmail.com with ESMTPSA id b12-20020a17090630cc00b00722edb5fb53sm1007705ejb.116.2022.06.22.04.05.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 04:05:14 -0700 (PDT)
Message-ID: <6b4f108c-b4bc-72cf-5972-222fbb2f3fca@gmail.com>
Date: Wed, 22 Jun 2022 13:05:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v6 15/16] arm64: dts: mediatek: Add infra #reset-cells
 property for MT8192
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chun-jie.chen@mediatek.com, wenst@chromium.org, runyang.chen@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220503093856.22250-1-rex-bc.chen@mediatek.com>
 <20220503093856.22250-16-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220503093856.22250-16-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_040519_446378_DDAC9AEA 
X-CRM114-Status: GOOD (  12.99  )
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



On 03/05/2022 11:38, Rex-BC Chen wrote:
> To support reset of infra, we add property of #reset-cells.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 411feb294613..79803420d8ef 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -269,6 +269,7 @@
>   			compatible = "mediatek,mt8192-infracfg", "syscon";
>   			reg = <0 0x10001000 0 0x1000>;
>   			#clock-cells = <1>;
> +			#reset-cells = <1>;
>   		};
>   
>   		pericfg: syscon@10003000 {

