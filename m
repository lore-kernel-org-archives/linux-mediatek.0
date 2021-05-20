Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E097CC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:48:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58EBA611BD
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 03:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58EBA611BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2OPODNqFCSU7N9SHB2g2+lbSghfaGlEw7op5/2jrn2E=; b=LJfAlWXKoqDOo/PRH6Yes3b8wN
	VrDlKguiVOCE9SyDM5/rSOWZaAdyLwWYfCqv/51GHFHQYVR3Lm7yhlkilGo4I922SdBK42tOsx1o4
	0BnyyjqlXSJIFqzdbVdrUVGs33vio1NV3HmZbpND9J67nZFvYkChMcHwEvbY4QnRAKjjEnPBcAkRP
	NeW7uWmRJpdf2coBQrTAct2w2CVK/YPlK6qzlGFzZg218CkcApCzBVv2gGupimiO6dPTW5jTIVBsf
	Jd0pCXIFqSDwinCN0aaNI4b1NwQxaWm9qKd2IDtvkbmSjomGQHfNxnZN5vhjYINw0bP0V3MATCkAv
	WFAZLpoA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljZfd-005nMb-V3; Thu, 20 May 2021 03:48:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZfY-005nLM-WC
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 03:48:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ijv0nh/+wa4MYdsyJ0kHqDPXJVtLrJsi8sPZB43bsqU=; b=UpdGRGwueAJHDCmrojcQAd6Anv
 rPPuzMoKcuK4AmyXjNsJuvEv+MJCLTpUq5G7V/GweSS6uAsibgxx76LOY33t/T1sm1FNSZFKCA+5A
 cWWZPJn92+LtfS/m6YpHhvPcd5wzKHMfof0urR1Y7DZyCCo5dWC3HOtS4hw9+lBavxXgw3z/8sa/C
 JteEUKkCpKMCotdpth/YXwH/CXATPOAeCuE8+epOyc1Atx7uvSd1Hblhz85vSgA4djF9AkGqNEZb5
 6rEx+jUBoTegGYzBOMt8mI/XglchYlPhVfYUHfthBaFBY5kaPFUxcY41mwHH2pw+6JOLLJZ74+MH7
 LU+dWj9A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljZfW-00FumR-DV
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 03:48:19 +0000
X-UUID: 231724c7f02f48f18797d1dc2e8f87ce-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ijv0nh/+wa4MYdsyJ0kHqDPXJVtLrJsi8sPZB43bsqU=; 
 b=FCiYcM0rdwlZxMEUe2ghoQ5Ak4r1zOaF4ancf/1fyV+K+JFvTtGwdBnjFQvulzEPfCYIZ/qIbgRaTZnKz8a0zgNfv/0abDGIAWESgRxgo/SIybBRiPlv57TEbEvH7w8CQANp1j1ckvUht6g6V34Ls4DwgO2rN0MLmQphsS+wr/Y=;
X-UUID: 231724c7f02f48f18797d1dc2e8f87ce-20210519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 739907029; Wed, 19 May 2021 20:48:12 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 20:46:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 11:46:43 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 May 2021 11:46:43 +0800
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
Subject: [PATCH RESEND 1/7] mt76: connac: add bss color support for sta mode
Date: Thu, 20 May 2021 11:46:35 +0800
Message-ID: <1621482401-29025-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_204818_488244_786D92A9 
X-CRM114-Status: GOOD (  11.58  )
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

Signed-off-by: Jayden.Kuo <jayden.kuo@mediatek.com>
Signed-off-by: YN Chen <yn.chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.c   | 14 ++++++++++++++
 .../net/wireless/mediatek/mt76/mt76_connac_mcu.h   |  9 +++++++++
 2 files changed, 23 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 949703ae6c2f..e0d6bdadf5b1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1307,6 +1307,7 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 				u8 pad[3];
 			} __packed hdr;
 			struct bss_info_uni_he he;
+			struct bss_info_uni_bss_color bss_color;
 		} he_req = {
 			.hdr = {
 				.bss_idx = mvif->idx,
@@ -1315,8 +1316,21 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
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
