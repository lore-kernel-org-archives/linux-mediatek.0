Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B916B606D52A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 19:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=umA7Ner6;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o4QGgerz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=; b=umA7Ner6NrMET9
	PtU/sZSo23I6FosHu4atYcgFVa3iYOYPOcZiyYXLtqN/yk4YaUBuM9PT40R2bLBWa+70OWdDRBPld
	PTfJYKKHGtfm/4qqYJGKWTppIqEzYnWol88mjdMC+B2xiFCjcKxOQXSfA5e0gG0AiEV9HLvpfHPgK
	0srElYpLe5vBhVIGUCZtWW8yNeSwyyWgDlFqih2ncUq4DlXm5gGuK9/GDhQJUqfL0cBStsLO5TNKU
	SOOdmLslOPmHRzK+vnpWNfLpoYKY55wjUvcnfxqxdlXztdUMgZGQ0Av7+2yLlmj3QpS/yA0YYsE8t
	EHPDBx2iIjXdsi9/CyJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Xt-0000000ARg7-1gYg;
	Thu, 05 Nov 2026 19:54:49 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP3Xm-0000000ARaz-0fFj
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Nov 2026 19:54:45 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso18672825e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2026 11:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793908480; x=1794513280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=o4QGgerzq/T5GwloPl5LIVLyNCBhoWyEDJrSMRtLjCGchqckvXvfpq+20tiD3PamTW
         WfXJKBuZOOpeAWEGh2qX6F0FnGXgs/y0IvfV5Aw0rrB+cGIsyL3fvECLqTeI3+QrDHiP
         yZeGZ2jQccfljssgksk5qoec+Ukcb3hxy0iUwqveOWWtcVciKX4kSfMrP+6rzkaGF4zH
         AdsSLFjGSUh30O5DVyswBeEzDuHeopT8IP8U4jYb7dFJsuEDyH+FZaU7WIz7Tk3hfrBZ
         xCJKMPvAheMs8mZywE+uOLx4CB8nKes56Mr2I2BdDrJCmjQJ19x6b1W72EQv2HM1YdHc
         RBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793908480; x=1794513280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DcCZ++LfjibxMYCGx+YpvA8XnStwxpnU2ZVwc+ej5jY=;
        b=kR3G8SV2TjGKz7vP5cAolY5LOC89E/ugWodMjwIMSVu/ktFH7I1HcrN5eR0tpPMK57
         5fKQ6Y9Ts0Vy+zSXK6KkUK1xxOXFCvTA0HnI5McB5f5W3P8GQs4NBjDIg+XlUuEf+ly5
         qsCHgF1EypP83tlEmMYtP+b7QoLrPHpdBVXKaNN+WwirGI8JshpzjGeQ7FCW/czNN/3h
         w5llvrpodmhcwJNsuWc4hoTVUBt76CYpCUShMCAyvZgkv0z+TzVY0e+ETQ0t2OleTd4/
         uFrc9S+6/iwNdkLpxrv3K0Yc/dtznP5Hua3Deihuqrc1joJEGwuYCvvd89telpoJcfap
         PJ/w==
X-Gm-Message-State: APuU4Z9JVI1E4SKRZrEsmwnKCZGYkj6BnAkb0iMFcDA8llYSvq3q1etz
	tQ5P0JLrIxJRS3p1s3sLhrfQ21wmR8Y7fTiy958XreyktUE++GBkc6rCjVe0Afgf9ZE=
X-Gm-Gg: AYBFou0GUHOPt6AsyrzyCGBNnOXjse9pHpDDiaUcTJIRcprnAN+zWDIjgwBrKCZVWci
	26F9QNYL5ICSdgwlfkA7WT+70q1uGVK4Uppw1/XIL6pr7UxBYpxLP6xg02bQOt6FEbmRt2CcqiQ
	1q6dFGoraY9m1BAneJ6k4TOMDwVtuQ3ZsnVQra1m2N3GHvslK+8o7sxuZqsKJb79jTsNBaaJGVq
	hPgSPwb2S1Uiq7Grs1Tq91yo+0z8obj+5tpcVebdP9oI5LWnU6Gg/yQp8mZ9Z6AsPA9sej2zkRh
	CK0SpUO7yCDKdYqwL5Gu/PY6lhqpVZ0554JQUcu7m1QE65A5eSC39UUrTbqySxh+2hC3bTI8qxb
	J66sZmraHEgdt3LrTfWeMdCPkjTRMsqqY43xUrH+RSoDjZk6VZReOpykFA0q7P/TCpQYR4YcKdD
	3X884eSJmyCBxrV43TrXgy9rJwm9aiWS8vd3uu9i8jCG6Aidue99pv4s9X5aU9/+NTF69F5cR/7
	EV3YoKlFFYDyiMVGA7d6Qzswj3nzxneMWrGhBlJ10APwVITjyybzb9mJgs16qr7i9OFIEkN/ZdJ
	Bbmj9AUJh9rSzHRfKIZgA7TX
X-Received: by 2002:a05:600c:1f95:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4b6e063f1e5mr3032495e9.29.1793908480210;
        Thu, 05 Nov 2026 11:54:40 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b5725fb0d1sm83862895e9.8.2026.11.05.11.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 11:54:39 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Fabien Parent <parent.f@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-gpio@vger.kernel.org
Subject: [PATCH v12 5/8] input: keyboard: mtk-pmic-keys: Add MT6392 support
Date: Thu,  5 Nov 2026 20:50:25 +0100
Message-ID: <20261105195206.3440-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105195206.3440-1-l.scorcia@gmail.com>
References: <20261105195206.3440-1-l.scorcia@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_115442_369842_CA00E6AB 
X-CRM114-Status: GOOD (  11.88  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Val Packett <val@packett.cool>

Add support for the MT6392 PMIC to the keys driver.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index c78d9f6d97c4..d758c7743f6a 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -13,6 +13,7 @@
 #include <linux/mfd/mt6357/registers.h>
 #include <linux/mfd/mt6358/registers.h>
 #include <linux/mfd/mt6359/registers.h>
+#include <linux/mfd/mt6392/registers.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/mfd/mt6397/registers.h>
 #include <linux/module.h>
@@ -69,6 +70,20 @@ static const struct mtk_pmic_regs mt6397_regs = {
 	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
 };
 
+static const struct mtk_pmic_regs mt6392_regs = {
+	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x2,
+				   MT6392_INT_MISC_CON, 0x10,
+				   MTK_PMIC_PWRKEY_RST),
+	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
+		MTK_PMIC_KEYS_REGS(MT6392_CHRSTATUS, 0x4,
+				   MT6392_INT_MISC_CON, 0x8,
+				   MTK_PMIC_HOMEKEY_RST),
+	.pmic_rst_reg = MT6392_TOP_RST_MISC,
+	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
+	.key_release_irq = true,
+};
+
 static const struct mtk_pmic_regs mt6323_regs = {
 	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
 		MTK_PMIC_KEYS_REGS(MT6323_CHRSTATUS,
@@ -301,6 +316,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
 	{
 		.compatible = "mediatek,mt6397-keys",
 		.data = &mt6397_regs,
+	}, {
+		.compatible = "mediatek,mt6392-keys",
+		.data = &mt6392_regs,
 	}, {
 		.compatible = "mediatek,mt6323-keys",
 		.data = &mt6323_regs,
-- 
2.43.0


