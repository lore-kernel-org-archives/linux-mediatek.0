Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E792C606A331
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 11:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h0KMsV15;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=G4dXRLVE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=shbvfSBDzRVaT/N6z1PMlGhIE7QCCC86jNh7wNzWVx4=; b=h0KMsV15ghxi8mAF9b35G8wENh
	0x5fN/t5ajb+HF31ruDoBzYBYszK1Xa3S3g90lJLVlFAgDV4eOvveWLsEcAi+f90ViEyhcXYmIgwl
	Lz3uabPup/FwwxVaTVdaTTUGMRybkT30zpfC6BDVdsQelxhFeWuP37FOWV5JZAGVpLeSgdKvY6Ixk
	d3JrsEZEXknG0ghdCKsdLi888LP9S6FYxQZ41ZsoNMeb7VAOFFP2IMy3fJOkUhazt7q/joQoTtojo
	wftaJoKnXJuqXYOvHetwQ2ljhOXrMdrIRZrzbYWYroQP4isUvu47eWAEULevOsF2+b1ylih+y9R1X
	nJYzcZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSN7-00000003D0O-2Qoj;
	Mon, 23 Nov 2026 11:38:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSMj-00000003CWB-3U50;
	Mon, 23 Nov 2026 11:37:47 +0000
X-UUID: 4b9e78c2e73211f1acbe4559397dec65-20261123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=shbvfSBDzRVaT/N6z1PMlGhIE7QCCC86jNh7wNzWVx4=;
	b=G4dXRLVEf/SZfEpUORl1XztMz1pBSC/QRQHr2EQ/BcEFESaYDV6LDmJkRBdiVZZeT4B/M9/KRP8gU2Hahvg6C29ASbuYSNTpmYK78wMihAdLD0ero2Xw4N8B26y7F4InRACUZ6QrHYmOEdAA54Gi12b14QGrVi7FufrehFyb1qo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:cd764088-ccfc-41ec-ad3a-d3da8075efcd,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:225b3c31-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4b9e78c2e73211f1acbe4559397dec65-20261123
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1570305437; Mon, 23 Nov 2026 04:37:42 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 23 Nov 2026 19:37:40 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.53 via Frontend Transport; Mon, 23 Nov 2026 19:37:39 +0800
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
Subject: [PATCH v3 8/8] thunderbolt: Drop WARN_ON() in tb_disconnect_pci()
Date: Mon, 23 Nov 2026 19:36:55 +0800
Message-ID: <20261123113705.2297329-9-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
References: <20261123113705.2297329-1-chunfeng.yun@mediatek.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_033745_924207_7795F519 
X-CRM114-Status: GOOD (  15.55  )
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

tb_disconnect_pci() uses WARN_ON() if the upstream PCIe adapter port
or the associated PCIe tunnel cannot be found. This triggers a full
kernel stack trace in dmesg.

However, tb_disconnect_pci() is invoked when userspace deauthorizes
a router via sysfs (writing 0 to 'authorized'). Under dynamic runtime
conditions, an upstream port or active tunnel may not exist.
For example:
- If a USB4 router fails to resume or is unplugged during system/link
  sleep, the disconnect flow may tear down and free the PCIe tunnel
  before userspace deauthorization runs.
- If PCIe tunnel activation previously failed (e.g., due to link
  training or Type-C handshake hiccups), the tunnel was never
  established in the first place.

it seems unnecessary due to it does not indicate a kernel bug.
Furthermore, it causes unnecessary kernel panics on systems
booted with panic_on_warn.

Since -ENODEV is already returned to notify callers, simply drop the
WARN_ON() checks while keeping the -ENODEV return.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3:
* modify commit message.
* Reworked sw->is_unplugged checks to directly drop the WARN_ON(!up)
  and WARN_ON(!tunnel) checks in tb_disconnect_pci()

v2: no changes
---
 drivers/thunderbolt/tb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
index 57c11ba13459..5f674c305d43 100644
--- a/drivers/thunderbolt/tb.c
+++ b/drivers/thunderbolt/tb.c
@@ -2267,11 +2267,11 @@ static int tb_disconnect_pci(struct tb *tb, struct tb_switch *sw)
 	struct tb_port *up;
 
 	up = tb_switch_find_port(sw, TB_TYPE_PCIE_UP);
-	if (WARN_ON(!up))
+	if (!up)
 		return -ENODEV;
 
 	tunnel = tb_find_tunnel(tb, TB_TUNNEL_PCI, NULL, up);
-	if (WARN_ON(!tunnel))
+	if (!tunnel)
 		return -ENODEV;
 
 	tb_switch_xhci_disconnect(sw);
-- 
2.45.2


