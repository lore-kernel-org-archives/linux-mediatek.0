Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9E3C55179
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 19:48:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7474A20738
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 19:48:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WokcdL/1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="g6+x/GLt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7474A20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ph6Egb9QZ2R2S2NnfVArKmxVvEi+1MHd4yNHR0q3hGA=; b=WokcdL/13mnrkw4v8pLP2t+6ZJ
	2hWogm9SNzRdO+gows+LISIKFvdbZTyTBQSrhu1eZMkDSjXHqdsDZZaw1CBQrXK6YOuqBC5t12+8a
	xkbwTZ9ScSbA1VP0h0nVuinbr8AvebAZsnIqUaZkZF3YfQGTlSXKjJTjJKPIRrOK7g2AS2V5lC/qD
	XH9+HkDj+uuOFbRCzJFLjv1Rkc1OQqXh/mwnlyiE584KQ7hfXrIswEl94G8yH8kdKBHGewhukevxd
	cnPDb39GsO/HM5fKM+2WuQb2MX1N/K54ml4porY0eq01UiD0ZB0kZHR5Dmx/vmonWitj7dvSQdjPT
	dEjDR2AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXUxW-0006Ex-V0; Tue, 27 Oct 2020 19:48:42 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXUxS-0006Cd-27
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 19:48:38 +0000
Received: by mail-wm1-x341.google.com with SMTP id t3so267549wmi.3
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hLsmVRD6KI4G1EA4PKVGyaEE4muIeMLkXJ8Hxgq8zc=;
 b=g6+x/GLt8CwpScbwoNFsJjQgHbjy/vmJ0KLfnp7JOvlw7H5ciaP1xUfOUr56UGQLU+
 4FvhCOwGz7hcuTqpS+eXI8v1LAKua/OuswV8sSwejLwgEwYCYcX/iko59ZMbBa6biz2Q
 li2JAqYpA0rDKK+HKbKp+fsU5SwTjfqgNAy7i5vXsXzFA4q5XUMg+vp4tAUArnT+Ece7
 XuC0xWi+xFnoOu+yPZzEPWEjOhPScdJXcpd7tzWu9+ZeX5S58y9ba3LvfiiyFeBtgADw
 5+NbUZ4Cn38mlCfsbpOPacdWoOnEBiAJfcbQngrBh1YWFBIP/9b3zcsq8TM8MZhmssCm
 /nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0hLsmVRD6KI4G1EA4PKVGyaEE4muIeMLkXJ8Hxgq8zc=;
 b=jxEy6RMU8+d3VK9Bdl5vGo2ZVXQlSkA/Q925SL2c8Zn0No9kXyjbm6JuotVEoeDKUt
 8KeLnoNeaefZ4I81fwc2IUUtMJ677pXDqHKgmH7TcxpZRIBPGkyo6cGYCPr8h3TwLUPy
 1AU0cXMVzzkKXmxoZz27+goKUuDidC+NOnrX30DWa8XaANBBSwdR54vsat+6Jh194QRc
 bPTFcjsaVBaMHMNXPw/pacCyxj6qY7lMgIhx+gJKv/sv0hXEbQU+mNlfzM5bEL+G/mf1
 eei2Ma40TZ/LfwfW8LMIdx7SQa5kohRUABz4sqD0DoWfnfboNAOaxT/qdmjIhyVvgCJV
 a/Ew==
X-Gm-Message-State: AOAM531SFXFHRR2cO1emLjsYh1Jjdn0RAr0nXKbh7H9ZNh2GAP8kpvcz
 i+AK/h4g63OyFPx/PNNLKh1+3w==
X-Google-Smtp-Source: ABdhPJy5s4X3sTXQBhl4W6qUJ0tqu7xQOd7uQPKTN+jIC2MCmU8BspUNsMBu9GxI3FEqt4cJZB0+qw==
X-Received: by 2002:a1c:9c51:: with SMTP id f78mr4608115wme.189.1603828115582; 
 Tue, 27 Oct 2020 12:48:35 -0700 (PDT)
Received: from localhost.localdomain (159.174.185.81.rev.sfr.net.
 [81.185.174.159])
 by smtp.gmail.com with ESMTPSA id h62sm323222wrh.82.2020.10.27.12.48.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 12:48:34 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/3] dt-bindings: arm64: dts: mediatek: Add mt8167-pumpkin
 board
Date: Tue, 27 Oct 2020 20:48:13 +0100
Message-Id: <20201027194816.1227654-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_154838_149891_3566301E 
X-CRM114-Status: GOOD (  10.83  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add binding documentation for the MT8167 Pumpkin board.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 30908963ae26..5c772b937efc 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -84,6 +84,10 @@ properties:
           - enum:
               - mediatek,mt8135-evbp1
           - const: mediatek,mt8135
+      - items:
+          - enum:
+              - mediatek,mt8167-pumpkin
+          - const: mediatek,mt8167
       - description: Google Elm (Acer Chromebook R13)
         items:
           - const: google,elm-rev8
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
