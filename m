Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C52C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uojS5iTh6cQUusV8x5VTqf8EgsR3V6iSmetyjrUf/R8=; b=RPLAYTzI/ZDs2r
	NtbURSpPasq8HMPfK+CY6jkohKu6CMug6e0tgPJM/lYMDHi58VmC8QjLr02BqbAoSnviqpXG3Rv7V
	bXwMZRUMrwcwgrnEasu5key7oqMjDYRBMp6cnuqf7VOt4wHMVpfSmfQeki5CeNWVCjl2c7x6RZJh7
	FraxL2CSO058Trl0V0pFqfFyof8WR8CBWrepXP1I1vfH8qDfn/9wL1o3zPyY1My+PSnhzWA/T9t+K
	GU6hbGPn+QVpTlRn640bv02rfi3omtEKHFI+TZckAaM02lLJ/Z3Ofv/C6qWfx7WABFpID9mkVbDCW
	NzAU7tkw35VkyIGz2iQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLfU-00En6K-9y; Tue, 26 Apr 2022 13:55:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdE-00Elti-21
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id w4so25535168wrg.12
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NSPijaD+f/0zVFm+Yx4b1C0MDA0Gs9+IxO2aTwmm2dI=;
 b=5sTu3reUZ/D7WVN5H8YcW9y6Y/Ke/a9s9ssXnYuXVl3+HJJLMSn76Sq9pGMUjZXNmG
 FXkQZ692OnMwQdwxU5ROq2/KiIocmS/SOAiWtUn8/HhNl8y+lst/JLZky1DhheOp5iM4
 68Sx6S1uNoljHsGtihJ509m2G25Z2c1nufEVMiDGuL0dAHkxC6C95HyPqvwywaAF7t8k
 iI0OffFTm1qRTZhwPjkoIB+Fz3gJrk20veXfnZ137JCCc+pNSptpeTT0EHH05BAKP3WY
 WQC/ZabeUhtJn9uMN73R+2Af7QWGFHXopGVnv5ctNDJT1P6n88ghPBU+bWyrl45oG1gX
 zvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NSPijaD+f/0zVFm+Yx4b1C0MDA0Gs9+IxO2aTwmm2dI=;
 b=Fptak8icQmCKVex8Dsda0WIVuGoLdfkD+TZYq3haDpEMS9oBEuNQAFfTk2C2kuodvI
 /aVVND96cqza24dQB7A2tWPslfczRQjx6hOn126j8wUZf0UAmu0vd1v+zCZaZDyEpGAI
 HEUbcnqu+yQBjE5vxljZcwUUHuKFYis2Qs9XAwaXH20oaE/cezlPBG9fYII4Ngwc9hvc
 dorTpim5UooR9jBA6j5j1Eg5wqUEnmJGkCt4y9XDlqW+pGdyIkHD5dxEpATJG4+1rQ9u
 MUuSkQqAnRK8uxqPmqWoHtcfzj8J8GYVht0Vha8JUCWffjT6Rr7BMZxeeqSjKZ0VKvXS
 Pgjg==
X-Gm-Message-State: AOAM532LFwDDip4I/thyx8nxaUeieYQyYLmej5FBKd+I3WEA+iTAxGga
 I+UopagynvqKyhkvEujO6GtoQA==
X-Google-Smtp-Source: ABdhPJw0lMnT3QLeM/7DxRZav6cl/N5O7FfTfXNSrQ2Cx1+4fJUzX917Psb/7srV8MG9taEy0pDw1g==
X-Received: by 2002:a05:6000:1ace:b0:20a:ad7f:d616 with SMTP id
 i14-20020a0560001ace00b0020aad7fd616mr18465795wry.327.1650981208364; 
 Tue, 26 Apr 2022 06:53:28 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:27 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: input: mtk-pmic-keys: add MT6359 binding
 definition
Date: Tue, 26 Apr 2022 15:53:06 +0200
Message-Id: <20220426135313.245466-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065332_146750_94CEE422 
X-CRM114-Status: UNSURE (   9.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding definition for the support of the MT6359 keyboard driver.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: no changes

 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 9d00f2a8e13a..afe9062a4dc7 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -13,6 +13,7 @@ Required properties:
 	- "mediatek,mt6397-keys"
 	- "mediatek,mt6323-keys"
 	- "mediatek,mt6358-keys"
+	- "mediatek,mt6359-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
