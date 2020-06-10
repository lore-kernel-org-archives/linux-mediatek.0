Return-Path: <SRS0=3/N7=7X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 203EBC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 05:48:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2A36207ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2020 05:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pofMM5e4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NL4pbin7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2A36207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzR8Ny3SZ5/e7hEzlYaegJNzPFxhDkSEuAmyx6H168k=; b=pofMM5e4m8tRj1
	fVWo/RlaGT5nOPSYSu49TnbyMdoZJOPtwUFbkI+8uhw3JC1/60i8CKkAdZg18WIBQjW5kq17VvkE4
	Zgb6u7wE3OXESaymzSsVCLC/o1WGfy6/42Bq0LF0kicHTffR+bejOTTHaMPcgMSq3G+r30LLHsDo3
	fvReK8GaSzhdB05lYJO6x6mWxi6kAaWAzLgKncXyEayr4oImfoE40IK3TIE9uk2MyFTXDc2q7Wgsl
	NiRyKdPVhe+8hjXw4tFZLS3hHsg+nyF3uu1mEQ0kBjxULMijMutBcdp4cUccJtylIwX0c7szgFvJZ
	Xe3j4RN5zUqliR37E4FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jitac-00022I-J2; Wed, 10 Jun 2020 05:47:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jitaA-0001Y2-04; Wed, 10 Jun 2020 05:47:30 +0000
X-UUID: 93cc083d972547ed8017c889919407ed-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=R2nKHBp5Cvsj2AhiULL9paxjnUyMgPHkofrlWMrINHY=; 
 b=NL4pbin7KeDovszSfsOG3qB4M0CD3YS0FscB7IQtqlzpt0oYhA+X0ZBzEI04O5LwT2T5jp1dh4GaL2arl/v2SHASJCxdA0Aq3i8v65FOWd3gHqZomJ4KjRbm+To/crQV9J781b1ZFGM8vA/yfpSrTmF6S198eFFmWzSNhWXlhZE=;
X-UUID: 93cc083d972547ed8017c889919407ed-20200609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 938782650; Tue, 09 Jun 2020 21:47:06 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 22:47:19 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 10 Jun 2020 13:47:17 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Jun 2020 13:47:17 +0800
Message-ID: <1591768038.527.6.camel@mtksdaap41>
Subject: Re: [PATCH v4 09/17] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
From: CK Hu <ck.hu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Maoguang Meng <Maoguang.Meng@mediatek.com>
Date: Wed, 10 Jun 2020 13:47:18 +0800
In-Reply-To: <1590826218-23653-10-git-send-email-yong.wu@mediatek.com>
References: <1590826218-23653-1-git-send-email-yong.wu@mediatek.com>
 <1590826218-23653-10-git-send-email-yong.wu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_224726_236377_2A7BACD0 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: Will Deacon <will.deacon@arm.com>, youlin.pei@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Evan Green <evgreen@chromium.org>, eizan@chromium.org,
 Matthias Kaehlcke <mka@chromium.org>, devicetree@vger.kernel.org,
 cui.zhang@mediatek.com, Tomasz Figa <tfiga@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+ Tiffany & Maoguang.

