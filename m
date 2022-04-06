Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D405BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 11:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqTqaVGq7qAgBCecAcytjUgXNc7KvN5bTH25ux/SYd4=; b=lLxlQezh/5cAbv
	COr25csTFctKdmbh3GBB50b7HplGYrY7q6ej+nEMUtVWBLe6ScEPTWK8I0fqTqzS7cXoJbYZcEOup
	0lyDxxx2Xz8UMXazJKm3mKC9PPOhT1iqzjVaPJ8gxgEHRrp2J1PyiIWB4kccMdAR4VkpLgFayHPVa
	SqBCxyKsrcnsmfbg83uWUivK1FOr4g4yBO+OQElNFc98cYQH6GY5VqnsJs87HFWthucR5TOn78vwA
	tV99LtatidDs5OtBUK0+6VPuQbxiT1L5Bj2NrzWCsiqRPpZ1EyEk16IgOKQ2SHuN2UBZmEYuDMDbJ
	CK+kgZ3WZClO+N4hoxNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc46Y-005qkW-P4; Wed, 06 Apr 2022 11:45:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc46N-005qi7-9q; Wed, 06 Apr 2022 11:45:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 318E01F454CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649245528;
 bh=Fewgg+W6G1clWAEhEVkkn/lbkFWCF9MXpHqn8lun8+U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W0PyamTsuvA78l+/qDMNGB6+50vsfBr9RtR3NmgbT0TpB0CLcmKhN3U7kOED1i6j5
 4+luSQam5SOsryOX1O7J4La7JDlAFG0pBGud0XvHsMv6oaLx4ZOBHwj9YTmpfpjY7k
 t2OWz3k2yeyD2DPbW/THzfBJ6dKVKPCHFDfOVyL55k5fBwgB+mCtCmsW6oxi3ZSCb0
 E2xnpJh2X1rqd4mYjf+kP1TFxVs0WxfPxionk63hhXfPvYetGY4acG5czvaTsgJpBb
 /cZL7/mTkLhfHPFTUQOPWijqhkXc2FF/YNXd2TdT8gRcM/9QU9jvCxKkyqNV8kh+NH
 lYINv/Sd3khPQ==
Message-ID: <a263e572-35ec-9671-50e3-dbc71b55b6cd@collabora.com>
Date: Wed, 6 Apr 2022 13:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173: Add gce-client-reg handle
 to disp-mutex
Content-Language: en-US
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski@canonical.com, matthias.bgg@gmail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220228110329.245366-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220228110329.245366-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_044531_604678_54E2FA24 
X-CRM114-Status: GOOD (  13.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/02/22 12:03, AngeloGioacchino Del Regno ha scritto:
> Add a gce client reg handle to the disp mutex to enable MT8173
> platforms to use MediaTek's CMDQ for extra performance.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 291db4fcbb25..9eaea1156e25 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -1278,6 +1278,7 @@ mutex: mutex@14020000 {
>   			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
>   			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
>   			clocks = <&mmsys CLK_MM_MUTEX_32K>;
> +			mediatek,gce-client-reg = <&gce SUBSYS_1402XXXX 0 0x1000>;
>   			mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
>                                                 <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>   		};

Hello, this is a friendly ping to avoid forgetting about this patch.

As a note, this was successfully tested on MT8173 Acer Chromebook R13 (Elm).

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
