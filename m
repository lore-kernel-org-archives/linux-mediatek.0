Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 559FFC48BE8
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 09:51:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1F6611BD
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 09:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF1F6611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2M1uV61sjma9fJW52Ya1TV4Dx6v7YS9HdYFbBHQLmIo=; b=ARiEeEkpepqBPm
	je8Z4eLJnEWfcx2EBAdfbaUs0Dl1IOTuOwgYzoMwvSxpvDbxqFLC809BVjYVHaMbErMdXM4hBwf9j
	noq7DeLP3QxM/1/fOCHbeJM+G2NbU9K1s5YTdjMzMpuCZN2sfbJcoyofeWs0+lUY7bgO7BZIgw93K
	CiqmueConu8TMcndN96Hed6KYvxT+xPoB1ldRQC3VZCXmtpfsnP6XU0RhFal2/SHnxkLoylseDLJO
	+0tHxHMPi16u7jbXA/9oQHcwZqcXhyeaqO5FzXKEuQqDf5iiiavhJV7gHLx/oszVAWN8FmjZ+cGPc
	SDQAihc8DFKLcnhoad7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqYO1-007Wxb-Qv; Tue, 08 Jun 2021 09:51:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqYJC-007UtY-0P; Tue, 08 Jun 2021 09:46:10 +0000
X-UUID: a23fe19d7ea047bb80ad244e497c74aa-20210608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+B2QImP6/+3dV4dUubTd73D2XzItTeRR9Dm1MA2u5aE=; 
 b=J4z9qa2fVQL/eamSXhQPw3XjNimlYGwPgBifuwXX9od2Y45B7zNzH+LCHVpRZOM5WGI7kKWKBi2NKFWBDw6faYtQTg+A6vGYDAWUmRkMWdLT/a4weAkSLYbTgk2wfmvAsbb4QPhE/f7ZpStf+9tKwuAefRWek/MjGWm96ww5U1M=;
X-UUID: a23fe19d7ea047bb80ad244e497c74aa-20210608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 502012896; Tue, 08 Jun 2021 02:46:02 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Jun 2021 02:36:00 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 8 Jun 2021 17:35:54 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Jun 2021 17:35:52 +0800
Message-ID: <1623144943.7079.1.camel@mhfsdcap03>
Subject: Re: [PATCH v5 08/16] media: mtk-mdp: Get rid of mtk_smi_larb_get/put
From: houlong wei <houlong.wei@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 "Evan Green" <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 "Tomasz Figa" <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "iommu@lists.linux-foundation.org"
 <iommu@lists.linux-foundation.org>, Youlin Pei
 =?UTF-8?Q?=28=E8=A3=B4=E5=8F=8B=E6=9E=97=29?= <youlin.pei@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Matthias Kaehlcke
 <mka@chromium.org>, Anan Sun =?UTF-8?Q?=28=E5=AD=99=E5=AE=89=E5=AE=89=29?=
 <Anan.Sun@mediatek.com>, Chao Hao =?UTF-8?Q?=28=E9=83=9D=E8=B6=85=29?=
 <Chao.Hao@mediatek.com>, Ming-Fan Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=98=8E=E6=B1=8E=29?= <Ming-Fan.Chen@mediatek.com>,
 Yi Kuo =?UTF-8?Q?=28=E9=83=AD=E6=87=BF=29?= <Yi.Kuo@mediatek.com>,
 "eizan@chromium.org" <eizan@chromium.org>, "acourbot@chromium.org"
 <acourbot@chromium.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>
Date: Tue, 8 Jun 2021 17:35:43 +0800
In-Reply-To: <20210410091128.31823-9-yong.wu@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-9-yong.wu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 73160F7F9D6C1295E7F9E9F7A0C989361B8103D51415275D79DD2191FBD6D2842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_024606_122975_3FCA33C4 
X-CRM114-Status: GOOD (  22.40  )
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

On Sat, 2021-04-10 at 17:11 +0800, Yong Wu wrote:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the mdp device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Minghsiu Tsai <minghsiu.tsai@mediatek.com>
> CC: Houlong Wei <houlong.wei@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 40 -------------------
>  drivers/media/platform/mtk-mdp/mtk_mdp_comp.h |  2 -
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c |  1 -
>  3 files changed, 43 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> index b3426a551bea..1e3833f1c9ae 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
> @@ -9,7 +9,6 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_mdp_comp.h"
>  
> @@ -18,14 +17,6 @@ void mtk_mdp_comp_clock_on(struct device *dev, struct mtk_mdp_comp *comp)
>  {
>  	int i, err;
>  
> -	if (comp->larb_dev) {
> -		err = mtk_smi_larb_get(comp->larb_dev);
> -		if (err)
> -			dev_err(dev,
> -				"failed to get larb, err %d. type:%d\n",
> -				err, comp->type);
> -	}
> -
>  	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
>  		if (IS_ERR(comp->clk[i]))
>  			continue;
> @@ -46,17 +37,12 @@ void mtk_mdp_comp_clock_off(struct device *dev, struct mtk_mdp_comp *comp)
>  			continue;
>  		clk_disable_unprepare(comp->clk[i]);
>  	}
> -
> -	if (comp->larb_dev)
> -		mtk_smi_larb_put(comp->larb_dev);
>  }
>  
>  int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  		      struct mtk_mdp_comp *comp,
>  		      enum mtk_mdp_comp_type comp_type)
>  {
> -	struct device_node *larb_node;
> -	struct platform_device *larb_pdev;
>  	int ret;
>  	int i;
>  
> @@ -77,32 +63,6 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
>  			break;
>  	}
>  
> -	/* Only DMA capable components need the LARB property */
> -	comp->larb_dev = NULL;
> -	if (comp->type != MTK_MDP_RDMA &&
> -	    comp->type != MTK_MDP_WDMA &&
> -	    comp->type != MTK_MDP_WROT)
> -		return 0;
> -
> -	larb_node = of_parse_phandle(node, "mediatek,larb", 0);
> -	if (!larb_node) {
> -		dev_err(dev,
> -			"Missing mediadek,larb phandle in %pOF node\n", node);
> -		ret = -EINVAL;
> -		goto put_dev;
> -	}
> -
> -	larb_pdev = of_find_device_by_node(larb_node);
> -	if (!larb_pdev) {
> -		dev_warn(dev, "Waiting for larb device %pOF\n", larb_node);
> -		of_node_put(larb_node);
> -		ret = -EPROBE_DEFER;
> -		goto put_dev;
> -	}
> -	of_node_put(larb_node);
> -
> -	comp->larb_dev = &larb_pdev->dev;
> -
>  	return 0;
>  
>  put_dev:
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> index 1bf0242cce46..36bc1b8f6222 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.h
> @@ -27,14 +27,12 @@ enum mtk_mdp_comp_type {
>   * @node:	list node to track sibing MDP components
>   * @dev_node:	component device node
>   * @clk:	clocks required for component
> - * @larb_dev:	SMI device required for component
>   * @type:	component type
>   */
>  struct mtk_mdp_comp {
>  	struct list_head	node;
>  	struct device_node	*dev_node;
>  	struct clk		*clk[2];
> -	struct device		*larb_dev;
>  	enum mtk_mdp_comp_type	type;
>  };
>  
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index 976aa1f4829b..70a8eab16863 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -17,7 +17,6 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/workqueue.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_mdp_core.h"
>  #include "mtk_mdp_m2m.h"

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
