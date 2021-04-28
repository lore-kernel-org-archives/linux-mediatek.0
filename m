Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48EAC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C56C613FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C56C613FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YR8mhfCT6WOmW6L60t5jxRTBfU45BYoDzYm/bpIho2I=; b=bPNppJki977OLucI9cJSlQwa/
	GgxN9rcBi4ItVN+rnRswM8zVsu+fQeNc0brfC39kkfvy8y0qWu4X+N23eArWdX+jjaiND8UUcl7g9
	m1KQR8uP54YMSDzZ96+/k04tYg60VOnGfKGhZsewYc4yC+oXG2NJuR2574G6PCNYtVJNZ1igKZMTY
	sHsCVBJOx6BXsfVHFJ8cBeVOEKGIZ7QKRsKwFATgnrJ0RqjJmARxQzQOEefnMUF/ChSQN4c3VXy33
	UNOaOxkdxBcfhe8I6VVMpdmmRxOblEwOGdgPhYRdZqFucm4qTcPsQX7PWVvGfGqeEqYy5yDPn0IHw
	uDeRHvViw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnHM-003rPO-HU; Wed, 28 Apr 2021 16:43:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGh-003rGV-Ke
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KSF6Pij+oCZWv8GIdJGXO9GyJLWrt789k7MQt6XyiRs=; b=P7sg0AD3gjLpicvnLMJdy9maR+
 Ex+z3hs8SdLZV1/kHb33NzxC/sk/Qf9Tkz1IazLEBI8BzhTTyngMwuMJC80PtqrznapwlfQqGlA8H
 pSagKGz5gHzyBn7ghWOMSpjv2p4xGdymCNxRaQHUk/DeC9bT+C4k1VoGS/8QNFeUKpUpdv1r1WOsm
 m5P3okPD5ULVGGKAxlwhf6YpokFHqzNQIGgI40RIzdPHfCC2WC8rCOHqtZag6hWszs0GhVt6bZ72D
 ZoLKIBjJO7MfHZwYQzsNdxqC7qUn2I9+HnyhBLmgsih/Q8Fq/+q5pDPaLovsezW1Bd6l9Gq4aEFel
 RiC/571w==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGe-0001e3-Mh
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:42:30 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 a22-20020a05600c2256b029014294520f18so4854839wmm.1
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KSF6Pij+oCZWv8GIdJGXO9GyJLWrt789k7MQt6XyiRs=;
 b=OQOO4MY6aSibgH++lNkvFpbOmvNXA7h9sW8y6dafOcjjjW1+d6WJP3VgTNCRmFVG3W
 nRGU4J90kEj+nRDYYxk74wirKyfsHKxJf6qYuScw4/b8WKyeSFP+jyTIeRgZI2EufLvU
 7pR7yKWfFsbYo5y3KQxC4USfsByJuNPnGVRlyv6oa+fZX/EZumWGOih904DSSWVzC21W
 maaxVK1Kp4+ZqUvRybJ9hHrR9Ugs4ewdv5u/7zjPxLWqnsML7vB/i7DIK7hISSreCEPv
 Gc9PW/z2fcc2alytzLatTnrdZSQUF7EpkTiRdCnhA5XhHKYZJtHCPiVw8uY5RDPiRCqj
 hE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KSF6Pij+oCZWv8GIdJGXO9GyJLWrt789k7MQt6XyiRs=;
 b=FX8ggTGSFUvSmkJOCQ1C4lBE0on1yh22lmjU+tTvHXVSWYVi69yJsIBBu89mdW/kOV
 uAeEjJkL42jXN1zYqReFdCjnfrV7GWV3XCwyco0Ozw4I3CUmzrFi37GjAUR9g2FsIfn9
 jUO/iui0mLrtUnOd/6UaUN94o08EqIxmhqjiblRGNnStoqaUyPfInI8RlzAy/IhzzJNQ
 2EyjOetaOrVR/TJkTZxEjWRJ4Kq7mHsyFBbAA+rn9CL4FmwrRXQo7MEUhFeLLxN4MPN9
 jcIQD+FsYvaKpz8MhiJhw+9cws17MZNY+6KMnjt5C7tvKbF6OrbveaOqMyGzE/4/mY9j
 xB4A==
X-Gm-Message-State: AOAM531/02n6MHOnAK9fVqAl+BA74gVRIsyR7O1ffhYZOdHOecHLqCJl
 u0e9BiGOwddl/QrH3Gg3RRV6dA==
X-Google-Smtp-Source: ABdhPJyVSmNvzgpTISSckOFTwPe4BMSsBwptn//otLjLQhK4nnPGDJcuWxnqMK5HD5OOqGqB/b8sVg==
X-Received: by 2002:a7b:c156:: with SMTP id z22mr5652648wmi.86.1619628146887; 
 Wed, 28 Apr 2021 09:42:26 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
 by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:42:26 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: fparent@baylibre.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] mfd: mt6397: add mt6358 register definitions for power key
Date: Wed, 28 Apr 2021 18:42:14 +0200
Message-Id: <20210428164219.1115537-3-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094228_745078_47F7A53D 
X-CRM114-Status: UNSURE (   9.08  )
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

In order to support power/home key detection, add definitions for
two more MT6358 PMIC registers:

- TOPSTATUS: homekey and powerkey debounce status
- TOP_RST_MISC: controls homekey,powerkey long press reset time

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 include/linux/mfd/mt6358/registers.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 2ad0b312aa28..201139b12140 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -8,6 +8,8 @@
 
 /* PMIC Registers */
 #define MT6358_SWCID                          0xa
+#define MT6358_TOPSTATUS                      0x28
+#define MT6358_TOP_RST_MISC                   0x14c
 #define MT6358_MISC_TOP_INT_CON0              0x188
 #define MT6358_MISC_TOP_INT_STATUS0           0x194
 #define MT6358_TOP_INT_STATUS0                0x19e
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
