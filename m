Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C95C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 12:22:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E58AE2146E
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 12:22:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WEh3TlJX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eRQ3etiQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E58AE2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oy1boDaPWteNb6okE2+E46c9MkImQ6Td+9Njqw7IqiQ=; b=WEh3TlJXB3inL9
	xpwdLTHsslLW7inyvQH9+Ut2J4G+ELqdv+vVx+AtK83gBe0OfcIzi8aRDWySAlAkn5bHPDUURnTeu
	hMSfeK11czOJ2g7sTtECG93a8SaewId40HHH9QGGPaNlhcyd5uzsYLmkz82ZR4B3hXVQYLcRbXq5L
	LuOT0Y3IzDvlbehJzbpSGDyLAobpIRSlPrG8KqqwAuwk3r6kqf8OHuF7x1ZorAAmYDAjqXAsOtJ9F
	9crQtGcVlkNIknd+gtTAAFZttoa0N50GRI0W88245Rcve5DYahpiW28gJQggnXRpkVEPYu/cqDqO5
	KZpvAn+CpBFwYi52/YDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9T2s-0006OZ-Hr; Wed, 04 Mar 2020 12:22:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9T2p-0006Ab-UU; Wed, 04 Mar 2020 12:22:37 +0000
X-UUID: 030cebc5bedd4b14853cb354e97ef111-20200304
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=G3qywGgyJLG5zIB5C4MO427fFnJC0uUmsvwjBMR84aU=; 
 b=eRQ3etiQz0k00Y/O4qrGp5zeoDLOhNrZ4ojvFAtAXDxEWXpBTGh2IbBnX8KxMd8L10IaGPxFFfIjlbeptdFy6PQDpT8JfRr8HpWGIJbL+DZBcwGLdlquXaR4qGYBsRIoB38xriDIObO3TM/fDCY1AvvcMepSfYlQQN/2cp+NYM0=;
X-UUID: 030cebc5bedd4b14853cb354e97ef111-20200304
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 624140711; Wed, 04 Mar 2020 04:22:29 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 04:22:27 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 4 Mar 2020 20:21:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 20:21:25 +0800
Message-ID: <1583324538.4784.22.camel@mhfsdcap03>
Subject: Re: [PATCH v2 3/3] iommu/mediatek: add support for MT8167
From: Yong Wu <yong.wu@mediatek.com>
To: Fabien Parent <fparent@baylibre.com>
Date: Wed, 4 Mar 2020 20:22:18 +0800
In-Reply-To: <20200302112152.2887131-3-fparent@baylibre.com>
References: <20200302112152.2887131-1-fparent@baylibre.com>
 <20200302112152.2887131-3-fparent@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200304_042236_012396_D4904DC4 
X-CRM114-Status: GOOD (  15.12  )
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
Cc: devicetree@vger.kernel.org, joro@8bytes.org, linux-kernel@vger.kernel.org,
 ck.hu@mediatek.com, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-03-02 at 12:21 +0100, Fabien Parent wrote:
> Add support for the IOMMU on MT8167
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
> 
> V2:
> 	* removed if based on m4u_plat, and using instead the new
> 	has_legacy_ivrp_paddr member that was introduced in patch 2.
> 
> ---
>  drivers/iommu/mtk_iommu.c | 9 +++++++++
>  drivers/iommu/mtk_iommu.h | 1 +
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 78cb14ab7dd0..25b7ad1647ba 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -782,6 +782,14 @@ static const struct mtk_iommu_plat_data mt2712_data = {
>  	.larbid_remap = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9},
>  };
>  
> +static const struct mtk_iommu_plat_data mt8167_data = {
> +	.m4u_plat     = M4U_MT8167,
> +	.has_4gb_mode = true,
> +	.has_legacy_ivrp_paddr = true;
> +	.reset_axi    = true,
> +	.larbid_remap = {0, 1, 2, 3, 4, 5}, /* Linear mapping. */

Normally we put the file include/dt-bindings/memory/mt8167-larb-port.h
into the first binding patch. 

If we have that file, we will know there is only 3 larbs in mt8167.
thus, here should be: larbid_remap = {0, 1, 2}

Other than this,

Reviewed-by: Yong Wu <yong.wu@mediatek.com>

> +};
> +
>  static const struct mtk_iommu_plat_data mt8173_data = {
>  	.m4u_plat     = M4U_MT8173,
>  	.has_4gb_mode = true,
> @@ -799,6 +807,7 @@ static const struct mtk_iommu_plat_data mt8183_data = {
>  
>  static const struct of_device_id mtk_iommu_of_ids[] = {
>  	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
> +	{ .compatible = "mediatek,mt8167-m4u", .data = &mt8167_data},
>  	{ .compatible = "mediatek,mt8173-m4u", .data = &mt8173_data},
>  	{ .compatible = "mediatek,mt8183-m4u", .data = &mt8183_data},
>  	{}
> diff --git a/drivers/iommu/mtk_iommu.h b/drivers/iommu/mtk_iommu.h
> index 4696ba027a71..72f874ec9e9c 100644
> --- a/drivers/iommu/mtk_iommu.h
> +++ b/drivers/iommu/mtk_iommu.h
> @@ -30,6 +30,7 @@ struct mtk_iommu_suspend_reg {
>  enum mtk_iommu_plat {
>  	M4U_MT2701,
>  	M4U_MT2712,
> +	M4U_MT8167,
>  	M4U_MT8173,
>  	M4U_MT8183,
>  };

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
