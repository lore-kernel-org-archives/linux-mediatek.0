Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3A3EB8FB1
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 12:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQMUszIcgmGJv9njGU4mzErP+G8GOtyqChUT67JHxYE=; b=uCaBVeGCjDpD5s7unTiYIUaewU
	TIKnuGtGQT2ivu7vRxY8J712eB7hv1nqbO8E4JmacA4Fzn3QtejmGroU0v3jyHjQRsR/ODT/MoqwP
	M03lYaCh4qMKMyABKMMFma5yl/n+xcjW2IqqCGpqZ9uW+maLKiEE4wgBartbK4wrw1fItl+fs8fjf
	w9jNr0QLxZJargSkJ8aXYpuyNyyMvM69EMHPVhKez4jAnYvqzke91xfCBoBWjQEvfbA2bGZJwh0e8
	m8+0cXRBc9weUhrptCaZBJDs96UeRRTQVpg3mGmyAEHiU+jC2V1KKZA8HlEZ+py+9FgbcV2JA/f3j
	Pk7tWctg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDrd-00C48Z-1p;
	Thu, 07 Sep 2023 12:12:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDra-00C47h-0e;
	Thu, 07 Sep 2023 12:11:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EC0A76607308;
	Thu,  7 Sep 2023 13:11:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694088713;
	bh=kZmzmGdZjTp+pv+nFULwgyI8KjWwGKWBpiBdon/MuOQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AeTWCkiDqD6f6FOITG/CljMPbT9mYAoEZvyFi3Cfj6tonymBBm/2twaiCSpnjDbmf
	 gPFGyadrak/wld94EhKUePT1PZAglGN2ZbZYHjg0ExUOP4LEOUqCrBoltr7NYjgWzU
	 dTYe+1OZsk49MA+OfckLS3URBrZ9mvWWyMBEiw7NzNqk6Ou7+Fzj5DrbghhvoTkYlU
	 oUX5lOxD3yNijtQRm7wpjE+NXaDtHI6l9YzevNWfFz1HsV5LM2Xzd49TYZnWmc8JPK
	 znKu5mSvDDg+mhPG9pZH6mTe1GkYuMCU0NuA2OjpnYgrOARWT6g1h2A7JdT+5IQFh7
	 qQUIk4kE9s5+Q==
Message-ID: <a0b60e8b-7fb7-b2d9-8c91-1be665e43800@collabora.com>
Date: Thu, 7 Sep 2023 14:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 01/15] soc: mediatek: Add register definitions for GCE
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Jason-JH Lin <jason-jh.lin@mediatek.com>
References: <20230823151332.28811-1-shawn.sung@mediatek.com>
 <20230823151332.28811-2-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230823151332.28811-2-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_051158_366240_B2EF9EAD 
X-CRM114-Status: GOOD (  15.74  )
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

Il 23/08/23 17:13, Hsiao Chien Sung ha scritto:
> Add register definitions for GCE so users can use them
> as a buffer to store data.
> 
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   include/linux/soc/mediatek/mtk-cmdq.h | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 649955d2cf5c..3eb95ef34c6c 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -14,6 +14,13 @@
>   #define CMDQ_ADDR_HIGH(addr)	((u32)(((addr) >> 16) & GENMASK(31, 0)))
>   #define CMDQ_ADDR_LOW(addr)	((u16)(addr) | BIT(1))
>   

Please add a comment explaining "TPR"

> +#define CMDQ_TPR_ID		(56)
> +

Please add a comment explaining what those definitions are, what is "SPR"?

Regards,
Angelo

> +#define CMDQ_THR_SPR_IDX0	(0)
> +#define CMDQ_THR_SPR_IDX1	(1)
> +#define CMDQ_THR_SPR_IDX2	(2)
> +#define CMDQ_THR_SPR_IDX3	(3)
> +
>   struct cmdq_pkt;
>   
>   struct cmdq_client_reg {


