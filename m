Return-Path: <SRS0=FJ4T=K2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B5EC47082
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 11:36:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70BDD610E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 May 2021 11:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 70BDD610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjIdhZzuQ+oU4bAl4WZ60Rvdg5IVlO+yeG+kC+hzDms=; b=njLFYP8FyKt0VC
	Qt1mRkwwCcXWN1EL94bQwMkUMBNBtRfKAqObCYqrHijtVOPRZGpXk3jlVVqRbpRAXPx+YM78X6BRv
	O6eQt6K8jP0CA44K6j/hgAP9xyH97R9iXUt9nKOpLdGqQatsqj9IFkS0rTcx2aiPk6iz5ynGfY9je
	qMHz7ZAvOosv7xn0UnOGrvNrQP95SFUPDPufj1Q1JZlDLQWbb8QjjQFNUo0opnp+FMAG4YUZiDT8F
	H9CGPWK7CQ2aj2ARt61MrLY0vXHix2bkBZhcXWE88cE2moAEwxjipJ/RHk8ItISk2S2E2O9sfMhN0
	xOg2Yga9oXrqnyF32pCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lngDm-00C17v-0e; Mon, 31 May 2021 11:36:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lngDh-00C173-95; Mon, 31 May 2021 11:36:36 +0000
X-UUID: 7b73cc3f75d94ccfb61c499335755b73-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lGvDrucw7R+ESa51Vw2ltK2gA0igTci22CG0bvNo3sI=; 
 b=R42WH1CKbw1qAt5ERiizYdFzIgObOHmlC6ku/pkFz8vpCJbhGrlAMv9zQEa0mdf6LnMqlMP5r2/CKGmmnl/lIXwLatJaL/Q4p5B15uQ37SKzk/gLlnNojLfA8quOUOY66jC84Xz/Y6P9ZreruRTubDGsAyr3NXUNcjX5VgOfTeQ=;
X-UUID: 7b73cc3f75d94ccfb61c499335755b73-20210531
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 819846594; Mon, 31 May 2021 04:36:30 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 04:36:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 19:36:12 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 31 May 2021 19:36:12 +0800
Message-ID: <f0eb6a1ac2e3a03c4cc742f45cdd9cb91537ff4d.camel@mediatek.com>
Subject: Re: [PATCH 2/3] soc: mtk-pm-domains: do not register smi node as
 syscon
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>,
 <chun-jie.chen@mediatek.corp-partner.google.com>, Yong Wu
 <yong.wu@mediatek.com>
Date: Mon, 31 May 2021 19:36:12 +0800
In-Reply-To: <20210531043502.2702645-2-hsinyi@chromium.org>
References: <20210531043502.2702645-1-hsinyi@chromium.org>
 <20210531043502.2702645-2-hsinyi@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CB375E2EB8027F684503A9B61A4BB8DDB07113F80DBAC2D41A947B8ADBDB162F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_043633_346928_B9D1B07A 
X-CRM114-Status: GOOD (  20.67  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-05-31 at 12:35 +0800, Hsin-Yi Wang wrote:
> Mediatek requires mmsys clocks to be unprepared during suspend,
> otherwise system has chances to hang.
> 
> syscon_regmap_lookup_by_phandle_optional() will attach and prepare
> the
> first clock in smi node, leading to additional prepare to the clock
> which is not balanced with the prepare/unprepare pair in
> resume/suspend
> callbacks.
> 
> If a power domain node requests an smi node and the smi node's first
> clock is an mmsys clock, it will results in an unstabke suspend
> resume.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: chun-jie.chen <chun-jie.chen@mediatek.com>

> ---
>  drivers/soc/mediatek/mtk-pm-domains.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c
> b/drivers/soc/mediatek/mtk-pm-domains.c
> index 536d8c64b2b4..a9ba71eee4bb 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -296,7 +296,7 @@ generic_pm_domain *scpsys_add_one_domain(struct
> scpsys *scpsys, struct device_no
>  {
>  	const struct scpsys_domain_data *domain_data;
>  	struct scpsys_domain *pd;
> -	struct device_node *root_node = scpsys->dev->of_node;
> +	struct device_node *root_node = scpsys->dev->of_node,
> *smi_node;
>  	struct property *prop;
>  	const char *clk_name;
>  	int i, ret, num_clks;
> @@ -352,9 +352,13 @@ generic_pm_domain *scpsys_add_one_domain(struct
> scpsys *scpsys, struct device_no
>  	if (IS_ERR(pd->infracfg))
>  		return ERR_CAST(pd->infracfg);
>  
> -	pd->smi = syscon_regmap_lookup_by_phandle_optional(node,
> "mediatek,smi");
> -	if (IS_ERR(pd->smi))
> -		return ERR_CAST(pd->smi);
> +	smi_node = of_parse_phandle(node, "mediatek,smi", 0);
> +	if (smi_node) {
> +		pd->smi = device_node_to_regmap(smi_node);
> +		of_node_put(smi_node);
> +		if (IS_ERR(pd->smi))
> +			return ERR_CAST(pd->smi);
> +	}
>  
>  	num_clks = of_clk_get_parent_count(node);
>  	if (num_clks > 0) {
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
