Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A78AC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 04:47:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 076C16101E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 04:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 076C16101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I669kdzJUDrtvJM8CnsbQsDAX0XGNQYL7ZbhdbLc4M0=; b=R30JTvJldpk0fluqfP3i89wEM
	JPD7DElO3DayOF85TRoLgNaWuZQEoCAngyVK+NwqM6+ClOu4CrAbpQpT/TJBRluGwfgcbUc40RR4C
	DU7QiQcS63HWjER+jAoSIBBGKCODM0EPt1iTcfo0sbJ9/ykGP8Llf9QkaenJ30tKxpojcFTQj+bFG
	6bkW5g0gaCCfsh5grDb7CN3HQGv9t0QHEyLtIoE2K9x0kuwzeZiZ42yYeGnCpaJn+hP4g2rgzPLj1
	fmezKmXghldl7sxckHPhCHOy81wmKK2jylhn6p9vXbe8YbrqDaLC12aUw3Hdok1hRtuxhJTa1vmT8
	GsT15VikA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liVAN-00Di0F-Dp; Mon, 17 May 2021 04:47:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liV91-00Dhqw-BU
 for linux-mediatek@desiato.infradead.org; Mon, 17 May 2021 04:46:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=u8kN3BycCZfJwbMfO+TSQ2ahtl/ryuwqSSG/HuTJ2tk=; b=bPFPR6yggxMnWqy52I2RgZJ1jH
 t+LvlC2rX08Lxz84kUGrjhwdnoeopMCT/NShTLEno74Z7MP87B0J5j0xdym6jdokFBDYcjlv3Vr7p
 Xgi3Ii5unTHUuI1kndYlqlFMW2L8eXRYEuoZz6C/EB5R+SA73Zrr9obEqChDEznga1nVLpwQYSRkv
 LkBJwK3kIpOIoAMmzVVbNS+ZEtixFmivwOIpoxwpDnHc7G99WReTXMJ7qX7RafqipGF2V+nQ6qA8E
 OGp8EFCPGJnlCrU4YA8KuIPOTlUQ5/ClNHG+GJ8dq4pO6X9NOuDKYjEauBfJrBzuqhj/o3o6gTP2/
 l4qF/EXg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liV8v-00DTjD-HO
 for linux-mediatek@lists.infradead.org; Mon, 17 May 2021 04:46:15 +0000
X-UUID: a60d4a325209439cb1a91655ba7494fd-20210516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=u8kN3BycCZfJwbMfO+TSQ2ahtl/ryuwqSSG/HuTJ2tk=; 
 b=lbrH7bZQB/5Utz0igeZL8vNJivxBW6xiGKJrmxEbTgMzROPdaomlcUTlR72nk4HltgKPOQxztpPU5EZEf2e7tVPi1qh+TssxzG6vlsumn57Dev1LQopvbs9mK75EEj2RSpG+N9hVHg1PXSiQqicRFLzcUjdGsRiUNpmT4cd6tds=;
X-UUID: a60d4a325209439cb1a91655ba7494fd-20210516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 163052981; Sun, 16 May 2021 21:46:10 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 May 2021 21:46:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 May 2021 12:46:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 17 May 2021 12:46:01 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao
 <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix MT_EE_CAL_GROUP_SIZE
Date: Mon, 17 May 2021 12:45:58 +0800
Message-ID: <66c4bb0c6f4b1abcd0e17680ad42f742e2c1a528.1621198865.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <1da08f158e6784da6727779550f96f7a9c958b19.1621198865.git.ryder.lee@mediatek.com>
References: <1da08f158e6784da6727779550f96f7a9c958b19.1621198865.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_214613_610619_73ABBD16 
X-CRM114-Status: GOOD (  10.02  )
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

Fix wrong offset for pre-calibration data.

Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
index 033fb592bdf0..30bf41b8ed15 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.h
@@ -33,7 +33,7 @@ enum mt7915_eeprom_field {
 #define MT_EE_WIFI_CAL_GROUP			BIT(0)
 #define MT_EE_WIFI_CAL_DPD			GENMASK(2, 1)
 #define MT_EE_CAL_UNIT				1024
-#define MT_EE_CAL_GROUP_SIZE			(44 * MT_EE_CAL_UNIT)
+#define MT_EE_CAL_GROUP_SIZE			(49 * MT_EE_CAL_UNIT + 16)
 #define MT_EE_CAL_DPD_SIZE			(54 * MT_EE_CAL_UNIT)
 
 #define MT_EE_WIFI_CONF0_TX_PATH		GENMASK(2, 0)
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
