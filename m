Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40062C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 15:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6muYTmuW4fRLX681LzGmDQIgs514tFCN9mQYiCTTPsk=; b=K1ayKi//xJo0eBN8R2jz9neIjJ
	PrmVhbtZ/qZROshgSZPRN4RCy4zGNl6s4pqE3s0bpSLhcRS+h8obZ4/AugPQQ7BZ4pevm/dVnCvCI
	OjCBVXxF/qQuGiB7Rnfo1Hky3s5i9ztgd1jlTy3MX7KOwsEhXIJ5W+ijnVqFde5AYUsJBzKW1POVB
	te2jjcc4iI+GgykKq8U6HPzOm0HoHtngPFPflUoK4KVGP4e+GnsAbgkLfExwDWBWmC7stloAnKGVO
	UsMOYLQpZPUi20Xalhj2c9c81xXmqkdmtbbsCa4wyrSevlBk9TMTFzSO+6b7NCJwRV+gdxCEmOUdV
	2frVLgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot96B-006aP7-NY; Thu, 10 Nov 2022 15:04:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot95w-006aGd-9S; Thu, 10 Nov 2022 15:03:58 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 55D486602959;
	Thu, 10 Nov 2022 15:03:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1668092630;
	bh=QFiZtqMZmaPw9ms++EaxKdyMdIsrAeckCDCQOTuJxik=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JlfT/GNYWdHxplSYyKFjYL6QN5tqEuJ+HWxKryM+tp4hJBGEFb6vKHZ/hBrhvtYS1
	 9feWUusJC6z0W10zbkJyiSDmJ5LcBW4sxuYm/WAQN4C5VV7rKwdB3PO90HXiNmofh9
	 1iOxbEoqcqxY3w5VdJXgjPdUCEvdg0lt3KrlazQxCgF+mFrEf5Z6ldVk7nkULWD8Gg
	 yHyJTD2Q70uWMaWdL4mViQ/vfWB5Op0DW71uXrddE0qM70Y+SXk9vyGgh9Hp2nNAKQ
	 H6qDzAxNMegbVET/sjEWEdia3/huvwixZ+logC7JpHP5BRYgdGMPtT9fI4q6NtGnXX
	 n9XDWLIAC8+FA==
Message-ID: <eae90e1e-408b-4f9a-9211-649da28b0358@collabora.com>
Date: Thu, 10 Nov 2022 16:03:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] soc: mediatek: Add deprecated compatible to mmsys
Content-Language: en-US
To: matthias.bgg@kernel.org, matthias.bgg@gmail.com, nancy.lin@mediatek.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221110120222.32297-1-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221110120222.32297-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_070356_587932_AF385D98 
X-CRM114-Status: GOOD (  15.17  )
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

Il 10/11/22 13:02, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> For backward compatibility we add the deprecated compatible.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Hello Matthias,

You forgot to advertise that this commit depends on [1]... and I'm afraid
that you have to push a v2 anyway, because...

> ---
>   drivers/soc/mediatek/mtk-mmsys.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index ba2e79b26993b..47106f557c574 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -303,6 +303,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
>   		.compatible = "mediatek,mt8192-mmsys",
>   		.data = &mt8192_mmsys_driver_data,
>   	},
> +	{	/* deprecated compatible */
> +		.compatible = "mediatek,mt8195-mmsys",
> +		.data = &mt8195_mmsys_match_data,

...mt8195_mmsys_match_data doesn't exist anymore after [1], so this should be

		.data = &mt8195_vdosys0_driver_data,

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=681097

Cheers,
Angelo


