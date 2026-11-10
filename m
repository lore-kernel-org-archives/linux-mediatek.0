Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E3460A2616
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B54wu7UB;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=jdyYrRTb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5MFak8Bg9i/mQ+Qaw0YkrN7t0h0c/xyAJIn04TPnDno=; b=B54wu7UB3cWx/z2bMADBCd6B/M
	wuJdeaIzBYVSjtsBy9eEZGGgOrLPuTsPVIavYQsO1vseT1+YzHZD1U/KI3/Wz1NNaS+okucxMQ9A4
	r1nVucZMykwT0rqZZkaVvRleEsBOKh/Bbqz2nxN9Z0YnDle4qgUMN4DSf6igqU8CO46bSEuVyloPg
	1lnY2ofXKwcA/wyCAXUbFfp6bOWQo1FiAmzmFhzvxmWSPnJ8/p0l7gbmJvgoOvclzk/SUqrEZjSgC
	XqmDM+jOqubX+KZ2249DmywJjGVmqq8I5j1y/xQD/6Z2MidzyNTp0gWBjBPImDVm7BcnAaTh5z5hL
	gBl8i17A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMT-00000003gpy-0mgb;
	Tue, 10 Nov 2026 11:50:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMK-00000003gdl-1kIs;
	Tue, 10 Nov 2026 11:49:54 +0000
X-UUID: d55d80dedcfc11f1afed4741b24580c9-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=5MFak8Bg9i/mQ+Qaw0YkrN7t0h0c/xyAJIn04TPnDno=;
	b=jdyYrRTbmVL89ExCcXiVw6yAwVjchjWlATZ7EYTb87dcgK1VL6VNl0l/ni00Sxg1bciV8WBTvDGIRyU1sWmy+7DSBACv+P9yC8ZaW1BiQZHjcw3s1IkRIVYToiHTOV/qQZUcn6jdMxhTEzX0T8Iim0U/PAwqja7GwYtdo5UKVHI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e7d92c97-33cc-4e71-9eb5-21c338661896,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:b7428d8d-b3e7-4795-ae33-b1b4d51e21d7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d55d80dedcfc11f1afed4741b24580c9-20261110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1457726683; Tue, 10 Nov 2026 04:49:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:45 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Tue, 10 Nov 2026 19:49:44 +0800
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
Subject: [PATCH v2 6/7] thunderbolt: decouple the waiting time of TB_PORT_UNPLUGGED and TB_PORT_UP
Date: Tue, 10 Nov 2026 19:48:54 +0800
Message-ID: <20261110114925.722014-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034952_495274_7DFFBA4A 
X-CRM114-Status: GOOD (  17.55  )
X-Spam-Score: -2.1 (--)
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

When usb4 is woke up by device disconnect, no need wait for 2s,
usually the phase2~4 takes at most about 200ms, and enters to
TB_PORT_CONNECTING, if it is still in TB_PORT_UNPLUGGED after 400ms,
treat it as disconnected.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
new changes
---
 drivers/thunderbolt/switch.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7daee83c7ed8..e12546bfb869 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -489,8 +489,9 @@ int tb_port_state(struct tb_port *port)
  * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
  * wait_if_unplugged is set then we also wait if the port is in state
  * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
- * switch resume). Otherwise we only wait if a device is registered but the link
- * has not yet been established.
+ * switch resume, Wait at most 400 ms for link to start connecting,
+ * if timeout, means the device is disconnected). Otherwise we only wait
+ * if a device is registered but the link has not yet been established.
  *
  * Return:
  * * %0 - If the port is not connected or failed to reach
@@ -501,6 +502,7 @@ int tb_port_state(struct tb_port *port)
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
 	int retries = 20;
+	int unplugged_retries = 4;
 	int state;
 	if (!port->cap_phy) {
 		tb_port_WARN(port, "does not have PHY\n");
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


