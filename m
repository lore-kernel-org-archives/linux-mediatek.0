Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 155DDC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 02:18:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D77F52078B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 02:18:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ib7Xlv0y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PUWLhYJn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D77F52078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XD62zyPDPfvY/CXiKxe3/MhQe4MEzn22VMl5xl00GYQ=; b=Ib7Xlv0yRgwD2mR7gYLeXvlFb
	dRHbrUfV1CTnB/PK4ZWPfvCShe0927MSFoDRI52d8fr3BROIeE7UD4TBNJbluIkxyiPJ9Qg5uEm4w
	cEgujiTeNnXfwItXirtM5E3aP+X0+SACLzSzrbPWeRYCxYNuuqzg3CQP21B5W9yWDVvX/6rNIn1KG
	u/eMaQ12gL/hyRREzfCfdQSdXDym2J5Cl5oq1bbpGeYN8lWREseftfxvpmZDxDrnnwyYSIGio+21E
	9GRHAdGlP2yuOrifU6PQAhj4er/tAUJJ8L/aR/BaaNWhC7/yDgCRzi9tK/XlTCs4EnAJ68Vf742qw
	1rpkLHrVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqSKX-0000t4-5m; Wed, 01 Jul 2020 02:18:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqSKS-0000s7-C9
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 02:18:31 +0000
X-UUID: e1c1e964379347f3b831503ec26f4ac6-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DcY8OQCD9Qm2ySPaa/SLgUyczR+AJ+WptOzp9lGgZhw=; 
 b=PUWLhYJnGHCJl/9g6VyPlszSVCfUbB8XU38bFoDZFp7qrET349sHjz70PVznqSPr9C38gYzmXed+J0aigogGer/4Js5gvtaL1zi2jCtKlniF8Zrsq4gKj4tLBS8DJDUXJuTBrz2CetqHTcgayTqWByUQPoJ9JBXWQPJR88GBJOA=;
X-UUID: e1c1e964379347f3b831503ec26f4ac6-20200630
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1953423879; Tue, 30 Jun 2020 18:18:21 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 19:18:20 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Jul 2020 10:18:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 10:18:12 +0800
Message-ID: <1593569872.32037.6.camel@mhfsdcap03>
Subject: Re: [PATCH v5 02/10] iommu/mediatek: Rename the register
 STANDARD_AXI_MODE(0x48) to MISC_CTRL
From: Yong Wu <yong.wu@mediatek.com>
To: Chao Hao <chao.hao@mediatek.com>
Date: Wed, 1 Jul 2020 10:17:52 +0800
In-Reply-To: <20200629071310.1557-3-chao.hao@mediatek.com>
References: <20200629071310.1557-1-chao.hao@mediatek.com>
 <20200629071310.1557-3-chao.hao@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 71933EE4DC99580A780AB184F067753C98B859006AD047915C8496CEE95F99B82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_221828_621455_DB59683F 
X-CRM114-Status: GOOD (  14.48  )
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
Cc: FY Yang <fy.yang@mediatek.com>, wsd_upstream@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-06-29 at 15:13 +0800, Chao Hao wrote:
> For iommu offset=0x48 register, only the previous mt8173/mt8183 use the
> name STANDARD_AXI_MODE, all the latest SoC extend the register more
> feature by different bits, for example: axi_mode, in_order_en, coherent_en
> and so on. So rename REG_MMU_MISC_CTRL may be more proper.
> 
> This patch only rename the register name, no functional change.
> 
> Signed-off-by: Chao Hao <chao.hao@mediatek.com>
> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/iommu/mtk_iommu.c | 14 +++++++-------
>  drivers/iommu/mtk_iommu.h |  2 +-
>  2 files changed, 8 insertions(+), 8 deletions(-)

...

> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index ea949a324e33..1b6ea839b92c 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -18,7 +18,7 @@
>  #include <soc/mediatek/smi.h>
>  
>  struct mtk_iommu_suspend_reg {
> -	u32				standard_axi_mode;
> +	u32				misc_ctrl;

Here will cause build fail for v1:

drivers/iommu/mtk_iommu_v1.c:675:20: error: 'struct
mtk_iommu_suspend_reg' has no member named 'standard_axi_mode'
  writel_relaxed(reg->standard_axi_mode,
                    ^

We could change something like:

union {
	u32	standard_axi_mode; /* only for v1 */
	u32	misc_ctrl;         /* only for v2 */
};

>  	u32				dcm_dis;
>  	u32				ctrl_reg;
>  	u32				int_control0;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
