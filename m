Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A8AEC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 10:56:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A7520780
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 10:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u1PFHKjT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="W1MUIfLa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A7520780
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z3wduDY9xpY7WfCxjoH5oacPopLHiJZzxKT9ZXy9zDw=; b=u1PFHKjTkfjS0LXur7XbiuZPr
	LE+8lklB+I4GKnYAsOFlCG62kOyKWm1n3danfjSRe6kIwZVFYHAJYBIa9fnRMuDT+CHf+xhJIe5+8
	PnsMdeCW83pKSJjztNVOjRXJl1tjVuI6LkimyAnUaqr7cWasBcFuDayPc/e+A0GLzCX/do341E2Gn
	mBxWohGzj02g+Os+xo4r7DSaEiEuZ0HvwbHAnwb9rtb5GEMtyvsDeEruG/EONXvye47wrHufWGZFZ
	oHtImwNH4cKXanmwXO9NcLLsF8ey6LbYxH3RPDa5t2aUdThdrZSLuiqLAo71IsrhUHrZzXw0OSuRF
	6Azv6Rj1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqDvd-0001zr-JC; Tue, 30 Jun 2020 10:55:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqDvb-0001yz-Dk; Tue, 30 Jun 2020 10:55:52 +0000
X-UUID: 876ed2ea83f642af975784f2b4eabdb8-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bwKT46w9uGcCWgvZnA7Tt6P0SET70mbkJOxHElU0i8s=; 
 b=W1MUIfLaM1gJbkVQ7lxcGX2oCQS1LT4kO9HnrjFsM3paV62YTLJ0c2CObuD5+1JCqDAPgJcnctbLPAgvXsw69w1upcROiLRUS4fYBpBjkNYSHcDYz2yITJ1B+iE6+K0rnfdml9TEEdpoU2/cJi3IC1HxdDP8EGJCsJhNIdgLdBo=;
X-UUID: 876ed2ea83f642af975784f2b4eabdb8-20200630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1694588932; Tue, 30 Jun 2020 02:55:40 -0800
Received: from MTKMBS32DR.mediatek.inc (172.27.6.104) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 03:55:41 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32DR.mediatek.inc
 (172.27.6.104) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 30 Jun 2020 18:55:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 30 Jun 2020 18:55:35 +0800
Message-ID: <1593514516.24171.25.camel@mhfsdcap03>
Subject: Re: [PATCH v5 06/10] iommu/mediatek: Add sub_comm id in translation
 fault
From: Yong Wu <yong.wu@mediatek.com>
To: Chao Hao <chao.hao@mediatek.com>
Date: Tue, 30 Jun 2020 18:55:16 +0800
In-Reply-To: <20200629071310.1557-7-chao.hao@mediatek.com>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
 <20200629071310.1557-7-chao.hao@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D7FCA91426CFD155D58B85D54AA5A21697363337348731C64131373A298F8F732000:8
X-MTK: N
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-29 at 15:13 +0800, Chao Hao wrote:
> The max larb number that a iommu HW support is 8(larb0~larb7 in the below
> diagram).
> If the larb's number is over 8, we use a sub_common for merging
> several larbs into one larb. At this case, we will extend larb_id:
> bit[11:9] means common-id;
> bit[8:7] means subcommon-id;
> From these two variables, we could get the real larb number when
> translation fault happen.
> The diagram is as below:
> 		 EMI
> 		  |
> 		IOMMU
> 		  |
>            -----------------
> 	   |               |
> 	common1   	common0
> 	   |		   |
> 	   -----------------
> 		  |
>              smi common
> 		  |
>   ------------------------------------
>   |       |       |       |     |    |
>  3'd0    3'd1    3'd2    3'd3  ...  3'd7   <-common_id(max is 8)
>   |       |       |       |     |    |
> Larb0   Larb1     |     Larb3  ... Larb7
> 		  |
> 	    smi sub common
> 		  |
>      --------------------------
>      |        |       |       |
>     2'd0     2'd1    2'd2    2'd3   <-sub_common_id(max is 4)
>      |        |       |       |
>    Larb8    Larb9   Larb10  Larb11
> 
> In this patch we extend larb_remap[] to larb_remap[8][4] for this.
> larb_remap[x][y]: x means common-id above, y means subcommon_id above.
> 
> We can also distinguish if the M4U HW has sub_common by HAS_SUB_COMM
> macro.
> 
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c  | 20 +++++++++++++-------
>  drivers/iommu/mtk_iommu.h  |  3 ++-
>  include/soc/mediatek/smi.h |  2 ++
>  3 files changed, 17 insertions(+), 8 deletions(-)

[snip]

> @@ -48,7 +49,7 @@ struct mtk_iommu_plat_data {
>  	enum mtk_iommu_plat m4u_plat;
>  	u32                 flags;
>  	u32                 inv_sel_reg;
> -	unsigned char       larbid_remap[MTK_LARB_NR_MAX];
> +	unsigned char       larbid_remap[MTK_LARB_COM_MAX][MTK_LARB_SUBCOM_MAX];
>  };
>  
>  struct mtk_iommu_domain;
> diff --git a/include/soc/mediatek/smi.h b/include/soc/mediatek/smi.h
> index 5a34b87d89e3..fa65a55468e2 100644
> --- a/include/soc/mediatek/smi.h
> +++ b/include/soc/mediatek/smi.h
> @@ -12,6 +12,8 @@
>  #ifdef CONFIG_MTK_SMI
>  
>  #define MTK_LARB_NR_MAX		16
> +#define MTK_LARB_COM_MAX	8
> +#define MTK_LARB_SUBCOM_MAX	4

Both are only used in mtk_iommu.h, and I don't think smi has plan to use
them. thus we could move them into mtk_iommu.h

>  
>  #define MTK_SMI_MMU_EN(port)	BIT(port)
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
