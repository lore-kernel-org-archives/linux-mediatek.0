Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9947BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 10:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNGi52q1GuHgD1+/pyeFlE7Hz9RsLG/GniVm7XAU8G0=; b=NZLtUDuaUR/wrP
	gRrGUx+BNEunp8HYz52sHFX22DgKaXWHgWBnqtmg9E2Rh3Vm7shx++UBNJpQO1o3pJCZndYum5O2t
	wZnJUFNDeYFmrBSwH601VzsQNx8A+MosVvWKz/X5HhtOSudjVOIy+BQ829YZRYVDuBIyjnFQQMcLf
	YVZksaMqyLPHjkjpRb5stVsqj3t2KtfrjJ2/VI8Q8gCHazqJ6jHXTPewSOl5UR5Vc+TM2lEaQ1jjz
	J4hHWU9xG2A0lyAO95QTdJWs9npPx+BvOo03TJh2zFnGCv/FNTpPoW6YCuhZVcjiRa1AcqFaZf5s6
	Isqru1e48L/wUah86Rvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqEf-005RKH-QI; Tue, 03 May 2022 10:58:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlqAW-005Opy-C9; Tue, 03 May 2022 10:54:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 84E591F43E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651575251;
 bh=lZd+DG3UpSGFUrcfauTCxb9uhLYPRfZSRC5NUn+DRL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I9z1T1OOuMqKW88TTxHG7ChxBDlOGk61luZJjp6eoeQTUHgevPFlA/3nRL+WLXRcl
 4NSAuZXIELUqPMBFSy29aDdZZbQF5qQnpXWmVmI4hKdQwhfxfJDfp0y2LlE+4Akkjz
 uiqDqSSMalE6PG5ZRQR4UEoMYoGolqul5xzB1CrfqYPQcCKm5PeIgWbnYymaNCFJv2
 pnQE4QrZ+LFKWUkS7Ck/+3H6JatEm3FgHil0eQGIiJ9y3CQFHKCVHex3KYYiT/nAe5
 CAFjy+ZWibVROAA2PaXWbu5IgBzhH2a2C2FU5SgYwJJuzip5shaqVuqWsfT5OFcqDS
 FzklHDM5yr+tQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] pwm: pwm-mediatek: Add support for MediaTek Helio X10
 MT6795
Date: Tue,  3 May 2022 12:54:04 +0200
Message-Id: <20220503105405.54832-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220503105405.54832-1-angelogioacchino.delregno@collabora.com>
References: <20220503105405.54832-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_035412_603558_3F7CD330 
X-CRM114-Status: GOOD (  10.03  )
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

The MediaTek Helio X10 MT6795 SoC has 7 PWMs: add a compatible string
to use the right match data.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pwm/pwm-mediatek.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 568b13a48717..28c2d0e5a8ac 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -264,6 +264,12 @@ static const struct pwm_mediatek_of_data mt2712_pwm_data = {
 	.has_ck_26m_sel = false,
 };
 
+static const struct pwm_mediatek_of_data mt6795_pwm_data = {
+	.num_pwms = 7,
+	.pwm45_fixup = false,
+	.has_ck_26m_sel = false,
+};
+
 static const struct pwm_mediatek_of_data mt7622_pwm_data = {
 	.num_pwms = 6,
 	.pwm45_fixup = false,
@@ -302,6 +308,7 @@ static const struct pwm_mediatek_of_data mt8516_pwm_data = {
 
 static const struct of_device_id pwm_mediatek_of_match[] = {
 	{ .compatible = "mediatek,mt2712-pwm", .data = &mt2712_pwm_data },
+	{ .compatible = "mediatek,mt6795-pwm", .data = &mt6795_pwm_data },
 	{ .compatible = "mediatek,mt7622-pwm", .data = &mt7622_pwm_data },
 	{ .compatible = "mediatek,mt7623-pwm", .data = &mt7623_pwm_data },
 	{ .compatible = "mediatek,mt7628-pwm", .data = &mt7628_pwm_data },
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
