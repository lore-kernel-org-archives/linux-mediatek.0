Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 389D0C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:35:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECB29238EE
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECB29238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l1NVJPRBAvogBzgc2NO/rFG5CMz/mNqTI9mFwG0GnKA=; b=IraG2U3iwncMiEN21PVw+2s3A
	dXLKqoea7Z1ro6WVtMPM9JAEOn4SuoFzhGp2y4T5A7HcuFgPDz7AYuNEeysIpiuKiNrhEt7nN1bbt
	qoEVVSW4Y5ZeYnYc+YBkd/uLhq5sqGmn89j/CEPIqRyg4m9SrVWiYJIHeUprPjAA4AuOSTRjzd29g
	w7+mYZMhLD/rLrgEtvoKaH5IoGolBNU4X7Thv4t/ONmRvpEc50BK9M14dhKJIpahJItLTWKJkNDuG
	816Dmt62GGs1vocTCcAqxthK7PjbtjawosgIzkB52s/RZbQy6UUm4MFC38nYEzOmHy965WUcMOWcy
	V91FZheCA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2TYx-0003wW-Kl; Thu, 21 Jan 2021 06:35:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TYf-0003nx-KB; Thu, 21 Jan 2021 06:35:06 +0000
X-UUID: ce2c9bbed3944685924fdabcf3fcb6c0-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=X5y9BHRQuKG0gK1kzm7WGmKfMrZdt3f0a6gX5csBgVE=; 
 b=te8SzNJ29SHk7GfsFTqGrqWfpmoRb/gOWsk0Sw138hg1dUTliPWNqLWsDnkl+pZvILhpulyIDA917qR3U4Z5bdMs445SOEj27FokysptpnGJXr+in9ybUoy/TdmfBHCfrVIQOmsXBegmlv0i9EtuO3VmwYGmiV0YsD9/RmYopjY=;
X-UUID: ce2c9bbed3944685924fdabcf3fcb6c0-20210120
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1198826836; Wed, 20 Jan 2021 22:35:01 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 22:25:35 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 14:25:22 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 21 Jan 2021 14:25:21 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH 2/3] memory: mtk-smi: Add module_exit and module_license
Date: Thu, 21 Jan 2021 14:24:28 +0800
Message-ID: <20210121062429.26504-3-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210121062429.26504-1-yong.wu@mediatek.com>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 24476291C01264CB107719D7F0A11F842FC2D47325FB94F0AD32DB898B4DCD9F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_013505_819576_E3E0B0C7 
X-CRM114-Status: GOOD (  11.06  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com, Will
 Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The config MTK_SMI always depends on MTK_IOMMU which is built-in
currently. Thus we don't have module_exit before. This patch adds
module_exit and module_license. It is a preparing patch for supporting
MTK_SMI could been built as a module.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/memory/mtk-smi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index e2aebd2bfa8e..aa2a25abf04f 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -597,3 +597,13 @@ static int __init mtk_smi_init(void)
 	return platform_register_drivers(smidrivers, ARRAY_SIZE(smidrivers));
 }
 module_init(mtk_smi_init);
+
+static void __exit mtk_smi_exit(void)
+{
+	platform_unregister_drivers(smidrivers, ARRAY_SIZE(smidrivers));
+}
+module_exit(mtk_smi_exit);
+
+MODULE_DESCRIPTION("MediaTek SMI driver");
+MODULE_ALIAS("platform:MediaTek-SMI");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
