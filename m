Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B682F606A327
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2esg1U4z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ULywT2CQ;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=I4aNr1yC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PRXvGXWiLhUZfSPTLsYZVP3/cuMLTt0j/3uv3gxjm5I=; b=2esg1U4z8JZ88q1gguNNHALbYr
	jZVG1lF1by05VlWIuhD059Zq46Oxy2nRslHEKDUFrUeRKd4HE9ulF05FZTikfSPK22i6Tt+iAT404
	y1c0khI3dN8Q+t1SAeVe4IQ5F1Mp0vOkg1kyELx4y3SxMr0zZW+C8XvLLOfgdNPYzhkSWKAbW6njC
	Us+IRi8Axgkfhm6c6ATqD4G9Q99zz/+gQ1UQe309zgUcZIL769esL0yaiHxzmPB/kRARfcC5gUcYo
	xRuu1C4wwaehl7ula43MTHqilObGkTQx7LF44zjiaoVulLv8Z/qm8sDxevfCeBZVe8EURtLOZOIx4
	7MckGQlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSNG-00000003DBl-44G3;
	Mon, 23 Nov 2026 11:38:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSN0-00000003CuY-14KR;
	Mon, 23 Nov 2026 11:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PRXvGXWiLhUZfSPTLsYZVP3/cuMLTt0j/3uv3gxjm5I=; b=ULywT2CQkq0Wj3krUZuKHhtsqH
	PGZG4xEMP6MixBSJ8isa5EtCne7r9lCiYFBeqYkRMTy8Ya84YSDsfOGSGaEPrmbtGm4TqFZxv3g6J
	29DMBGTKfNDbYXHB044gFSL+wW7mImWc2/lwM3H5qu885Vc1dDbqeVJ3Rdipv2yHt5HnFHHBTFTTw
	uDQQwS5/sn8DAA1AovomasaDCyU6xyk3F9RqV0N6CIr4O2t+kIQxmDPtBEP5nQoUYsXdOCy1L/S1X
	s3JUeTw2xWYsIqSIxcfWYDhwBtqT8GgJjsKGQVJ4wPcXUeGIaoGmTSSvus9ICumfLlGxeNXJ0wWcG
	GFm56LYQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMw-000000033lC-1es7;
	Mon, 23 Nov 2026 11:38:00 +0000
X-UUID: 4b2718eae73211f1afed4741b24580c9-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PRXvGXWiLhUZfSPTLsYZVP3/cuMLTt0j/3uv3gxjm5I=;
	b=I4aNr1yCX8n2yzkvnTC2WVDMur+VTmQ+9pqizbn8iNIATfBYDgxvwRgjfkuildE5Vb4PxesxU8bztSsaLFKQM7KPEk9MYbboMgvJgnKvx6uirP3aOARqoNlb4RvlLcd5szoZ2+HahZ4DqPUox4kT2sw7s4GoHFAhflBz4fkskG4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:20287a61-3f8b-4b3d-bfad-c4005ebf44cf,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:c9f7f319-ae4c-4a2b-b1c4-72e411efd0c9,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4b2718eae73211f1afed4741b24580c9-20261123
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 712190739; Mon, 23 Nov 2026 04:37:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:39 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:38 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mika Westerberg <westeri@kernel.org>
CC: Andreas Noever <andreas.noever@gmail.com>, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>, Sven Peter <sven@kernel.org>, Yehezkel
 Bernat <YehezkelShB@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>
Subject: [PATCH v3 7/8] thunderbolt: Decouple the waiting time of TB_PORT_UNPLUGGED and TB_PORT_UP
Date: Mon, 23 Nov 2026 19:36:54 +0800
Message-ID: <20261123113705.2297329-8-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_113758_748541_F08B3C64 
X-CRM114-Status: GOOD (  17.82  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When USB4 is woke up by device disconnect, no need wait for 2s,
usually the phase2~4 takes at most about 200ms, and enters to
TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
treat it as disconnected.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: fix code style
---
 drivers/thunderbolt/switch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 97e3fd8cdc0c..0da5b7ee4c29 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -489,8 +489,9 @@ int tb_port_state(struct tb_port *port)
  * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
  * wait_if_unplugged is set then we also wait if the port is in state
  * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
- * switch resume). Otherwise we only wait if a device is registered but the link
- * has not yet been established.
+ * router resume, Wait at most 400 ms for link to start connecting,
+ * if timeout, means the device is disconnected). Otherwise we only wait
+ * if a device is registered but the link has not yet been established.
  *
  * Return:
  * * %0 - If the port is not connected or failed to reach
@@ -500,6 +501,7 @@ int tb_port_state(struct tb_port *port)
  */
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
+	int unplugged_retries = 4;
 	int retries = 20;
 	int state;
 	if (!port->cap_phy) {
@@ -519,7 +521,7 @@ int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 			return 0;
 
 		case TB_PORT_UNPLUGGED:
-			if (wait_if_unplugged) {
+			if (wait_if_unplugged && unplugged_retries--) {
 				/* used during resume */
 				tb_port_dbg(port,
 					    "is unplugged (state: 7), retrying...\n");
-- 
2.45.2


