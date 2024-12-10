Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05743E77181
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V7i5zNgyQQlrRDWh+0G6ogAAGEAyg0BmLGcSQLKBgfs=; b=lQdCS/80vUIFDGVhquxGgVSAet
	0YMsgN5YfbPwLSAgO0gFWRdeI+O/PY6MPpgyW+RMjFRczvEYQBoH0lH5fkFwvT1XNL2X+LBuWwXx7
	SNgQhoeeFr1NeiYjbwEkoSRjcLaToMqqoW3/zTvK6dekGeMxhv9YhMYv6ccvkMLEvXWR+lRGCN8fB
	JiwKX26zdnn4ezIyt3wj73UFKo5Kt98XmMn1/PHCU/8f7NUQ0r/RLtMpVx7E/BYM3B555hfVJ9kjb
	ZKI7WQJ1kkqFNVrddpuxoDDV+5BSXINjHOcLMCdcJL2ZdWiFU1BWjqRoA2MPgeDkksIw8s2Gnu4QW
	4F4pj04A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwWd-0000000As3S-0sYS;
	Tue, 10 Dec 2024 09:27:27 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwVa-0000000Arqj-0Lzy
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 09:26:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-21670dce0a7so7483935ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 01:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822781; x=1734427581; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7i5zNgyQQlrRDWh+0G6ogAAGEAyg0BmLGcSQLKBgfs=;
        b=dMLz1F5/buJ2exkRbtj3CAjfK4kdH5qLuk3g4ZZ6EMzyqBPpic59OA3Oyno2LXx4LS
         5NKSDYFdkk2szjugQKBvhBqHzMtDNKxvgPD1TkTvow66I7Thd7TSnK3yABewYaXA3vye
         ga3QOxsYzNmdKBPD33rMUumxP6oiJPUiBmsCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822781; x=1734427581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7i5zNgyQQlrRDWh+0G6ogAAGEAyg0BmLGcSQLKBgfs=;
        b=odNpQODA5IfkDJ+zIlCOR7ZLDG5hdwxHZzXzfTUncLvya0DBsyirzLK8NAUo6QoPXh
         hXgziV7v4fdvWbTKyYXgdW4MBtbXjHgp1uRyj1NlDmwPrKjw7xj6NJb5yBqJtMG4hdIa
         V4NyyxaBeRWMCZAYWcukLu919URI7nOPo5jbMHfttK4KZfqsxXR+VLB6Xd3uTyKIJ+VG
         dxvoKNFD0nATqXEu8srFrxzBGbwRvnXEmISI199hdzbSk47aAl9lylBTqBVUavWriwO+
         HoAQWTadnu+drPyMASSvtv7ZPibLTtSCwVG1DH/IKQbJXQukLV/TVEnXGPT0eFoaJgzo
         3/PA==
X-Forwarded-Encrypted: i=1; AJvYcCXT2bZQDiuVAu/hvv/LalBa8aPwOU7dOXQVgKWKgtLt3040M76seLp+OygsnOMS1GLcWTsbGTo4KhbsTZAYOw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3Gtj4cVAQwglKjMbyXVhSNUOSWAh0nXWlEGT8MBHR6H1Jf1XF
	unl56NkGDFJzaF7/iznuEFj9D09OaU3qOEhsNuWJ4HvuwoBG3tlu21POo41iag==
X-Gm-Gg: ASbGncuHPkNxDJ+hy2AMXPbJ/GUGALQiv5iIobm8jquKhaFfiNPUDQAM8j422kQaDzu
	nZT1hgDKUULwekNaVJkRE1am4ye8eGBD8sHGl7abMEpYHPjJhu/mTqh5VpshuzgesTRPa+4BsyG
	MtExQ4jHjHsTXBLh9gRyGA6vNphBmUSfx84xOEQ7PXaZ53BGWXInC52SWqI2xvfPN+qZJtPUBk+
	rLAEUr23yRy6BkXOWVZ82x5BuEFx8JEaAu3HXJhMid6Pft1VAfgPJ4F2txTnKs4EY5S2dkU
X-Google-Smtp-Source: AGHT+IEbVN3vePe7Dj1LS50n6Z7qkx2DIp+ZHcNP48MQNc9h/O+CQoe/H6Q2j2soGp26ZPZFTYHuQg==
X-Received: by 2002:a17:902:ec92:b0:215:773a:c168 with SMTP id d9443c01a7336-21669fc68camr66076865ad.1.1733822781417;
        Tue, 10 Dec 2024 01:26:21 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:89ce:2db9:f7d5:156d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21632c4fc62sm49006905ad.194.2024.12.10.01.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:26:21 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
Date: Tue, 10 Dec 2024 17:26:13 +0800
Message-ID: <20241210092614.3951748-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241210092614.3951748-1-wenst@chromium.org>
References: <20241210092614.3951748-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_012622_120109_A57EE0E9 
X-CRM114-Status: GOOD (  11.20  )
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

The MT6397 PMIC bindings specify exact names for its sub-nodes. The
names used in the current dts don't match, causing a validation error.

Fix up the names. Also drop the label for the regulators node, since
any reference should be against the individual regulator sub-nodes.

Fixes: 16ea61fc5614 ("arm64: dts: mt8173-evb: Add PMIC support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 511c16cb1d59..9fffed0ef4bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -307,7 +307,7 @@ pmic: pmic {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-		mt6397regulator: mt6397regulator {
+		regulators {
 			compatible = "mediatek,mt6397-regulator";
 
 			mt6397_vpca15_reg: buck_vpca15 {
-- 
2.47.0.338.g60cca15819-goog


