Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE36C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Apr 2022 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ai+MHncI/1zT622utE/atIoPBlKJM8a2ASbN1kpPla4=; b=EtuNKKHmmEUABI
	qozVpNB/oxlpwxm2BcSbekVu27A1bDJPuMf0jMbRcbdUD4wesEah3f3gmUEM4ygml/G4+aTQzORoA
	haXyANPZGomynQdDQgcJ9tg3me4oVWCLNbq+r2Qm3LVDgg2UhqfwPxVuknwFmKGMssX+Xuab39GPC
	kZ8xA4UVXTekC2NoXcA91V3J3FrOTfx/PSGmsaxQDUbzG2KTNjkc383FYpPjVQqxo3ifhNc1bL7ox
	FP6Z7u5UWZ/RDSlRiueEVsqMaBYns6ke++5i73ndc5J/XANb5IZnDgdtcWdSA2OMAPD/fJ4J8yjcF
	jedGizRgvoerlXVmLq0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhXOu-00DfML-EJ; Thu, 21 Apr 2022 14:03:16 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhXOq-00DfL4-To
 for linux-mediatek@lists.infradead.org; Thu, 21 Apr 2022 14:03:15 +0000
Received: by mail-wr1-x436.google.com with SMTP id e2so568767wrh.7
 for <linux-mediatek@lists.infradead.org>; Thu, 21 Apr 2022 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wQKtX8WQCvG5ejnoi5Tx3qqomca9PHBF2mLes/stX7M=;
 b=AgEJXmMrcJiYHb/zC+7om2oCRjpYUw8xNsSKSQV9uECuRMPTThufzJ1NJY+df/hfKK
 XV9IBzJaoUikKzxvhHEXHe7kK+RqS6k4BEZ6Vyq3uQySxeXxYfJO9sgcVe5o2Xx6G4tt
 vFjNsdML7fETc24SqP/5MXFeTEpuRO5k+/4dC65zh312CKWKi2DgDWFQxeruHy4fmuOG
 jmhD9RwDHKfa4qmANxzECjdjQeC2h1IavNVWNTyDvuKztgwbmIfc9OMRPfFYV82O+9Ma
 wUyY6IxNyvlJtIxV1WW3gW9lseMJcOwoLKSuuBDd2FfImpLXdYUjm1o9Uw+kFrwC2ms4
 1m1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wQKtX8WQCvG5ejnoi5Tx3qqomca9PHBF2mLes/stX7M=;
 b=Y1+2xko1+8pt97IfqCXe+4PtUSpJ+rdIBbdlgPnJYLfSnFGLC71MtVo+4rUAXVe7CZ
 9ShUnMmZCPa4hJ+/M0dpjr02jngFS8Ztaidgw1c9qwM1acuetPT4sfslV6+2H/uxpcHU
 lK2ZSs3JnV2T3ytXVU89L1LK2OG+wYDJzOr5tnTv46+Guhb+iboXRj3DWmGUu3L/zffN
 SLkupd+bqRaMEyqAKAtR3XYVm6wmvl65DzKq7VKgWYNyDcUOh4INXGMH+IMjfQPraQJG
 RSVxibJy3miGYfGASr5fVpHC/UJzSTPuDAt7aPZDZqfo1zB1/NExUmxpiHSHknPQPTgP
 dAmA==
X-Gm-Message-State: AOAM533xmz/AAmqr939lr6kbBbv48VTcswjaginyz7GH+ZcjyY8FC7xN
 N5J9SvXJacbbiby33W//Jsk8mQ==
X-Google-Smtp-Source: ABdhPJwNBbP3ZT3FPSvScQRH2EbIoBe4I+WYo8GwVldT54PatPc9ePoTluWLxh6Mkgyejmraj+GshA==
X-Received: by 2002:a5d:53cb:0:b0:207:ab75:3ce7 with SMTP id
 a11-20020a5d53cb000000b00207ab753ce7mr20360816wrw.171.1650549788683; 
 Thu, 21 Apr 2022 07:03:08 -0700 (PDT)
Received: from groot.home ([2a01:cb19:85e6:1900:e19f:c42c:d783:89c1])
 by smtp.gmail.com with ESMTPSA id
 g5-20020adfd1e5000000b0020a97e7ba9fsm2899192wrd.92.2022.04.21.07.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 07:03:08 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH] dt-bindings: input: mediatek, mt6779-keypad: update maintainer
Date: Thu, 21 Apr 2022 16:02:55 +0200
Message-Id: <20220421140255.2781505-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_070312_987479_098C182F 
X-CRM114-Status: GOOD (  10.04  )
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

Fengping has no longer interest and time to maintain this driver so he
agreed to transfer maintainership over to me.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 .../devicetree/bindings/input/mediatek,mt6779-keypad.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
index b1770640f94b..03ebd2665d07 100644
--- a/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
@@ -7,7 +7,7 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek's Keypad Controller device tree bindings
 
 maintainers:
-  - Fengping Yu <fengping.yu@mediatek.com>
+  - Mattijs Korpershoek <mkorpershoek@baylibre.com>
 
 allOf:
   - $ref: "/schemas/input/matrix-keymap.yaml#"
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
