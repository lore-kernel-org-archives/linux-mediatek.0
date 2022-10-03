Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D44C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Oct 2022 14:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GiXAKPwtuuaKt3Y1ZrWA6Uh7cvyeHmQm57n/uMzzut4=; b=WpCPGIv0lM2jQm9bAzx7vJtjiG
	bzX98NVXrncPIutAuu+Eh67wnOKAXvXmKo317BqkDKX8mu+VIcujlc5/dL/HRlOczMn7KTiKD4vM+
	Gi49PBccVdPZONn82Dcu7kkqiEYZiVAwiSIv7Tb+weyNqbAcKgoDMdHCna8rtDqHG7fBmM2GGgejU
	F/l9CAMxtt0qDJQHIi46QWD2mT5xuZiloOUuJEnK1hPK5xPeWvmajI9f4Pt/EqQyt9Bux0keFUsKz
	xO5IQCqHeWmv1Hpkw58uYPnSwJNLcPTORM3J1V7t3P2KcWvT6RuIu7Yfyb3wv2Z5kyktqbRqcm9o/
	uGIOQ8VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofMpy-006LPZ-9k; Mon, 03 Oct 2022 14:54:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofMpn-006LLH-79; Mon, 03 Oct 2022 14:54:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4CEB86601B15;
	Mon,  3 Oct 2022 15:54:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664808857;
	bh=ZsZW6LIMD7DHK9CJfXlywHYlJVcDHHTqRYvHEu2AQuQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Upa3fvOXjvZ8LuhUJroA93qxsldU81ctGpJu1Iif7bMMGqMrD/pqaM5cd0ERxbKSy
	 gt405EkWH7bBQFMsSQwphjbXcVpHyNGR7W4/AVQINtub4P7SKRutgLSJHqWN8PweR9
	 ysRByU2dkqLAD7bw8KANWZaOR6H86Ql6LGITU9Zj5K/zaqm1OpwSHwGv5effXnZRX9
	 2VJyzu8XpMiXaeoz/YkfuZOEgso1N9cYW8vxtnkhe4miJJMQTuuzOsX2SEgmQH9kqb
	 qevk3+CEHVwbWCwUzOqC398M8Vf7BM7f86qd75K/MBJd1Q4neQbAE08pPKmTBzaIRJ
	 Y0HfQvCgKzUMw==
Message-ID: <6bcf2f53-ffd1-5159-47a5-b3d7db548158@collabora.com>
Date: Mon, 3 Oct 2022 16:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v8, 3/4] mailbox: mtk-cmdq: add gce ddr enable support
 flow
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220930160638.7588-1-yongqiang.niu@mediatek.com>
 <20220930160638.7588-4-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220930160638.7588-4-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221003_075419_418667_77D9722C 
X-CRM114-Status: GOOD (  16.49  )
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

Il 30/09/22 18:06, Yongqiang Niu ha scritto:
> add gce ddr enable control flow when gce suspend/resume
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   drivers/mailbox/mtk-cmdq-mailbox.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 04eb44d89119..2db82ff838ed 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -94,6 +94,18 @@ struct gce_plat {
>   	u32 gce_num;
>   };
>   
> +static void cmdq_sw_ddr_enable(struct cmdq *cmdq, bool enable)
> +{
> +	WARN_ON(clk_bulk_enable(cmdq->gce_num, cmdq->clocks));
> +
> +	if (enable)
> +		writel(GCE_DDR_EN | GCE_CTRL_BY_SW, cmdq->base + GCE_GCTL_VALUE);

My only concern here is about the previous value stored in the GCE_GCTL_VALUE
register, as you're overwriting it in its entirety with
GCE_DDR_EN | GCE_CTRL_BY_SW.

Can you guarantee that this register is not pre-initialized with some value,
and that these are the only bits to be `1` in this register?

Otherwise, you will have to readl and modify the bits instead... by the way,
if this register doesn't get any changes during runtime, you may cache it
at probe time to avoid reading it for every suspend/resume operation.

Regards,
Angelo



