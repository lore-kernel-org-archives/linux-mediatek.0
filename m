Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8101C7EE29
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 13:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTPwRcU9/1owFrxG0zY81x47hBDLk9OGUJzI1r232yU=; b=xTo/nVMASI1FkKSEKDVPwaWKJ1
	QQBera7EEE0xW2POywO7ZjUyXm4jrnmqnvB/rhQDERf/FoEHUIHt9iQLPlw5WpMOJh4RixVcQTyOS
	t5l/DpxnSXXjLX2JxYmYaIiV+aZNJwiPoXdcbhiVH/iI0U+GZdPZxFWheDgsN9q/IDisdNPbFS7Cs
	UPg8CBXcNr2bLveSgAmq59Lxhr2OaKvl99DlVNKfkmGzV6zJZK1gpTyCAR+RVB26ZL7rBr5OY221z
	qZ+DpuM+44LgWlPjGrdFG9V7bjYuBZ4TL4HCn3dLJnDSCuR3CCv6r0ySrt6SdkWGhJM1H7QQze/0C
	8RZoVtnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dLU-00Ag3n-0D;
	Mon, 29 May 2023 13:55:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dLS-00Afus-0J;
	Mon, 29 May 2023 13:55:35 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-30aa1eb95a0so3256558f8f.1;
        Mon, 29 May 2023 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685368533; x=1687960533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nTPwRcU9/1owFrxG0zY81x47hBDLk9OGUJzI1r232yU=;
        b=LWr/g27RUnLmjW3T0TzziGpJ6dU3yFMD0ZkbRXguiTeMWWNxRMcii3JVD3SdkYxLSL
         Q2zJc/hK+eVilxyWDq9VWLGOiwv2+OtPXq+Btm7uYOf86seEzZF0YIeCX+yjMSboiI2c
         88KAAH9HIiP8mIksgsZp+PAj4ru1k2qAoBwvknLWWIaxLiYqCPXrfpQdR3t64Yo/smWw
         mssYTEQkhqQzqJUIQIGqE8ovS1Q8LVE8onl+dSfriT/vuzqlQjQ1KBty0AmTEQCfA9PE
         kRsrsF9w1ILVCA088Hb4AdoGwDJATkxgpNUDeaRcHGpXzc9qAEwwwGArtJWsIkXf3ISB
         x31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685368533; x=1687960533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nTPwRcU9/1owFrxG0zY81x47hBDLk9OGUJzI1r232yU=;
        b=PXIEJo0FdQdXjGxgrzE8fTOiXbi7Hn6MQ7H+AdfMaditU3MpDsfFwn6FWSrg65S74B
         JqyQ24afH6UMjWddzQcv4yIk/bbCTHupRkzyv9413Uix6zgA7iUXxqkzQpBEZi0p09em
         c0tHYePY0r/Paclc7pQms0NB9G95scrO6kcIsV76rok772gc1nw1PBKd5SnFNieujJpG
         9fg2k8Br/U8QeFdxJgnsiDBjS8E1n9jAg927FqB5LOnSqa6xzdwW1/pO/oB/s4NrWMel
         3bDR+NBJ5Q4nvRhetQoCDPAYyezwhOZOv/fw0aQWQl3SPZDcdbjjJ5rPhTsisBxbZ9uR
         KJQA==
X-Gm-Message-State: AC+VfDxrSn3n5knvrQs2HdSu8FxtwjKTFonjqWWVHv962v5d4G8gOwUG
	TZA/lmj6s/UVJOmbonHmy2Q=
X-Google-Smtp-Source: ACHHUZ5eSkNEsDiTtiEBDzlhzfIK9hH43HFqaSiCjMt3hgF///ZXBnNz6oeXz1iWZkcB2H6r75yy/A==
X-Received: by 2002:a5d:4143:0:b0:30a:ec3b:58d8 with SMTP id c3-20020a5d4143000000b0030aec3b58d8mr1939358wrq.3.1685368533466;
        Mon, 29 May 2023 06:55:33 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t4-20020a5d5344000000b00307acec258esm74633wrv.3.2023.05.29.06.55.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 06:55:32 -0700 (PDT)
Message-ID: <86a96f9d-196a-8592-41ac-f3b8303d55c6@gmail.com>
Date: Mon, 29 May 2023 15:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 17/27] arm64: dts: mediatek: mt6795: Add MMSYS node for
 multimedia clocks
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
 <20230412112739.160376-18-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412112739.160376-18-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_065534_138559_6252A007 
X-CRM114-Status: GOOD (  13.34  )
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
> Add the MultiMedia System node, providing clocks for the multimedia
> hardware blocks and their IOMMU/SMIs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   arch/arm64/boot/dts/mediatek/mt6795.dtsi | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> index 99cc4918e6ba..a8b2c4517e79 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
> @@ -635,6 +635,19 @@ mmc3: mmc@11260000 {
>   			status = "disabled";
>   		};
>   
> +		mmsys: syscon@14000000 {
> +			compatible = "mediatek,mt6795-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
> +			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
> +			assigned-clock-rates = <400000000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> +				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +		};
> +
>   		vdecsys: clock-controller@16000000 {
>   			compatible = "mediatek,mt6795-vdecsys";
>   			reg = <0 0x16000000 0 0x1000>;

