Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3885CC54E58
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 00:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NSf3780jcQvryheQKbVaP1K5KnZB7/pr0Qc8v0iBK8=; b=n0QCQgPIe5LbeBX+R4mJVDKZK3
	wl7qjmxtbTPQ2PUa8xLRPQ5u8ttIv/zph+a0aNVdETi1LMakwrKb8oJpOGTPjspNjVMZeWTqprlp9
	vJQv4CWj3sSG9f4NHnd2tVc3OQchd9EXtad0jowNn9eRn52ip+nSVT182iQgtRBlfeV10GLtyt3OT
	bgJiKjNULvZP8S86sgK0KsEpCtNWASjDUXwjff9WUOt2IoIwD40TbjMkBh9lTCD8lUOv78ZME/Nx1
	ncZap8u8TvYGEiT6qfhd1rAmUYjZOefGDLy9HqMMS+nIcjZorxIXEyNUv+aiUmfZ3udDfzPGX1P7+
	Iwt0h9pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlIOG-0000000209m-0QRj;
	Sat, 16 Mar 2024 00:59:12 +0000
Received: from outgoing6.flk.host-h.net ([188.40.0.77])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlIOA-0000000208P-0BCL;
	Sat, 16 Mar 2024 00:59:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc:in-reply-to:references
	:content-type; bh=4NSf3780jcQvryheQKbVaP1K5KnZB7/pr0Qc8v0iBK8=; b=vV3y3KZpIDp
	1gURf+ybmNXDffUPEcuVccXEqy71Sktq5UX65gx/yetHPqq44Bur72h2ab26tfcdfaj/hKeNxGMhG
	KzfjFRoS9QjA3ICjcGF7ocmNSP1FhKe0uiu39RL1GxgL+NwYa77fGFCYlghkytKA1yIFFnXvr1LTU
	HkfzCfATtQPpRa7EWSBpVSpX5tPogkXoa9LDk6lh7U4ceYHxfuy8KmMfTR9YGL7TZGw9B+cK37Gcu
	0PgH+pQY/JCqI+vYppNFzekqEloj0505RxH54JGoRTqVo2+atb9Wk8935sIBSN6rRRFS3QuXWodW9
	TvkT9q3s1T13CeUbdM543Ig==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam2-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rlIO0-00DUq8-CM; Sat, 16 Mar 2024 02:58:59 +0200
Received: from [41.144.0.193] (helo=localhost.localdomain)
	by www31.flk1.host-h.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rlINy-0008DX-5q; Sat, 16 Mar 2024 02:58:54 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Swartz <justin.swartz@risingedge.co.za>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] spi: mt7621: allow GPIO chip select lines
Date: Sat, 16 Mar 2024 02:59:15 +0200
Message-Id: <20240316005917.20526-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00503044966356)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8sM9tNQBDeE3N2l1CjpmaIPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIss2oH4Yjh6Q4paNNh70vrmKlRYN8+ZW0XX0AH/7tz8lOUWMR
 3Oz/N19DDfqg//ykQCB4rUl3suKct8rEwEjtlBjGf82vsPPH4Z6bBeyJ2ioKLll7c1zqbZ0Shnfk
 f76m6WzjgyOQ30CX3jGye0AgO43dPg2t4siixN3H6ipUQpvJyU9EF7gOc/LMwk9dvTa+WmuNA8WT
 ybi1JN85FSnfKaZl5e9CnNR0t//S8nh6vX9JR7tTkgtGxbJXMnaWeORi/IOL8hFK8UwSRsjj826v
 xIvoo9siXVea4yN8+JzC4p2qtoJeAaAIM5zNlwLSz7WsotxMDYRAzuCR0I/uZN17IfdXFZsEUcDk
 8TfE1VxuxGc2M4JzCc//R6Wyn0xEa4/gbKRUuwP9TxU53J++//mag2wVXO50BuTihrUiUr+Ne0YD
 3ddZG295JphtZpms9X0aBNANCxNWMmHXUTEMGGbKThOghFKJuzFdJ78lk25pCKnYrhUnk1aI/tYo
 PYfrgLItviC2z3vIzjh1mXBwO7cA3KxDuzsITj9XSEsqBTpMNClkAdhK23InA2zzja5I1riDVsRE
 /qfh3BpRIL035Lwa3AR5iWi4B3c2TvD1mYFCey4YQsgkfE0ewNgNUY5lZOQ5d86hkdfWpdNtlHKD
 /N5YI0ii+HGJbtyrZfX5fEH4LjZJ4azDVvtI4xLpBrhpV1Z2g0cC96lvLg9F6alXVA5GCKQ8jPBS
 b1sSQu/sXnVb6BTD1y1EN4lWLphXo/QFY19KiazSUJJrHpiQXIumX+z7RP3Fs7AeUg8cSzkuHTCW
 7WeivJsOGdLHT5AmY9PDPjGy0z6bhalFEM/pjPCQA+BAlnIZxFSV0ux1niV+gnzf0coKruD/dlzX
 C6+t6EZu9kdJCbEH65DSZ+j3bGAiXooYBVbntXLVlUvPrcBZhPHsfcZm4zuNRcgRKiGg7nXFaZTx
 I/6scxhAq/6af00PEtBNjYtqmoKr5eemJzKNdiP7m3gSrWCqyhAo0JR3rThOyxKFbWMT2xK3KT9R
 mx5HiKCYjt40eTXlWiUAYdLmsJdAoPIA+QBBCmRnfEQkXp5mAyXTIBVUuAX2KYddQlACXnsZ2u9C
 nazM3+ZE40UYhpZLE/UxL7hrJSk60SF3F6RYOYr2
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_175906_955733_0A5CF497 
X-CRM114-Status: GOOD (  24.03  )
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

