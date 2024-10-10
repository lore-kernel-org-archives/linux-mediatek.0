Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BCAD2445E
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 23:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82HiPSULHr+FUteMSvvyK8noRcXFrMRkdAs1zK1bpjI=; b=MJujDoox5SWpX3IgWh6gW0cOuH
	70s+5u2959QmdTGm7jJ5Yq0568xUBeS50F+TnHxTPOal2yAGfJ6vGM9mJVUUcbNXg1EFPLH/6IMhZ
	DL/OCuyvn/QqsMH5X5r2V/X1CPFDwSe2n0uplWvDykjJmmjP4Q8RHEaNSpR7HriCS2zx6B9o7MoXn
	0oxEhj5Pgiui53bPbh1LC8iN6MHLN3WnaIpUGVOvAloAB4ldV5dNGbAuZJXo0v1sYajoTE7S9MdoJ
	/gJG2oQkhoNbPPsXJ2mvygaE3RtkgveRXxeu2qxuW2BwEFMNfDBDlp6PhkDgYQEgCZE/emgqvtiT8
	UCQorcsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz2dB-0000000EfDM-0W2o;
	Thu, 10 Oct 2024 23:31:41 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz0fc-0000000EP3j-3F7e;
	Thu, 10 Oct 2024 21:26:06 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-37d47eff9acso719074f8f.3;
        Thu, 10 Oct 2024 14:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728595563; x=1729200363; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=82HiPSULHr+FUteMSvvyK8noRcXFrMRkdAs1zK1bpjI=;
        b=hkXNJud721eViSGp6xC1idpcQDbDt6X+y/Ya5cPBnNzQNtP0t2kcCWnc9P/Qmbtsbx
         xbVMz/o6/JVVXnnOKr/tCbKNZiqUx3OKwSM7yWJe+Nt72NJzJQZzuoFvASodeCWTOboI
         Y+BnStnGaSFz2JamDdLXv6V2CXa56sNHU0qJHC02rO5MXr+AtSL9I4OVedKEE4TMnN3i
         whGB51zvIHmjpp8ah2Ts4O/usUYLd4JSY1tcZqUWfJ6NJ/JpI2X3R3tTBPjNu/7RcSYe
         CC8HduUf0cnklw3z6dJ2E1Sw+n5Qt1B3Hqw+o0vCoPmnpMD3Sbk6YOzXiUL2pGj79LMK
         /yqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728595563; x=1729200363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82HiPSULHr+FUteMSvvyK8noRcXFrMRkdAs1zK1bpjI=;
        b=TFxX8vYyXBr2L1K3PuCAA0qSIVqNHd6xdZjjlChQ5JsPEGWjLWug1nC/ayhP1oCVqw
         Y7OiYHukik3Z8/awLTF8T9+6KWtiBHvVoryEZHduxOKfI/zqE59NPGOGV7l1tdOkWjr7
         QMnzOGW7r9oLZy1Qim3h4L6QmoFBMa5NxkJtvzKXqBgmS2vlWmocYmf0wkDp8chHliXy
         BXZc4QSYNwbEd5AOnR/Ntoxp4sD7bmV9QbHx7jPM+1H3UgNlcRdn510DNf3km+CNHsO8
         D49RqRCAy+mJqgn9EpTqeRsfpI0lhvBwgetYEMV+OwjXxv6pCV96XVA4Wim4IuFTSrVz
         /mBw==
X-Forwarded-Encrypted: i=1; AJvYcCVHaadbcDiR3Z3hOH9zjhkWrtfw/1kAmYslkH1rp5H2TTPAeuFEXiQsNSxhfU2l+pKKJFJ+/n3lg7O0+vgth0c=@lists.infradead.org, AJvYcCVnQqQB2EiY8YHSf6nwH/c7tfhmVEjSNHWwkXShRSXXedIVOfcZTX8jod1PjLuHn5wCvr+55JO72GwLVoat9nGRdA==@lists.infradead.org, AJvYcCXCHGRvjjmSUHhKJHL4lNWJerpWaarTjqTw1LLw+zYV31pVSVUIdX7+0yixsxeiCrU0+nO3aTz1VtU4zmUe0RVB@lists.infradead.org
X-Gm-Message-State: AOJu0Ywl6uOTb9Jtcn1u7YsLl+K40nKJnCM37lO82Hz5eF4ibOF0VSGP
	kGYicNt3u/oO1pI3itdRB5gTursr3XUch2h/CcB3cPMhlh2/bjuV
