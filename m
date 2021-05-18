Return-Path: <SRS0=DTMy=KN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D125C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 17:54:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE693611B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 May 2021 17:54:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE693611B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9KO4a/zU5O0K+koMWKBBm4hkQIUsgekMoj1ZaFIrOmo=; b=qZZ0ar8NAjN3ThdDwPlHJ43eJ
	7lF8giKqrVpae+ZNWl5EYlXv5QGgWx4sAc0WK3rfukpsvaY1sQmkVwjxsMGOYLwfFEH6kxRQw3OPx
	IenWK1khDnb+NcAPvp13uMB6qSE1WzjYDYeHxa2q49K4UjOC8ZvtrOxt7q/KaxrvE+cfCJU71paLh
	4jJDAODAFgDxgqhocyLT0pzf7oot/CwzFSmEBhF4opFDH+CP5bUTx2uveQ0a6stPMnTYKmSsX87y0
	Ia3QnD/chUW6Lf/56DfSbSr1skLT/F6DOK2YM7ooLuuYeSqkkPnMbCGQVwBKzyd5fxVk3eLO/hgaK
	XJu1S2Wjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lj3vY-001XXa-95; Tue, 18 May 2021 17:54:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj3vK-001XVL-Fb
 for linux-mediatek@desiato.infradead.org; Tue, 18 May 2021 17:54:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PLVQ7hIqXEULCgZ/4wiK8+ueeFxBJlxUXknsRaEIBHA=; b=tQF25KtDmbUnPPR/2k9+KPlt0s
 2h7aESw97pMGXAwe7WJ0SMufWhxr1Hb4BCuXUJphSZPIJNfAVE++UXB+kNQ9xi5+EqHThBXnNtFR/
 MKtxTBgHSgmNBxIuLBFaBGW2MzuzeG5HMpDEYhcuC2T5jNvLqQ9j1ewkLsb29BykpVVSIALl8N9z3
 O2g941ALH9VB0UvaDeXZjCs0w1smJPCuEWo8kWCC15RMiqk6wSbV7m+x+Z8b1uuLQb7Y/TDH1hzXo
 /h0eZ37bftyg9b/k30pqNrfklJ6ycmBnAXyx1ofewfDXU+77XnzN7oVunKgpM0ree7AYeEpMhmXS+
 SxuYM2YA==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lj3vH-00Er08-Pi
 for linux-mediatek@lists.infradead.org; Tue, 18 May 2021 17:54:29 +0000
Received: by mail-wr1-x42c.google.com with SMTP id j14so9462309wrq.5
 for <linux-mediatek@lists.infradead.org>; Tue, 18 May 2021 10:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PLVQ7hIqXEULCgZ/4wiK8+ueeFxBJlxUXknsRaEIBHA=;
 b=Fw1hiSEKJwwWL4NurL0SjZg9GALsBP+nS9UPU6oFcZOXSdUM3c25El70ylGrJ7XPBZ
 JplQI+zkgEdFTLbJ/DJEEry6En7TI1P2kUM1wDrZKIS5FMp60iwF5y/5ctYpLqEdfaje
 zsP5m/516eJcdr/aVZFMEMVSC0yrRLz7zrhbHDnU40OQk+UyYTmT9KczAfN1pQWBW2mm
 /nnyQfkzFsOt9EGCaNN/4q5lFYd3XHKk6oD+cXu7nC5V6xBma4pFnwYn/V/cZckuQ7ao
 6zuKdep4qJflBGTs7ddu+uh7vP5JsONiuRJAnLp0ZF2CL/Y9jJzPo2HAMFppOfxgfMux
 prrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PLVQ7hIqXEULCgZ/4wiK8+ueeFxBJlxUXknsRaEIBHA=;
 b=En9bLT+GokVgBswCzjSPnoXqWU0cvYODjEAs0CqvBJmrcGnwot3oXPt7aLZI15N7qf
 ebMcc0LnggQCTQxElAE6OVWHxbZLc3rIIa64vMVy1vwKZmXLQeWvP9Y1hIFF2hqKpgv1
 Lxyu6S/ngAmtwV3o6O0lUKY8ABDSyFWi6y4y3pr3DuA3JAIYCrQxBDmv0pIuqTeZYOC6
 l7mkEPKzHIHIPKIDJMgDXM5CmdA3B1hvk0kIHPICMuZ841NX79zdkj25NHzbDq1HYURb
 00Fl8Qrjn+tNsKauqXWEzpUm0cTGtFZvP3rP1aJneVgEvhz6wNpUhvzDzn48ALZ2IfKN
 KtFA==
X-Gm-Message-State: AOAM530nMlJ94RJ4m2ZFTXEyaCuDk2Tpa59MJleULbg52nHcffVf/Mq4
 cA9x2+/gkL+DQtxXC9nBBrUOdQ==
X-Google-Smtp-Source: ABdhPJwm91GbLiu6awzKvHAEIvP7ZGY0aWkr8qz5BvRRbbR/Sgfv5RR/wmv+HKpYkgxbUn5hDqfw8w==
X-Received: by 2002:adf:fd04:: with SMTP id e4mr8455935wrr.116.1621360466340; 
 Tue, 18 May 2021 10:54:26 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id a17sm14458963wrt.53.2021.05.18.10.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 10:54:25 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: pwm: pwm-mtk-disp: add binding for MT8183 SoC
Date: Tue, 18 May 2021 19:54:20 +0200
Message-Id: <20210518175422.2678665-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518175422.2678665-1-fparent@baylibre.com>
References: <20210518175422.2678665-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_105427_851362_21F24918 
X-CRM114-Status: GOOD (  11.14  )
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

Add binding documentation to the pwm-mtk-disp driver for the MT8183
SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
index 0f016c81cd53..85bca1c59f95 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-mtk-disp.yaml
@@ -18,6 +18,7 @@ properties:
           - mediatek,mt2701-disp-pwm
           - mediatek,mt6595-disp-pwm
           - mediatek,mt8173-disp-pwm
+          - mediatek,mt8183-disp-pwm
       - items:
           - const: mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
