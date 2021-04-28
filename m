Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F28C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:44:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41E9B613FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41E9B613FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l/JZXUW5+JP21iSZ8qgzbn9Jk+OnXjidPdiyvfI0A2Y=; b=rLnGlncv7DPtaT68JWvJDEnYo
	lW+ZiSyJWAfsrJjjn4mTwJfGek8gpC4uov+bpxUu/wm/1hDkj4TtkcVq4LXKCECAJXNK7Tt2iKMEV
	nHU7AVAkeqYNQsOW0ReyKiCUXIf/d/dPhcmyLJoNs5F2OrE0K4R/n4io8HFx+FuWZKIdxpRHK5Gp+
	1eAGH2igsf3RRYQVpDRqRZ+vfSqcDNashAe2N9g3T+/HFTTbCSMLxMZvnpEwzeCHNzZKCDtzGxegM
	kQmdcBDBzSV7vLXvscCh0bVldX7YKps802fnwRaQkH6ihZ+MyonW2R2P+bKG/72a7brAV810qOjiQ
	tPC3N2ZzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnIk-003s2R-U0; Wed, 28 Apr 2021 16:44:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGl-003rHG-T1
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:42:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=rEhU8Um5f0JiN5UeHBJI5GyHDmhvUyYTxNlEBkR3UOo=; b=AMzfovCPC2BK24AGM5MGpPruxn
 4qkVEBHXtodFnvp5hKAmB7BnuWPmRUojnejg7srMShJWDd7i4StR/JcFzOyeO0K0BzIcZWK6EDe7Z
 YTxTGl+T1hO4fPGSwxW3wbiiVNnBfilV7iT2sTW9I7DdFNMj76+MqycGb8qRgwRpQ/FFQMOAoEWMx
 3cBcvzQFhmRKmGUR7DXJ/ZCk51cjO9ErFLWXELIhaae1a4hfYve85lu/bAgaCQjyQWZNJaCnO8910
 bzYaOZTo8+qtSqO6SiCH54tVcGBRSCMSLUBOzVCaV34FjnrCTot+onZYI8iDAYknDSr0XS8ySFGdI
 dujvyQ6A==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGj-0001hX-E9
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:42:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id i129so7235542wma.3
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rEhU8Um5f0JiN5UeHBJI5GyHDmhvUyYTxNlEBkR3UOo=;
 b=VANfQzQ0qON+/3vbMLMeo4ASaKFeXcGWMD6nIW0LD8DjR1bqi4cUiu4gKKeaLke52p
 qIEKuNpnOiXnFStis487cvxwy75vIEhnZF79j6c+Q5ahIwL+kzfAT7nTBXd5/HxTSdZi
 QqgCB138YLKciSWvIYZjC7A0qhuIk30UR5sjlYySEmRH1PrnbMdP9YSkE+V9amPfgN7R
 AXkAk5vkO9Ium1n1CU3J6s8MQTXDVaaN7pxpwVAZJnt8+UfamsBUWFB/DswEgxNwaSHV
 aQtt21fZi05Tu0+0dIIOpug4QInjppHkAZ7KtIueLir5KFpei5pMLKyBuRUKPElfOmzU
 +U0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rEhU8Um5f0JiN5UeHBJI5GyHDmhvUyYTxNlEBkR3UOo=;
 b=ivPyBgeeKdc/066f1ghBHSQZpXR+s4GLKjgmmSSQoY36RIrxPoNOHVrfMwqRe34aCc
 /8FcFptWKpT7bnF4GDxOTxj1RadPuTiIhy4DLN2GXjavwEx7JlHPKYy5jGzUoArnEGim
 wYLdJWBQuvyZFTkA+tHQh3qAw+BHdnWSBB8WBHunRaanIkDJPYzkN/+dnUn3vchFwj/5
 l6cABHBAfGdgrlrCi2ZhLDzIQUcSkJTDr8TPjSbtBEbUOYB2X8YT5J+1g17yiDuu1g69
 dwzlCEocInUUil/20Rahe0KNVGKPdFRahl/pnE0npt4ywiW34FCB5Mx0MXHrA9qCsFmY
 n1JQ==
X-Gm-Message-State: AOAM533c3yxnzIV+vidKWyMTj12vyVoI7xuyri8/RbPE4R8fWwIVt4/c
 jU7iYOMzv943a2WQgTaydOdXRQ==
X-Google-Smtp-Source: ABdhPJxng5RPhsw/McvY8XrJYzLmH7UXgx8AS7ZgIpJmZ5h8u3Ww/Ds6Rad8TOErgiFInrsHrO7P3g==
X-Received: by 2002:a05:600c:2cd6:: with SMTP id
 l22mr25791567wmc.160.1619628152274; 
 Wed, 28 Apr 2021 09:42:32 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
 by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:42:31 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: fparent@baylibre.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: mt6358: add mt6358-keys node
Date: Wed, 28 Apr 2021 18:42:19 +0200
Message-Id: <20210428164219.1115537-8-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094233_527713_ACB15C5E 
X-CRM114-Status: GOOD (  10.35  )
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

This enables the power,home keys on MediaTek boards with a mt6358 pmic.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index fa159b20379e..a1b017a6a751 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020 MediaTek Inc.
  */
+#include <dt-bindings/input/input.h>
 
 &pwrap {
 	pmic: mt6358 {
@@ -356,5 +357,16 @@ mt6358_vsim2_reg: ldo_vsim2 {
 		mt6358rtc: mt6358rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
+
+		mt6358keys: mt6358keys {
+			compatible = "mediatek,mt6358-keys";
+			power {
+				linux,keycodes = <KEY_POWER>;
+				wakeup-source;
+			};
+			home {
+				linux,keycodes = <KEY_HOME>;
+			};
+		};
 	};
 };
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
