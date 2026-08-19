Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D32BC5DF81
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 19:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=O/sNYgJI7iTmex3XqzHbkrDBlq9Mkontfk7aIxaop2E=; b=I56VDFY87jo0t501mY6jnZkTSF
	9dDjXiE5QP38KjFCxcd7owcQjQeZUx5Dr1KdC7RG+z2ah3Vll9KiOkLZsVG7cGUw3f9CJ2IOPsD2r
	l5cAPtYpWZFPLvXLIxN10sqGiJ4gzQR38jXlPciX353helbF98cDKH1XoP0yoSizCK2yBCiu2jMVV
	s9pgRjz1ICW0zNrCdS4lCt+ZAU5f7AZWyRRoDScDo7OjfBQ7H/EVIrmyj2CP52A8Qm0SbJjFPwHTn
	UNrjdoFBt57H00Yk72P4rQvg/axrWV2FlfPGolEqSQ/QgRkDSBDX3OdBGr2/Mw2+KYT3YGHBz/fIk
	YTYij+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlyl-0000000ASVH-1kEj;
	Wed, 19 Aug 2026 19:29:39 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwlyj-0000000ASUj-0Co1
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 19:29:38 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c9ef3e1337fso1078811a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 12:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787167776; x=1787772576; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/sNYgJI7iTmex3XqzHbkrDBlq9Mkontfk7aIxaop2E=;
        b=l31LVF9N4CX6sTD2ETXSVOpEjDBZk9RWmxsO4+q7qjZ0QUN/A08PCcwdSVV9Sfh+zf
         UjKUiMGAUKhFbPweizBWcS4OinLNdK16YKAswRDu/2N7qnzHePMGTOzSxqQ+2Lh/XmGc
         z8jooDYGClKq4nNsH5jLwv4oJX+ldXRSUZ1EbJfWGJv8cKvGREKNVPN7lSoavQQTDJlW
         Won6YSFqk0rwLJMkD5OYFKxfNymZkkK8Bhmantos0jLKlr/u+1/HEJ6VClV8kjne9cgK
         kDMZSRjfshCACtqld/7XpvtBxR50wdYQK2l/Lf/leAZe3zvRVgpVmcHJkuAeAGSbXsk0
         OL3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787167776; x=1787772576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/sNYgJI7iTmex3XqzHbkrDBlq9Mkontfk7aIxaop2E=;
        b=aC6lrOKGZgXw4foVo6kt+PCHXPGPzaJtkUKuTlfgJtwDGW56X85zqtORvYZ4BJT+vV
         O7kfHlmmzB8TMWGkwMRYKxTHv16pF/qcQfFmoX/7pL3lPE/mx/s28++rd0eG9DjbWB9H
         ARHqhISZ+vKVBc1insXwTXO2D6EdFlDqQouow/CHLjcz1JNwEl1977Z+gVGjljkpsmNy
         vDc6TxZ3c9UYtMLffnJlC94Q2Vfmarjg9kOolIJ3pT7RTE8Gufd3DTwSJhBrGhonhCZO
         hpWeNnK80Bg+/bJQISC7RyCbtP0xAvfjKT+Fu6QzH79BdAJd0wJYsn0afTpMPtCbtxJe
         roiw==
X-Forwarded-Encrypted: i=1; AHgh+Rq00kl8RPQlvN3gn0lykXbkuJzhx12PsACOMeThtIHyv8gH284HNgHcxNjE2Cv+QQ0HTd083Rz0xIYtZq2MLw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxxnge+rrjr4zFfJjdU7V/Dab9S3YE1BBPsttf0WcM7SjgAUE5p
	fi9w3i9NVuNqoPHj1giQqhRcc/owMSO9wKftorv95+iqcQXQBzWsWNVZ
X-Gm-Gg: AR+sD101CfjFEYK16tuUeIDindgyZSdhE77Ym+oYYy3yHABFbX0FT4HoPN5BNYXPi73
	Dt3n/SRsxZ+5QIQl6lURseJ1Mltt9sdjSThHWRWy3BAzScGzRWbd40mu+G6vaibTgRwBq2CZImT
	VHY3swxWVZib0Lfr1FFSCuKjYXvsO6nHqOsV6q2Ssp5q4DAF8XEYM4ibo1bYztAjsSgVbiKHP5i
	o9aySkL37J78ZDuG5VhUNL3Qfd4mtjSPctkXpPPjQOeuJjuQoz7XdTRlcKEUgDS1CTSIkwWUAFw
	CR9Tqw2tL4okELX2IpSVo+Rn7Lxry5ZT+chU5LEFIu8hIybjYl37ORWhPzxNi2BMk4KLF4yMb1m
	lw4dQnFkW3j3PkvrEsRNy/o+lIi7EsHajTUfCi9vat5033wOu2hXqt3b1WdJwpvSWVUM8dZttU4
	dnFTea8Mz4a3onFWL564a+tpKpITAynLEAd8GRyOk4HmI2R5CJqzna8BIIdCO2XOy3FUZVEg==
X-Received: by 2002:a05:6a20:d707:b0:3c1:fbf:1e2e with SMTP id adf61e73a8af0-3cd011d6123mr15174456637.10.1787167775719;
        Wed, 19 Aug 2026 12:29:35 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.196.141])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef77be3sm9088789eec.10.2026.08.19.12.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 12:29:35 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	naseefkm@gmail.com
Subject: [PATCH wireless-next] wifi: mt76: mt7615: read MT7663 temperature from the correct offset
Date: Wed, 19 Aug 2026 23:29:11 +0400
Message-Id: <20260819192911.1886457-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_122937_091267_B7D107C2 
X-CRM114-Status: GOOD (  10.66  )
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

On MT7663 the hwmon temp1_input attribute always reads 0.

mt7615_mcu_parse_response() takes the temperature from the first dword of
the THERMAL_CTRL response payload, but MT7663 firmware reports it in the
second one. On a DASAN H660GM-A (MT7663E, N9 firmware 7663mp1827) the
request and its response are:

  request:  00 00 00 00
  response: 00 00 00 00 2a 00 00 00

0x2a is the reading, 42 degrees, while the driver returns the leading
zero. mt7915 and mt7921 already pull sizeof(*rxd) + 4 for this command.

Restrict the extra pull to MT7663, as no MT7615 or MT7622 hardware was
available to check whether their firmware uses the same layout.

Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index ff57ede87f71..1ce0192c2c91 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -153,6 +153,8 @@ int mt7615_mcu_parse_response(struct mt76_dev *mdev, int cmd,
 		ret = *skb->data;
 	} else if (cmd == MCU_EXT_CMD(THERMAL_CTRL)) {
 		skb_pull(skb, sizeof(*rxd));
+		if (is_mt7663(mdev))
+			skb_pull(skb, 4);
 		ret = le32_to_cpu(*(__le32 *)skb->data);
 	} else if (cmd == MCU_EXT_QUERY(RF_REG_ACCESS)) {
 		skb_pull(skb, sizeof(*rxd));
-- 
2.34.1


