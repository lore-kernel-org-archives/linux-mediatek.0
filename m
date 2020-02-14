Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8CFC2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 15:56:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C3E624649
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 15:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cchy9p1Y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mvScXVCZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C3E624649
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RcPaE/b5qRx6amwuBF1uL/JWSm0cT3gHpZa/WbYpsDA=; b=Cchy9p1Y7wk9VB
	xcobM6Y8cOxOJuo0av8WRf4CxR0lYdeHIa9htQRcJUQzqy20wUDeeGP7JaU/IuuarhuJbzYBVEQ+S
	CjZ3RfoqTN2ukK/2ZgMN8CAn+NU5OCB9PRXRqU3QUbE2BS/JuUz5GzCHg95XYWER8JwF53P4TKoPT
	IlOLYNAXeY+n1p08CC/DjwF8I0KZg3CmrakzjY9mu7IuERgXmjyuZU27sGYRHR2H9XcqnwqdilLLg
	3Zmp//28Sx7r5GX1VBu4iKwi3Qikm/ClreHPRMp0tVefMyMNEdtNWSca7l9wKkEZXEII4nNO68uC4
	g/04ninFNRNcKIEUtZLQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2dJo-0001JD-Gh; Fri, 14 Feb 2020 15:55:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2dFr-0004rN-HK; Fri, 14 Feb 2020 15:51:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A88F524676;
 Fri, 14 Feb 2020 15:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581695506;
 bh=wKF6to/Ae7L+wJeSIQu3UCpCEcTa0xmUwfpSPCOZrZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mvScXVCZZGKbdhDLBBA8Pf1/tP6aX9MO+p+8ZaCwgzXkSUkc96Hr73x+FgaAS4iqc
 p5Qp3Ws/4Bp5FgBfZMjynkEPkUM0ZTkCvcdfilJVqVylr0uTI6L3b7ndalN9MlNgOa
 S29QIkVTgPNXErNpIPm+NWd6v6U4hg0CSbaifSVU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.5 132/542] mt76: mt7615: fix max_nss in
 mt7615_eeprom_parse_hw_cap
Date: Fri, 14 Feb 2020 10:42:04 -0500
Message-Id: <20200214154854.6746-132-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200214154854.6746-1-sashal@kernel.org>
References: <20200214154854.6746-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_075147_612795_7F2726A6 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Kalle Valo <kvalo@codeaurora.org>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

[ Upstream commit d08f3010f4a32eec3c8aa771f03a1b342a1472fa ]

Fix u8 cast reading max_nss from MT_TOP_STRAP_STA register in
mt7615_eeprom_parse_hw_cap routine

Fixes: acf5457fd99db ("mt76: mt7615: read {tx,rx} mask from eeprom")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
index eccad4987ac83..17e277bf39e0f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/eeprom.c
@@ -92,8 +92,9 @@ static int mt7615_check_eeprom(struct mt76_dev *dev)
 
 static void mt7615_eeprom_parse_hw_cap(struct mt7615_dev *dev)
 {
-	u8 val, *eeprom = dev->mt76.eeprom.data;
+	u8 *eeprom = dev->mt76.eeprom.data;
 	u8 tx_mask, rx_mask, max_nss;
+	u32 val;
 
 	val = FIELD_GET(MT_EE_NIC_WIFI_CONF_BAND_SEL,
 			eeprom[MT_EE_WIFI_CONF]);
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
