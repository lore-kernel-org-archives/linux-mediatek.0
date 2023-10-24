Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D330C07545
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 08:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5VkBC9QH8H6V+B/5heQv7Ip5gvNeSATQXkLcBuZpvs=; b=aHDPgIp6wKUO7TBRpUg7+LIei9
	aQ452iIZJB2qP1VJJiNlOGeuvsSd77hyw4JBPdQtS+neUG9yoX6X/Xw86UZxMAIwMQ9Ooa1EvoAPm
	Hd1Z7CG8DJVDoUnmGvaFpSNQAWXQIrLE+sXmDcWj3g2bHBGp8PQbQfKeeB7VOqmUMzuUtgyk4Lwx7
	GhmavOdtQd74VJNxU42Qa2zdztQUobEzooF0+/ovCVbswWk5rL/uHRqkJ+Z9OijxQkPcGVyxcuwtJ
	U3Q1yxDF0uhrz8t2Gm/KB4Nxg0ejnr7sU4WvW1Xit2s9a2BUdsa8ZTdPTkw9tKHpWw/gFA5ZEWbxu
	dZpdA9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCvB-009CrJ-1j;
	Tue, 24 Oct 2023 08:37:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCv7-009Cov-0g;
	Tue, 24 Oct 2023 08:37:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4F2036607324;
	Tue, 24 Oct 2023 09:37:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698136666;
	bh=b3hTgipRW+886R6FBsLygN4L72yjGIgmU9zLWuzpo3o=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=Xd+v3I16W7Ru4Jf3AYHTV0CFW5XwhEBZqYtNMSHps/DrHYiBAu3MCvYI7reaWAV4u
	 yfqjXYbzv6fWT9WUkubjxVMRv7/GWj4AcakbfAXbLZICEfUOwWZMpxA0gY7Pzx9o8Z
	 1YHE9FhQ+Jr9g6VZRlLWHjNcK9RJeTMdVMSqGY3lwM5S/X2cRWoBweSyIlxVtuQkiV
	 yTVQ0p9eyCfKgcUCdSman/gaGB9k4C65WQbiMd1PEtkgxUqcPwYEslUIQtkTNVfcYb
	 5/inotH8/Z8UygntUeEr59+og5ZcyW7B0ihRjgJq5fnSSZLzHxalFEKuWUUegzXK5h
	 wBP0SD7+L2GMA==
Message-ID: <e3198dd5-48da-498c-9f21-4f6845b37675@collabora.com>
Date: Tue, 24 Oct 2023 10:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 05/11] drm/mediatek: Add mtk_ddp_sec_write to config
 secure buffer info
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>
References: <20231023044549.21412-1-jason-jh.lin@mediatek.com>
 <20231023044549.21412-6-jason-jh.lin@mediatek.com>
Content-Language: en-US
In-Reply-To: <20231023044549.21412-6-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_013749_396985_0C91B34B 
X-CRM114-Status: GOOD (  11.84  )
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

Il 23/10/23 06:45, Jason-JH.Lin ha scritto:
> Add mtk_ddp_sec_write to configure secure buffer information to
> cmdq secure packet data.
> Then secure cmdq driver will use these information to configure
> curresponding secure DRAM address to HW overlay in secure world.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 12 ++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  4 ++++
>   2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 771f4e173353..3dca936b9143 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -111,6 +111,18 @@ void mtk_ddp_write_mask(struct cmdq_pkt *cmdq_pkt, unsigned int value,
>   #endif
>   }
>   
> +void mtk_ddp_sec_write(struct cmdq_pkt *cmdq_pkt, u32 addr, u64 base,
> +		       const enum cmdq_iwc_addr_metadata_type type,
> +		       const u32 offset, const u32 size, const u32 port)
> +{
> +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> +	/* secure buffer will be 4K alignment */
> +	if (cmdq_pkt)

	if (!cmdq_pkt)
		return;
	cmdq_sec_pkt_write....

Regards,
Angelo



