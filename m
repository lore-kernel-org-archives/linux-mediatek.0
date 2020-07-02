Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D43C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:24:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 602BE20874
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0nXAnUQ0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="kHYTzLii"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 602BE20874
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Sbo8FnfWuafei7U0WJk6gtzspNckbdlXCrRfrd02oTs=; b=0nXAnUQ0puCprXwCPVDmaOlJW
	DdgaTMe600NDlzaGo4V1urJzZ1zHuj+BVXarOUnpBtKn8a6OEMlu4VOWzUC4ao692XakACHB97KGj
	gS0e3hRIu1Jf03YHOCzhWKkjQH5B9OQDu0yDzs9XZP5XP0lb66sXClTnjp/Muo7SpYGDcBd0Q6cd7
	QZU+XufeBnluSbUuL/4ME1IPr1G7Hoth3ZxdskbF9XShjvof+KcsLE/2dUsK7vC8R486L8evoGRZi
	xy2eUoaRxmuCKX1SX82+aGyWBxWK5g5qdTC/iHNG1E9JNLidVrPZvs9PG9iPbGYCGVLGABIs0+rS/
	eWBcRPrEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqsdn-0003Rv-KK; Thu, 02 Jul 2020 06:24:11 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqsdk-0003PF-Vk
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 06:24:09 +0000
Received: by mail-qk1-x74a.google.com with SMTP id k1so15573772qko.14
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 23:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=iAAvm140uabXTl+jHo1MA3XpYMJqItzUT/T49Tq/jsE=;
 b=kHYTzLiiwAcymrEuy2t4xpNOUScn5Lchdcc0t1JjYbvXgAyblfAUldguvPrFi7PLsL
 OMO8k+MiyIOHXgBHn9cqSUo9/EL+vvY3zcwjjCrbIOXtzed3gWpla8EgWuFG7IaUyjUa
 KpievEzGpDkxAuuwmZ5LtpmfMjXczIXZcHrlEmBSgrei3aOLWhrE45hATpoT6SKkg91x
 hKlyrvyBHwteXHacR1PdKN+Hb+aLWoO1q0zUVJU35WVF50UbggaRcrDcPAfxl0RZtynv
 lSE9bipkznoS52wS+CJHh9YCG4FxQUBzvEPX7iLtHBZcNH3lLYrk4b5BptcgTQwH4y1B
 d3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iAAvm140uabXTl+jHo1MA3XpYMJqItzUT/T49Tq/jsE=;
 b=lROsPcmxCb4suRqLgejZDCQwSX7C/iPdC3RDGxPvSMeCcGuGPk5mhYrACO1CHPYmdJ
 7rLmck8tX1MelP748ghhn5dnUxS/Jdr74/OQUxsoIfHZiVGVOrAChW/utnfNqN/qfRIt
 MqmyAa6d/5BNQk9/GQ/LqR8F3+Q7mGuClDzA8q0r3dcTE4cqil9rE+ID5b6QfS6O4r4O
 mgQFYnnIB8PM+dweyOfJtoD72Zp2I7Xm3edHX/j6JxxU+rPZWLYJR+ds2ID9IUGjNwpx
 n9SNbBQq2obemLm8LS/J1xMsf2QmwgrqmjwMLj4WyU8rPQwaCbBqJHoozz+H9LvJC/FT
 Qd7Q==
X-Gm-Message-State: AOAM533GtTsDEKlPQhPiZTkSSrMfYpxW32iXilVlUwGs7+y6E/HmBc4g
 fG0sNwgds8Y7+pa7jArhC3z6H5dGuzJpsffTEGr6LkI51WMVRSnj/HCXXqNNW/Ws4cPxlsggOl1
 24mE1JyUzQrC3SFY+vMrX7IDrgG3tmFjFuUwMqd4/YtCYJ2uiZRlvbU7XyoWoFsyahf3lUOTs99
 Cwxznb
X-Google-Smtp-Source: ABdhPJx5gWyUPIpirkdQ+kayP/qflMJSBQVvzakrGUJ3dxaXfYaUR0EhWXVX6sjNNxNRPVQuX/3W7A5g8oJn
X-Received: by 2002:a0c:ab55:: with SMTP id i21mr29086666qvb.139.1593671046028; 
 Wed, 01 Jul 2020 23:24:06 -0700 (PDT)
Date: Thu,  2 Jul 2020 16:23:20 +1000
In-Reply-To: <20200702062320.2903147-1-amistry@google.com>
Message-Id: <20200702162231.v2.4.Ia24db14ffcd7803db3a728e15fa9fb2e6ce83e0b@changeid>
Mime-Version: 1.0
References: <20200702062320.2903147-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 4/4] arm64: dts: mediatek: Update allowed mt6397 regulator
 modes for elm boards
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_022409_071785_4FD4C9CE 
X-CRM114-Status: GOOD (  10.31  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Anand K Mistry <amistry@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This updates the allowed mt6397 regulator modes for elm (and derivative)
boards to use named constants.

Signed-off-by: Anand K Mistry <amistry@google.com>

---

Changes in v2:
- Introduce constants in dt-bindings
- Improve conditional readability

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index a5a12b2599a4..e9cfded307b3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/mediatek,mt6397-regulator.h>
 #include "mt8173.dtsi"
 
 / {
@@ -926,7 +927,8 @@ mt6397_vpca15_reg: buck_vpca15 {
 				regulator-max-microvolt = <1350000>;
 				regulator-ramp-delay = <12500>;
 				regulator-always-on;
-				regulator-allowed-modes = <0 1>;
+				regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
+							   MT6397_BUCK_MODE_FORCE_PWM>;
 			};
 
 			mt6397_vpca7_reg: buck_vpca7 {
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
