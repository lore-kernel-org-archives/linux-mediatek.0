Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D9ADC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 18:12:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D235C20723
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 18:12:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qOsQnCjX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bsloMzFY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D235C20723
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4dYCz14FJ1hHrAF+CrGXYFYVsNixIpfpfF9hF97ObT4=; b=qOsQnCjXyeeEbaNm5sOGi6m66J
	uZz9Qzo4VKxlw+3FrrhjsdQZuOesNseZLxR0yVUdIAS+hyGA9jGeWd2HhXdNsKyef1JU8T8qUuY+n
	3q+FHhlLdPcoGpBJN/+NHLWeTqCeoIGCadSfX0YFAI+SN4gRWT6396Ed0KWUgPSMY+yDH5DWw2yjb
	bwLfHcSVd4IN3zE6oOnLRt0F3Noi6fGAeUuomUGI73WG90ZMJ18dCQ0luE7X1xwqdwXiFTGycv9/F
	NEwDwKbKdATnX+rfAIvk6FopW8dE8duCiU5nmiFvDIMFSVEa0AZGefKOdXzuHWD5DQHY/70S7Gslp
	E5qlNKKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXTS9-0007tx-9e; Tue, 27 Oct 2020 18:12:13 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXTS4-0007rQ-VP
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 18:12:10 +0000
Received: by mail-wm1-x341.google.com with SMTP id d3so2414848wma.4
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=er1O3yHYE2dfZAtg9MYR2G3dWLGNVrruH1edHcefbnw=;
 b=bsloMzFYU+sjn0EHCNX05u0v3HMhR+DRCYOINuw9yP83GdKxOWN/pwJB6ENsBqk+BP
 XcKN7YCcvKAcNJ/Eym826aUQFudPqSpHk/rSkprBQ/WThjLkTBak4eUvLD55f3xB7DmG
 yQRmXNFymQbfm+s2BJaWBQAsv20oLjMmdbvRj/yMpZLz6icRS39vvtotJZV1jU6fFm3c
 wbsV+vgtPg903HKuTKoA0HiLK9Je16Irz5+2MdRP+bGmGVHuz7gWvcQFkyH7OXyA4yLC
 HNsipqvMDqVKgfW4vQ6XBnl/8k8xvpwDK9ikVyglSIWlGg6M2NZTj+opD30VLYOzXA/6
 mjSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=er1O3yHYE2dfZAtg9MYR2G3dWLGNVrruH1edHcefbnw=;
 b=sNg3aNkeOZGn4XcUEX8V1fjNNP0A5s6/zJKn74wJ8pEdFe51Y/PaN23sZW23mHBNBi
 kBrlgQlJkvlXDd6LrIMmKsYKPZf4NsV1FucqknOc9Xp2GMMSUoboQa5ctwuiM+HOuPGB
 MjS4G/2Sk51S0xl5quK2Gy/UFWNyXMpTQuGM63Igsg7v2S4X94RiwQUwEQ/zP2Ev2UW9
 J/Hl946eV9mIzGBnvNQJ6kZOmvpBmiW8Hctz85ZXLgimooMCsEnDqHuiqaK22qfF3mJ2
 QbNYbvbhXWTGyPQzymbT3aF3qqyfg+IcUZ1hcFZ7XJ0JTHbu09mpap97tqtj0dAmtjbx
 l0/g==
X-Gm-Message-State: AOAM531JiAo6pOhOBBAUhtXIpFquH8Bvg38yHO7qvm9ACR6z+1N/r2ZK
 ODlsc8jHbPlltooMffHHQwt2Iw==
X-Google-Smtp-Source: ABdhPJzOJI8JYV3oC0Xp3xAlpwU1KLwVOsla33zNeb7gIVy1xaeHbaIkQWpOBckqDBLzb/eLYApw9Q==
X-Received: by 2002:a1c:98d2:: with SMTP id a201mr3882929wme.166.1603822326283; 
 Tue, 27 Oct 2020 11:12:06 -0700 (PDT)
Received: from localhost.localdomain (159.174.185.81.rev.sfr.net.
 [81.185.174.159])
 by smtp.gmail.com with ESMTPSA id h206sm2801224wmf.47.2020.10.27.11.12.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:12:05 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v6 RESEND 1/3] dt-bindings: mfd: mt6397: Add bindings for
 MT6392 PMIC
Date: Tue, 27 Oct 2020 19:11:54 +0100
Message-Id: <20201027181157.862927-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_141209_248952_9ED2AA49 
X-CRM114-Status: GOOD (  11.87  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---

V6:
	* No changes
V5:
	* Rebased, removed regulator documentation because it will be send later
	on in another patch series
V4:
	* No change
V3:
	* No change
V2:
	* New patch

 Documentation/devicetree/bindings/mfd/mt6397.txt | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/mt6397.txt b/Documentation/devicetree/bindings/mfd/mt6397.txt
index 2661775a3825..f051a951ba72 100644
--- a/Documentation/devicetree/bindings/mfd/mt6397.txt
+++ b/Documentation/devicetree/bindings/mfd/mt6397.txt
@@ -21,6 +21,7 @@ Required properties:
 compatible:
 	"mediatek,mt6323" for PMIC MT6323
 	"mediatek,mt6358" for PMIC MT6358
+	"mediatek,mt6392" for PMIC MT6392
 	"mediatek,mt6397" for PMIC MT6397
 
 Optional subnodes:
@@ -52,7 +53,10 @@ Optional subnodes:
 
 - keys
 	Required properties:
-		- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+		- compatible:
+			- "mediatek,mt6323-keys"
+			- "mediatek,mt6392-keys", "mediatek,mt6397-keys"
+			- "mediatek,mt6397-keys"
 	see ../input/mtk-pmic-keys.txt
 
 - power-controller
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
