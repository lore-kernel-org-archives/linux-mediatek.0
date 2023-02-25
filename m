Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA98CC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 10:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNOc3+gSr8ZmR62uYnPdP5co5re0OgpLu9vaZLf178E=; b=qIZBT9VmraR3tV5Ln47iGPWix2
	YPb2MI3jiRnif7rk1iscXIF3rGYudsNSAO3ngcbxEKtm6EfJ1e1ZXb3LsFeFDGMOehWU27XQp4Um6
	sxbWyuhfc22+VSpnpUWpyIuPOGX0z3MlSaSjRJ0hIy5grNQQTLR/XiPffTOoSIZZLgSTQk0I16667
	IsJ19NkdPwkIm9Tr1sX+7XhNkUlJLTWuYLJKOrnGhjdZYphNf5YLrq/GULaGpU3ccJziVDDqQUHSK
	YKmMnf6515DhpFo9Tx8w63WO3H2paltNh1TTjW1oMhxVIJSpNTXyydZsvjxhuA9NU+eYN9kSekmIa
	nv5ZS/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVrcV-005Sli-2Z; Sat, 25 Feb 2023 10:17:35 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVrcE-005Sc8-7v; Sat, 25 Feb 2023 10:17:19 +0000
Received: by mail-ed1-x531.google.com with SMTP id s26so6796186edw.11;
        Sat, 25 Feb 2023 02:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SNOc3+gSr8ZmR62uYnPdP5co5re0OgpLu9vaZLf178E=;
        b=EiIvBQ4GbWPFzedJeC8giVvUC0oKHukVPsn13/vJOzDFgYuk80Nj1emClZAr1NBI5V
         vBSlUbVdniHkVoWAd7+a5EoAqbIsd/DdcIBm/RkxtLzG7vcANrDA7zMMv3b0WauIMF7Z
         JWSa5UxGl2kTnwB6MBqRpZW2/baw2wscfSiKVTVY+mVtJ1eLbq6oTiJ4CHiYmf1/nGzT
         QmdOrMAPFLOo1/cvrUQ8dwoQ8pGovqfNAR3mOWbYuQB1ACk1EBzGKCJBLBaesFSUvtIs
         C21sBYrpDoKjUqxe2gUfk+Uf7445uuZqw0hyhTwv223q+TDv3Cm9IfY7WTUMwKgaSLwf
         RWug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNOc3+gSr8ZmR62uYnPdP5co5re0OgpLu9vaZLf178E=;
        b=shnIKHClF5zqLykuymoqvDXyX3LVA5nOpf9OrQT95stDbdPLEn1IW7pxs8Liq32GBs
         aySmC/wxzN0WXlqLzPTlKmwUwt20BwCw8qW77hnVMeD+hDqL+zr2TBMcDHpFIptR6OaY
         hmeMDSF/iMMyy3s3lsO5bpzK9oXIRzKA8yfX7OLk7CsgllZSkgUTn2D6fG9AQmb3Ecbr
         QQAig4eiyaPOpVllX6HL07VlzeKje5JjCQPUqGN3s8jdP1CkkjmPIGcs6oyXlimA8JZp
         b2WlFUeTuQU43f8fapquiizIwmKGWnKmKu0W4CWokFi9m9LnquJgjHiNby8C9kiPzBGl
         yFqw==
X-Gm-Message-State: AO0yUKV+rsto5NVqlyqkbTLUyKGDNdFSHhAQ4H4i/S03BgL76dYvlGWV
	/J7cFRJYghWHcDZ/f0qR+HE=
X-Google-Smtp-Source: AK7set/K6P2ZaMdb52XoOkvgi1/h1i47RQzA9sBuj1bguB5r7y/Kmiv984/NFZkpd2u9AUu9BAVqTw==
X-Received: by 2002:a05:6402:b04:b0:4ae:f496:10ac with SMTP id bm4-20020a0564020b0400b004aef49610acmr17413203edb.0.1677320230397;
        Sat, 25 Feb 2023 02:17:10 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id y23-20020a50ce17000000b004af6163f845sm677722edi.28.2023.02.25.02.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 02:17:10 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: power: Add bindings for MediaTek MT6735
Date: Sat, 25 Feb 2023 13:16:27 +0300
Message-Id: <20230225101629.264206-2-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225101629.264206-1-y.oudjana@protonmail.com>
References: <20230225101629.264206-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_021718_354037_52C9C00C 
X-CRM114-Status: GOOD (  12.23  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add DT bindings for MediaTek MT6735 SCPSYS.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
---
 include/dt-bindings/power/mediatek,mt6735-scpsys.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt6735-scpsys.h

diff --git a/include/dt-bindings/power/mediatek,mt6735-scpsys.h b/include/dt-bindings/power/mediatek,mt6735-scpsys.h
new file mode 100644
index 000000000000..5124cdee9dc7
--- /dev/null
+++ b/include/dt-bindings/power/mediatek,mt6735-scpsys.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _DT_BINDINGS_POWER_MEDIATEK_MT6735_SCPSYS_H
+#define _DT_BINDINGS_POWER_MEDIATEK_MT6735_SCPSYS_H
+
+#define MT6735_POWER_DOMAIN_MD1		0
+#define MT6735_POWER_DOMAIN_CONN	1
+#define MT6735_POWER_DOMAIN_DIS		2
+#define MT6735_POWER_DOMAIN_MFG		3
+#define MT6735_POWER_DOMAIN_ISP		4
+#define MT6735_POWER_DOMAIN_VDE		5
+#define MT6735_POWER_DOMAIN_VEN		6
+
+#endif
-- 
2.39.2


