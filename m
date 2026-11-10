Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536B60A2600
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4DiwQwAY;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=sEzBpdmI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UxQvBCWTGDJp0csChHCGxtym2Bdka/KsE4W82hKPGgY=; b=4DiwQwAY/gEvpjeexrxISRQUkQ
	qZ5+ARMTaWUrWQFblOjFCrdZC/eiR9pTaD6nCA6CW661RkNQaYtMMcB9B7wsgcIwQG5Yc4osSd4Vk
	0M8G92EvTyROHVehRSOaVk2sgd81YEjTZNRMuOumGFXQ6z2/taRa3Ep2mSIImrh6oGeCMMr/NouAm
	E2CPUuHST8tOxU29aksqt/Ia331zQThbD1FYVPmAXvE0aEW19qvyeZGhMc9SIOGA/YwfEAxXbw2+p
	BJJf3G923pkQeP48V1YJg6UEz7+nA7goaeKYC/smbM+WWt6nZEo2puknjI61WfVXgghE58qxfsYPD
	r0TIEmXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMO-00000003gha-2peh;
	Tue, 10 Nov 2026 11:49:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkMJ-00000003gc5-0kTO;
	Tue, 10 Nov 2026 11:49:53 +0000
X-UUID: d38bd8b4dcfc11f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UxQvBCWTGDJp0csChHCGxtym2Bdka/KsE4W82hKPGgY=;
	b=sEzBpdmIMpkLNhDRTseC9NI/0H8iuovYvsE/TvjNnuzaKTi2i6MNoG/imoDhqJ1RqpuE+qaP5R5N0chTVF2Yizq5J8uH5zEFNUz8ZX6RU7DiJ4gWUcQsw/X5aQjLh3kC2nruW5Zt3C8HcHdGTDoyDASJnvnLHxS3Y/mi7TyGEPo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:1f183809-5a85-4877-a45d-7a3f439daeb5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:b1b91457-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d38bd8b4dcfc11f1acbe4559397dec65-20261110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 335116247; Tue, 10 Nov 2026 04:49:46 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 19:49:44 +0800
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
Subject: [PATCH v2 5/7] thunderbolt: increase the lane adapter link-up timeout value
Date: Tue, 10 Nov 2026 19:48:53 +0800
Message-ID: <20261110114925.722014-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_034951_263146_E75F619F 
X-CRM114-Status: GOOD (  16.24  )
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

when plug into a USB3 device into USB4 hub's downstream facing port
to trigger usb4 driver wakeup, encounter the lane link up timeout
issue, then cause usb3 hub disconnect:

usb4_hi NVDA8100:00: 0:1: failed to reach state TB_PORT_UP. Ignoring port...
usb4_hi NVDA8100:00: 0:1: lost during suspend, disconnecting
usb4_hi NVDA8100:00: 0:4 <-> 1:20 (USB3): deactivating
usb4_hi NVDA8100:00: deactivating USB3 Down path from 0:4 to 1:20
usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:20 to 0:4
...
thunderbolt 0-1: device disconnected
usb 2-1: USB disconnect, device number 10

Completes link training at ~1.48s (with two retimer) and transitions
to TB_PORT_UP after change the timeout to 2s;

In the USB4 spec, Phase 5 (Link Equalization) alone is allowed up to
1000 ms. When add tPhase2~4 (200 ms), and retimer transaction delays
(tCmdResponse = 50 ms), the physical link is allowed by spec to take
1200 ms to 1500 ms+ to complete initialization.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: change timeout from 2.5s to 2s
---
 drivers/thunderbolt/switch.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/switch.c b/drivers/thunderbolt/switch.c
index 7ff3da79da76..7daee83c7ed8 100644
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
@@ -500,7 +500,7 @@ int tb_port_state(struct tb_port *port)
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


