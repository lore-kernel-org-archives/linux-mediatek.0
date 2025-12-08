Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA83D3B7F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Dec 2025 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7JXAaO2yrn7qeKYGN4H79yr+8ih1bG+MhPK7ncJdHWI=; b=baUvi/hsRXZKVMyH86JWf/Kkpd
	VWG8MYo0rtTMZZJ6628yQz2rIk2PNg32KpgxVKVFImt7ijzJuLSiqzP7Zm7zveKc01vVbKjVLGiZC
	OKbKLPMzn5V774evG5a6jUsnI5Ij49GZDWi8//Y8ROwU+ol+ENLL9zS3UVOWNs93vuOTLZ7e3ij26
	q/HLd6RzGxyv+k+Q0qq/oD+wZMGHgs9i4zaQ5CqZ2TuREbW9tN4h72ual+bN8Wc2U/skdSis8TVLv
	UuqWi0UVd5bFwGr12wH67beELb0Dt/F0wuXFYiaKosPbh4UG3Va1+SZE/I0uOtRjJq6MJwfBO0Viq
	y9Bv1/Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9r-0000000DBmH-3mJY;
	Mon, 08 Dec 2025 14:24:11 +0000
Received: from mail-24420.protonmail.ch ([109.224.244.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSc9p-0000000DBi4-028i
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Dec 2025 14:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=monroe.io;
	s=protonmail3; t=1765203845; x=1765463045;
	bh=7JXAaO2yrn7qeKYGN4H79yr+8ih1bG+MhPK7ncJdHWI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=XB344MeRZM5gOQISWT53f1c4JBQ9osAoOW80l11xahnDe/ZwoCd33Iz3qE0WadkIG
	 MqbBbSCnQ4zGGkVWYYe5p6TJ8ojOeVCmOSZHbn00xXzeqxuy7YOnUmP7wEhtpjE9Wy
	 J88NaZKWjYa7wpF8UOCwyN6mPqcFzrlC5SZvgfAKkvBq1EuY6pna9ejxbFYCyOYOsy
	 cNbIJxPf6tM7sZOYAHqjGKAY6v98kfcui3zrkeH5NGqYwt1mLq/9W1IArhxpz4n9IG
	 atbnyITlEmQor4RA5SYsO0b5fNyIPoSK9SAQlTGUcSz8BtrXAnWhsxxO1M++yxbacz
	 9x95l/R51T96w==
Date: Mon, 08 Dec 2025 14:24:00 +0000
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
From: Chad Monroe <chad@monroe.io>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Chad Monroe <chad@monroe.io>
Subject: [PATCH v2] mt76: mt7996: reset device after MCU message timeout
Message-ID: <6e05ed063f3763ad3457633c56b60a728a49a6f0.1765203753.git.chad@monroe.io>
Feedback-ID: 9731019:user:proton
X-Pm-Message-ID: 80c6cf0b9126d58699fd27e33aea10b608107b02
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_062409_198724_68D0F5FC 
X-CRM114-Status: UNSURE (   4.95  )
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

Trigger a full reset after MCU message timeout.

Signed-off-by: Chad Monroe <chad@monroe.io>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 5 +++++
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/=
wireless/mediatek/mt76/mt7996/mac.c
index 2560e2f46e89..2e5f6a2cafe1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -2736,6 +2736,11 @@ void mt7996_reset(struct mt7996_dev *dev)
 =09=09return;
 =09}
=20
+=09if (READ_ONCE(dev->recovery.state) & MT_MCU_CMD_STOP_DMA) {
+=09=09set_bit(MT76_MCU_RESET, &dev->mphy.state);
+=09=09wake_up(&dev->mt76.mcu.wait);
+=09}
+
 =09queue_work(dev->mt76.wq, &dev->reset_work);
 =09wake_up(&dev->reset_wait);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/=
wireless/mediatek/mt76/mt7996/mcu.c
index 14a88ef79b6c..40ebda9a3f12 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -209,6 +209,7 @@ static int
 mt7996_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 =09=09=09  struct sk_buff *skb, int seq)
 {
+=09struct mt7996_dev *dev =3D container_of(mdev, struct mt7996_dev, mt76);
 =09struct mt7996_mcu_rxd *rxd;
 =09struct mt7996_mcu_uni_event *event;
 =09int mcu_cmd =3D FIELD_GET(__MCU_CMD_FIELD_ID, cmd);
@@ -217,6 +218,14 @@ mt7996_mcu_parse_response(struct mt76_dev *mdev, int c=
md,
 =09if (!skb) {
 =09=09dev_err(mdev->dev, "Message %08x (seq %d) timeout\n",
 =09=09=09cmd, seq);
+
+=09=09if (!test_and_set_bit(MT76_MCU_RESET, &dev->mphy.state)) {
+=09=09=09dev->recovery.restart =3D true;
+=09=09=09wake_up(&dev->mt76.mcu.wait);
+=09=09=09queue_work(dev->mt76.wq, &dev->reset_work);
+=09=09=09wake_up(&dev->reset_wait);
+=09=09}
+
 =09=09return -ETIMEDOUT;
 =09}
=20
--=20
2.47.3



