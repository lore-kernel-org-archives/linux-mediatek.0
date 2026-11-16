Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BF5606A880
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2026 17:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uH+ycbU/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=htPpsj1ZCqMRn1NtlL8aj52+oY3mSts/TrS2vw7Er68=; b=uH+ycbU/R1YL5I
	cgT52DVzkUT9++hTsFIIUFdHKKg0rOCMS2z5oFPgywS9asZ/mC5kQGDqNzkAgs5dGuLS0hyF6shFM
	LP0Fm9/Xv1hjoCc43Ap0xqg92emR4hoE9X1OAJz9riX6XHouJrKc2D8dns9wW6ZL65aeE4NWPCFoo
	DZQWaB2F249Ulo9QWgI4R6QIPx1QoWWfJN1pxenUV6YZbcpZ3VP6GVN0qOfAvAOJGUtrShvD/hIky
	WgpyZVp91lwAexvr/UUF0bdMokDL2MJKNhLLBaFHWDRTrdcQ7+XPahVLITH5hMGqjf1N4N4Z77Pbe
	/x7qR/8Gy3OTMJbxVNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0uH-00000003SfC-1iMd;
	Mon, 16 Nov 2026 17:54:17 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0u2-00000003SVN-0z7d;
	Mon, 16 Nov 2026 17:54:04 +0000
Received: from [2a04:4540:1403:e6fc:5f71:2c1e:7d62:945f] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0tq-004GoI-03;
	Mon, 16 Nov 2026 18:53:50 +0100
From: John Crispin <john@phrozen.org>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH v3 1/3] i2c: mt7621: assert and deassert the reset line
Date: Mon, 16 Nov 2026 18:53:41 +0100
Message-Id: <20261116175343.344425-2-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116175343.344425-1-john@phrozen.org>
References: <20261116175343.344425-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_095402_269637_DA63215C 
X-CRM114-Status: GOOD (  14.37  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The driver resets the controller with device_reset(), which needs a
.reset operation in the reset controller. The EN7581 reset controller
implements assert and deassert only, so there every call fails, logs
"I2C reset failed!" and leaves the controller as it is, also after a
transfer timeout.

Get the optional reset line at probe and assert and deassert it. The
MT7621 and MT7628 reset controller does the same in its .reset
operation, with no delay in between, so nothing changes there. A board
without a reset line no longer logs an error, and a reset controller
that is not ready yet defers the probe.

Suggested-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: John Crispin <john@phrozen.org>
---
Changes in v3:
- Add the Reviewed-by of Philipp.

Changes in v2:
- New patch. It replaces "clk: en7523: add a reset operation" from
  the clk series (Philipp).
- Link to the discussion: https://lore.kernel.org/r/0c96f978571c569de6552fc11131e45b55cada1b.camel@pengutronix.de

 drivers/i2c/busses/i2c-mt7621.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 9ea5e3f9a763..7a31cc8b89ce 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -65,6 +65,7 @@ struct mtk_i2c {
 	u32 clk_div;
 	u32 flags;
 	struct clk *clk;
+	struct reset_control *rst;
 };
 
 static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
@@ -85,7 +86,9 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
+	ret = reset_control_assert(i2c->rst);
+	if (!ret)
+		ret = reset_control_deassert(i2c->rst);
 	if (ret)
 		dev_err(i2c->dev, "I2C reset failed!\n");
 
@@ -288,6 +291,11 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 		return PTR_ERR(i2c->clk);
 	}
 
+	i2c->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(i2c->rst))
+		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->rst),
+				     "Failed to get reset\n");
+
 	i2c->dev = &pdev->dev;
 
 	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
-- 
2.34.1


