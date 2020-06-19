Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8808C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:13:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77EC2080C
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 07:13:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YYHustoy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="M9q2XpuU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77EC2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGv1Ja30ked/z6h4G9CtCxd5jjR5Ro2gRRoUk86FoSw=; b=YYHustoyoTfwl5
	H3jPUOp6fE0lsILjCkclRnUbJmBfLuHnq95oxD6a3YWr/rUI+4pZ0/1aY3uniuJFJLUkdCbvr3+Kz
	rpQUmUW3duxG7/3dctTLOtrFbCO1ATivIGe6nJB1o8CvFBebYV9kr3PFXXWSfwEhg/3vnNd/pRWhc
	z5AeNJfmrCwg7hR2JpL0kokBucO22XmL9vv1S5e9q9hwXndQ927zLs0LvMI2nRcZeA8fxWBR+E7+M
	FNb2d9drCpgBDyDmaJKq+9qsz/isADKg68ZDMsFXrewYv9otRJPesz4i1ii4ojLu76Gng1eNAkCOL
	TSHW0l/83/4OR/r3uSpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmBDi-0004ks-R8; Fri, 19 Jun 2020 07:13:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmBDg-0004kO-DI
 for linux-mediatek@lists.infradead.org; Fri, 19 Jun 2020 07:13:50 +0000
X-UUID: 307d272b17544ad4bb3971cd8fc4baff-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Ge4Q1IGNmven9DEwI5s/AYTPPYmWkvgiVPEkL7m9LtI=; 
 b=M9q2XpuUPKOgdGV049XKRskPDU9OY/g1aBHPIBEN+X6ADjyZR7Q3LoaSXElk2pylXOH0sCWRb0460ICYCNgEosZcpjvFOrRQBV94OMMBShz0HYfCbMd6sH6tc2jzpvraGNgMwEWC6tkfbkHbr5lryexkgIAW08MD3ZRpS7oczAo=;
X-UUID: 307d272b17544ad4bb3971cd8fc4baff-20200618
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1771009837; Thu, 18 Jun 2020 23:13:57 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 00:13:42 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 15:13:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 15:13:33 +0800
Message-ID: <1592550813.23952.5.camel@mtksdaap41>
Subject: Re: [PATCH 09/10] media: dt-bindings: mtk-vcodec: specify SCP node
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 19 Jun 2020 15:13:33 +0800
In-Reply-To: <20200520082723.96136-10-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
 <20200520082723.96136-10-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A4C11D294B15114B2E1BEFFA5738803A511605A5CDDAEB32273C11F7D27DE922000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_001348_451944_D786D714 
X-CRM114-Status: GOOD (  11.96  )
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
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Pi-Hsun
 Shih <pihsun@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-05-20 at 17:27 +0900, Alexandre Courbot wrote:
> The mediatek codecs can use either the VPU or the SCP as their interface
> to firmware. Reflect this in the DT bindings.
> 
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>


> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index b6b5dde6abd8..7aef0a4fe207 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -19,7 +19,9 @@ Required properties:
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> -- mediatek,vpu : the node of video processor unit
> +One of the two following nodes:
> +- mediatek,vpu : the node of the video processor unit, if using VPU.
> +- mediatek,scp : the noode of the SCP unit, if using SCP.
>  
> 
>  Example:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
