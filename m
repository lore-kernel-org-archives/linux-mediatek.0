Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F33C27C52
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 10:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUOfftVxmN0wD0bHAeBdgTD00YsjSteC0cg8b3vAO1Q=; b=cb4keEKYW0/JJqH5War6DzIWjA
	Zn5WIqOzksFnz8gH30OC4hlY27cJ+CfDTvIYlHVPOi4r/a60tX1EyM+sDYYyNu6z/uP2TO3E+ZbM8
	qKP0jf+Ufiz2uSfJ7HQjT5nAGVtRr5/egJSlWw6TNltQh7g/Y3753JJ5ohJdpgn20j81r2gzZ+H9s
	yN53dcXClOD8n7eCTUtHkvea+ajLlkykPsKn0QfvF2r8a8bGP6iCn/zifPwo9qvYcUUw+u8Sq+grm
	fhu27h77xOQChPnt16JMYBsSXkz4P2H9dWnJvgCDmysavASKlbR1PqckpN/JDpNC6jqLIah3DHLhu
	8Gj1C//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAi3-00000009Rsg-3gz2;
	Thu, 06 Jun 2024 10:51:07 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAhy-00000009RrD-4474;
	Thu, 06 Jun 2024 10:51:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717671057;
	bh=V5kYSuM39lIyPyl/wBUgkddb3iuaXISbMV793lW+VO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XMmtKzPgFURGg6x7dDHARuSpRJmfp6YZhIZxS1Y+vK/tt8JbTXZ1/0oLVpARHtFXy
	 lbNyoV1Y35lhQVP4Zorf2vsKM5S0LSMaE7A8uOwTIdzCZqV8ChpP9BnoQ/Ih1UBQhV
	 Oj8P2sgE97ymMJ8sw70wj2Vc2Gsd1lFgnUJ//U9stRLIaAGlWQFRo6EKuRJeEh08fM
	 FlzmvRPERk+/kkcsBNYOJ0Z6DBFyCquSC0coyahHsXfRtNyt1BqrqW2min272MnTZR
	 5N22aB7Wx3kMoDf9J3645pyOHZaiMeocO0JRD1TNX6u0O4vqC78MM2oCcyqgA/0RWC
	 XvXWCAAWsZOlA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C3FA63780627;
	Thu,  6 Jun 2024 10:50:56 +0000 (UTC)
Message-ID: <99d19104-875c-4214-b4a4-4c228cc08b66@collabora.com>
Date: Thu, 6 Jun 2024 12:50:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Don't print error when optional scp
 handle is missing
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240605-mt8195-dma-scp-node-err-v1-1-f2cb42f24d6e@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_035103_191131_DB77E923 
X-CRM114-Status: GOOD (  20.60  )
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

Il 05/06/24 21:35, Nícolas F. R. A. Prado ha scritto:
> The scp_get() helper has two users: the mtk-vcodec and the mtk-mdp3
> drivers. mdp3 considers the mediatek,scp phandle optional, and when it's
> missing mdp3 will directly look for the scp node based on compatible.
> 
> For that reason printing an error in the helper when the handle is
> missing is wrong, as it's not always an actual error. Besides, the other
> user, vcodec, already prints an error message on its own when the helper
> fails so this message doesn't add that much information.
> 
> Remove the error message from the helper. This gets rid of the deceptive
> error on MT8195-Tomato:
> 
>    mtk-mdp3 14001000.dma-controller: can't get SCP node

I'm way more for giving it a SCP handle instead of silencing this print... the
SCP handle way *is* the correct one and I prefer it, as that'd also be the only
way to support Dual-Core SCP in MDP3.

I really want to see hardcoded stuff disappear and I really really *really* want
to see more consistency across DT nodes in MediaTek platforms.

So, still a one-line change, but do it on the devicetree instead of here please.

Cheers,
Angelo

> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/remoteproc/mtk_scp.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index b885a9a041e4..f813117b6312 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -37,10 +37,8 @@ struct mtk_scp *scp_get(struct platform_device *pdev)
>   	struct platform_device *scp_pdev;
>   
>   	scp_node = of_parse_phandle(dev->of_node, "mediatek,scp", 0);
> -	if (!scp_node) {
> -		dev_err(dev, "can't get SCP node\n");
> +	if (!scp_node)
>   		return NULL;
> -	}
>   
>   	scp_pdev = of_find_device_by_node(scp_node);
>   	of_node_put(scp_node);
> 
> ---
> base-commit: d97496ca23a2d4ee80b7302849404859d9058bcd
> change-id: 20240605-mt8195-dma-scp-node-err-6a8dea26d4f5
> 
> Best regards,


