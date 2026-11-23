Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E516E606A32C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 20:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XDf+qWh3;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hTYRYfo2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=2XPrAVxeEBOl/91jeQU5k7j8fuWUtX0/F5/UrgSfTUQ=; b=XDf+qWh34x+26X
	0BsMwYOmyLxS6E9CNRTKQkh2b6wZeqyVQBIId39Clx1keS1pquD17teaMbVmaClGalmZA8/QRPyHa
	zNpM2lsgXtJaFkb3bZhqj5/3RzgHrkyvl7bUZcqRCVvNtFED4UrXQY54YNdwtDP6RPJ6BiPe6CMZ1
	2aMedwMQMqC09SwyqqPaQO8fs8Cm0WWvpHaYkS4z95DI1chrU/gej/D/lo2zXZY+bCs6CeAGVKIHs
	Eig8AVzHZ/wtIIN7UsShWOth3QMg6DwGdRyu2S8XFHQJy+qzsLv9TnVmGozoqfdEtFlN+lCZU3Dwh
	S3q3rQVXzBkHi7XR1ITg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaDS-00000004mGV-2Wsp;
	Mon, 23 Nov 2026 20:00:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVaDR-00000004mFA-0Ghv;
	Mon, 23 Nov 2026 20:00:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 838FD62314;
	Mon, 23 Nov 2026 20:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 658591F000C0;
	Mon, 23 Nov 2026 20:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795464040;
	bh=2XPrAVxeEBOl/91jeQU5k7j8fuWUtX0/F5/UrgSfTUQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hTYRYfo2s+ByadcdVqp89uBh0lCXz0eBLSeSrCSF1ZVmkASs7w6m5Q26vD2aeqi5/
	 qI9Z2HsdhqYKBU9KV5P0TWFUdR5hnBEpzbsbHPm93QEssAbVsljnoboHXxTGJJEBCN
	 hrXf0ErfvA315/YeANd6Y+CRBA2xVxF4wy8WAsBE9nUWJYK2tZKR5bJbMPAh6zs/I2
	 i6JnClLwWrfegfB52TqFH3wDPYH4KJE7XF83gED+C3w2/F8yvucGAH2z1uWbKrBD2O
	 FznccK18Ksua6d1K1rRkmL1R9gh4zHUplB4pkag5FgunplTuiQHPYScyZzAQXFG26i
	 xdlPoo3TIoXqA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryan Brue <ryanbrue.dev@gmail.com>,
	"Tianping.Fang" <tianping.fang@mediatek.com>,
	Yingjoe Chen <yingjoe.chen@mediatek.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	Sebastian Reichel <sre@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 02/10] rtc: mt6397: handle non-DT platform device matching in probe
Date: Mon, 23 Nov 2026 19:59:13 +0000
Message-ID: <20261123200012.502284-3-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123200012.502284-1-lee@kernel.org>
References: <20261123200012.502284-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The parent MediaTek PMIC MFD driver instantiates RTC platform
subdevices even when the optional RTC child Device Tree node is omitted,
and devices can also be bound via sysfs driver_override.  In those
cases, of_device_get_match_data() returns NULL, yet mtk_rtc_probe()
succeeds with rtc->data left NULL and mtk_rtc_write_trigger()
subsequently crashes when dereferencing rtc->data->wrtgr.

Provide a platform_device_id table covering the MediaTek PMIC RTC cells
and fall back to platform_get_device_id() when no OF match data is
present, returning -ENODEV if neither match path provides driver data.

Fixes: 29ee40091e27 ("rtc: mt6397: Add support for the MediaTek MT6358 RTC")
Closes: https://sashiko.dev/#/bug/linux-35993d35-d776-4f86-9bd2-42c6ee078f88
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/rtc/rtc-mt6397.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index ab402f9f85c3..c40644ae509a 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -343,6 +343,14 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	rtc->addr_base = res->start;
 
 	rtc->data = of_device_get_match_data(&pdev->dev);
+	if (!rtc->data) {
+		const struct platform_device_id *id = platform_get_device_id(pdev);
+
+		if (!id)
+			return -ENODEV;
+
+		rtc->data = (const struct mtk_rtc_data *)id->driver_data;
+	}
 
 	rtc->irq = platform_get_irq(pdev, 0);
 	if (rtc->irq < 0)
@@ -427,6 +435,16 @@ static const struct of_device_id mt6397_rtc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, mt6397_rtc_of_match);
 
+static const struct platform_device_id mt6397_rtc_id[] = {
+	{ "mt6323-rtc", (kernel_ulong_t)&mt6397_rtc_data },
+	{ "mt6357-rtc", (kernel_ulong_t)&mt6358_rtc_data },
+	{ "mt6358-rtc", (kernel_ulong_t)&mt6358_rtc_data },
+	{ "mt6359-rtc", (kernel_ulong_t)&mt6358_rtc_data },
+	{ "mt6397-rtc", (kernel_ulong_t)&mt6397_rtc_data },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, mt6397_rtc_id);
+
 static struct platform_driver mtk_rtc_driver = {
 	.driver = {
 		.name = "mt6397-rtc",
@@ -434,6 +452,7 @@ static struct platform_driver mtk_rtc_driver = {
 		.pm = &mt6397_pm_ops,
 	},
 	.probe	= mtk_rtc_probe,
+	.id_table = mt6397_rtc_id,
 };
 
 module_platform_driver(mtk_rtc_driver);
-- 
2.56.1.750.gf70dc682cf-goog


