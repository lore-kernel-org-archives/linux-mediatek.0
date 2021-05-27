Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6397AC47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 278C8613F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 278C8613F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nr6OYPZxCasruUxNMTKEyx1pFYQh4KMBeAPC+B2xNk4=; b=UCTYFpFUuXhpmY
	T3mtYOs0W/moHca9fGC6fn0O8qu/SEJWZI+LkGbovtiYGEXd8ZyLpObChsDGW8GSK7u3ByTh3A5xw
	m/9NWYG1sfxN6vs9bgrym/w8j48HIpFy04k9UN/Ec7hYOjl20JSFOX5sX9O5mYbBfttW3Ld+3evG8
	YJRExyLb3pFolgzYbXSJnuDH1A3MRSL40N7gYtG0CVzznqcMQBKfmLnbbnHHNlv8z7mX+7FBPiMPi
	U/nQBro0jDLJdJjZr/6n5rbSvdiJQkoPOdtQ2p088zqjcR8sR2Eai8x8amP2drD70eCS4bVsjJwi4
	xkClvsiEN8Ky98pNN1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmAuc-003a7t-Ht; Thu, 27 May 2021 07:58:38 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmAsC-003Ybi-Ga
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 07:56:09 +0000
Received: by mail-pf1-x42a.google.com with SMTP id x18so3014017pfi.9
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 00:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MM8kzddH0ZuV0BgZsD6j/UZqR+lPZQliP2/mR7NqPNQ=;
 b=FnkqpDhRWtVgo98ZZzaFBu0d9tAx5+WqDrox/kScBtBSg+ZPgbBqYUf9050eZhoYqC
 UxGHrsorZlaYjWFhpa9O9UVUWJR+/gKBTBev+95L8cN9hHHLRsrhh4Si8ZNLnxiB2Swc
 HqOS4zXE1l3gZveClF6Zwx6TCcY7Aaf5ExlkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MM8kzddH0ZuV0BgZsD6j/UZqR+lPZQliP2/mR7NqPNQ=;
 b=SAUuHNNvstmDn7FXXMGLOwiPXmdtUUSBX6Y4dEL/6OOIQKJ0vOL3A7YxdcAGy6P5wO
 2d9piDE6Xpamdasuwg3Ns8ruV31s3ITsqopAOaVcXFa0HcTdW0z07rTnA+Gf2vH0Kres
 Lyz2lrsVCcykcvtiGB1YHWgb62UUNvCONyhUlKVHZDUTBcj4fcdy3rF9gu0Htag/jYrn
 EXF2T/r3wSef1EprGTckOPkLzUNUVexIJHRkQXBY3CtdUQJsTUb37aX0KPQ/S09GTmiH
 ct7XltAY0JwjmmnKSyaXPBXWvd/vktAHK7vRSHs2+/B6ftVFUf22L9d8Xg80uBncNm+O
 rmdQ==
X-Gm-Message-State: AOAM532PGll4dAL0xLWrh/8bHNcaETMSTZiQh0vlUJveXQBG3zmqkc57
 El+qqSCElmCfBYQKJbuHUXGAgs7y5cVk4A==
X-Google-Smtp-Source: ABdhPJyOChGktKvovO4oemHNBggRkAwTN52ULnjVngUsAWsrKKPIL7V1slxR+WXS+Ib+L6oEWikEHA==
X-Received: by 2002:a63:1260:: with SMTP id 32mr2593858pgs.232.1622102167325; 
 Thu, 27 May 2021 00:56:07 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id 69sm1217790pfx.115.2021.05.27.00.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:56:07 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v21 RESEND 2/4] dt-binding: i2c: mt65xx: add vbus-supply
 property
Date: Thu, 27 May 2021 15:55:54 +0800
Message-Id: <20210527075556.1709140-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210527075556.1709140-1-hsinyi@chromium.org>
References: <20210527075556.1709140-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_005608_572429_A1E199C8 
X-CRM114-Status: GOOD (  10.53  )
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

Add vbus-supply property for mt65xx. The regulator can be passed into
core and turned off during suspend/sleep to reduce power consumption.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 7f0194fdd0cc..2c45647e9f0b 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -32,6 +32,7 @@ Optional properties:
   - mediatek,have-pmic: platform can control i2c form special pmic side.
     Only mt6589 and mt8135 support this feature.
   - mediatek,use-push-pull: IO config use push-pull mode.
+  - vbus-supply: phandle to the regulator that provides power to SCL/SDA.
 
 Example:
 
-- 
2.31.1.818.g46aad6cb9e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