X-Google-Smtp-Source: AGHT+IGXFqB+Zazmp7zehHYuM+XL6z61pYXfmG/3rSEoRILp6KFB73i+GbynVFHLtM/y3xRgpb0hmg==
X-Received: by 2002:a05:6000:459b:b0:37d:37b2:385d with SMTP id ffacd0b85a97d-37d5519118amr285252f8f.12.1728595562834;
        Thu, 10 Oct 2024 14:26:02 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3d08-841a-0562-b7b5.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3d08:841a:562:b7b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6a8940sm2402083f8f.6.2024.10.10.14.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 14:26:02 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 10 Oct 2024 23:25:52 +0200
Subject: [PATCH 02/10] Input: mtk-pmic-keys - switch to
 for_each_child_of_node_scoped
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-input_automate_of_node_put-v1-2-ebc62138fbf8@gmail.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
In-Reply-To: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728595555; l=2458;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=VnsjVhq/mttVM6JYsQsLgW4CuzOsRfVPLIHizOJxOgE=;
 b=ZS797SMZjCf7D8Lm77tFOx/ESKZizmB8NLX/9NtgZRCNy1/Qe09aBZ6jGgwJT+aYB75Bagai0
 S9JU5B7IeC2D7sgZK2eq4Xtr8wWKCnkMDiB1XWjLJ0wpWwKDsfmLIhB
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_142604_857586_77EB1471 
X-CRM114-Status: GOOD (  13.64  )
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

Use the scoped variant of the macro to simplify the code and error
handling. This makes the error handling more robust by ensuring that
the child node is always freed.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/input/keyboard/mtk-pmic-keys.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
index 4364c3401ff1..5ad6be914160 100644
--- a/drivers/input/keyboard/mtk-pmic-keys.c
+++ b/drivers/input/keyboard/mtk-pmic-keys.c
@@ -307,7 +307,7 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 	int error, index = 0;
 	unsigned int keycount;
 	struct mt6397_chip *pmic_chip = dev_get_drvdata(pdev->dev.parent);
-	struct device_node *node = pdev->dev.of_node, *child;
+	struct device_node *node = pdev->dev.of_node;
 	static const char *const irqnames[] = { "powerkey", "homekey" };
 	static const char *const irqnames_r[] = { "powerkey_r", "homekey_r" };
 	struct mtk_pmic_keys *keys;
@@ -343,24 +343,20 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	for_each_child_of_node(node, child) {
+	for_each_child_of_node_scoped(node, child) {
 		keys->keys[index].regs = &mtk_pmic_regs->keys_regs[index];
 
 		keys->keys[index].irq =
 			platform_get_irq_byname(pdev, irqnames[index]);
-		if (keys->keys[index].irq < 0) {
-			of_node_put(child);
+		if (keys->keys[index].irq < 0)
 			return keys->keys[index].irq;
-		}
 
 		if (of_device_is_compatible(node, "mediatek,mt6358-keys")) {
 			keys->keys[index].irq_r = platform_get_irq_byname(pdev,
 									  irqnames_r[index]);
 
-			if (keys->keys[index].irq_r < 0) {
-				of_node_put(child);
+			if (keys->keys[index].irq_r < 0)
 				return keys->keys[index].irq_r;
-			}
 		}
 
 		error = of_property_read_u32(child,
@@ -369,7 +365,6 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			dev_err(keys->dev,
 				"failed to read key:%d linux,keycode property: %d\n",
 				index, error);
-			of_node_put(child);
 			return error;
 		}
 
@@ -377,10 +372,8 @@ static int mtk_pmic_keys_probe(struct platform_device *pdev)
 			keys->keys[index].wakeup = true;
 
 		error = mtk_pmic_key_setup(keys, &keys->keys[index]);
-		if (error) {
-			of_node_put(child);
+		if (error)
 			return error;
-		}
 
 		index++;
 	}

-- 
2.43.0


