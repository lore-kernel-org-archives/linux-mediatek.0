Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58ACC4724C
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 15:20:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A63B820A8B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 15:20:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tScR/X7K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A63B820A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qK8Ql+LhqYbtToT4ZeFSfHVVcaobH76KgzK5qKY5ILs=; b=tScR/X7KBRZU0H
	7+oFlGkx1P2+9/3PE176Pg/5f73wA3trjY8Zcs+GkjvKEO203dNppejlv02sVEDfVDOjfQC2RNwrt
	qI7ovliLFuajESu32sU56Ak8AAUxHrhNKQDurgD+EcI9tq2800lj7oW045Y/HEjmNhNnUxX40/mZt
	hyGOv4p8S1fTShpS1Q5CFKLKcIhlGtAC7cf6bpZwurCOtVsGPzsSdLP2poS9ThNCoQgeUdXHW4b9V
	rgXN1FzNNBdUyneYPfKPXoM44BWpLNskeGy0DBWrJKAB4USAOzgiysThfYwde99xLl+cKsW6k1HQl
	CTXCx0UsYRueUumsDwjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWLqe-00036D-TK; Wed, 06 May 2020 15:20:36 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWLpq-0008RZ-3Q; Wed, 06 May 2020 15:19:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id BB4F92A2500
Subject: Re: [PATCH v2 1/5] [media] mtk-mdp: remove mtk_mdp_comp.regs from
 mtk_mdp_comp.h
To: Eizan Miyamoto <eizan@chromium.org>, LKML <linux-kernel@vger.kernel.org>
References: <20200506054920.109738-1-eizan@chromium.org>
 <20200506154832.v2.1.I0d52fd84fe481e254a10960b060f32c47ce0d202@changeid>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <0cd4d52b-e4bb-90c2-a5b5-a2e39169bf1c@collabora.com>
Date: Wed, 6 May 2020 17:19:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200506154832.v2.1.I0d52fd84fe481e254a10960b060f32c47ce0d202@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_081946_274101_E982AF71 
X-CRM114-Status: GOOD (  15.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Eizan,

Thank you for the patch.

On 6/5/20 7:49, Eizan Miyamoto wrote:
> These fields are not used and can be removed.
> 
> Signed-off-by: eizan@chromium.org

You need to drop the above line, for this and the other patches.

> Reviewed-by: Enric Balletbo I Serra <enric.balletbo@collabora.com>
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---
> 
> Changes in v1: None
> 
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 1 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 2 --
>  2 files changed, 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index 58abfbdfb82d..c76cd61fb178 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -106,7 +106,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  	comp->dev_node = of_node_get(node);
>  	comp->id = comp_id;
>  	comp->type = mtk_mdp_matches[comp_id].type;
> -	comp->regs = of_iomap(node, 0);
>  
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		comp->clk[i] = of_clk_get(node, i);
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 998a4b953025..3b83bd6e0d8b 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -38,7 +38,6 @@ enum mtk_mdp_comp_id {
>   * struct mtk_mdp_comp - the MDP's function component data
>   * @dev_node:	component device node
>   * @clk:	clocks required for component
> - * @regs:	Mapped address of component registers.
>   * @larb_dev:	SMI device required for component
>   * @type:	component type
>   * @id:		component ID
> @@ -46,7 +45,6 @@ enum mtk_mdp_comp_id {
>  struct mtk_mdp_comp {
>  	struct device_node	*dev_node;
>  	struct clk		*clk[2];
> -	void __iomem		*regs;
>  	struct device		*larb_dev;
>  	enum mtk_mdp_comp_type	type;
>  	enum mtk_mdp_comp_id	id;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