Extract a magic number, from mt7621_spi_probe(), used to
declare the number of chip select lines (which co-incides
with the native chip select count of 2) to a macro.

Use the newly defined MT7621_NATIVE_CS_COUNT macro to
instead populate both the spi_controller's max_native_cs
and num_chipselect members.

Declare that the spi_controller should use_gpio_descriptors
if present in the device properties (such as those declared
in the cs-gpio property of a "ralink,mt7621-spi" compatible
device-tree node) so that the SPI core will recalculcate
num_chipselect to account for the GPIO descriptors that
it should have populated in the cs_gpiod array member.

Remove the assignment of mt7621_spi_transfer_one_message()
to the spi_controller's transfer_one_message hook.

Refactor the mt7621_spi_transfer_one_message() logic into
mt7621_spi_prepare_message() and mt7621_spi_transfer_one()
and assign both to the spi_controller's prepare_message
and transfer_one hooks respectively.

Migrate the call mt7621_spi_transfer_one_message() made to
mt7621_spi_flush() just before chip select deactivation,
to the end of mt7621_spi_write_half_duplex() to ensure
that any pending data is shifted out of MOSI before the SPI
core deactivates the chip select line.

As chip select activation is now taken care of by the SPI
core, due to the use of the transfer_one hook instead of
transfer_one_message, the calls to mt7621_spi_set_cs()
from mt7621_spi_transfer_one_message() have fallen away.

And although the SPI core will handle activation for GPIO
chip select lines behind the scenes, it requires a callback
to allow the driver to perform controller-specific
operations to control its native chip select lines.

Rename mt7621_spi_set_cs() to mt7621_spi_set_native_cs()
and make sure that it takes into account the activation
polarity of the chip select line it's acting upon, as the
passed enable parameter represents the desired line level
and not the desired activation state, and then assign
mt7621_set_cs() to the spi_controller's set_cs hook.

Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
---

Changes from v1 to v2:

  Mark Brown recommended using the transfer_one hook
  approach, so I did.


 drivers/spi/spi-mt7621.c | 95 +++++++++++++++++++---------------------
 1 file changed, 45 insertions(+), 50 deletions(-)

diff --git a/drivers/spi/spi-mt7621.c b/drivers/spi/spi-mt7621.c
index 4e9053d03..3770b8e09 100644
--- a/drivers/spi/spi-mt7621.c
+++ b/drivers/spi/spi-mt7621.c
@@ -52,6 +52,8 @@
 #define MT7621_CPOL		BIT(4)
 #define MT7621_LSB_FIRST	BIT(3)
 
+#define MT7621_NATIVE_CS_COUNT	2
+
 struct mt7621_spi {
 	struct spi_controller	*host;
 	void __iomem		*base;
@@ -75,10 +77,11 @@ static inline void mt7621_spi_write(struct mt7621_spi *rs, u32 reg, u32 val)
 	iowrite32(val, rs->base + reg);
 }
 
-static void mt7621_spi_set_cs(struct spi_device *spi, int enable)
+static void mt7621_spi_set_native_cs(struct spi_device *spi, bool enable)
 {
 	struct mt7621_spi *rs = spidev_to_mt7621_spi(spi);
 	int cs = spi_get_chipselect(spi, 0);
+	bool active = spi->mode & SPI_CS_HIGH ? enable : !enable;
 	u32 polar = 0;
 	u32 host;
 
@@ -94,7 +97,7 @@ static void mt7621_spi_set_cs(struct spi_device *spi, int enable)
 
 	rs->pending_write = 0;
 
-	if (enable)
+	if (active)
 		polar = BIT(cs);
 	mt7621_spi_write(rs, MT7621_SPI_POLAR, polar);
 }