On Sat, 2020-05-30 at 16:10 +0800, Yong Wu wrote:
> MediaTek IOMMU has already added the device_link between the consumer
> and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
> the smi-larb's pm_runtime_get_sync also be called automatically.
> 
> CC: Tiffany Lin <tiffany.lin@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Evan Green <evgreen@chromium.org>
> ---
>  .../media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c  | 19 ---------------
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  3 ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c |  1 -
>  .../media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c  | 27 ----------------------
>  4 files changed, 50 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index 36dfe3f..1d7d14d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -8,14 +8,12 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_vcodec_dec_pm.h"
>  #include "mtk_vcodec_util.h"
>  
>  int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>  {
> -	struct device_node *node;
>  	struct platform_device *pdev;
>  	struct mtk_vcodec_pm *pm;
>  	struct mtk_vcodec_clk *dec_clk;
> @@ -26,18 +24,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
>  	pm = &mtkdev->pm;
>  	pm->mtkdev = mtkdev;
>  	dec_clk = &pm->vdec_clk;
> -	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
> -	if (!node) {
> -		mtk_v4l2_err("of_parse_phandle mediatek,larb fail!");
> -		return -1;
> -	}
>  
> -	pdev = of_find_device_by_node(node);
> -	of_node_put(node);
> -	if (WARN_ON(!pdev)) {
> -		return -1;
> -	}
> -	pm->larbvdec = &pdev->dev;
>  	pdev = mtkdev->plat_dev;
>  	pm->dev = &pdev->dev;
>  
> @@ -113,11 +100,6 @@ void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
>  		}
>  	}
>  
> -	ret = mtk_smi_larb_get(pm->larbvdec);
> -	if (ret) {
> -		mtk_v4l2_err("mtk_smi_larb_get larbvdec fail %d", ret);
> -		goto error;
> -	}
>  	return;
>  
>  error:
> @@ -130,7 +112,6 @@ void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
>  	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
>  	int i = 0;
>  
> -	mtk_smi_larb_put(pm->larbvdec);
>  	for (i = dec_clk->clk_num - 1; i >= 0; i--)
>  		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
>  }
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index 52d1ce1..7d3966a 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -190,10 +190,7 @@ struct mtk_vcodec_clk {
>   */
>  struct mtk_vcodec_pm {
>  	struct mtk_vcodec_clk	vdec_clk;
> -	struct device	*larbvdec;
> -
>  	struct mtk_vcodec_clk	venc_clk;
> -	struct device	*larbvenc;
>  	struct device	*dev;
>  	struct mtk_vcodec_dev	*mtkdev;
>  };
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 5301dca..18025f7 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -8,7 +8,6 @@
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  #include <media/videobuf2-dma-contig.h>
> -#include <soc/mediatek/smi.h>
>  #include <linux/pm_runtime.h>
>  
>  #include "mtk_vcodec_drv.h"
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> index 01c6a55..047919e 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> @@ -8,44 +8,25 @@
>  #include <linux/of_address.h>
>  #include <linux/of_platform.h>
>  #include <linux/pm_runtime.h>
> -#include <soc/mediatek/smi.h>
>  
>  #include "mtk_vcodec_enc_pm.h"
>  #include "mtk_vcodec_util.h"
>  
>  int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
>  {
> -	struct device_node *node;
>  	struct platform_device *pdev;
>  	struct mtk_vcodec_pm *pm;
>  	struct mtk_vcodec_clk *enc_clk;
>  	struct mtk_vcodec_clk_info *clk_info;
>  	int ret = 0, i = 0;
> -	struct device *dev;
>  
>  	pdev = mtkdev->plat_dev;
>  	pm = &mtkdev->pm;
>  	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
>  	pm->mtkdev = mtkdev;
>  	pm->dev = &pdev->dev;
> -	dev = &pdev->dev;
>  	enc_clk = &pm->venc_clk;
>  
> -	node = of_parse_phandle(dev->of_node, "mediatek,larb", 0);
> -	if (!node) {
> -		mtk_v4l2_err("no mediatek,larb found");
> -		return -ENODEV;
> -	}
> -	pdev = of_find_device_by_node(node);
> -	of_node_put(node);
> -	if (!pdev) {
> -		mtk_v4l2_err("no mediatek,larb device found");
> -		return -ENODEV;
> -	}
> -	pm->larbvenc = &pdev->dev;
> -	pdev = mtkdev->plat_dev;
> -	pm->dev = &pdev->dev;
> -
>  	enc_clk->clk_num = of_property_count_strings(pdev->dev.of_node,
>  		"clock-names");
>  	if (enc_clk->clk_num > 0) {
> @@ -93,13 +74,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>  		}
>  	}
>  
> -	ret = mtk_smi_larb_get(pm->larbvenc);
> -	if (ret) {
> -		mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
> -		goto clkerr;
> -	}
> -	return;
> -
>  clkerr:
>  	for (i -= 1; i >= 0; i--)
>  		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
> @@ -110,7 +84,6 @@ void mtk_vcodec_enc_clock_off(struct mtk_vcodec_pm *pm)
>  	struct mtk_vcodec_clk *enc_clk = &pm->venc_clk;
>  	int i = 0;
>  
> -	mtk_smi_larb_put(pm->larbvenc);
>  	for (i = enc_clk->clk_num - 1; i >= 0; i--)
>  		clk_disable_unprepare(enc_clk->clk_info[i].vcodec_clk);
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
