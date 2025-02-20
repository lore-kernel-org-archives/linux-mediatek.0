Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28177C021B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Feb 2025 15:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ewNBcxlBPeKEAVRlE4+JYHKqmJRY8BNPDlD5uFq3lMo=; b=gS8GR5vHZmrosYNXRd9y1zn4lW
	LTFcJmHu3lhkf0DvVLqRWTYWP5uaOpX7OE04Uw3n8gOW7h3oEp2yntf20KyuVkJeAamDfTwU/8WFw
	AiduvX+0/OL89xSEXGW/lY2IIBN4J1TqVeFrfHwPOfPAO2XQ0MUSNTMXZdtF+KWF4e8o7pWXPTl51
	HsdCq8T3KZerhjpmWcXKw/dyGuzTDkDdTjrNRjGrir1eX7iG5BWT6swuESYGZLX6ID6azU2ec3XsY
	0g9nmtpktnAnt2mt0sprQWhoSWjiIH8i7QekJlxHt+Xwt+0+nxgxOrKgdnaGm7Kog2oaQrh4QMm/x
	kkXHBKRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl85z-00000001T3j-4Bm6;
	Thu, 20 Feb 2025 15:04:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl84U-00000001Sch-1O89;
	Thu, 20 Feb 2025 15:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740063756;
	bh=rck6B72os/DWioFHMOmH67JN8LqxpYdTERiLlS+nlTw=;
	h=From:Date:Subject:To:Cc:From;
	b=DwHMrhftva+2vJ3zQamsc79qDX+CINE6HLPpu75s0Z8Zr7NRsl26Qw7l35PPVaxBG
	 1yKXd+e5cHoKyNtKoRK0wLG+FAUqto69/oYX3nAtxKTm9lwg6/Mvl6qDjBsnOF/i4+
	 KAsNZEKYuxQuom0f1ixxiQBCnOzbxmVKJtFJ8En+v14m9KcePBgdvU5r3HAWxHOwtj
	 /mbSZo1XMf31/MpidFckD/z5LJSlTvZkrarx5PhqU3iPMitZaovj6V73unDHhTNkTz
	 X/EwrWwv+Y8o4L+HPhPAH4QqtNRasaKRnirN9HJD/BRYwijzoI/mi36nu7WZMnq3I2
	 IuObWD5cgelbw==
Received: from yukiji.home (lfbn-tou-1-1147-231.w90-76.abo.wanadoo.fr [90.76.208.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AE1D617E1557;
	Thu, 20 Feb 2025 16:02:35 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 20 Feb 2025 16:02:09 +0100
Subject: [PATCH] soc: mediatek: mtk-socinfo: Add extra entry for
 MT8395AV/ZA Genio 1200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250220-mtk-socinfo-genio-1200-evk-v1-1-a683ad028bc5@collabora.com>
X-B4-Tracking: v=1; b=H4sIAPBDt2cC/zWNQQqDMBAAvxL23IVkobX4leJBk9UukqRNogji3
 xsqHmcOMztkTsIZWrVD4lWyxFDB3BTYdx8mRnGVgTTdNZFGX2bM0UoYI04cJKIhrZHXGRtDw8M
 9yVljoAY+iUfZ/vFXd3Li71If5ZQw9JnRRu+ltCrwVvD6QHccPx8glG2dAAAA
X-Change-ID: 20250220-mtk-socinfo-genio-1200-evk-712b6d82dc11
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740063755; l=1266;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rck6B72os/DWioFHMOmH67JN8LqxpYdTERiLlS+nlTw=;
 b=utlvnCOJj4zzso5Z1dtj4zu9mvNrVqF9Y9tC6p7GZPke22xBquuAUlGIEX64Egw4QHjvotDls
 QV9FKciTZt+BrkX9eRTaSRNb9HAbgk9j8XmwsYUtVtvbyPFpkEaen42
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_070238_523381_79F8F081 
X-CRM114-Status: UNSURE (   8.66  )
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

The Mediatek Genio 1200 EVK P1V2 board has a different socinfo match
for MT8395 SoC (commercial name Genio 1200), so add it the driver.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/soc/mediatek/mtk-socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-socinfo.c b/drivers/soc/mediatek/mtk-socinfo.c
index a15d8f854cefa90883377b47bbc16a7072ee21cd..fbaf82a6e14c31d447f7725c82b306ff055e1c7d 100644
--- a/drivers/soc/mediatek/mtk-socinfo.c
+++ b/drivers/soc/mediatek/mtk-socinfo.c
@@ -59,6 +59,7 @@ static struct socinfo_data socinfo_data_table[] = {
 	MTK_SOCINFO_ENTRY("MT8370", "MT8370AV/AZA", "Genio 510", 0x83700000, 0x00000081),
 	MTK_SOCINFO_ENTRY("MT8390", "MT8390AV/AZA", "Genio 700", 0x83900000, 0x00000080),
 	MTK_SOCINFO_ENTRY("MT8395", "MT8395AV/ZA", "Genio 1200", 0x83950100, CELL_NOT_USED),
+	MTK_SOCINFO_ENTRY("MT8395", "MT8395AV/ZA", "Genio 1200", 0x83950800, CELL_NOT_USED),
 };
 
 static int mtk_socinfo_create_socinfo_node(struct mtk_socinfo *mtk_socinfop)

---
base-commit: 964b0ceed00032fa0fa841fd61e5f315880a2d36
change-id: 20250220-mtk-socinfo-genio-1200-evk-712b6d82dc11

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


