Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A9C9C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:22:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AF6E619E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 11:22:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6AF6E619E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VlwwjnS6bJ+lK5e37gabcWdtaWZEzPhESFiyyGzdtNs=; b=dUJtpNxGQkR1Gv
	vW6PE2UOfO5IITtgcmcw+Z51A2Gp3Bxky4GAXix9Mc6kGAFLLcv7Aeb/mEZ+yVmbd+I9smVxpisla
	vVkU//LO5c3TbBSj7mWGwXLjgMEGW9GrwiMWe9FLIR2RTZqMfrKfSCsTQXqgUxntSPsXe5NXOdN58
	xVB713iBxK0cBprQOYKOthO8nrFWSMxAh3hGym+v2ihyaomPrGNpZLnqts9z8KbzYsRD5WrYOK7fs
	mOwPHqM5B4BzglHthbmqhg55OIfqvQYr5TCg9XW6bZAt/l0WTO1chtBxtcgfi5e7Dmuc1j7u+P7Di
	MWKbQzRCaC5Fg8L+giUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8LAA-00EcZH-4Y; Tue, 27 Jul 2021 11:22:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8LA6-00EcWb-KX
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 11:22:16 +0000
Received: by mail-pl1-x62c.google.com with SMTP id c11so15329422plg.11
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Jul 2021 04:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A9OpObOhNKRT1oPCp9Nu/AHOlXXiMYSXBYlg8dkzJ3E=;
 b=DiqnuquaXJwP3eaObksalDscAsH+YhayozsjW33Um66W84C9i6JolTO8sPjpHayoGX
 Ust6aHXUxkBKmmpQzgoYt0z4noDFlUKo7Aid+kRozpswPZwPI+u+dMdkK0nlTuOhLjBF
 ZdQ2JagFO3TqOd+66LDEiQ1243a2V6zstmblM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A9OpObOhNKRT1oPCp9Nu/AHOlXXiMYSXBYlg8dkzJ3E=;
 b=MZ2HPx0M0QSdPuaXdiLCbiO7QcGJwoSGiIirRLr7SFDrqbuYvCS4k3YfphcIBkBntF
 Ui/6EwQrknYjf556drIhtmueoJNZmltaYxAF2MN3kpICND3SfjPL5k7cvMOU4w/M+DEP
 qS2s+OTuFjC+ALrglFEAwqGAE/MORQ9AeY5apkRb+23FuyV4kzRPtPZ8SYvnbaNvYj50
 LELD/Z6IzN0jVFQCR2AJgLea8NQ0VE7m150wlDJloviZQsLI+dpmNegZXZGNo/63CAqU
 h8jWLxMEgbjsdI7Ydc8VUG/UT4IcgNjhEBTH4HQV7n6PGHkVcoF1+mjHahF8W6n3xgkX
 iilg==
X-Gm-Message-State: AOAM531Ppf1dns3I9JYL8RlrSDAicw8K3cufHjqtbdEBXkFAzoIoSxa9
 XgRn+/w/CP/cZ1yrKa7zdsA1dw==
X-Google-Smtp-Source: ABdhPJxj1u4Gxg84zfPYkvKEg+0aPmJrlpRhck/HakTm5IhumkZ5XEl0Y2WzjGh2P9uFjnQZaZYWQw==
X-Received: by 2002:a17:90a:f86:: with SMTP id 6mr3889825pjz.68.1627384933489; 
 Tue, 27 Jul 2021 04:22:13 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5176:76cc:2193:9b8f])
 by smtp.gmail.com with ESMTPSA id 20sm3506467pfh.15.2021.07.27.04.22.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 04:22:13 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, eizan@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] arm64: dts: mt8183: kukui: Use aliases to mmc nodes
Date: Tue, 27 Jul 2021 19:22:07 +0800
Message-Id: <20210727112208.2508675-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.432.gabb21c7263-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_042214_746547_4DBB6060 
X-CRM114-Status: GOOD (  11.54  )
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

fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree alias")
allows the use of aliases to number SD/MMC slots. This patch use aliases
to mmc nodes so the partition name for eMMC and SD card will be consistent
across boots.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
v2->v3: fix indentation error and add more commit message.
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ae549d55a94fc..8e9cf36a9a41a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -13,6 +13,8 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		mmc0 = &mmc0;
+		mmc1 = &mmc1;
 	};
 
 	chosen {
-- 
2.32.0.432.gabb21c7263-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
