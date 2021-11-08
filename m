Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EBEC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:25:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E71C76125F
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 08:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E71C76125F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fk5oTlsdjYAHtHLU2bC1oL1KFrbuyrSAd9eWTADP5kY=; b=QoJ1QCtJJZcklN
	cm+RRUASYbsFXFl5H1Tpp2nnobhf0jbjA9kSLLMz0Az4mh2kcZMnTk/Rz3VcZ5gc2jPCgW7TOQY88
	l9a640iOWsWAANBExtG5qZz1IRihgn2+RmVsNGNOXm+/63Tja0N11b5TtGkDYiHfRVTWOHfVuC427
	Y9zjVm7sJqTgguf2nsyzca22n3dJCCy7HQ6J4orO735+76S/BuU/lJRsmEp/GkMO482IVeC4ff8KL
	9+p2MG3ohxtBpxq1sAUAuDT1+MKmBqtCNjvf5Zp/vAO+wnVl3UMalVRcqd72H0Y3iggBjrlzclUid
	LK6R0lM2N/Tui7PGbz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjzxS-00FiiA-VJ; Mon, 08 Nov 2021 08:24:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjzxN-00Figo-VE; Mon, 08 Nov 2021 08:24:48 +0000
X-UUID: f86b53b3ca914e63ae8f2511e67e2046-20211108
X-UUID: f86b53b3ca914e63ae8f2511e67e2046-20211108
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 80446148; Mon, 08 Nov 2021 01:24:39 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Nov 2021 00:24:37 -0800
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 8 Nov 2021 16:24:36 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 8 Nov 2021 16:24:35 +0800
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
 <ikjn@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH v2] memory: mtk-smi: Fix a null dereference for the ostd
Date: Mon, 8 Nov 2021 16:24:29 +0800
Message-ID: <20211108082429.15080-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_002446_032488_5EE853C6 
X-CRM114-Status: GOOD (  16.95  )
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

We add the ostd setting for mt8195. It introduces a KE for the
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
if "larb->larb_gen->ostd" is null, the "larbostd" is the offset(e.g.
0x80 above), it's also a valid value, then accessing "larbostd[i]" in the
"for" loop will cause the KE above. To avoid this issue, initialize
"larbostd" to NULL when the SoC doesn't have ostd setting.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
change note: Reword the commit message to show why it KE. and update the
solution via initializing "larbostd" is NULL explicitly in the non-ostd
case.
---
 drivers/memory/mtk-smi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index b883dcc0bbfa..e201e5976f34 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -241,7 +241,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
 {
 	struct mtk_smi_larb *larb = dev_get_drvdata(dev);
 	u32 reg, flags_general = larb->larb_gen->flags_general;
-	const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];
+	const u8 *larbostd = larb->larb_gen->ostd ? larb->larb_gen->ostd[larb->larbid] : NULL;
 	int i;
 
 	if (BIT(larb->larbid) & larb->larb_gen->larb_direct_to_common_mask)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
