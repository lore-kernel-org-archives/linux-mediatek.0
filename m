Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E7AC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 09:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nD8Wapu+VRPKefbTQf25d3P5xSFplx5PMwduFCXJOMo=; b=D9pBhNShc4nrehG7KhsuIu+coP
	0DLTc/L4gpd4bl03eiAT61UxFIJnx8JlhJneSlZh89OiOc3vY3oOQSgJexj1fm7j0IQWK5RPVqwdM
	zHOatO7B5g8oVR+5Gb+C1vgHtbeIVgDJYNxd4NKCspzoHmYS9nL/D/+012Uwp7BmRnwNhUIJLH3E6
	NMvKR665wQC2WjCwEkrrx0z+UbLc7j1OThqb5Jlz6mSP9XFrqg1Wrprn8aY9Bvt+YwcQXFtt+B+FJ
	Rz9C5TS0M0PyR+w5ACRNhJcASBAqViA2BsqTXzgn9n1u1xqxujF2LGRj1EmjNIhqHwM0Rg7WgSnJ/
	OPpaaQng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNCg-0018Pl-OY; Thu, 06 Oct 2022 09:30:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNCE-00189h-Dk; Thu, 06 Oct 2022 09:29:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8228B6601595;
	Thu,  6 Oct 2022 10:29:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665048577;
	bh=kvxxKqrwKOa1pX0j27ZJQT3NZRH0yvcPw/O79fTGVb4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P8izCRHPICQPADzDxWwzctcQljlGz2l47sPaqD9eoWBv/8WdBYYn4QQ//ONtN2r/i
	 TvddvJmAeMCLYr2hHe9IsFovdg5HpDXuwRZc+ZkDnJ2vy3ZhDGda8uVUfLWidvpBPW
	 0pxcCjWPwb3jG12fL5sgUrgskdtcg86diT8o9eAslxZMUuYmTFukuYlu9ZQpDRdfwn
	 mm0xukYF1olcKQOJR2zDO+SldwcCQJTOinKcNnMWoHs8QQ0oEIZ41GoIE4T+2M7cxC
	 7QrJdxQ6ZysZqdqaZg1Eh65bT+Gwsr5kukDOdXep4bq3Zd13mnb4RJbeenFPl4LoFC
	 5KVcNrIsAavJw==
Message-ID: <ded0300b-5b54-48eb-038e-102ae91573c5@collabora.com>
Date: Thu, 6 Oct 2022 11:29:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9, 2/4] mailbox: mtk-cmdq: add gce software ddr enable
 private data
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20221006043456.8754-1-yongqiang.niu@mediatek.com>
 <20221006043456.8754-3-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006043456.8754-3-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_022938_664399_DA1C7113 
X-CRM114-Status: GOOD (  22.14  )
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

Il 06/10/22 06:34, Yongqiang Niu ha scritto:
> if gce work control by software, we need set software enable
> for MT8186 Soc
> 
> there is a handshake flow between gce and ddr hardware,
> if not set ddr enable flag of gce, ddr will fall into idle
> mode, then gce instructions will not process done.
> we need set this flag of gce to tell ddr when gce is idle or busy
> controlled by software flow.
> 
> 0x48[2:0] means control by software
> 0x48[18:16] means ddr enable
> 0x48[2:0] is pre-condition of 0x48[18:16].
> if we want set 0x48[18:16] ddr enable, 0x48[2:0] must be set at same
> time.
> and only these bits is useful, other bits is useless bits
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index c3cb24f51699..04eb44d89119 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -39,6 +39,7 @@
>   
>   #define GCE_GCTL_VALUE			0x48
>   #define GCE_CTRL_BY_SW				GENMASK(2, 0)
> +#define GCE_DDR_EN				GENMASK(18, 16)
>   
>   #define CMDQ_THR_ACTIVE_SLOT_CYCLES	0x3200
>   #define CMDQ_THR_ENABLED		0x1
> @@ -81,6 +82,7 @@ struct cmdq {
>   	bool			suspended;
>   	u8			shift_pa;
>   	bool			control_by_sw;
> +	bool			sw_ddr_en;
>   	u32			gce_num;
>   };
>   
> @@ -88,6 +90,7 @@ struct gce_plat {
>   	u32 thread_nr;
>   	u8 shift;
>   	bool control_by_sw;
> +	bool sw_ddr_en;
>   	u32 gce_num;
>   };
>   
> @@ -132,6 +135,9 @@ static void cmdq_init(struct cmdq *cmdq)
>   	if (cmdq->control_by_sw)
>   		writel(GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
>   
> +	if (cmdq->sw_ddr_en)
> +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);
> +

No. That's redundant.
Here's a better way:

	u32 gctl_regval = 0;

	if (cmdq->control_by_sw)
		gctl_regval = GCE_CTRL_BY_SW;
	if (cmdq->sw_ddr_en)
		gctl_regval |= GCE_DDR_EN;

	if (val)
		writel(gctl_regval, cmdq->base + GCE_GCTL_VALUE);

Regards,
Angelo

>   	writel(CMDQ_THR_ACTIVE_SLOT_CYCLES, cmdq->base + CMDQ_THR_SLOT_CYCLES);
>   	for (i = 0; i <= CMDQ_MAX_EVENT; i++)
>   		writel(i, cmdq->base + CMDQ_SYNC_TOKEN_UPDATE);
> @@ -545,6 +551,7 @@ static int cmdq_probe(struct platform_device *pdev)
>   	cmdq->thread_nr = plat_data->thread_nr;
>   	cmdq->shift_pa = plat_data->shift;
>   	cmdq->control_by_sw = plat_data->control_by_sw;
> +	cmdq->sw_ddr_en = plat_data->sw_ddr_en;
>   	cmdq->gce_num = plat_data->gce_num;
>   	cmdq->irq_mask = GENMASK(cmdq->thread_nr - 1, 0);
>   	err = devm_request_irq(dev, cmdq->irq, cmdq_irq_handler, IRQF_SHARED,




