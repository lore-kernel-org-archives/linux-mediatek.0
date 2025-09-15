Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB9FCAC592
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wITPvp7/efm6Dl0gfgL0SX/8lhR3YuecJJW2qwdu/GQ=; b=JnPnyGrRJ6VxwZ+c/1DNTHWYen
	MGSzrMBO/lmC8oxosjCDGNy3da89plvtVjHKboJ9kumoDsWOOONDNr8fTK3f2kGv0ihsNJMezcK9g
	5346pqIkLwUfExK+w2c09YgKaNSgFjcmYoPwWam5INn9+tL8BTe7JORMEpeYHytnjgFSFRBSkI8/5
	8CxdYtVopS3qAM8wwB5pBwbAHZFUiPOPugZdMCOMTq7UYYvMg6KecQ7nfuPGWK1c53RuWwIwjLcsd
	oLdz7ot8zFnvDEkw84VbU2zqPpo/kwDVT8FPDfWNXJrZyrA1Q85oC5xtqfF87aJI+VEkT8dz4Je6P
	2R44U4gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8cD-00000004C69-0z6f;
	Mon, 15 Sep 2025 12:47:29 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8c6-00000004C33-0oDW
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Sep 2025 12:47:27 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=uu/gMIxTOJZHAzP8oYJjcIpztQhHUgf09obUDi3ID1xeRLz9DRf3VWMWg4ECpxT0To7+QfDzfnlMkXL3dOrKUKjRD3kW+oQzP9GWTWT31zByp+BYgrLouVPsn70DfaHIClDbgpGK7mNHH6/lWYHVPmV5G6hsGNH/2D8zfmZdCXhUCu4U8FLxEO9NLOHfTx18TxIPpb1l077186jKGEmlFeIZDiTVQeLsqBwFxoIs0wzcEDmHE/8Boy2CLKPCq+Z5KDWaCLtOUT+8HcEoSYYVfC3VC5B1oPC2Ny2pqW1xdIQaQB6HsL54O2ijru34AVI3ybJjvppM6B1/qqHk6lv3dw==; s=purelymail3; d=purelymail.com; v=1; bh=EocTBfRhuqVV5QheA/P/utq8S19upYhfTSQz2Zpf1do=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-mediatek@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1506483826;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 15 Sep 2025 12:46:32 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Mon, 15 Sep 2025 14:46:24 +0200
Subject: [PATCH v3 2/4] pinctrl: mediatek: Add debounce times for MT6878
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-mt6878-pinctrl-support-v3-2-593cc007d4cf@mentallysanemainliners.org>
References: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
In-Reply-To: <20250915-mt6878-pinctrl-support-v3-0-593cc007d4cf@mentallysanemainliners.org>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757940385; l=1617;
 i=igor.belwon@mentallysanemainliners.org; s=20250908;
 h=from:subject:message-id; bh=EocTBfRhuqVV5QheA/P/utq8S19upYhfTSQz2Zpf1do=;
 b=U+bY7U9xUd0C4Z7k+0r/AwFbEZznVSRDowQDdQjlcm7N6QSO4UdkET41xnzth3uOtFhOcnt9v
 Jz3FjqFJ0s8D7dX9UbiW99RK2v6PUFV70apsJLXq7h7psGgaNN2LS3R
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=t9Kz6B3jEwJD7YAKcp8XftfEz7SUSlGbrsfFlbrrFwA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_054722_311179_02434C1B 
X-CRM114-Status: GOOD (  10.01  )
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

MT6878 uses different debounce times than other SoCs. Add them to the
EINT driver.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
 drivers/pinctrl/mediatek/mtk-eint.c | 5 +++++
 drivers/pinctrl/mediatek/mtk-eint.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 9f175c73613f84b47c0160947f32da7aca7d5a18..c8c5097c11c4d14eb41bdd7f9cb93b4a5756d2b2 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -66,6 +66,11 @@ const unsigned int debounce_time_mt6795[] = {
 };
 EXPORT_SYMBOL_GPL(debounce_time_mt6795);
 
+const unsigned int debounce_time_mt6878[] = {
+	156, 313, 625, 1250, 20000, 40000, 80000, 160000, 320000, 640000, 0
+};
+EXPORT_SYMBOL_GPL(debounce_time_mt6878);
+
 static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
 					 unsigned int eint_num,
 					 unsigned int offset)
diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
index fc31a4c0c77bf28b106943e9292d0dcc425c4922..3cdd6f6310cd0da5aa74623c5f1dbe8f8495d689 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.h
+++ b/drivers/pinctrl/mediatek/mtk-eint.h
@@ -52,6 +52,7 @@ struct mtk_eint_pin {
 extern const unsigned int debounce_time_mt2701[];
 extern const unsigned int debounce_time_mt6765[];
 extern const unsigned int debounce_time_mt6795[];
+extern const unsigned int debounce_time_mt6878[];
 
 struct mtk_eint;
 

-- 
2.51.0


