Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A033C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 12:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JKx6aKDGW0AyjftAdYqCC21nD0Jz6nFDsHFcUvXDrbw=; b=opmaPgRpc37vuVZoDAoDuRzslK
	uDZERLKhRitkUQUaIW6orrjkSqHz53dCU6Hmm5842efIWhz2oJXSVhAFfGiFJSn1vNO6ncKNJNay7
	baOT68tQMfgPhrqdqzcrzhaEbOJoqPYHYhD1/wCy/TA15W4wnUahl5AXoJfeR8FLZEAjdt3a/DTFI
	NnhbdLSrU4d9StHr3QCXT6NnMEfd5h2qHZKBRE7e3asQNNK4H+q/xmzxL8L2GLes0vJBQdhaT4uZY
	xslKSep8bBJmIysFKSrAIfDLEv1fTZve3oQ/cZQqE3g6cKUmftivYuDGAkF8aKOIRIOr6goSQR5Z0
	vhe7RP+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBw8-00000009dG6-0A2v;
	Thu, 06 Jun 2024 12:09:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFBw4-00000009dEe-06EF;
	Thu, 06 Jun 2024 12:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717675777;
	bh=d/jCCF0NCqOhRllSWhbYbAQCzOnOV4aDMEeLQSfza+0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=ex+NapCYaV6uQigRxoz9OgZuuxLinAt+ffhPwDJQBgGlx2SPufS1v3P+AztsrF40y
	 dRz3GUhZMHA2YYKyeXhuBGMbG9HldE7vrKp5Z0aMkk7TJDryuZgGDfB6vIuUmaN5Jh
	 ZtaoW+WFg76wAWKZsxuc9ptVjZ6wJAFaEFmmrrdiBvJ/OcdNeb1n1sjacYJ08NifXs
	 gJXda7TmOb3v0I06XyPOME2H9GCfAv25M4/IRnJcZmn5FRz6dl9OI7Bt36nIC2i+vy
	 6ozyecsSOFutlgR3Bx0/B/YDrWkIdTEhWye8VrqdgyMs7MzMaplLnHAA1p7tZ0ul1V
	 Dy86HOeJ8iz6A==
Received: from [100.93.89.217] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8ACD83781022;
	Thu,  6 Jun 2024 12:09:36 +0000 (UTC)
Message-ID: <657ef910-e6fd-4791-988e-4aba03104c20@collabora.com>
Date: Thu, 6 Jun 2024 14:09:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/12] media: platform: mtk-mdp3: Get fine-grain
 control of cmdq_pkt_finalize()
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20240222154120.16959-1-chunkuang.hu@kernel.org>
 <20240222154120.16959-11-chunkuang.hu@kernel.org>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <20240222154120.16959-11-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_050940_249885_BC0F7A3F 
X-CRM114-Status: GOOD (  17.23  )
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


Le 22/02/2024 à 16:41, Chun-Kuang Hu a écrit :
> In order to have fine-grained control, use cmdq_pkt_eoc() and
> cmdq_pkt_jump_rel() to replace cmdq_pkt_finalize().
>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c | 3 ++-
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c | 2 ++
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h | 1 +
>   3 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> index 6adac857a477..b720e69b341d 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-cmdq.c
> @@ -471,7 +471,8 @@ int mdp_cmdq_send(struct mdp_dev *mdp, struct mdp_cmdq_param *param)
>   		dev_err(dev, "mdp_path_config error\n");
>   		goto err_free_path;
>   	}
> -	cmdq_pkt_finalize(&cmd->pkt);
> +	cmdq_pkt_eoc(&cmd->pkt);
> +	cmdq_pkt_jump_rel(&cmd->pkt, CMDQ_INST_SIZE, mdp->cmdq_shift_pa);
>   
>   	for (i = 0; i < num_comp; i++)
>   		memcpy(&comps[i], path->comps[i].comp,
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> index 94f4ed78523b..2214744c937c 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
> @@ -231,6 +231,8 @@ static int mdp_probe(struct platform_device *pdev)
>   		goto err_put_scp;
>   	}
>   
> +	mdp->cmdq_shift_pa = cmdq_get_shift_pa(mdp->cmdq_clt->chan);
> +
>   	init_waitqueue_head(&mdp->callback_wq);
>   	ida_init(&mdp->mdp_ida);
>   	platform_set_drvdata(pdev, mdp);
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> index 7e21d226ceb8..ed61e0bb69ee 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
> @@ -83,6 +83,7 @@ struct mdp_dev {
>   	u32					id_count;
>   	struct ida				mdp_ida;
>   	struct cmdq_client			*cmdq_clt;
> +	u8					cmdq_shift_pa;

Can send a new version of this series because this patch can't
be applied on media_tree/master branch.
The code look correct for me but we need to be able to applied it
to perform more checks.

Regards,
Benjamin

>   	wait_queue_head_t			callback_wq;
>   
>   	struct v4l2_device			v4l2_dev;

