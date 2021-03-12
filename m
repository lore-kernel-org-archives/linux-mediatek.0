Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63F1C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 07:56:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48D0964F83
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 07:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48D0964F83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VjjgEza2bNqLkRVWhOgJxyPvQLMtWb9ttWRdhIA9P0c=; b=DjVgzLt0fOpf6aMFgPJitmzxA
	oiHwdFVl55Vq3SiVhwTdBCpYSoMP4yZof32X30HSEjTQ1llwTBpZ+jP+t0TGZSJ78kESpEP9EENBq
	sHYR+6qLvQSNPa2LM1U8H/MPMVDWsYQ81g/YLxX0eJhzASrCM33hdV4X5BP5Oo+OmElg097F82VjA
	gbTXjvuCuZQYdq9K8GVuWPz9oFYrtgEbYJ53sq0A5rAnr+nXcgtrpVKnHV8YaE7cXvUju0zzdD8Rx
	DQhOZKFvYbHE8Bjibb1R2IocfzBNNQTAogsBa3FXHnParqXY59khwohWykX0dRp41IDiFZeEjOZWQ
	EcQHizb2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKcen-00Ap6h-B7; Fri, 12 Mar 2021 07:56:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKceM-00Ap0r-4P; Fri, 12 Mar 2021 07:56:00 +0000
X-UUID: dae54707d4b04d158c4ac8eae968730d-20210311
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TRYTA+AXyQi0DxvhKs7PI41orFgVunlUhT1pkSQgdTk=; 
 b=Hi8dQ8lsKo5/p35/qHLnrMiHeVOC3/2ljyjwIXxptVDrtwG5iWXZSK800Tk6OUgLiyrpiyXz1miwxpRdE0b3Gz48UyTcQN4H0HWV5Sq2iBZYIfgcJb4LM2f5sLT8ssFrpqS9PWyb8jRN+CgTR3XM8HFTIsjt4bD8JIPFNqOHL2c=;
X-UUID: dae54707d4b04d158c4ac8eae968730d-20210311
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 893629401; Thu, 11 Mar 2021 23:55:52 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 11 Mar 2021 23:55:51 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 15:55:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 12 Mar 2021 15:55:47 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Longfei
 Wang" <longfei.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 <yong.wu@mediatek.com>
CC: Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2,
 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges property
Date: Fri, 12 Mar 2021 15:55:38 +0800
Message-ID: <20210312075542.5503-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210312075542.5503-1-irui.wang@mediatek.com>
References: <20210312075542.5503-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9AD2604808B236AB1281924F3F7EB318735AA395EF3B3D65D1674ABD64299D6D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_075558_525219_1CF6C411 
X-CRM114-Status: GOOD (  11.83  )
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

The mt8192 iommu support 0~16GB iova. We separate it to four banks:
0~4G; 4G~8G; 8G~12G; 12G~16G.

The "dma-ranges" could be used to adjust the bank we locate.
If we don't set this property. The default range always is 0~4G.

Here we don't have actual bus/parent concept here.  And the iova
requirement is for our HW. Thus put the property in our node.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8318f0ed492d..d852683d3e6f 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -22,6 +22,8 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
+- dma-ranges : describes how the physical address space of the IOMMU maps
+  to memory.
 One of the two following nodes:
 - mediatek,vpu : the node of the video processor unit, if using VPU.
 - mediatek,scp : the node of the SCP unit, if using SCP.
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
