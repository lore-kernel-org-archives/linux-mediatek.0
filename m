Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20E7AC7619D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:06:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1E820718
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:06:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R3dmQkxt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VMNhfQPQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1E820718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ijh1PhQ3HNMfxW2iUPSdHuDZsrjjlo3DOhmanOejG4k=; b=R3dmQkxtS8sb4s
	JwvkawuKzLd29hgJs2xZNzvAJ1lbjr+x2TRdtckCoYIgFsOPzTjQh691FbFSoiAt/ExAN/j3JqBn8
	U5Yj7IV3Ow6YD7ROYkmFDcT/CJGw0Zv++EEKLt6OuOcweCX7DedguPPjQ5WSZuFSmm38HeDq68lLM
	OL2836B6i1qcgkGhdSebb0k84tEy38t1GOWDxQNuVBbYiKdRNqi71IBZjfIXNtOt6e6GDkb9hEpdn
	VBlF2jLLDRiqgRVRKZFZplW5IzFZIwn6JA7RlZkqAinTBi/hx/yXvlB7FBoK4kO0tHRdSautNhAA+
	PICly5gm1OaQ1jZpVnFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3cM7-0003yI-U5; Mon, 17 Feb 2020 09:06:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3cLV-0003XZ-Cv; Mon, 17 Feb 2020 09:05:42 +0000
X-UUID: e7ef495c9a5642ee90fcf0dc2bc281a4-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=vQjXF5b/dhN0jgoPQcivzh7j7m7tgJaNaeuzKj+drKw=; 
 b=VMNhfQPQNjqiwlbO0ZQXlurstAqXAOerflZLb7pzaA6yXmvDxbkgkI7nqSOcRSzUMAeqmUz+jkMn5PAgq4F414+eMXlsRej4DGv3u+MxV5dMf5ULnszdEEL0J9nrn5pSJOnU7eUxkGvy+0+8JJtXzW6x0Em2j5VmQuQEByotCTQ=;
X-UUID: e7ef495c9a5642ee90fcf0dc2bc281a4-20200217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1074194043; Mon, 17 Feb 2020 01:05:36 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 01:06:23 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 17:04:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 17 Feb 2020 17:03:36 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, CK HU
 <ck.hu@mediatek.com>
Subject: [PATCH v1 1/3] dt-binding: gce: remove atomic_exec in mboxes property
Date: Mon, 17 Feb 2020 17:05:30 +0800
Message-ID: <20200217090532.16019-2-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
References: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_010541_460495_237E2DB5 
X-CRM114-Status: UNSURE (   8.74  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is not any client driver using this feature now,
so remove it from binding.

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 7b13787ab13d..0b5b2a6bcc48 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -14,13 +14,11 @@ Required properties:
 - interrupts: The interrupt signal from the GCE block
 - clock: Clocks according to the common clock binding
 - clock-names: Must be "gce" to stand for GCE clock
-- #mbox-cells: Should be 3.
-	<&phandle channel priority atomic_exec>
+- #mbox-cells: Should be 2.
+	<&phandle channel priority>
 	phandle: Label name of a gce node.
 	channel: Channel of mailbox. Be equal to the thread id of GCE.
 	priority: Priority of GCE thread.
-	atomic_exec: GCE processing continuous packets of commands in atomic
-		way.
 
 Required properties for a client device:
 - mboxes: Client use mailbox to communicate with GCE, it should have this
@@ -54,8 +52,8 @@ Example for a client device:
 
 	mmsys: clock-controller@14000000 {
 		compatible = "mediatek,mt8173-mmsys";
-		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
-			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
+		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST>,
+			 <&gce 1 CMDQ_THR_PRIO_LOWEST>;
 		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
 				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
 		mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
