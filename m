Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663BCC7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 07:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v05rQQaGlo1pyl376I/VtsiDWSss2IkaTyB0UDJtjm0=; b=eVNnz1a9wAnn5z9unLJLn8Ni1q
	MtUVWj42xpgXbcvyJQto4dQVuATWFdcnaYolaDN6AB47m85jo9WK3t/2rGBGWy0y9bCGUNmkf+DSM
	Tw1x25gfnsiXieJ7j56pNrFEDpUgS9AW/Z4tJheut5t/wzCb/Yc0BCcaaLpzaQ9AVChumBfwCzhU5
	U6dqj5awXDjqzKULkoteAk2yeQBS1yVyb3gsg8DoAx/FyktzhYAcQEaYB4JF4RXPX3pIqMyFCK/12
	w4nHiFQC9CpZuzsDdBEcGvzNL8mR2DN9AjK4umljEiU55+UDkZvtSSEagmNfQGmc0RUAvfqoICtrU
	iCrh1YfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdnn5-006AdS-06;
	Sun, 19 Mar 2023 07:49:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdnmy-006Ab3-1y;
	Sun, 19 Mar 2023 07:49:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id p20so9469219plw.13;
        Sun, 19 Mar 2023 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679212151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v05rQQaGlo1pyl376I/VtsiDWSss2IkaTyB0UDJtjm0=;
        b=ciLgT5fY5cTZIJLgLAwox4Aa/6J1AK6tg44G4ZB0dGIjqjYFMKBK5Bk4beuTI0gyC0
         79gOIRQ5fU2fELyZ9bfu1K6eGx99f+TX2eYafwWCtl/jlcP67NR7ApMZkPXkYpKjh5P5
         M9JXdZtlU/FrQz2LJWxvXMDwzshLnN/jWzwT3Wu24sx0aq53n854TGo1hA3Bh53x3Ytd
         t2q4ItydT4gQX0rjB65C21LDpkBMRPG2vum4JAqBClXGVKoU3uh4Ikxbe2ufYZpVApYV
         utTZbY7ULSmQNR59uDTjY53KSKDkxNh9HPWHURfQrbm5W0pGlYtQ0GbmDa32igY4dSYk
         zGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679212151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v05rQQaGlo1pyl376I/VtsiDWSss2IkaTyB0UDJtjm0=;
        b=qRvZFK6dwRXiqDDBZCo+fib4JtcJblAGQ/R9O9Uz9f1z2qdfpB4w7ieZnx6rcSVAj3
         4ln6IiF7mjq66kPVbMYcQs8H4N7JQaPxh20m/tySwjeIp7yhjEP5U+CcMxIx9eYZmnqP
         5P7tDKNUMhzwAOnF1C/fv6gQ5eePRK1t8KqRzmYQuvg8Tx3Z4S45Su1nMQYllND0XCYb
         8QDA99hgHbLvJLgsOiM+QXfpR2Tj6xoGukZCIDCefsUhMrpKnrppGwSON21lnLo0xTme
         UPgpf3rK0h+VLPqeLP7jHVyBLF6rydpR8kghMlcVS3idtHVe9E16kgR1qeyc3fHfKVNh
         5X+w==
X-Gm-Message-State: AO0yUKVi6Gfzv5UO97Ap0VcWFu5laLctzcOVg0nNiifhe85omII2M+9B
	E0lOQ+QgwY1SgKdc1jO1Osw=
X-Google-Smtp-Source: AK7set9Tg0zxbyUAYIOpLktcG+E6CTcXT48PPu0KmZnyA413iHs4uzzxBhLAT8t4aQgI8NimPdFm2g==
X-Received: by 2002:a05:6a20:1bdf:b0:d9:4c19:fe69 with SMTP id cv31-20020a056a201bdf00b000d94c19fe69mr588049pzb.25.1679212151098;
        Sun, 19 Mar 2023 00:49:11 -0700 (PDT)
Received: from debian.me (subs03-180-214-233-29.three.co.id. [180.214.233.29])
        by smtp.gmail.com with ESMTPSA id m15-20020a638c0f000000b0050bf6f246edsm4062983pgd.3.2023.03.19.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 00:49:10 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3F9B210667A; Sun, 19 Mar 2023 14:49:06 +0700 (WIB)
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
Subject: [PATCH 3/3] Documentation: leds: MT6370: Use bullet lists for timing variables
Date: Sun, 19 Mar 2023 14:49:03 +0700
Message-Id: <20230319074903.13075-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230319074903.13075-1-bagasdotme@gmail.com>
References: <20230319074903.13075-1-bagasdotme@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1990; i=bagasdotme@gmail.com; h=from:subject; bh=Ho6JS/QsaewELgY3oj9F2/RDEMc+m0oRO+h4IFBGt1I=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDCli+/Idutvs9ILKXzTH+c2Sb2KXPrQkNupbx4KdPBv3H Zz1j/9IRykLgxgXg6yYIsukRL6m07uMRC60r3WEmcPKBDKEgYtTACbiHcnwz8D8CPfLs7vZTl+x 2By96GB8l9jLuGInr+LA951T8q/89mFkeKh1tlf6//VFFp2Lly17tv7be4YjnRMlO95l7/o8mf2 8PC8A
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_004912_675959_94E169D7 
X-CRM114-Status: GOOD (  10.50  )
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

The timing description contains list of timing pattern variables, but it
uses code block without indentation instead. Switch to bullet list as it
is better fit for this purpose.

While at it, substitute "load" for "duty" because the variables control
timing for current load into the device.

Link: https://lore.kernel.org/oe-kbuild-all/202303182310.tB1mUzU7-lkp@intel.com/
Fixes: 4ba9df04b7ac66 ("docs: leds: Add MT6370 RGB LED pattern document")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/leds/leds-mt6370-rgb.rst | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/leds/leds-mt6370-rgb.rst b/Documentation/leds/leds-mt6370-rgb.rst
index ea782797a06df0..152a2e5921724b 100644
--- a/Documentation/leds/leds-mt6370-rgb.rst
+++ b/Documentation/leds/leds-mt6370-rgb.rst
@@ -45,17 +45,17 @@ Pattern diagram::
           +----------------------------------============------------> Time
           < Tr1><Tr2><   Ton    ><Tf1><Tf2 ><  Toff    >< Tr1><Tr2>
 
-Timing description::
+Timing description:
 
-Tr1:    First rising time for duty 0 to 30%.
-Tr2:    Second rising time for duty 31% to 100%.
-Ton:    On time for duty 100%.
-Tf1:    First falling time for duty 100% to 31%.
-Tf2:    Second falling time for duty 30% to 0%.
-Toff:   Off time for duty 0%.
+  * Tr1:    First rising time for 0% - 30% load.
+  * Tr2:    Second rising time for 31% - 100% load.
+  * Ton:    On time for 100% load.
+  * Tf1:    First falling time for 100% - 31% load.
+  * Tf2:    Second falling time for 30% to 0% load.
+  * Toff:   Off time for 0% load.
 
-Tr1/Tr2/Tf1/Tf2/Ton: 125ms to 3125ms, 200ms per step.
-Toff: 250ms to 6250ms, 400ms per step.
+  * Tr1/Tr2/Tf1/Tf2/Ton: 125ms to 3125ms, 200ms per step.
+  * Toff: 250ms to 6250ms, 400ms per step.
 
 Pattern example::
 
-- 
An old man doll... just what I always wanted! - Clara


