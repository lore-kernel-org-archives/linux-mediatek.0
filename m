Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F2EC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 09:48:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D7CF6143A
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 09:47:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D7CF6143A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UoMFs6VInp1BpscTMI+saTZ1U7O5nnGnhhi9l93f1CE=; b=T88T78Bqfrpv/V/EOqf5tPOHkC
	zvqRHjRr7NemsfPM6jNtUwsGqY7cq4hDDAF3JiIWyRfLvT3C5CbeL24J7Kuuso+or+XLDAkLY8Z0I
	3xba1r5hFr3tx+rDPAmZGhjp/9dPnw/1OBe+rw0MpitPfLGUtm6Ypagq/5v8DAff9FsK8AbGYIMc7
	j5bi6zfD+jIhMgIqY+ZAAB20JXNz5eGfxInhhqhfzaCrlL1uO+do/VzquSd4z52fcpKt8OcwsvxLY
	rczs76mpqVld1n3zlUixLvTqB6pegGK7iMoknuPguBoLi9szSqN/KgckU0ptqUbyKKek8i2b94w5A
	AUBgrF3Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lh7wV-005Fmt-4H; Thu, 13 May 2021 09:47:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh7wQ-005FmP-FE
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 09:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=WBk5M93vpkIgJ//wSPBBylK01yb+Kw75oJkY6pSauY8=; b=OV6s3PEoxHX95EreBP+t/p3VkV
 rtFbLxKPDAI4tAM0+31zN2BFy9VoFxhlGvJ4RyKgFxdjK3DZE4Mbrrd5wJszkPt39Hdx7dCFgNxmt
 qoco33aCEexfNUk3ZlYekfUeH1wmndD06MMtBVsHbyPHj6pYKYz0xCMSK8EywjY1G7DltNymwVPj5
 JoWMMmIWkvBDDl+QDx6JNT9qXzrrtQvUW/Uy88bg1hf6q1mgYNboOKXRp/uyTU+CsQ6fYX5wzazYa
 OckQC1UwTh0vA2+7hn5m8gADWEmPYaDGvdzc8zg5rCcQ/OJv/Cx6+XKoEXwYahbpzQ3Gcuo/42Ws/
 YvO/S4nA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lh7wM-00B93d-FQ
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 09:47:36 +0000
X-UUID: c604bf3882a04460ad8232c21089b1df-20210513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=WBk5M93vpkIgJ//wSPBBylK01yb+Kw75oJkY6pSauY8=; 
 b=SCJucAFCN70TDH8DzPOL5qAkDQL4lWmnV9zVou01Jumcxkiv3UjeO2MzpFQ5tm9phtwlUA9r94j2q/WKWIcIEH8pyqEBzOZW0biP1WWsnyAWJkcZiLMMtJw+1nKHftHjdW5pHcKS+7l53ARre/G4KwHPDcVaCGs093/eEoSyy28=;
X-UUID: c604bf3882a04460ad8232c21089b1df-20210513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 139584749; Thu, 13 May 2021 02:47:31 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 02:47:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 17:47:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 13 May 2021 17:47:28 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
CC: <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, 
 <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <Eric.Liang@mediatek.com>, <Stella.Chang@mediatek.com>, <jemele@google.com>,
 <yenlinlai@google.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, YN Chen <yn.chen@mediatek.com>,
 Jayden.Kuo <jayden.kuo@mediatek.com>
Subject: [PATCH RESEND 8/9] mt76: connac: add bss color support for sta mode
Date: Thu, 13 May 2021 17:47:27 +0800
Message-ID: <1620899247-4221-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_024734_551434_EECF087A 
X-CRM114-Status: GOOD (  11.00  )
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

From: YN Chen <yn.chen@mediatek.com>

Add bss color support for sta mode

Reviewed-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Jayden.Kuo <jayden.kuo@mediatek.com>
Signed-off-by: YN Chen <yn.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   | 14 ++++++++++++++
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 6ffe4b91d567..8ebcbb5ea51c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1311,6 +1311,7 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 				u8 pad[3];
 			} __packed hdr;
 			struct bss_info_uni_he he;
+			struct bss_info_uni_bss_color bss_color;
 		} he_req = {
 			.hdr = {
 				.bss_idx = mvif->idx,
@@ -1319,8 +1320,21 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 				.tag = cpu_to_le16(UNI_BSS_INFO_HE_BASIC),
 				.len = cpu_to_le16(sizeof(struct bss_info_uni_he)),
 			},
+			.bss_color = {
+				.tag = cpu_to_le16(UNI_BSS_INFO_BSS_COLOR),
+				.len = cpu_to_le16(sizeof(struct bss_info_uni_bss_color)),
+				.enable = 0,
+				.bss_color = 0,
+			},
 		};

+		if (enable) {
+			he_req.bss_color.enable =
+				vif->bss_conf.he_bss_color.enabled;
+			he_req.bss_color.bss_color =
+				vif->bss_conf.he_bss_color.color;
+		}
+
 		mt76_connac_mcu_uni_bss_he_tlv(phy, vif,
 					       (struct tlv *)&he_req.he);
 		err = mt76_mcu_send_msg(mdev, MCU_UNI_CMD_BSS_INFO_UPDATE,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 8f4d85b148fb..d64b8058b744 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -575,6 +575,7 @@ enum {
 enum {
 	UNI_BSS_INFO_BASIC = 0,
 	UNI_BSS_INFO_RLM = 2,
+	UNI_BSS_INFO_BSS_COLOR = 4,
 	UNI_BSS_INFO_HE_BASIC = 5,
 	UNI_BSS_INFO_BCN_CONTENT = 7,
 	UNI_BSS_INFO_QBSS = 15,
@@ -789,6 +790,14 @@ struct mt76_connac_sched_scan_done {
 	__le16 pad;
 } __packed;

+struct bss_info_uni_bss_color {
+	__le16 tag;
+	__le16 len;
+	u8 enable;
+	u8 bss_color;
+	u8 rsv[2];
+} __packed;
+
 struct bss_info_uni_he {
 	__le16 tag;
 	__le16 len;
--
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
