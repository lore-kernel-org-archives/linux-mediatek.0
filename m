Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A55F0C88E53
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 03:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YKUD7Q8leVgtHxcVUmnMCsrruSvvfMchXK3EUk9cdSs=; b=d9E9+q5126xQFX1FLbbW87f5r1
	o+Domrp9NCFrV3SVSWhCnahOP6NIkw4yKbrnQdnV+n66aFe+0FbuBN9e2MJ0EsIwt3RG7mxPScHG+
	2MtkAtd4WtgtHoY1pHp/ELpT8DA8VALGWMNOcU4v/BG7kWsU0hFFV1DhstPnB6zCde7FPbEwKsvwj
	Jr8i2uUYH6aKFabnIkIOB+GmrSsTpV5UwGEmou9jDOHhFFZMvu8ugybbHlwc+0R/pFXn6kIvvcjwc
	zg2gsVV2dvjsokHalYUtkBEAYa/ZPNvbk5pvJfQwSYNpsMKKDk6m8sxFBvCnD2iuT1YkQ8rkgtGRf
	UVi1SojQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KDZ-000000059mG-0Tsv;
	Tue, 15 Sep 2026 03:52:25 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6KDU-000000059lL-2aAC;
	Tue, 15 Sep 2026 03:52:23 +0000
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowAB3TvLuwKhqos0HCA--.49242S2;
	Tue, 15 Sep 2026 11:52:14 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: angelogioacchino.delregno@collabora.com
Cc: chih-yin.chiang@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marcel@holtmann.org,
	mark-yw.chen@mediatek.com,
	matthias.bgg@gmail.com,
	sean.wang@mediatek.com,
	lkml@vger.kernel.org,
	Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH 1/4] Bluetooth: btmtksdio: Fix runtime PM leak in btmtksdio_reset()
Date: Tue, 15 Sep 2026 03:51:45 +0000
Message-Id: <20260915035145.1724096-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowAB3TvLuwKhqos0HCA--.49242S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1DZF43Zw48Zw4rWr4fGrg_yoW8Jw4xp3
	97uF1Ykr13Ar4ayFsrtF1rXFWj93y3tryjkFyUK34rur45Xr42yF1UKryjq3ZFkrWkArW3
	tF1IqrsxWFyjkaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfU78u4UUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRILA2qoiqL8UAAAsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_205221_025479_825736F4 
X-CRM114-Status: GOOD (  10.18  )
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

btmtksdio_reset() takes a runtime PM reference with
pm_runtime_get_sync(bdev->dev), which leaves the device's usage
count incremented even when it fails.  However, when the reset has
already been started (BTMTKSDIO_HW_RESET_ACTIVE is found set by
test_and_set_bit()), the function returns early without dropping
that reference, leaking it on every concurrent reset request.

Add a pm_runtime_put_noidle() on the early-exit path to keep the
usage count balanced.

Fixes: 8fafe702253d ("Bluetooth: mt7921s: support bluetooth reset mechanism")
Cc: stable@vger.kernel.org
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/bluetooth/btmtksdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index 5b0fab7b89b5..243215a81fa7 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -1280,8 +1280,10 @@ static void btmtksdio_reset(struct hci_dev *hdev)
 
 	pm_runtime_get_sync(bdev->dev);
 
-	if (test_and_set_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state))
+	if (test_and_set_bit(BTMTKSDIO_HW_RESET_ACTIVE, &bdev->tx_state)) {
+		pm_runtime_put_noidle(bdev->dev);
 		return;
+	}
 
 	sdio_claim_host(bdev->func);
 
-- 
2.34.1


