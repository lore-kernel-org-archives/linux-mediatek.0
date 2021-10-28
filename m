Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE98C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 05:51:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 836196103C
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 05:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 836196103C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=00modpIbe5zg1zUU/+qVgg74GjwwXSiHDF3AC98blok=; b=QLXXHocgQ6lIUX
	ckATiUkYZzFqjnTKxf2LNonHIrQMCh7ZijDKHaidkSCyAkT5zMuDrfhcrFPtYA+QaCbCjf9rX8m/m
	IM6NFr9fJnzjCg0sKb1eKeHzAYJHgFiX4h4hgw9blhx+mPidtEBhikFJraqEeH8HNFS5v7QPsktjq
	C8R3e1CUb+LclC+OH3G4r3Ff9KjbWBwwjTdKWwewaMkQrZEjWiZpEGDZYGZ3AKz3yGmkRBgEqotp2
	P8xhpzpMFc+PLmYbNSjiC7lDc+/P3Jam/8HMYvOv5Obui2+h7PF6xmhLkA3M4DH063IAWqrLUn6Ns
	YzR9VkPAIN5uroOO2Sbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfyJg-006uop-Fj; Thu, 28 Oct 2021 05:51:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfyJd-006unv-99; Thu, 28 Oct 2021 05:51:06 +0000
X-UUID: 47c0cf0942264e92a3e5373641f852c1-20211027
X-UUID: 47c0cf0942264e92a3e5373641f852c1-20211027
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1699719921; Wed, 27 Oct 2021 22:51:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Oct 2021 22:51:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Oct 2021 13:50:59 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via
 Frontend Transport; Thu, 28 Oct 2021 13:50:58 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <yi.kuo@mediatek.com>, <anthony.huang@mediatek.com>, Ikjoon Jang
 <ikjn@chromium.org>
Subject: [PATCH] memory: mtk-smi: Fix a null dereference for the ostd
Date: Thu, 28 Oct 2021 13:50:56 +0800
Message-ID: <20211028055056.26378-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_225105_349240_0A722AB2 
X-CRM114-Status: GOOD (  15.92  )
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

We add the ostd setting for mt8195. It introduces a abort for the
previous SoC which doesn't have ostd setting. This is the log:

Unable to handle kernel NULL pointer dereference at virtual address
0000000000000080
...
pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
lr : mtk_smi_larb_resume+0x54/0x98
...
Call trace:
 mtk_smi_larb_config_port_gen2_general+0x64/0x130
 pm_generic_runtime_resume+0x2c/0x48
 __genpd_runtime_resume+0x30/0xa8
 genpd_runtime_resume+0x94/0x2c8
 __rpm_callback+0x44/0x150
 rpm_callback+0x6c/0x78
 rpm_resume+0x310/0x558
 __pm_runtime_resume+0x3c/0x88

In the code: larbostd = larb->larb_gen->ostd[larb->larbid],
if "larb->larb_gen->ostd" is null, the "larbostd" is the offset, it is
also a valid value, thus, use the larb->larb_gen->ostd as the condition
inside the "for" loop.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
Hi Krzysztof,
Could you help review and conside this as a fix for the mt8195 patchset?
The mt8195 patchset are not in mainline, thus, I don't know its sha-id,
and don't add Fixes tag.
Thanks
---
 drivers/memory/mtk-smi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index b883dcc0bbfa..0262a59a2d6e 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -257,7 +257,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_SW_FLAG))
 		writel_relaxed(SMI_LARB_SW_FLAG_1, larb->base + SMI_LARB_SW_FLAG);
 
-	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i++)
+	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larb->larb_gen->ostd && !!larbostd[i]; i++)
 		writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));
 
 	for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
