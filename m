Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A57C5AC67
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Aug 2026 23:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JM0R8IKUQr7cM/ajSLHBnZKnVzOicpi+oUAzf1nTyJc=; b=JSi7maW1AyEqbqe1gu6JdJWBau
	yrYrgwXx3MRLHoIPxjbJHlsruIvnbhqyHj9RrO6rKE0lcWSsoEv3NFIBvRzjhawTsCOF3/xsy9GYV
	9Ze04Ru3hUUehVcPfCdWueQXt4GKgQi3xCyPFfQLwBXumuvlbhE+uSCvi+klLf99Yk1IS2huhPth/
	PWuYj7vft6AF1yIFQ3YuZYd2STPTSUzYcztrVuKglmiHDeJ2IqymVp5xef71M8GRsLHPgbt0HkN94
	0nRuoZECnBI3wyT0QvUyFAEdNWHpRxfQc3TUIVyJmvbYPkPo+sExc9uOPaxFq6Rmn0HGeTvfB0c22
	NEPoir4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvtw-0000000F5Uo-0VlW;
	Tue, 11 Aug 2026 23:28:56 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtvtt-0000000F5UM-3Qna
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Aug 2026 23:28:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=justthetip.ca;
	s=key1; t=1786490928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JM0R8IKUQr7cM/ajSLHBnZKnVzOicpi+oUAzf1nTyJc=;
	b=W0MjgnFZUXzZP3CEO3KFjhHA/Wp+RSY/Kcyu/yl7ebYzfLitpzU1Lwv6QA9C7+9ljIiVad
	pi5tcHomcLRSDFfzzFv5lQ1FrXhGOQ3p39eSwHxjDevHy+cPH7jbEn4SOGn7Lo67tAJUhS
	QWrKjLBThbNHwfEgcnzH3YBWDM0zH1QZe+wMbZfFdsJ3TPypkQwZFZfQ27bxzRQk1MdvYY
	1xcAAaz0I4Q51t/U8BbZFYAKuwPjnXknrmanLfkXlLqn3925wpf06OKtWeNotuLjIj834l
	yrafL6aLBoN2aNCsS8UaCmMH4+hOG1pvoQpEQPchiRSbDXt7E7Q+opzEjg9pKg==
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Sagun Kayastha <sgn.kayastha@gmail.com>
Subject: [PATCH wireless] wifi: mt76: mt792x: validate ACPI SAR table length before parsing
Date: Tue, 11 Aug 2026 16:28:39 -0700
Message-ID: <20260811232839.515463-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_162854_277591_49A96204 
X-CRM114-Status: GOOD (  12.37  )
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

Both SAR readers derive the entry count from the ACPI buffer length.
Nothing checks that the length is at least the header size, that it
divides evenly into whole entries, or that the count the table declares
in nr_tbl matches.  A malformed table whose length happens to land the
count inside the accepted range is parsed with the wrong layout and its
limits are applied to the radio.

mt792x_acpi_read() allocates exactly package.count bytes and only rejects
counts below 4, so a four byte table is possible.  The MTDS path already
reads ->enable at offset 4 before any length check, past the end of such
a buffer.

Take the length checks first, then read the header fields, then compare
the derived count against nr_tbl.

Seen on an ASUS ROG Zephyrus G15 GA503RM whose MTGS and MTDS are both
malformed.  The parser accepted them and applied a limit that clamped
every txpower_sku entry to tmac 4, about 2 dBm.  With them rejected,
txpower goes from 3.00 dBm to 23.00 dBm and txpower_sku spreads back
across OFDM/HT20/HT40/VHT80/VHT160.

Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")
Link: https://github.com/morrownr/mt76/issues/62
Reported-by: Sagun Kayastha <sgn.kayastha@gmail.com>
Tested-by: Sagun Kayastha <sgn.kayastha@gmail.com>
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
 .../wireless/mediatek/mt76/mt792x_acpi_sar.c  | 28 ++++++++++++++++---
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 946dd79..7e72c38 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -114,6 +114,7 @@ mt792x_asar_acpi_read_mtds(struct mt792x_dev *dev, u8 **table, u8 version)
 {
 	int len, ret, sarlen, prelen, tblcnt;
 	bool enable;
+	u8 nr_tbl;
 
 	ret = mt792x_acpi_read(dev, MT792x_ACPI_MTDS, table, &len);
 	if (ret)
@@ -122,12 +123,10 @@ mt792x_asar_acpi_read_mtds(struct mt792x_dev *dev, u8 **table, u8 version)
 	/* Table content validation */
 	switch (version) {
 	case 1:
-		enable = ((struct mt792x_asar_dyn *)*table)->enable;
 		sarlen = sizeof(struct mt792x_asar_dyn_limit);
 		prelen = sizeof(struct mt792x_asar_dyn);
 		break;
 	case 2:
-		enable = ((struct mt792x_asar_dyn_v2 *)*table)->enable;
 		sarlen = sizeof(struct mt792x_asar_dyn_limit_v2);
 		prelen = sizeof(struct mt792x_asar_dyn_v2);
 		break;
@@ -135,8 +134,19 @@ mt792x_asar_acpi_read_mtds(struct mt792x_dev *dev, u8 **table, u8 version)
 		return -EINVAL;
 	}
 
+	if (len < prelen || (len - prelen) % sarlen)
+		return -EINVAL;
+
+	if (version == 1) {
+		enable = ((struct mt792x_asar_dyn *)*table)->enable;
+		nr_tbl = ((struct mt792x_asar_dyn *)*table)->nr_tbl;
+	} else {
+		enable = ((struct mt792x_asar_dyn_v2 *)*table)->enable;
+		nr_tbl = ((struct mt792x_asar_dyn_v2 *)*table)->nr_tbl;
+	}
+
 	tblcnt = (len - prelen) / sarlen;
-	if (!enable ||
+	if (!enable || tblcnt != nr_tbl ||
 	    tblcnt > MT792x_ASAR_MAX_DYN || tblcnt < MT792x_ASAR_MIN_DYN)
 		return -EINVAL;
 
@@ -148,6 +158,7 @@ static int
 mt792x_asar_acpi_read_mtgs(struct mt792x_dev *dev, u8 **table, u8 version)
 {
 	int len, ret, sarlen, prelen, tblcnt;
+	u8 nr_tbl;
 
 	ret = mt792x_acpi_read(dev, MT792x_ACPI_MTGS, table, &len);
 	if (ret)
@@ -167,8 +178,17 @@ mt792x_asar_acpi_read_mtgs(struct mt792x_dev *dev, u8 **table, u8 version)
 		return -EINVAL;
 	}
 
+	if (len < prelen || (len - prelen) % sarlen)
+		return -EINVAL;
+
+	if (version == 1)
+		nr_tbl = ((struct mt792x_asar_geo *)*table)->nr_tbl;
+	else
+		nr_tbl = ((struct mt792x_asar_geo_v2 *)*table)->nr_tbl;
+
 	tblcnt = (len - prelen) / sarlen;
-	if (tblcnt > MT792x_ASAR_MAX_GEO || tblcnt < MT792x_ASAR_MIN_GEO)
+	if (tblcnt != nr_tbl ||
+	    tblcnt > MT792x_ASAR_MAX_GEO || tblcnt < MT792x_ASAR_MIN_GEO)
 		return -EINVAL;
 
 	return 0;
-- 
2.55.0


