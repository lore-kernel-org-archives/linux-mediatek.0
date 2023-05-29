Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8466C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 13:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxF01hOJFWwqeJ5mF+InyarZkjvnXX1icR3jLwM6pIw=; b=UZ90UFYOR+cfUxeISCW5IXfMyC
	DNbG+KZuFnZAJ7hWi79sOcwuuRLJsm9huV2g7L9gpXFk2LG8KywKuU2dT0frKhxWmTu4IxjMnPSrp
	z1jkOLk5QzZshlHvLIas+lJlWJsM+T4sVmS8RquZzeyt35RB0vCsN7qjUwpDhSDETzx68dKVREJEM
	GPiHnaCbAANXmyYkmQFHPUywGdZCXELJisdrH5aYJGvMXy7AUJAUATwWmKebMqxpHyCu+flCFDzZ2
	25lUGKuQkdw0kW0GsOAt7jrXU6u9eFJyP3O1QUJ6T0PuK1gS23NLJUQTgfTyPho6iE9DlNdtyPXoG
	IuwTNyJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dKx-00Afw2-34;
	Mon, 29 May 2023 13:55:03 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dKv-00Afus-2R;
	Mon, 29 May 2023 13:55:03 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30aa1eb95a0so3255943f8f.1;
        Mon, 29 May 2023 06:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685368499; x=1687960499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxF01hOJFWwqeJ5mF+InyarZkjvnXX1icR3jLwM6pIw=;
        b=Bt0Aszg9Rqb5zOu1MN8HeJXrz6mEjVF+eCPfGBuXKTcwLER/vanVda1+RWQ03bASjl
         x07VUdprCygZ0Y0p38AO4EYof/LD/2Joa5jTCigjXwMxxh+tOZoZnUu9zhcdEE3G2/sO
         fas84MgaOBG+QFPwRz3QV/4hAgjXh6Vk9p2K9FSOZw4yRaT8ROD1tKp9kk+XndaYV0xS
         j8ipOOESrDlLQsFFQYt7NrkW7dlByEZKuhIQ/TjsstzmRV/KZQSDKQV5YEXpIxJbObVE
         +7hndZ6H1iTJY9CtuKRgoO4AaHp/nTkKvoehx0s54IiNZN8HtctFeCz5v8cx/xx6tAOJ
         fTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368499; x=1687960499;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxF01hOJFWwqeJ5mF+InyarZkjvnXX1icR3jLwM6pIw=;
        b=Pr+ClUJM508T9kqz1wRdeRrAD43IFqJMVmt8/ojfd4o1MOM2XuXgvqaTZaq/9abVvu
         HS7zj72cDjkPppi4cCV03AXa0ATG2VWjklc5VGkQdKrbvueKd1XbeiAmlFdqogeEJKh6
         BBK4smzYtyGcpc8m1MfjR1hF6/mModC8iz0kTKNK28O7qswbVmCMbvSRAeFqij8N9JB8
         Gv8QuuRGAXJXre7G0LiDqkVecdStXF96pDrxY5Ag3T1+FZ3+1OKg+8lMORerqjegBtLz
         TG7lmV8v3cq0IblGmNjCzsOjXH7n/znb32ndDsfYV7eeKY9mVe3u8+VFb1ued4apC1nV
         StuA==
X-Gm-Message-State: AC+VfDx6UJ3fWNG8SMDF1f13fpGoC5vXdI6RzVyzWGUAgYvbTguwfia6
	W0hUcnx10p+soAY+W7Zgryg=
X-Google-Smtp-Source: ACHHUZ7m92JhOoSuT58IidM7J4/3EF7ZTdc7SnG4vzmODXGWQHCnYiTNtNtfeLeAW4fOuzUIVItl2g==
X-Received: by 2002:adf:d086:0:b0:30a:e7b6:52d6 with SMTP id y6-20020adfd086000000b0030ae7b652d6mr4346165wrh.52.1685368499381;
        Mon, 29 May 2023 06:54:59 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id x2-20020adff0c2000000b0030af20aaa3fsm26184wro.71.2023.05.29.06.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:54:58 -0700 (PDT)
Message-ID: <bdbc4e15-3cd9-ae93-fff7-6e323035c1d2@gmail.com>
Date: Mon, 29 May 2023 15:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 16/27] arm64: dts: mediatek: mt6795: Add support for the
 CMDQ/GCE mailbox
Content-Language: en-US, ca-ES, es-ES
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-17-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-17-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_065501_802037_D219F964 
X-CRM114-Status: GOOD (  13.49  )
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



On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> In preparation for adding multimedia blocks, add the CMDQ/GCE mailbox.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 090400d7fd61..99cc4918e6ba 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -7,6 +7,7 @@
>   #include <dt-bindings/interrupt-controller/irq.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/clock/mediatek,mt6795-clk.h>
> +#include <dt-bindings/gce/mediatek,mt6795-gce.h>
>   #include <dt-bindings/pinctrl/mt6795-pinfunc.h>
>   #include <dt-bindings/power/mt6795-power.h>
>   #include <dt-bindings/reset/mediatek,mt6795-resets.h>
> @@ -401,6 +402,15 @@ fhctl: clock-controller@10209f00 {
>   			status = "disabled";
>   		};
>   
> +		gce: mailbox@10212000 {
> +			compatible = "mediatek,mt6795-gce", "mediatek,mt8173-gce";
> +			reg = <0 0x10212000 0 0x1000>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_LOW>;
> +			clocks = <&infracfg CLK_INFRA_GCE>;
> +			clock-names = "gce";
> +			#mbox-cells = <2>;
> +		};
> +
>   		gic: interrupt-controller@10221000 {
>   			compatible = "arm,gic-400";
>   			#interrupt-cells = <3>;

