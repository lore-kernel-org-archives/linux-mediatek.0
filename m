Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1117C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 16:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hxoqc6LjNJJXEboF+FXE+sEH2czWaqJobUKYw5G2z/w=; b=Y+n+q5OsGnIIYQ
	+30m07NcQ0PGWClyuIq2yatZmnpSMjb9KMlsMLWzdUP0kFKoYb5ppQO7SgL0znM83wR5sE+R+DIhy
	A/jl6/OpzU151sUtLH8ez3btWxomPV3uU/um3GgMjgHzmfZAyaWVm8Kcx+TwA/OHrJaYCinEwGqeH
	aa8/I8Apcyverw/QJT9q1XrU+rIyS9QxOGJIg1OcO9AZH+jKi6cLLXNFWHUjxERjAiQYC2XVUDkAB
	oMh0qJ9o+uTD16GV71wLWZwa/3EwVsQIjaWAVgu/x5uanT3/hDZXQoE419SkhLvhw31Z6BZJiAGEh
	qmHdo/Y5LFBGzxowHj1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYVRl-005iGG-38; Sun, 27 Mar 2022 16:08:53 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYVRY-005iEp-Qg
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 16:08:42 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t11so17040361wrm.5
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 09:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ov+7Ck42RvbgYnt5K8SkrxtXocNZedNN5M9fAzVeOxA=;
 b=MxRx89uyTMlNU5ntlj7aSXIW5vG4yJvQ5UTnsMDhUYL7vtP1EKhgp8u/4WdzLwMuDL
 iWaNb8uSukU1Zsvaf1SxzzqJmBIS3f2nKDvlHdcTyVMbkLOBPmJ/SKgeo6yxQeaIGlRj
 ciofPkh/CyaVHAcwierKv4QWtKbAlVNNo584n5sFIc7b/eshu6V5i2m4JVPwwyVp6ono
 aI7CTuk54iUYPSbNCSf5SckE/aEA8NASGwQmNookRjp0j0B4T9ABXR6lRanYb6dAP5GV
 lgq7/X5JG9HVDl3c/Af9Pw+ZSXqk+cLmKizq/IF6ZFFzd7VmXzhjgWcnBtlGxdkM27Ga
 yFiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ov+7Ck42RvbgYnt5K8SkrxtXocNZedNN5M9fAzVeOxA=;
 b=V3qqIDKJjKByzIlm/7WfXN6j/e4ApKXikj1YE+yr/ZzHSvJYZJG73cjpRkC8NUSn9r
 pCdSJPmSWfdSImjOewNinlGi3gE+d5l21mFmV0S5cGphuIBFAqX0n5SdVoBntBt267X2
 PO2/4Nj0nYSpjPrtoK1vd5/DPjqQ9FY7imcjcBCRBWQsYXlLKDdG3bYHDU06gz88/dot
 bnUCIl2QcsVyjsLXZvSxWxaFPkS9D5HJHde6sWjvW/shatKDV/FLGOGHLk8OW9FY6Xpo
 Zw+TBAhDrqB9UP2gMbgYlXFYGImOd8+c6umbPESh6YlBhNnOl9pRjRgbsLk6aGnTDlTM
 a1YQ==
X-Gm-Message-State: AOAM530xZfzz6S7dJ05i6PdUPr8+lRYksG0ZxugsGwuD++G2rGnxupNp
 4bTzjp3rwiQ35OabF/jJKhCHig==
X-Google-Smtp-Source: ABdhPJwzeaGl81CkXL3nxPc7P7D9Xdw/+Q2JXGwaRyYkFlUNX56vEB3lxgaITvOaWZMekEn/bA0MaQ==
X-Received: by 2002:a5d:5607:0:b0:203:fb6f:3c88 with SMTP id
 l7-20020a5d5607000000b00203fb6f3c88mr18432363wrv.261.1648397318694; 
 Sun, 27 Mar 2022 09:08:38 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c020600b0038cbb21fb00sm9425883wmi.39.2022.03.27.09.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 09:08:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: mt8195: enable driver on mtk platforms
Date: Sun, 27 Mar 2022 18:08:13 +0200
Message-Id: <20220327160813.2978637-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_090840_873368_1F81CC0B 
X-CRM114-Status: UNSURE (   7.95  )
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

Set the pinctrl driver as built-in by default if
ARM64 and ARCH_MEDIATEK are enabled.

Fixes: 6cf5e9ef362a ("pinctrl: add pinctrl driver on mt8195")
Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/pinctrl/mediatek/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
index 66db4ac5d169..8b20109559b3 100644
--- a/drivers/pinctrl/mediatek/Kconfig
+++ b/drivers/pinctrl/mediatek/Kconfig
@@ -158,6 +158,7 @@ config PINCTRL_MT8195
 	bool "Mediatek MT8195 pin control"
 	depends on OF
 	depends on ARM64 || COMPILE_TEST
+	default ARM64 && ARCH_MEDIATEK
 	select PINCTRL_MTK_PARIS
 
 config PINCTRL_MT8365
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
