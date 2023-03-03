Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F4FC6FA8E
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 00:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIZ/VUwLQr0Tb6Hs8t6RcaxxMgXGsFSSH+ZFsM+YJEg=; b=CWt3MWcoXPFpTZ
	HW+LdIU5AqUOed5fX7TSXp+P7MNsKnkY0XaYlxZc5zkIL5EBIfR4Hfs5ohr7LKgaJppH0y0la/C1Y
	fsvA7+ESxzT056JHo4UgcHRy91Xx40JkMN5crgx1gIMNtizujgCRM+djHoo4YGhMF7eEArnlMZh5C
	C5VYFRnTbJp1S0Xkzf0F3mRXXko9ip2Cic+y5vtdtNCIqGQHSDMOEhKNgHY9gocsgr0NBDwFn2iOU
	031phHSSkS2RosgUqxtGQDMbTVe1ePF+Q6IRZVJzSoQ8PkP4Ggy/5sW6RjMb+YXCyNof81pcdalVu
	wlv2nuptr0rq8jovfZFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtMC-003sV2-KX; Fri, 03 Mar 2023 00:33:08 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXtJQ-003qoG-J3; Fri, 03 Mar 2023 00:30:18 +0000
Received: by mail-lj1-x233.google.com with SMTP id h3so724756lja.12;
        Thu, 02 Mar 2023 16:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677803414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIZ/VUwLQr0Tb6Hs8t6RcaxxMgXGsFSSH+ZFsM+YJEg=;
        b=aR/StYwg5SBRBhvvub54pAY0m0Dak5Vqi1Sn2vYzdDBLtdMkvWTrVCM/lqdvz9Douo
         FLDnxFfjNFng+q5UzRjBPEr8i41m8tlHvyE27SMFOwoC/s9ubhYRXgs9G5NWy9s/32pF
         4Wk73BnGAY2AXdu8/25JjMiA35UqkYAPoXYcew2afGVkltta25e4cQMBjhNMdoVjn+Hd
         lN0b4j1dsy2JzVqfR4nGNkHRDA3IXpIWWHWjB/i7gq3f5IEVnfzWqzU0GJiLo69EPQd/
         vp/RxMjmN3By5gPM7cptGrJaKEwnTN9zlGh2PuKUSk9MiRpbWujrdsyoVyNww7m5qpb4
         9YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677803414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIZ/VUwLQr0Tb6Hs8t6RcaxxMgXGsFSSH+ZFsM+YJEg=;
        b=3RSWUa5iJPa2cKTxrlx/485DOAcyzVhxzPgsjERI8pvho9N6Be+I06SFXdhKAO/7K3
         RfUweqZ4dZn46zRZCiqkTkSk6sPyIBQku5WNaRxzfu15ocf5RXRsfgVAiX802o8reBsd
         AUXbP49eVHb495V6VdZz1o0cL216gsPAXomftzMek7nIilqYxGCzsqqgRyNs1liNtOBM
         q0AHJOScsG6RoL8qLdvZydLRbYWU+ScfrqaxDMUMJfkV/fOWT3F808GKIxOWGf6DTv71
         KCCjMBw810mWaDqzrredmMLkKXkMuIdrh3AJX/NwqMPIe5uf80gBbpm31LuSQ0pLgqcK
         lyLg==
X-Gm-Message-State: AO0yUKWYetAd2qx3YVjqBpUz3KAKng/7dDDi5f2Fyw3D+kp54Ul0dqmJ
	rVKQ/Gt4DVcR0Qe/FrZyaaU=
X-Google-Smtp-Source: AK7set83k4MFsUVGzmCNJxxP1R5E6lqPSIHxrZtWDUwPEtDs/ZH+jWGM6ooYBuPE7QUickUieSdq6A==
X-Received: by 2002:a2e:870d:0:b0:290:6e01:8d0b with SMTP id m13-20020a2e870d000000b002906e018d0bmr3245766lji.26.1677803413992;
        Thu, 02 Mar 2023 16:30:13 -0800 (PST)
Received: from arinc9-PC.lan ([212.68.60.226])
        by smtp.gmail.com with ESMTPSA id v19-20020a2e9f53000000b002932b817990sm64901ljk.31.2023.03.02.16.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 16:30:13 -0800 (PST)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH 09/20] dt-bindings: pinctrl: ralink: {mt7620,mt7621}: rename to mediatek
Date: Fri,  3 Mar 2023 03:28:38 +0300
Message-Id: <20230303002850.51858-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230303002850.51858-1-arinc.unal@arinc9.com>
References: <20230303002850.51858-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_163016_717955_56482D7C 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

This platform from Ralink was acquired by MediaTek in 2011. Then, MediaTek
introduced these SoCs which utilise this platform. Rename the schemas to
mediatek to address the incorrect naming.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 ...ink,mt7620-pinctrl.yaml => mediatek,mt7620-pinctrl.yaml} | 6 +++---
 ...ink,mt7621-pinctrl.yaml => mediatek,mt7621-pinctrl.yaml} | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,mt7620-pinctrl.yaml => mediatek,mt7620-pinctrl.yaml} (98%)
 rename Documentation/devicetree/bindings/pinctrl/{ralink,mt7621-pinctrl.yaml => mediatek,mt7621-pinctrl.yaml} (97%)

diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
similarity index 98%
rename from Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
index a94d2e7a5f37..1c9ca0bf9750 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7620-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,mt7620-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7620-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink MT7620 Pin Controller
+title: MediaTek MT7620 Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
+  MediaTek MT7620 pin controller for MT7620, MT7628 and MT7688 SoCs.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
similarity index 97%
rename from Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
rename to Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
index eb0746cfc6d6..717c948951be 100644
--- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7621-pinctrl.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/pinctrl/ralink,mt7621-pinctrl.yaml#
+$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7621-pinctrl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ralink MT7621 Pin Controller
+title: MediaTek MT7621 Pin Controller
 
 maintainers:
   - Arınç ÜNAL <arinc.unal@arinc9.com>
   - Sergio Paracuellos <sergio.paracuellos@gmail.com>
 
 description:
-  Ralink MT7621 pin controller for MT7621 SoC.
+  MediaTek MT7621 pin controller for MT7621 SoC.
   The pin controller can only set the muxing of pin groups. Muxing individual
   pins is not supported. There is no pinconf support.
 
-- 
2.37.2


