Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C846C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 05:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E345361CAC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 05:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E345361CAC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds+Hsr/BkZwU3srDGbFM57JDnZ3EQGvZLms7WNJeNt8=; b=ai3jEd2o9YfVxS
	zHdmqtntWi61SeGVBGZnxFAJjMDCniVDeBTwomLkHUg5jhFofOPLdicr8eZqQ1qrvwzOXa+ImzJLc
	i2aPHfaJcvCmTxvor3EEIFj073KHSI8C0QKpYoCJFSu3oxkLE7Sz1Apd+i7Ald7DU/AWi4WX90CC0
	uK4K/Wg2gEeZuAMGbf1CLsc4/EoP6SC2NWCA7cFnnMrK/SLhPihTBvoCclQCp1cCM1rUMUjMMCyKK
	sCt8WQqagLWU5yipb/vWXneZ8ub/Q1D6SYRUebvN47lTkfTbbYyIh3UIBkkFSDegZfOFqg7Zgjx8C
	QQW2iWTaqoQGk+/n1/sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m100r-00DW8d-BN; Wed, 07 Jul 2021 05:22:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m100l-00DW8B-8W; Wed, 07 Jul 2021 05:22:20 +0000
X-UUID: 28ea31725ff04f51806527c85fd10eb0-20210706
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=d5jqJvBYyFEACUKKcTMeg4pADBDfmiehfiungkJXpnA=; 
 b=KcOcEra/bH1GffykvnweW9z7kiUPQh35LLQVAy6YymfAAUxxrb/q8gLPp+vgQL0eDenGQryGYgRVwwWaFiW/86DwB7LDuKJEPkmxaPFZsazxCUbCmb7p5kfMRzDsJySdR9Z66cWuAtg5raAvQqBNiQESoZ4vTzU6HIH4M4pBkwk=;
X-UUID: 28ea31725ff04f51806527c85fd10eb0-20210706
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 415144983; Tue, 06 Jul 2021 22:22:12 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Jul 2021 22:12:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Jul 2021 13:12:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Jul 2021 13:12:08 +0800
Message-ID: <1625634728.7824.17.camel@mtksdaap41>
Subject: Re: [PATCH v1 08/17] drm/mediatek: Add component_del in OVL remove
 function
From: CK Hu <ck.hu@mediatek.com>
To: jason-jh.lin <jason-jh.lin@mediatek.com>
CC: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Wed, 7 Jul 2021 13:12:08 +0800
In-Reply-To: <20210707041249.29816-9-jason-jh.lin@mediatek.com>
References: <20210707041249.29816-1-jason-jh.lin@mediatek.com>
 <20210707041249.29816-9-jason-jh.lin@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210706_222217_084665_F0106338 
X-CRM114-Status: GOOD (  18.47  )
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

Hi, Jason:

On Wed, 2021-07-07 at 12:12 +0800, jason-jh.lin wrote:
> Add component_del in OVL remove function.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 99c39487026d..7504e86b167a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -158,7 +158,6 @@ void mtk_ovl_stop(struct device *dev)
>  		reg = reg & ~OVL_LAYER_SMI_ID_EN;
>  		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
>  	}
> -

This modification is not related to this patch, so move out of this
patch.

>  }
>  
>  void mtk_ovl_config(struct device *dev, unsigned int w,
> @@ -424,6 +423,8 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
>  
>  static int mtk_disp_ovl_remove(struct platform_device *pdev)
>  {
> +	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
> +

This is a fix-up of patch [1]. Change this patch to fix all sub drivers,
add Fixes tag, and move this patch out of this series. (This fix-up is
not related to mt8195, so send this patch independently).

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.13&id=ff1395609e20c1cd98b3ec65d16dc18f0471dca3

Regards,
CK

>  	return 0;
>  }
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
