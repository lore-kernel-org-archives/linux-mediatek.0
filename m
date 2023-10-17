Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E01DCDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 09:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgnXaIDQZ3FYllOEY/M4ocMGMtdMS54WcuppmaHyUlU=; b=DyhVQJFAsftThv
	NhSWsgDJMyQdq4aizTO7ECqG50cT0Fhm5pHb5/FTHj9C9Wwv3Zx6gmrSPxuiFuPTM/734CVd0AVqB
	mwLfR44vWi9uRuXP8gKlbYXr3jeDB69m3WOAbuL7XNGt2jRaBQ67J5vg/bXrRjbINkJZWxht4hy9N
	8cFcDTT/yuPcSDo0p1R1UfaFjc+4z7HkT0q+QErkPG1HJWmYhWy4gaQQalMt/GinAlKpFwW5EhAik
	dehKKqpCepvyruQljlgxcl4uvXih21TQGN66bhc8I//JI6XM/ICjnLDOIkjzhVyBcZM77RrmAPDbS
	JBWLtF2/6dwoESfJB4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsggJ-00BsZW-19;
	Tue, 17 Oct 2023 09:48:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsggF-00BsXy-2R;
	Tue, 17 Oct 2023 09:48:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 01DCD66072C1;
	Tue, 17 Oct 2023 10:48:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697536082;
	bh=zm94jx7YZtaVKlcERgXxBphdF5yGXsd/A0Fvmcj8+3Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JnbVjhfam8ag2lMmYL9z5UQJY6ILzE5PDc8fGi+zbhQlJmYKOL3oWmpa0cRix16Pj
	 G1jsUUpafvlh+nWy/3FvpT3tyJ+vCRuuu2hNysRB5HR4NoGG/CNTkV5UP+GHEM1zoO
	 tm4iTQvYNkjIi3TxmDtnlbwmNA9YZd96mJJ85ELBvfxntsf55F7N/Nz6zovDi7MhAe
	 ixSt8gY8eMmtDe83XS2o9l/dmW3aUmdf1PTKOdXvHlXz92h7aU9wt/o0MhfxMYdKFy
	 U7O6r3FoF0njaPNvx99l3bexMcYAEKtjqSbF9OrMzgARru7gS4YfSt+9TSEcT7MU7q
	 YdC13KKrQGmkg==
Message-ID: <91932706-c42c-4c10-96bd-c8a91b7d82f0@collabora.com>
Date: Tue, 17 Oct 2023 11:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 15/23] drm/mediatek: Manage component's clock with
 function pointers
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
References: <20231016104010.3270-1-shawn.sung@mediatek.com>
 <20231016104010.3270-16-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231016104010.3270-16-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_024803_929639_6D863EC3 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/10/23 12:40, Hsiao Chien Sung ha scritto:
> By registering component related functions to the pointers,
> we can easily manage them within a for-loop and simplify the
> logic of clock control significantly.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>   .../gpu/drm/mediatek/mtk_disp_ovl_adaptor.c   | 111 +++++++-----------
>   1 file changed, 44 insertions(+), 67 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> index 60e5dfe9ef0d..fffef2a4f919 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
> @@ -53,6 +53,7 @@ struct ovl_adaptor_comp_match {
>   	enum mtk_ovl_adaptor_comp_type type;
>   	enum mtk_ddp_comp_id comp_id;
>   	int alias_id;
> +	const struct mtk_ddp_comp_funcs *funcs;
>   };
>   
>   struct mtk_disp_ovl_adaptor {
> @@ -67,20 +68,35 @@ static const char * const private_comp_stem[OVL_ADAPTOR_TYPE_NUM] = {
>   	[OVL_ADAPTOR_TYPE_MERGE]	= "merge",
>   };
>   
> +static const struct mtk_ddp_comp_funcs _ethdr = {

Sorry I just noticed that; can you please remove the leading "_" from all
of those?

_ethdr -> ethdr or mtk_ethdr
_merge -> merge or mtk_merge
_rdma  -> rdma  or mtk_rdma

Thanks,
Angelo


