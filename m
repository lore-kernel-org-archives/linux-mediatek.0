Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC2D8C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 07:31:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C47C613F0
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 07:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C47C613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cOwSYMAX/7vt7R7q61+vmrW/nwdlVPSik4O0R6oBkDo=; b=NH0fR8ipv0j8PGsbpspl14sq+X
	7R8rvjGtzhSGRlKvtCECa/9ep0F7sqjYMXyntsWZCZBqAKE/rsEL41KwoM1HOQ/0II3nILvPgc8L2
	m9/J2eW+gGeu/mXTHVPjh88H/oRq4FT7Q1NWqU1hqHtrcUoEn51K+PSgRy2Up91Dj6RPsDO0e35VV
	u1C5KEolbIN7nXD/qXMScVA8Ax9euk1FV76rOP6VKOUFMC29tCzJkte/4SDkg8qvQh5d4pZL5Ld9e
	NnowTYae+MTwFERmb2GrYUEO8bnWLLcQtE/pSOMqLMwBsVamLwZVSeG09UO4sjevU3jAK1aIquflz
	S7+c+WQA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWZzq-00BqYG-Sf; Wed, 14 Apr 2021 07:31:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZzY-00BqV1-PW
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 07:31:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=fkE+tUp6UsBCCxbBvu8r9DHfy7MsyvFZbkTXtiMUc7Y=; b=xAXQqwSBJuaIRzcmK1wvpvyjyS
 JqE5h9hycQ5zdqL/MtEQkRxvmFmWEHvGyGTSUag5CffR+ROY7VTA1s1Z8jiP0hth1J5TCqSxoM4DS
 dMDs47aZ7v7yAV5PoUj+DAZeiDriZxMFkP1kpnWXfBBaekEiDMh422m+u0yyQJcyKzJZqpG9F8hcx
 18PSSNZ5ysQC8Nf5tb8NFNYDWVa7DzmhT8OXcp/BGOTwmvpz7Rns473r77KbLTTB6/Udm0JVncls6
 aZCqDRsR/fUNK0n6C1PA7326rnvB6bblkEJOIrjb40A7T1TbkDNS/nXft2Q4He+xaRKuEwmlEUwOh
 vAgFZANQ==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZzW-007Zad-80
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 07:31:15 +0000
Received: by mail-pg1-x52b.google.com with SMTP id g35so13752517pgg.9
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fkE+tUp6UsBCCxbBvu8r9DHfy7MsyvFZbkTXtiMUc7Y=;
 b=gii7RoZ49IIoSWVe1COL5vMS71V3xnCWPJjnK+lTr1qBusdSeBx5/8V+yzGPc/g/zW
 36Jc8phM8bogF+m/VxLxaLnMholBZ0tvVsteluUatQPvkfsoFzOGONobtt3BLX6J7SGi
 UfkrMpW87Odp4LZFLp39NCQ85WAcRNbQYM+Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fkE+tUp6UsBCCxbBvu8r9DHfy7MsyvFZbkTXtiMUc7Y=;
 b=EuLf4sJIK/spAso+aTCmU6tMzbisFiLaUU1qeogJu4WAO09DJJQj/omrZpxz0HhHTM
 NxFc9YB649vUe1qRCfSmCgi/XTAC6PgFEw0/lsYqoPOpJRzTC1kWpberGcuhf2bnvflO
 PG+WLhj8++kV3i2rfRRbyNh8lUKQ1oKkGjyfW7P+Y6msm4C1NnFFVvb+ZPDhqoKbqxCB
 PgrCu1Zo3iUwxs12q+OC0Pvoj23wARY4NSNSHj7IBZINrypLj57cJwHPYzcpy+drx/58
 GBVhQxojGYzEabMjHkflD9rj2NsvE8Oe9mGAbZRrvtjrnKg4ynVaf+vaf/hH4QQf28DF
 xAPA==
X-Gm-Message-State: AOAM530+nQ5rs1tcsg1kXLuJau4UEUORH6xdS+C+oKDxpEJvprPcE1IS
 PkOpjuP4ygyy8hGB9sxzKI08BXmmcspWLg==
X-Google-Smtp-Source: ABdhPJwEGnEqaexqjkmF0jnwqOT/4IqXEYg+VEHsl4HeRmez+g7eLeJt2uCKLuvltEbqrAcE2HBnew==
X-Received: by 2002:aa7:83d8:0:b029:249:79c9:fd49 with SMTP id
 j24-20020aa783d80000b029024979c9fd49mr19643098pfn.72.1618385473359; 
 Wed, 14 Apr 2021 00:31:13 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:bd66:f13a:bfbf:21fa])
 by smtp.gmail.com with ESMTPSA id w191sm15632757pfd.25.2021.04.14.00.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 00:31:13 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mt8183: Add power-domains properity to mfgcfg
Date: Wed, 14 Apr 2021 15:31:08 +0800
Message-Id: <20210414073108.3899082-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_003114_290801_F4003D29 
X-CRM114-Status: UNSURE (   8.71  )
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

mfgcfg clock is under MFG_ASYNC power domain

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

Changes in v2:
Fix a wrong power domain reference (scpsys to spm).

Link(v1): https://patchwork.kernel.org/project/linux-mediatek/patch/20210224091742.1060508-1-ikjn@chromium.org/#23997681

---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 0ff7b67a6806..64813634c3df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1116,6 +1116,7 @@ mfgcfg: syscon@13000000 {
 			compatible = "mediatek,mt8183-mfgcfg", "syscon";
 			reg = <0 0x13000000 0 0x1000>;
 			#clock-cells = <1>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_MFG_ASYNC>;
 		};
 
 		mmsys: syscon@14000000 {
-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
