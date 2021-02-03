Return-Path: <SRS0=J04E=HF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC55C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:48:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD2FA64F6C
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Feb 2021 08:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD2FA64F6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lSQEqGr4lXTtDs4c8FLcqdslfrtiv4tX+O3aw6NGGd0=; b=vlBQlyV/eEZVdTFA4yn450NJ/
	SNY5LnbADsKCiAO/lxBxrS4jme5vj7lacMovvafL4aczVY6FqkVl+nb0lwojTOm075UPPqSqe+Rpx
	Z5oh5v5Ei3uJmhqT3o4UjVkz3wJ0ijTq5XP56qBhBgDSNiabrbcbgW5UXI8r1OgjwfDU7D2rZlNZ+
	8sA5z6083eULqO5TClafTy2G/yOsrKlUomz51YVycMng9iKDWZg1h+fTl7SK8PbYTtW2xgvZTlp0L
	7+PNCbCHr+McM73umlZh/x7P0Fl7lVB80MFsE9+G7pvfDgqBbDB3E57pLVsYkP0RbhXmfotEOFJcD
	9QiMmizdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7Dpf-0007r9-Fo; Wed, 03 Feb 2021 08:48:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7Dpd-0007qZ-PJ; Wed, 03 Feb 2021 08:48:14 +0000
X-UUID: d599a5c83bd148a7a9d510142ecf64b3-20210203
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=k+b2oxQakaQQPMDGLzL/7wJD2olR10j/ORYJj3OKdjQ=; 
 b=MyNXWDskBFTuVFSpQGnwXMKS3ctx/70uUThWUlG1doGzaMVKy+LLsVlrHeC6z4gpscKpoG0iXWrWxnYIpQwxzuBx7TMyTjeO/YWDFiVYxgLsOJDmCjJBh5IUXoXpMPEDi0tatrKPH3mA5vgGvx6TxVM4X1OEmlZKpl1uqiVxUqE=;
X-UUID: d599a5c83bd148a7a9d510142ecf64b3-20210203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 728802354; Wed, 03 Feb 2021 00:48:09 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 00:38:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Feb 2021 16:37:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Feb 2021 16:37:58 +0800
From: Irui Wang <irui.wang@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Fritz Koenig <frkoenig@chromium.org>, Tzung-Bi Shih
 <tzungbi@chromium.org>
Subject: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges property
Date: Wed, 3 Feb 2021 16:37:48 +0800
Message-ID: <20210203083752.12586-2-irui.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210203083752.12586-1-irui.wang@mediatek.com>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_034814_021065_B14C15F9 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: devicetree@vger.kernel.org, Maoguang Meng <maoguang.meng@mediatek.com>,
 srv_heupstream@mediatek.com, Irui
 Wang <irui.wang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds dma-ranges property for DMA addresses translation.

Signed-off-by: Irui Wang <irui.wang@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index f85276e629bf..e4644f8caee9 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -23,6 +23,8 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
+- dma-ranges : describes how the physical address space of the IOMMU maps
+  to memory.
 One of the two following nodes:
 - mediatek,vpu : the node of the video processor unit, if using VPU.
 - mediatek,scp : the node of the SCP unit, if using SCP.
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
