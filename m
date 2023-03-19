Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F95FC7618E
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 07:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZrlTZviMosYAdumBp1C/rmRwTbY5dbobt3fhT7ZNq4=; b=MpOrtaLim22dr4V1fI7/1qLa6Q
	H7qUHpzZfPUuEFXz5yRgLaiYleGYWnchnhBipdS+lDSn5dGChg6NY0nPPRONIxaW6CpwNSPvrzQ2y
	EpNpC+y40D2wncNahPst1kcacRYexva6YF1ooSfMp1qUmq6QmWEUCC0nKTO1+9FCsaBcx7iQOrpAS
	6zpNd8wHCz2qsLgv2fO9V3qjijYBvL+TxlhlMeWP4vCzxz9CiG8U9H0X49FW2RN6/73tkqM8qSfp3
	ucK0dTKULXCXXKDs8zwnLjzTYZRs2DfOSzJwuROL0W47EBUM2efdOXmkmUv3LlEplUpxVWcRM2w/X
	Kq0ef26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdnnC-006Ah3-0S;
	Sun, 19 Mar 2023 07:49:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdnmy-006Ab4-2u;
	Sun, 19 Mar 2023 07:49:15 +0000
Received: by mail-pl1-x62a.google.com with SMTP id u5so9485049plq.7;
        Sun, 19 Mar 2023 00:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679212152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZrlTZviMosYAdumBp1C/rmRwTbY5dbobt3fhT7ZNq4=;
        b=X+pg4c0mOXxK6FOIAMJ5fIB0gUD19QJRsJpkZldO9Lvj0mN7+oG+QuoGQFkwZzu0AE
         z6Pk40GIptJ47b76evr2q89mo1zasK44X2GEeyHo/DjnL/v+es7GMBIRMFNbiDLLd5RU
         TY6p58uv1vcDHdR+I5de5R33053JXpFEKFpv4vRwnBs7NDWQVW0X0sBcAxfT/OlLvEaU
         TqwT0dBWYoCuB2P0M9Vi69eyt0dMCTjS81umiOiHeZn8JJgfe39PbDe1+rmuuq4I0cjj
         RupnZ8ukauNxGZ69lbokRo0zrWGdqvYlKa72Js7wLe+wHfUB6KiqaT16y92CpMf7upfL
         /JKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679212152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZrlTZviMosYAdumBp1C/rmRwTbY5dbobt3fhT7ZNq4=;
        b=yCgy0pz19hc1gXgGqgkL4Jx8IrN9fhlQzEu4/yrlfW5wsqm0hbvrzBdOyNb8PBamvR
         CYs1n+rbVkEIcRlLZrpyaTL68PMQeEDAMU/1My9uKi19tXMMTaRga/RW1SN4jlu+2iq2
         R92yRh1xR/kqIricjfTOkAVxEUpXAfBQgRLL74YIg8u4+QnnmlrIszE/z4MQYBYn1YB9
         F2ghsh0FWzLL40fAdNKYphEqs5q8iEptrUiaxX0oe0if5LNINHgDWhPj8KNU1i//h8+P
         Z5X5OgEJDIoKsiqp2uDe1U6saXUWhdes82LR0yuW4+bRxL/URMl15EjEoxhto8e2fyEI
         CLOQ==
X-Gm-Message-State: AO0yUKV1Iml5B4a+x5Q3L7seoij17mYRsOOT+zROn+g7ynk8+IqCNcby
	sAJhQc7GOGPg/hO1eXZSZCk=