@@ -154,6 +157,23 @@ static inline int mt7621_spi_wait_till_ready(struct mt7621_spi *rs)
 	return -ETIMEDOUT;
 }
 
+static int mt7621_spi_prepare_message(struct spi_controller *host,
+				      struct spi_message *m)
+{
+	struct mt7621_spi *rs = spi_controller_get_devdata(host);
+	struct spi_device *spi = m->spi;
+	unsigned int speed = spi->max_speed_hz;
+	struct spi_transfer *t = NULL;
+
+	mt7621_spi_wait_till_ready(rs);
+
+	list_for_each_entry(t, &m->transfers, transfer_list)
+		if (t->speed_hz < speed)
+			speed = t->speed_hz;
+
+	return mt7621_spi_prepare(spi, speed);
+}
+
 static void mt7621_spi_read_half_duplex(struct mt7621_spi *rs,
 					int rx_len, u8 *buf)
 {
@@ -243,59 +263,30 @@ static void mt7621_spi_write_half_duplex(struct mt7621_spi *rs,
 	}
 
 	rs->pending_write = len;
+	mt7621_spi_flush(rs);
 }
 
-static int mt7621_spi_transfer_one_message(struct spi_controller *host,
-					   struct spi_message *m)
+static int mt7621_spi_transfer_one(struct spi_controller *host,
+				   struct spi_device *spi,
+				   struct spi_transfer *t)
 {
 	struct mt7621_spi *rs = spi_controller_get_devdata(host);
-	struct spi_device *spi = m->spi;
-	unsigned int speed = spi->max_speed_hz;
-	struct spi_transfer *t = NULL;
-	int status = 0;
-
-	mt7621_spi_wait_till_ready(rs);
 
-	list_for_each_entry(t, &m->transfers, transfer_list)
-		if (t->speed_hz < speed)
-			speed = t->speed_hz;
-
-	if (mt7621_spi_prepare(spi, speed)) {
-		status = -EIO;
-		goto msg_done;
-	}
-
-	/* Assert CS */
-	mt7621_spi_set_cs(spi, 1);
-
-	m->actual_length = 0;
-	list_for_each_entry(t, &m->transfers, transfer_list) {
-		if ((t->rx_buf) && (t->tx_buf)) {
-			/*
-			 * This controller will shift some extra data out
-			 * of spi_opcode if (mosi_bit_cnt > 0) &&
-			 * (cmd_bit_cnt == 0). So the claimed full-duplex
-			 * support is broken since we have no way to read
-			 * the MISO value during that bit.
-			 */
-			status = -EIO;
-			goto msg_done;
-		} else if (t->rx_buf) {
-			mt7621_spi_read_half_duplex(rs, t->len, t->rx_buf);
-		} else if (t->tx_buf) {
-			mt7621_spi_write_half_duplex(rs, t->len, t->tx_buf);
-		}
-		m->actual_length += t->len;
+	if ((t->rx_buf) && (t->tx_buf)) {
+		/*
+		 * This controller will shift some extra data out
+		 * of spi_opcode if (mosi_bit_cnt > 0) &&
+		 * (cmd_bit_cnt == 0). So the claimed full-duplex
+		 * support is broken since we have no way to read
+		 * the MISO value during that bit.
+		 */
+		return -EIO;
+	} else if (t->rx_buf) {
+		mt7621_spi_read_half_duplex(rs, t->len, t->rx_buf);
+	} else if (t->tx_buf) {
+		mt7621_spi_write_half_duplex(rs, t->len, t->tx_buf);
 	}
 
-	/* Flush data and deassert CS */
-	mt7621_spi_flush(rs);
-	mt7621_spi_set_cs(spi, 0);
-
-msg_done:
-	m->status = status;
-	spi_finalize_current_message(host);
-
 	return 0;
 }
 
@@ -353,10 +344,14 @@ static int mt7621_spi_probe(struct platform_device *pdev)
 	host->mode_bits = SPI_LSB_FIRST;
 	host->flags = SPI_CONTROLLER_HALF_DUPLEX;
 	host->setup = mt7621_spi_setup;
-	host->transfer_one_message = mt7621_spi_transfer_one_message;
+	host->prepare_message = mt7621_spi_prepare_message;
+	host->set_cs = mt7621_spi_set_native_cs;
+	host->transfer_one = mt7621_spi_transfer_one;
 	host->bits_per_word_mask = SPI_BPW_MASK(8);
 	host->dev.of_node = pdev->dev.of_node;
-	host->num_chipselect = 2;
+	host->max_native_cs = MT7621_NATIVE_CS_COUNT;
+	host->num_chipselect = MT7621_NATIVE_CS_COUNT;
+	host->use_gpio_descriptors = true;
 
 	dev_set_drvdata(&pdev->dev, host);
 
-- 


