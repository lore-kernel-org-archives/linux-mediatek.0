Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9424C5DF81
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2026 11:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IokGN/BgcpgUvROnkPq/p85oGGiZeBiuq4lIOBgjG2Q=; b=ZYsxWeJwGU/2uqXUVpbYgSel0u
	eAoJrAI9rxJggB9AomWAVJp0EaRKylnvqmkAX6BnPx+nixO1+1aJSKev9QXjlt48eJDBT7fr89ERO
	iLlBm0AUSAd4OZWuIKg5XuakaTkE5lajHnvpAeZN7zwhf1GWmO6CY8AdA6yBtsla89wkbb17t2e/s
	IT7nA2cBlfPoUTqDBSgIzSG0LcIeEz6yienu4sZ0GzEj56KOxmKomZMcQx5n12Hk0OXvcyGeWuY/6
	WrYLDEDTr3R3OLRILnu2cz2NYgX1rU6xAB22/R0VLJidLrhLpobG7js00KILErPz8Pfx9x5m7EQRP
	jQlvDDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0h6-0000000BPnT-2V2f;
	Thu, 20 Aug 2026 11:12:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0h4-0000000BPlW-1QNg
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Aug 2026 11:12:23 +0000
X-UUID: 00b2ae4a9c8811f1afed4741b24580c9-20260820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=IokGN/BgcpgUvROnkPq/p85oGGiZeBiuq4lIOBgjG2Q=;
	b=C4aX7LojRqHKuO0/HgqH1mJKWwN2WLJL2/tqMdNfc1alPCrhl0aFW9Fw1HXZ1a2M/1vkOiX8nmPO/tMVml99iSbcrqHVR8dY8u9ydr2ku0Yw6H3UQU/iBp/mVE64ZSuuaG4htSOehG5fIgd8KiWcMbobvMfz+a2AK3o6O35kadY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:1c87d302-0932-4422-a566-1d6b868287a9,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:7db8b62,CLOUDID:fb4512f2-0685-46a3-9cac-19d8f3a05ae7,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:1,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,
	OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 00b2ae4a9c8811f1afed4741b24580c9-20260820
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <anthony.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 525161792; Thu, 20 Aug 2026 04:12:16 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 20 Aug 2026 19:12:13 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Thu, 20 Aug 2026 19:12:13 +0800
From: Anthony Liu <anthony.liu@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <Sean.Wang@mediatek.com>, <Leon.Yen@mediatek.com>,
	<Quan.Zhou@mediatek.com>, <Ryder.lee@mediatek.com>,
	<litien.chang@mediatek.com>, <kun.wu@mediatek.com>, <jb.tsai@mediatek.com>,
	<emery.hsin@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Anthony Liu <anthony.liu@mediatek.com>
Subject: [PATCH v1] [PATCH 03/05] wifi: mt76: add ACPI MTFG option for bus configuration
Date: Thu, 20 Aug 2026 19:12:00 +0800
Message-ID: <20260820111202.1935373-3-anthony.liu@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260820111202.1935373-1-anthony.liu@mediatek.com>
References: <20260820111202.1935373-1-anthony.liu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041222_393848_299C3798 
X-CRM114-Status: UNSURE (   8.40  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Extend ACPI MTFG table parsing to support an additional MTFG bus
configuration option.

Change-Id: Ic8b9b4a70280439fd940dd96ca84d269b4817d31
CR-Id: WCNCR00542202
Signed-off-by: Anthony Liu <anthony.liu@mediatek.com>
Reviewed-on: https://gerrit.mediatek.inc/c/neptune/oss/nbd168_wireless/+/12378112
GAI-Code-Review: srv_ai_review001 <srv_ai_review001@mediatek.com>
AutoUT-Review-Label: srv_neptune_adm <srv_neptune_adm@mediatek.com>
Reviewed-by: jb.tsai <jb.tsai@mediatek.com>
Commit-Check: srv_check_service <srv_check_service@mediatek.com>
Code-Review-Course-Train: srv_check_service <srv_check_service@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 946dd7956e4a..227a6960f135 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -355,6 +355,7 @@ u8 mt792x_acpi_get_flags(struct mt792x_phy *phy)
 	} map[] = {
 		{ 1, 1 },
 		{ 4, 2 },
+		{ 13, 3 },
 	};
 	u8 flags = BIT(0);
 	int i, j;
-- 
2.45.2


