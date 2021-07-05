Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77749C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:36:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B5AA613DA
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B5AA613DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeRUkhuBPPGSI7FYWmAb8mdvstX2xYu9cfyP7zfuhXE=; b=2AmFLunmDxTxC1
	vGQrXo7LhS04nEo5aHkGoipupTZRk2E58kIk2fcEcLiIctyN2U1h+HaXLsY4XBoeuMnRy3ahAjq3p
	GDDJzRLTE7/T/svGsGoeA/kKCcuYANb9sCciVI0RCV9rZn5/bmJaNOtN4y8X8mLtJiqC+eAHfRSQg
	760jrbp3r24KcHr7F9K8wk5YMz0bzNcpa4OtVxmS+nehGGjbTNmWJlPr76P0vzw0FArQ/GPN9lTZM
	eYJM3c/9+eLF/QZ1XrjroNGjXmqsuJEa0EUtkW0iU2C+PFvtvYvLmsva+W0fcU4OwYkNdDu740Xpz
	griCu1Orz68rhAbVbhNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HH7-007rwl-91; Mon, 05 Jul 2021 05:36:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HFz-007rNb-4n; Mon, 05 Jul 2021 05:35:00 +0000
X-UUID: 10217ffd5f274304ae0e14c08d7c1ec2-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BhBz8D9XsYKoCbsNTLQpD3iG7k2SXLZSrE8tbyEe4Fk=; 
 b=IJbrmZCifCeWux0FAqp2gEjCN27IB7+g5+R/qrdH1rXcMar4uiaPKDuAk521zEwCif0ooD97S84q5AaVC2aUtDHSCkgl4vTIjPoevPhwS4ZuxlYZcpXojBeroTD/bzYDWxzysMC/55g2PgNKe+vuVJg6CxdcNU2hcYUwDeL02VY=;
X-UUID: 10217ffd5f274304ae0e14c08d7c1ec2-20210704
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 96605093; Sun, 04 Jul 2021 22:34:55 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 22:34:54 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 13:34:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 13:34:39 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v2 1/5] dt-bindings: mailbox: add definition for mt8195
Date: Mon, 5 Jul 2021 13:34:25 +0800
Message-ID: <20210705053429.4380-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210705053429.4380-1-jason-jh.lin@mediatek.com>
References: <20210705053429.4380-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223459_218692_E527998D 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Add definition of compatible and dt-binding header for mt8195.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 7771ecaac586..a036fb5407bb 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -9,8 +9,8 @@ CMDQ driver uses mailbox framework for communication. Please refer to
 mailbox.txt for generic information about mailbox device-tree bindings.
 
 Required properties:
-- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce" or
-  "mediatek,mt6779-gce".
+- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce",
+  "mediatek,mt6779-gce" or "mediatek,mt8195-gce".
 - reg: Address range of the GCE unit
 - interrupts: The interrupt signal from the GCE block
 - clock: Clocks according to the common clock binding
@@ -36,8 +36,9 @@ Optional properties for a client device:
   size: the total size of register address that GCE can access.
 
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
-'dt-binding/gce/mt8183-gce.h' or 'dt-bindings/gce/mt6779-gce.h'. Such as
-sub-system ids, thread priority, event ids.
+'dt-binding/gce/mt8183-gce.h', 'dt-bindings/gce/mt6779-gce.h' or
+'dt-binding/gce/mt8195-gce.h'. Such as sub-system ids, thread priority,
+event ids.
 
 Example:
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
