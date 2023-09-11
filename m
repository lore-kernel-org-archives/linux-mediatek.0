Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BDAEE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 09:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7DJF/aPEV3vDd8yqalPdz0X61vg1+5YEX3DUZznD8s=; b=kMTngTve4CSGwGSj69jLK1whUF
	Fvw+2alrFBiHhynMP/bq77Dq42UakOkcWKllyQuJQAr3s+J7fk979LEvpQWXU2N45JCPvBXozUbT8
	CRhfONTYrRlqby1Sma1E6tSAsK3xxkc82IWruu1oB/Qlzqxgot0yE0PDHPQ0nbD6uT+yeDdTsVgVV
	r28+16yNXZmctpL7LFcjBIKZ13cTki70kXAPAcqNvChAAjncsTEsNxz7Slz8u+yNs27ypxk+TBi+b
	nq2PdO4NddYNphP7jPyhSDDo06MGcROHt6qeley01o3IVOe7C2v+RRQUx7UW2M++u++2UhUjYZkNQ
	3L66R7gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcr1-00HaGV-0H;
	Mon, 11 Sep 2023 09:05:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfcqy-00HaFa-1f
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 09:05:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6979A6607083;
	Mon, 11 Sep 2023 10:05:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694423101;
	bh=jo+lZBQFX99dvsGk7KaxmmTzA/MbOTJVrWbivOzXhRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mtbHD9qpBwnAOBT1Pf31tPa8e9/mfxJdawdT3LzaggZOVj+Q/9ZsDK+j9T7vgPg1v
	 0QF3yxm7I/3uMSaQTZRMno7orv74HXfIgajTkAMwer/tSo0iizWjtv6JROGXyIs9jC
	 kNlRnJxDA33hBYDTunhybVndN9vhcQMJMRqLs5TLJF3IIFM7dYh27QKsAqfAVEShsS
	 7l9+nrqOq46Mo+H+nE+6uNUVzi/R3h0KQCa0iybQJSo3K6DC/3w3YXqCHGk5rXha5I
	 4DyIE6Z56+o2dgGaNicFofHW4X4zNVtwlhrzcfesJPBf1i6cSs6cvwNZEoILKNf4Zm
	 uvECARebonWfA==
Message-ID: <3cc94def-04b7-fdf7-622d-96db0fdd95c7@collabora.com>
Date: Mon, 11 Sep 2023 11:04:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 6/9] arm64: defconfig: Enable DA9211 regulator
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: helen.koike@collabora.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, david.heidelberg@collabora.com,
 daniels@collabora.com, gustavo.padovan@collabora.com, emma@anholt.net,
 robclark@freedesktop.org, robdclark@google.com, anholt@google.com,
 robdclark@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 jani.nikula@linux.intel.com, mripard@kernel.org,
 dmitry.baryshkov@linaro.org, matthias.bgg@gmail.com, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org
References: <20230908152225.432139-1-vignesh.raman@collabora.com>
 <20230908152225.432139-7-vignesh.raman@collabora.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230908152225.432139-7-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_020508_702798_D8348F2A 
X-CRM114-Status: GOOD (  13.32  )
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

Il 08/09/23 17:22, Vignesh Raman ha scritto:
> Mediatek mt8173 board fails to boot with DA9211 regulator disabled.
> Enabling CONFIG_REGULATOR_DA9211=y in drm-ci fixes the issue.
> 
> So enable it in the defconfig since kernel-ci also requires it.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
> v3:
>    - New patch in the series to enable CONFIG_REGULATOR_DA9211 in defconfig
> 
> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index a25d783dfb95..ef22b532b63a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -711,6 +711,7 @@ CONFIG_REGULATOR_AXP20X=y
>   CONFIG_REGULATOR_BD718XX=y
>   CONFIG_REGULATOR_BD9571MWV=y
>   CONFIG_REGULATOR_CROS_EC=y
> +CONFIG_REGULATOR_DA9211=m
>   CONFIG_REGULATOR_FAN53555=y
>   CONFIG_REGULATOR_GPIO=y
>   CONFIG_REGULATOR_HI6421V530=y


