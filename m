Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3856CC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Apr 2024 09:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K9Tuxkuv5GP03on1LEPNW9dEztUbP1PxdWw89MgNsZg=; b=zgJ8Ba1bDLGuge89tYMBk6XvsV
	Q2tAVPQCRUnhMBwcXt09SnlB/DNKXoyZh4T35N7cqtPzsqKfbqa8R8UgQakuGsxHydda2RxJ1p0Hr
	+eBOeFnwxRxneZReiJVc9zkoreHUsxXenUTHyvJcGYrwyYg4S/8yCduKa8uV3uSu5iWYYG3t6CkJu
	r/pSyL13xGe+ZCCMVj3m4WPks1pZgd665L/ZWghkbTsFzZ0n3+14wxeF0Roug4lXEBr7mP2GpjWA5
	zeSDMXCHSro/r8/IBvhzdNHe6+UQCpHb15ieSG892/MvMdZd/G1G6Bi8X2zk7ASwtgucFM6afkafU
	aKGOBIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1NiB-00000002Asx-2ZdG;
	Mon, 29 Apr 2024 09:54:15 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Ni8-00000002As9-2Sf1
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Apr 2024 09:54:13 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6eff9dc1821so3958947b3a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Apr 2024 02:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714384450; x=1714989250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K9Tuxkuv5GP03on1LEPNW9dEztUbP1PxdWw89MgNsZg=;
        b=hZaN/oQCN5Sy4SV1WdnczDBoewVzGYNvVNT0IG9MVmWSaKeYQ/7EyMjw6oKdGfIsOq
         6cUCPvBijaMK0x84p9m1uTC12eZZkSdmpEL6n8QZmlxoi33FQqECl60ivdxqHV2JE9Nk
         dLTQ5qFWpK7RDdSWKY6PpIrp2QazMWGPVCjYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714384450; x=1714989250;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9Tuxkuv5GP03on1LEPNW9dEztUbP1PxdWw89MgNsZg=;
        b=c9QLHtilOWeU2USDpiRDGLl1auhqPf3lv7OllOC6jSnXikwMazAUMH6LNTebmBaIhV
         51NoG6BqjBg+7ynyQRpVq/1trnHzU+67+CngJ/3rAfjDwhGbHzZoOjghFAhDzT/z3f42
         XVsEV9eT6FLUFdSFGY1gJghjp1yHYOLLhMWQv6uXj5UgfzcwlSS+Q3JQOB1t42myxLCJ
         WfO7fcd/rPK+RSiRrhR5BxkXD+HJApTUEow05yRoK+hwoVbwywLmr+uopVJCUM98571Q
         1bx8twbLjS0fpUHUt0YhX+hAqSt0NejoQyDOt3fpRCAKvgMq7rgJkdtukI7J7pL41Yah
         wEAg==
X-Forwarded-Encrypted: i=1; AJvYcCUYWdKV3TtGGtL3MzoXfFBBL16s31Wx53EeTaG9RMsZ5gM0zRyWC8bNd8hmrTXf/bEgcw+nAgQxX0ljRWsblCjJlO1fq+h0cseHgT2gSm0CVHiB
X-Gm-Message-State: AOJu0Ywja7C7V2sUTH+52VZtdQJ/t40KL1XVfPjLI5p3D6kM6k3ZGPVD
	EBOkSgs/C8mjMyfExGmDiTaZ845MRF+8cZLrRQdG+9uTrtDbZXtK4wNgbQN5+Q==
X-Google-Smtp-Source: AGHT+IE8IGwWKDE8w65mqrsUHZCWFhQYSBQsWdqW2ncfFU1qhQ9LU47X0Hj6sRPRPpb9Jccy3pViug==
X-Received: by 2002:a05:6a20:d80f:b0:1af:3d3f:83f1 with SMTP id iv15-20020a056a20d80f00b001af3d3f83f1mr5737629pzb.44.1714384450196;
        Mon, 29 Apr 2024 02:54:10 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:38e5:4a2b:ec4a:2ec9])
        by smtp.gmail.com with ESMTPSA id c7-20020a056a000ac700b006eb0027f2b8sm18932083pfl.9.2024.04.29.02.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 02:54:10 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Add off-on-delay-us for pp3300_mipibrdg
Date: Mon, 29 Apr 2024 17:53:31 +0800
Message-ID: <20240429095333.3585438-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_025412_637588_C76BE8A1 
X-CRM114-Status: UNSURE (   9.44  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Set off-on-delay-us to 500000 us for pp3300_mipibrdg to make sure it
complies with the panel sequence. Explicit configuration on the
regulator node is required because mt8192-asurada uses the same power
supply for the panel and the anx7625 DP bridge. So powering on/off the
DP bridge could break the power sequence requirement for the panel.

Fixes: f9f00b1f6b9b ("arm64: dts: mediatek: asurada: Add display regulators")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 7a704246678f..08d71ddf3668 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -147,6 +147,7 @@ pp3300_mipibrdg: regulator-3v3-mipibrdg {
 		regulator-boot-on;
 		gpio = <&pio 127 GPIO_ACTIVE_HIGH>;
 		vin-supply = <&pp3300_g>;
+		off-on-delay-us = <500000>;
 	};
 
 	/* separately switched 3.3V power rail */
-- 
2.44.0.769.g3c40516874-goog


