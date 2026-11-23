Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E030606A31E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AeEM0Q39;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=HyzROjB1;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=CxZ3bvhh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/LMRasrUDrIyQRML2g9DMrJg4enHdU4K8A0548fGU5M=; b=AeEM0Q39+KHSlCZJCyqqSLpovx
	ml9j1Y/+ZHE4kTXnpEpxTZ0aKUfW1hJC8QnesUrE4a/iIfCMlkmQzCASzrplGRRW4sG9S8if7bEq5
	8lUBTNgogosZwZpydboBX4MFwsXef57/oC8xVwDO4+dYBiWpPpijAaoCgvyfyX6DZ2LBJMAtMKkHi
	WkPIEAXfethu2d9VCPfqOhtYQxcTewYntFrSPZf42exRJRPovPrPQJKIMEi9YqsTOGUKt0kOU/gpY
	RpKXBiFFVd7zzXfSnn5fFJBClEjF3VdaJyvyLnBXNHFXZK6i3xBFqDkRTaCm64hnMIRBu0vdRxmoD
	WWgmzCLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSNR-00000003DJr-2Kf4;
	Mon, 23 Nov 2026 11:38:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSN0-00000003CuW-0yv1;
	Mon, 23 Nov 2026 11:38:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/LMRasrUDrIyQRML2g9DMrJg4enHdU4K8A0548fGU5M=; b=HyzROjB1GjlmCQCiDupUvfxHA6
	J5eZ6I2N+oX6Vr0RGkgVfZhXGXd8oOdWIsXWP5g3eL9n9SwCM3OYTxJG3eI1asJRDx8Nbslkk5LKh
	4tPTLqHPXVwlq3V0YgxSFqgfiWvNzpc/8CYQtrAvDthaWNx3LEhZG0BPX10qyGAxegsXZd0JD119p
	aJrGAQpXGdcQUSK3V5sIHkDJFAxCZYTXiE7tL62/D31f0Lcndt9VG+Fo4umyrOeyZYPtaVwJDF/zV
	/PC6qtxzgzn6USaKkqOPNuyv6k1x92FwnbSorNxE1/mGZOqiESy1vVZY7oqWlM+67d1GOthwERGMj
	nA6xOFNw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMw-000000033lE-2FdJ;
	Mon, 23 Nov 2026 11:38:00 +0000
X-UUID: 4aa1076ee73211f1acbe4559397dec65-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=/LMRasrUDrIyQRML2g9DMrJg4enHdU4K8A0548fGU5M=;
	b=CxZ3bvhhXtuwQcTDds1WrRay9qvpUHhDPYvzsvpt6waCgEyawiGTKnHnNcMDJicIE+XY5Q+z0WWVnpFlgd3g773F4kxE6X6uAGbGFTOpCqqy655nkCqYC/Rpn263DP47r918c0iG/YK/ahIj1pv+cmJfjCZYeQf0YdExC61Te0g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:f9f4156c-7640-4cef-84bd-fb7a826a96d7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:3075ad66-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4aa1076ee73211f1acbe4559397dec65-20261123
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 750978623; Mon, 23 Nov 2026 04:37:41 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:38 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:37 +0800
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
Subject: [PATCH v3 6/8] thunderbolt: Increase the lane adapter link-up timeout value
Date: Mon, 23 Nov 2026 19:36:53 +0800
Message-ID: <20261123113705.2297329-7-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_113758_825412_B1C0DE7F 
X-CRM114-Status: GOOD (  16.44  )
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

when plug into a USB3 device into USB4 hub's downstream facing port
to trigger USB4 driver wakeup, encounter the lane link up timeout
issue, then cause USB3 hub disconnect:

thunderbolt NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
thunderbolt NVDA8100:00: 0:1: lost during suspend, disconnecting
thunderbolt NVDA8100:00: 0:4 <-> 1:16 (USB3): deactivating
thunderbolt NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:16
thunderbolt NVDA8100:00: deactivating USB3 Up path from 1:16 to 0:4
thunderbolt NVDA8100:00: 0: TMU: mode change off -> bi-directional, HiFi requested
thunderbolt NVDA8100:00: 0: TMU: mode set to: bi-directional, HiFi
thunderbolt NVDA8100:00: 0:5: DP IN resource available after hotplug
thunderbolt NVDA8100:00: looking for DP IN <-> DP OUT pairs:
...
thunderbolt 0-0:1.1: retimer disconnected
thunderbolt 0-1:1.1: retimer disconnected
thunderbolt 0-1: device disconnected
usb 2-1: USB disconnect, device number 5

Completes link training at ~1.48s (with two retimer) and transitions
to TB_PORT_UP after change the timeout to 2s;

In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
1000 ms. When add tPhase2~4 (200 ms), and retimer transaction delays
(tCmdResponse = 50 ms), the physical link is allowed by spec to take
1200 ms to 1500 ms+ to complete initialization.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: update commit message and kernel-doc
v2: change timeout from 2.5s to 2s
---
 drivers/thunderbolt/switch.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7ff3da79da76..97e3fd8cdc0c 100644
--- a/drivers/thunderbolt/switch.c
+++ b/drivers/thunderbolt/switch.c
@@ -486,7 +486,7 @@ int tb_port_state(struct tb_port *port)
  * @port: Port to wait
  * @wait_if_unplugged: Wait also when port is unplugged
  *
- * Wait up to 1 second for a port to reach state TB_PORT_UP. If
+ * Wait up to 2 seconds for a port to reach state TB_PORT_UP. If
  * wait_if_unplugged is set then we also wait if the port is in state
  * TB_PORT_UNPLUGGED (it takes a while for the device to be registered after
  * switch resume). Otherwise we only wait if a device is registered but the link
@@ -494,13 +494,13 @@ int tb_port_state(struct tb_port *port)
  *
  * Return:
  * * %0 - If the port is not connected or failed to reach
- *   state %TB_PORT_UP within one second.
+ *   state %TB_PORT_UP within two seconds.
  * * %1 - If the port is connected and in state %TB_PORT_UP.
  * * Negative errno - An error occurred.
  */
 int tb_wait_for_port(struct tb_port *port, bool wait_if_unplugged)
 {
-	int retries = 10;
+	int retries = 20;
 	int state;
 	if (!port->cap_phy) {
 		tb_port_WARN(port, "does not have PHY\n");
-- 
2.45.2


