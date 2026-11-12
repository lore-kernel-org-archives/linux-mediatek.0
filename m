Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C459C606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 07:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MjxI/h2v;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=hZj6HRB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=B4ZD1hoCg1eZv+nGM6aMDIlxG/CU8uh64RuLx3XJAV8=; b=MjxI/h2vsTV4goCSQ54sGuajBY
	6iRzqM7g3LAwO/neGQWmLHjMmE22fovpRwKjLRxKNMuuo2X8UfbJyG76yPhYB0zK5LhxOJhuGK728
	nVl16xvdf8dxRLAZIJCf5owMYAmhi9ALFLVyOvYQNYfmjKmFHSHhEyLCNofrBL1lH0QmKPc+CBGaX
	X9dlcFiqR42+AK1tmXGdIViwAbKcmZFPLD4DgSMwEqfqcY/G50/Hc2MCiRLO2ZxPX/+4fls/1czEQ
	OkI3fX0ThPxZfBsP5jfUBsoJ7p+FRqV0TOqpWdCwAuF0rD4Rdypm0Xu02DD/bpghrxeL1sWIDBX0V
	SpF4r+Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPGU-00000008w30-45Jp;
	Thu, 12 Nov 2026 07:30:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRPGJ-00000008w0I-2pSO
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 07:30:32 +0000
X-UUID: e902a442de6a11f1acbe4559397dec65-20261112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=B4ZD1hoCg1eZv+nGM6aMDIlxG/CU8uh64RuLx3XJAV8=;
	b=hZj6HRB+fJCcfjTKcn+cCsMpev4BBXFeb6vwi/ZISIMBweEiuzdy8+WKTh2R7AWueJQJYzqwjmv6ZNWgexrZbd/F/lI10t8lqEiy5rzYCMybXXBoueN4fdoeVP4MjS5xFZnatnIQ9khOehyJ87aj4MUL/DvVfz+Gkt49wTvKRrc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:b86e3514-2f10-43d1-b2e8-7a9df60ca05c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:59bbbf30-f289-4656-bb36-27baf4489f11,B
	ulkID:nil,BulkQuantity:0,SF:102|836|865|888|898,TC:-5,Content:0|15|50|99,E
	DM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: e902a442de6a11f1acbe4559397dec65-20261112
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jb.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1017747693; Thu, 12 Nov 2026 00:30:18 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 12 Nov 2026 15:30:15 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 12 Nov 2026 15:30:15 +0800
From: JB Tsai <jb.tsai@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<Sean.Wang@mediatek.com>, <Charlie-cy.Wu@mediatek.com>,
	<jb.tsai@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7921: truncate the MTCL config to u8 explicitly
Date: Thu, 12 Nov 2026 15:30:14 +0800
Message-ID: <20261112073014.1798132-1-jb.tsai@mediatek.com>
X-Mailer: git-send-email 2.45.2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_233031_537672_64222FE3 
X-CRM114-Status: GOOD (  11.39  )
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

From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

mt792x_acpi_get_mtcl_conf() now returns a u32 and
MT792X_ACPI_MTCL_INVALID is 0xffffffff, but req.mtcl_conf in
__mt7921_mcu_set_clc() is still a u8, so the value is truncated
implicitly when there is no valid MTCL table.

Mask the value with 0xff to make the truncation explicit. The firmware
still gets 0xff for MT792X_ACPI_MTCL_INVALID, and valid MTCL configs
only use the low 6 bits, so there is no functional change.

Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 25b9437250f7..be0f1a063622 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -1330,7 +1330,8 @@ int __mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *alpha2,
 		.env = env_cap,
 		.env_6g = dev->phy.power_type,
 		.acpi_conf = mt792x_acpi_get_flags(&dev->phy),
-		.mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2),
+		/* MT792X_ACPI_MTCL_INVALID is sent to the FW as 0xff */
+		.mtcl_conf = mt792x_acpi_get_mtcl_conf(&dev->phy, alpha2) & 0xff,
 	};
 	int ret, valid_cnt = 0;
 	u32 buf_len = 0;
-- 
2.18.0


