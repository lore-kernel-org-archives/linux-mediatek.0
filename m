Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B96BAC00144
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 04:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnJ38ABSxv5mOZjPblxuu6Sp+racuYLx9eLMQV0v6no=; b=I/PK1wMpVx3W8cnN8cakePjyCi
	jRibNB5TMEk9d1HOYQxBf3srP2+xFfOvNQS8bYKMVW3fL5Sz3TQuc7IFTqxj6s5dgEobzGZB0zYTQ
	jFu3PKGvre6mjkrpcgp6KRYOZyLKAzuhsFqFnDhmtFeNwqW8NRn80gCuT5L2OQXgtSdZOrJiHAsqR
	A0pAuLf6UQtcKvanaypZVHJIL18KFG9VoXhKm279V+d5hA21szoCKykTsRvfItdEe5N22BKtrpvuz
	aNB8kQSYBCpJsB0eqacXvlgvLn0tWWOW+SnGDTeYfFVJYSh8z05Q/uQ51quRRdx7sZ6Z+nug6odP6
	1kuCYK+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJSAR-00HOom-0Z; Thu, 04 Aug 2022 04:09:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJSAG-00HOdy-GO; Thu, 04 Aug 2022 04:08:55 +0000
X-UUID: 1a800b212dc04ae89752f8ed85146e01-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:b222186b-d3a1-4ea5-9e7a-3a90cbf4ec52,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:0f94e32,CLOUDID:45fc3825-a982-4824-82d2-9da3b6056c2a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 1a800b212dc04ae89752f8ed85146e01-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 450199565; Wed, 03 Aug 2022 21:08:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 4 Aug 2022 11:48:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 4 Aug 2022 11:48:08 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Mediatek WSD Upstream <wsd_upstream@mediatek.com>, Macpaul Lin
	<macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<stable@vger.kernel.org>
Subject: [PATCH v2] usb: typec: altmodes/displayport: correct pin assignment for UFP receptacles
Date: Thu, 4 Aug 2022 11:48:03 +0800
Message-ID: <20220804034803.19486-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220727110503.5260-1-macpaul.lin@mediatek.com>
References: <20220727110503.5260-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_210852_630663_AEBF553F 
X-CRM114-Status: GOOD (  14.86  )
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

From: Pablo Sun <pablo.sun@mediatek.com>

Fix incorrect pin assignment values when connecting to a monitor with
Type-C receptacle instead of a plug.

According to specification, an UFP_D receptacle's pin assignment
should came from the UFP_D pin assignments field (bit 23:16), while
an UFP_D plug's assignments are described in the DFP_D pin assignments
(bit 15:8) during Mode Discovery.

For example the LG 27 UL850-W is a monitor with Type-C receptacle.
The monitor responds to MODE DISCOVERY command with following
DisplayPort Capability flag:

        dp->alt->vdo=0x140045

The existing logic only take cares of UPF_D plug case,
and would take the bit 15:8 for this 0x140045 case.

This results in an non-existing pin assignment 0x0 in
dp_altmode_configure.

To fix this problem a new set of macros are introduced
to take plug/receptacle differences into consideration.

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Co-developed-by: Pablo Sun <pablo.sun@mediatek.com>
Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>
Co-developed-by: Macpaul Lin <macpaul.lin@mediatek.com>
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: Guillaume Ranquet <granquet@baylibre.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: stable@vger.kernel.org
---
Changes in v2:
 - Fix commit message.
  - Remove duplicate "From:" tag.
  - Add "Fixes:" tag.
  - Add more "Reviewed-by:" tag. 

 drivers/usb/typec/altmodes/displayport.c | 4 ++--
 include/linux/usb/typec_dp.h             | 5 +++++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 9360ca177c7d..8dd0e505ef99 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -98,8 +98,8 @@ static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
 	case DP_STATUS_CON_UFP_D:
 	case DP_STATUS_CON_BOTH: /* NOTE: First acting as DP source */
 		conf |= DP_CONF_UFP_U_AS_UFP_D;
-		pin_assign = DP_CAP_DFP_D_PIN_ASSIGN(dp->alt->vdo) &
-			     DP_CAP_UFP_D_PIN_ASSIGN(dp->port->vdo);
+		pin_assign = DP_CAP_PIN_ASSIGN_UFP_D(dp->alt->vdo) &
+				 DP_CAP_PIN_ASSIGN_DFP_D(dp->port->vdo);
 		break;
 	default:
 		break;
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index cfb916cccd31..8d09c2f0a9b8 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -73,6 +73,11 @@ enum {
 #define DP_CAP_USB			BIT(7)
 #define DP_CAP_DFP_D_PIN_ASSIGN(_cap_)	(((_cap_) & GENMASK(15, 8)) >> 8)
 #define DP_CAP_UFP_D_PIN_ASSIGN(_cap_)	(((_cap_) & GENMASK(23, 16)) >> 16)
+/* Get pin assignment taking plug & receptacle into consideration */
+#define DP_CAP_PIN_ASSIGN_UFP_D(_cap_) ((_cap_ & DP_CAP_RECEPTACLE) ? \
+			DP_CAP_UFP_D_PIN_ASSIGN(_cap_) : DP_CAP_DFP_D_PIN_ASSIGN(_cap_))
+#define DP_CAP_PIN_ASSIGN_DFP_D(_cap_) ((_cap_ & DP_CAP_RECEPTACLE) ? \
+			DP_CAP_DFP_D_PIN_ASSIGN(_cap_) : DP_CAP_UFP_D_PIN_ASSIGN(_cap_))
 
 /* DisplayPort Status Update VDO bits */
 #define DP_STATUS_CONNECTION(_status_)	((_status_) & 3)
-- 
2.18.0