X-Google-Smtp-Source: AK7set+WLYRvVX9PN/cMN/rjPLFOr21daQFrwvEIa9L6A5+kHYsJszqEgnUoW+fDdfm5HpJYypHBZQ==
X-Received: by 2002:a05:6a20:6a20:b0:d5:4ae5:b01c with SMTP id p32-20020a056a206a2000b000d54ae5b01cmr16518677pzk.8.1679212151856;
        Sun, 19 Mar 2023 00:49:11 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-29.three.co.id. [180.214.233.29])
        by smtp.gmail.com with ESMTPSA id v15-20020a62a50f000000b00592eb6f239fsm4176967pfm.40.2023.03.19.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 00:49:10 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 1EE99103593; Sun, 19 Mar 2023 14:49:06 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux MediaTek <linux-mediatek@lists.infradead.org>,
	Linux LEDs <linux-leds@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	Lee Jones <lee@kernel.org>,
	ChiYuan Huang <cy_huang@richtek.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 2/3] Documentation: leds: MT6370: Properly wrap hw_pattern chart
Date: Sun, 19 Mar 2023 14:49:02 +0700
Message-Id: <20230319074903.13075-3-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319074903.13075-1-bagasdotme@gmail.com>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2990; i=bagasdotme@gmail.com; h=from:subject; bh=swN8Gr8RwqV1p16l7dEo74K7Y92x/GvHgKTiCdSiseE=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCli+/Kbpi1xN1Z88Inlx8HfUsJHkudlrbK7vitb+2pJV XYft0dSRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACbCJcLIsIVb6NmFG2x9BVN1 ZX3ez9xnnVFy+Za290H+CN5ZzxJ+hTIynNw+86Ax40apCc7njojf3GlXniBcG33do7HBtu7FybJ dbAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_004912_948897_1B55F308 
X-CRM114-Status: GOOD (  10.99  )
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

The pattern diagram (chart) of /sys/class/leds/<led>/hw_pattern is
wrapped in literal code block. However, the block indentation is
interrupted by Icurr axis label, hence below warnings:

Documentation/leds/leds-mt6370-rgb.rst:39: WARNING: Literal block ends without a blank line; unexpected unindent.
Documentation/leds/leds-mt6370-rgb.rst:41: WARNING: Line block ends without a blank line.
Documentation/leds/leds-mt6370-rgb.rst:46: WARNING: Unexpected indentation.
Documentation/leds/leds-mt6370-rgb.rst:44: WARNING: Inline substitution_reference start-string without end-string.

Fix the chart indentation by adding 4 more spaces so that the axis label
is in the code block.

Link: https://lore.kernel.org/oe-kbuild-all/202303182310.tB1mUzU7-lkp@intel.com/
Fixes: 4ba9df04b7ac66 ("docs: leds: Add MT6370 RGB LED pattern document")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/leds/leds-mt6370-rgb.rst | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/leds/leds-mt6370-rgb.rst b/Documentation/leds/leds-mt6370-rgb.rst
index abf739e448428e..ea782797a06df0 100644
--- a/Documentation/leds/leds-mt6370-rgb.rst
+++ b/Documentation/leds/leds-mt6370-rgb.rst
@@ -31,19 +31,19 @@ depending on the current brightness setting.
 
 Pattern diagram::
 
-     "0 Tr1 0 Tr2 0 Tf1 0 Tf2 0 Ton 0 Toff" --> '0' for dummy brightness code
+         "0 Tr1 0 Tr2 0 Tf1 0 Tf2 0 Ton 0 Toff" --> '0' for dummy brightness code
 
-      ^
-      |           ============
-      |          /            \                                /
-Icurr |         /              \                              /
-      |        /                \                            /
-      |       /                  \                          /   .....repeat
-      |      /                    \                        /
-      |   ---                      ---                  ---
-      |---                            ---            ---
-      +----------------------------------============------------> Time
-       < Tr1><Tr2><   Ton    ><Tf1><Tf2 ><  Toff    >< Tr1><Tr2>
+          ^
+          |           ============
+          |          /            \                                /
+    Icurr |         /              \                              /
+          |        /                \                            /
+          |       /                  \                          /   .....repeat
+          |      /                    \                        /
+          |   ---                      ---                  ---
+          |---                            ---            ---
+          +----------------------------------============------------> Time
+          < Tr1><Tr2><   Ton    ><Tf1><Tf2 ><  Toff    >< Tr1><Tr2>
 
 Timing description::
 
-- 
An old man doll... just what I always wanted! - Clara


