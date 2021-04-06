Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0CAC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:19:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F12613A7
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 14:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F12613A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/tGmPxfjPXDBjkjp4r7CMOeLXay5QEt4AbXnPP8nLhg=; b=bYIfAQcVgtezmD3XLfV1A4ZI7
	p3yWox0GOdpTU2e71NCd48b34WFMLfAhUWohd71sJxOQHz9XyMwvnVHg8mk9qrWnWqebv6RW9O6L0
	wE9DnKT5/oY7OW2BbixmHP+u/U5bxzCr340Im4pbainV+dpBSAuUVg6K7GxskUOY8qaJ3NVmmxvGw
	cRuAbxNDuDSuTen6MB5duJd6h8b9s62jjRued/cJij/+7iEEjFxlsQI/7DqNIHrHlzWPWGJP51CH7
	ogRJzfhykGuHRo3uGDi28+zQI+DgKL28NNy/l9xESjfNwx56lMZP6acu59XccBgt1Qh3EVgaSTN1M
	+xpguz6NQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTmXn-002ows-IA; Tue, 06 Apr 2021 14:19:03 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTmXi-002ovt-Q1
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 14:19:01 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 b8-20020a17090a5508b029014d0fbe9b64so4002866pji.5
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7DjmGF6FnRAdOMOxx79iiAfLHcA67arTjIOWyK4tFvc=;
 b=tuFpQyem7+MyofHl1KDCGxnIE9BsTsqrcTnmIFRasapf56OIPO5TFcMvR4t2HLcAWp
 90Mv+yNotGjgJpalZ5jOv/CMz0jwjXmk/aREctLFBtXDsiQFAMidyoFqZkm1e3O71FiB
 PyLTZtBn5+kjv4sG9tSau9F4RUuYcFvM38IQ5Hv6oD6oUUhTFk2sQdp1ik0ulyw9bZly
 FyAKL2w92xiT7L3FQgCQJCJ1DW/1sOuq8wRnpqEtGAzTFDgX0VKmD52L8N5ljh004vBf
 iaVQlizsUAhnF6ksf38ZqqZog3InF4u6fOflhNW8wskTyPj0T8ZJA52ydK2wAl2OAvTK
 DqiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7DjmGF6FnRAdOMOxx79iiAfLHcA67arTjIOWyK4tFvc=;
 b=kqDJzR5vE0rszO+eMoqw45kRPGRsDtvYshF4BMGGXHzhGZWJbl6/0JBsIy1B/T100q
 9k1Ls8yNqN9qy+JOecNfn9FHhbq7Ev0ZtiD+8DhHZhKlKydd5ADUsIXINnlXePe+Kj4O
 PGC4ulF0L4dm9EnjmoaeeJuolQ5BlQ20JZlYArq2gxucO0xbKnfsQ0qLWa22BN6Rgc7/
 DLWWx13jDQ7YaL1bs5xX0jYBfcnIg1sdixxW5TKzVSTwc/u+CJSQY03Jk2+1y5AsqqL+
 gZHtG5Y/XotdxF8lS9BjtFCx1HrI+ToOYogFruSMuHC+dT/NkZ2LrXDYb5kXCKRatg4W
 mSaA==
X-Gm-Message-State: AOAM530mub4D9TKO1IfgORLk0bHgtA9xmXWh2VAVoxprypWRNZ+9hvp/
 qRlnf+SaAUhhntxzWD+p6rM=
X-Google-Smtp-Source: ABdhPJxsINrnkef2tA65NnbGwjhL+miREBITUbGbg8CoFi/8e+9oSsiWo5WIJE7CIo/QexG5M3g2Jw==
X-Received: by 2002:a17:90a:7064:: with SMTP id
 f91mr4768709pjk.89.1617718737378; 
 Tue, 06 Apr 2021 07:18:57 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id u1sm18337581pgg.11.2021.04.06.07.18.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 07:18:56 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [RFC net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt
 controller
Date: Tue,  6 Apr 2021 22:18:19 +0800
Message-Id: <20210406141819.1025864-5-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210406141819.1025864-1-dqfext@gmail.com>
References: <20210406141819.1025864-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_151900_012056_938FB76A 
X-CRM114-Status: GOOD (  10.25  )
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

Enable MT7530 interrupt controller in the MT7621 SoC.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index 16fc94f65486..ebf8b0633e88 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -447,6 +447,9 @@ switch0: switch0@0 {
 				mediatek,mcm;
 				resets = <&rstctrl 2>;
 				reset-names = "mcm";
+				interrupt-controller;
+				interrupt-parent = <&gic>;
+				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
 					#address-cells = <1>;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
