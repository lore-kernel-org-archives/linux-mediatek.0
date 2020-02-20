Return-Path: <SRS0=Q2+k=4I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1D4C5ACC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 01:36:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D80921D56
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2020 01:36:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZAYUAbf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Cj+GpElC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D80921D56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKwmLqXvDqVpSW4/AV/ub81FTae/EbeVao9aGKynWw0=; b=dZAYUAbfo6l7AR
	ad7aDvuw5yeNcl4TCNX4zYy3OYixF0hz7meqrVqvsk2AxFikTNRtZiuyEd4Sxy5DY34xYnHvUsSFt
	/fyvTzUnTIGMCeE8B+QfE9WR/u0liC6BagdgUwA73j3UeUGOmOtuywDHwvPC85/Gu34htwVJe1XaH
	hiBBwByPxcT2UoLjgGVCLsrGECvrv+2bjdK2Sw5DGnEBP7smTmkFLBS7oGorcNX3/yqxMHnXXE8HG
	34XQNCsnUakFdr+He19tuBjOjMYyVobjsMnnyAeyORUmnmOHDRd1O5KziWJ6g+eaUZth/AdgaPzxy
	KBD322+AvNiYQQYw9neg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4alP-0006lY-2z; Thu, 20 Feb 2020 01:36:27 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4alE-0006dJ-OG; Thu, 20 Feb 2020 01:36:19 +0000
X-UUID: 22ad0f1db8de4e43a22b45bb9871a741-20200219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=M86BLgqozbH/Kl6AgJIXd8CaALScxACbiWE+AGXHu0M=; 
 b=Cj+GpElCDUUggrUPzXSWal+0LBXA/Js6cHOFqPE/HSfaiaFT5cQVqGJOVhIk4xx0Y8hcHvzyj1y6Q9oTXDtHHS3Uj3fqXFw9iZpkhY6n4ouBXRHWRSCrFNfZ8aENxznZvMCINcJKXhRTUIxqURVMkFU95xxb1IPgavATLujoa7g=;
X-UUID: 22ad0f1db8de4e43a22b45bb9871a741-20200219
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 148835711; Wed, 19 Feb 2020 17:36:11 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 19 Feb 2020 17:36:09 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 20 Feb 2020 09:36:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 20 Feb 2020 09:35:31 +0800
Message-ID: <1582162568.24713.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: component type MTK_DISP_OVL_2L is not
 correctly handled
From: CK Hu <ck.hu@mediatek.com>
To: Phong LE <ple@baylibre.com>
Date: Thu, 20 Feb 2020 09:36:08 +0800
In-Reply-To: <20200219141324.29299-1-ple@baylibre.com>
References: <20200219141324.29299-1-ple@baylibre.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_173617_783923_21A42181 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Phong:

On Wed, 2020-02-19 at 15:13 +0100, Phong LE wrote:
> The larb device remains NULL if the type is MTK_DISP_OVL_2L.
> A kernel panic is raised when a crtc uses mtk_smi_larb_get or
> mtk_smi_larb_put.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Phong LE <ple@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 1f5a112bb034..57c88de9a329 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -471,6 +471,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
>  	/* Only DMA capable components need the LARB property */
>  	comp->larb_dev = NULL;
>  	if (type != MTK_DISP_OVL &&
> +	    type != MTK_DISP_OVL_2L &&
>  	    type != MTK_DISP_RDMA &&
>  	    type != MTK_DISP_WDMA)
>  		return 0;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
