Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36D41C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 14:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3BE1207D0
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 14:14:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L3uaKarR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3BE1207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=8bytes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gnP0lRwaQKSFH2xXwvDprE16GBrsg8I3MkiP+cTZHxY=; b=L3uaKarRymdfGae4bYxzKvAdw
	ZmlngkCbm+QNWhnksNJtUVZQh0ld3TVlgz5y/UjNDRMv3ouZhaxwWeM1GEvYJSM25eCUcmJrA3+hz
	8fliwweWNpuY4zMSxdwK3VomIByycPu7ptYnIZbGKv4snp2SaM83V4AyKORQng2Ztt3fNnZ87h3xv
	o006rzgjYQ0AffIMHGDaxvAmwGzn/3PKa4cQwAwAVw2ZQiDQHtqqngLUAiHbZsuuTbskm2o1kEPmI
	48mQicNn0DugzeuZfrTTC1L81ZiOdmg12tvFceJFb97tRL9efbLhRAxuBm9jKJ4vAvXQhStpUpeCY
	ihCCqe11A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttms-0000dx-Kr; Fri, 10 Jul 2020 14:14:02 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttmp-0000cX-9k; Fri, 10 Jul 2020 14:13:59 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id E00A920C; Fri, 10 Jul 2020 16:13:50 +0200 (CEST)
Date: Fri, 10 Jul 2020 16:13:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Chao Hao <chao.hao@mediatek.com>
Subject: Re: [PATCH v6 00/10] MT6779 IOMMU SUPPORT
Message-ID: <20200710141349.GJ27672@8bytes.org>
References: <20200703044127.27438-1-chao.hao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703044127.27438-1-chao.hao@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_101359_452113_44BF3114 
X-CRM114-Status: GOOD (  10.82  )
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
 wsd_upstream@mediatek.com, TH Yang <th.yang@mediatek.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 03, 2020 at 12:41:17PM +0800, Chao Hao wrote:
> Chao Hao (10):
>   dt-bindings: mediatek: Add bindings for MT6779
>   iommu/mediatek: Rename the register STANDARD_AXI_MODE(0x48) to MISC_CTRL
>   iommu/mediatek: Use a u32 flags to describe different HW features
>   iommu/mediatek: Setting MISC_CTRL register
>   iommu/mediatek: Move inv_sel_reg into the plat_data
>   iommu/mediatek: Add sub_comm id in translation fault
>   iommu/mediatek: Add REG_MMU_WR_LEN_CTRL register definition
>   iommu/mediatek: Extend protect pa alignment value
>   iommu/mediatek: Modify MMU_CTRL register setting
>   iommu/mediatek: Add mt6779 basic support

Applied, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
