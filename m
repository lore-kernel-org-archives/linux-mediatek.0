Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EC65C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:28:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22C1920758
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 11:28:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Cw3SUhkN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="hPUb+38Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22C1920758
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rB/QYMKvJuLMt1uKsrnMb1Wd6aOdfEMqRzSZl1Cgrjo=; b=Cw3SUhkN/YGO3A
	8hgtiklK2QyJTR8+7pVEt7O5laLeOvr6z/HfDtwMGGw5Y5qzTrst/JxJqR107XjNzouFI/VGxUm1M
	v0c7xCuT2nzBohAKwl4in7TBjKtAQ75Gr+b8YSelEC+rjkDuokdV5FnWEdgYrsyiyH25/faDXMN3m
	XttTG2LA5TqCmJgAz22o6pvb3xBOQ+RAlseYshOF2MioYDLH4PvZ78GHvYLznKGlbNuAAUBILblEp
	tZ5txIdCaIDFC94Y41+HTVun8VAaTc8OzUQ8ZKwWzzfPLwa2t55KHw0QqQiClUqr1bEG2xPVphXcx
	smW0jIxoXx9TpCPJPv2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbMtd-0000pT-PP; Wed, 20 May 2020 11:28:25 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbMr5-000743-7j
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 11:25:52 +0000
Received: by mail-wr1-x441.google.com with SMTP id i15so2719038wrx.10
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 04:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
 b=hPUb+38ZdEA5j+6g5LHfDwWL5eh8efRY1B/ixdvGsNR4XuXCt7sgEl2KeRlJ01EfHE
 EwHOGNPCwWkPsPu0H2xE7XhCrvUD+VrSuLITBNLMrGEkQ7QcY0s+80+VPg1swVLHURWP
 xHwAimb0cSrRccyWhXbCLPH8OB51GJEHSGjSJ1ZGPPkIvhUxXcjhQQCPpR2FZ6iw+FDE
 pMyarLDzJYC1+xU12NnxQm+UFb9ClIV1caF73rLdPiOEs14KFs7zfNQ/MYOBYO6BxrGw
 sw8ZuuR4q30AfOxECvB4qm/LO3wwL5t1niEhB547XDw+i4/coyqEUjEheZS3hEKIEu87
 psOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
 b=rN4nult5GyQLfyuZes2i66U4Wx4DUguAA6kYeBpjkspLUCZxrslz/tEJG4kbTUM3B0
 YyJPLqp+LNlUi2XxrXIbjvDnbNLlsU8OHT9/qzNnSNviYEjHfbNqsOowlccPoPjHDm76
 rh5P31zVH5omlv04YpCDuTXqxriSqkA/69SuybnrVJR1/pJbP5+8St83B4NeouGLemLE
 5Yc/RyxGwn3z7I4/lyj6TWEqNC8o2T3ua8YtkxguVPGy1qrYyiDFZL7f50J0QkeVlZ0J
 PGC+bsqtZ6F8kDZHABmUvTweuVPKDUAk6uiEPZpJAwq7DK1ymeAssjhah7TKOHwPWg2P
 mlcA==
X-Gm-Message-State: AOAM530j8EFb5RDTLq8nJ91v18cKeuyd1/G3LoRtoaXG8vANuOjv5BvW
 YDt32rzXj4qetFkAnJHlEOuUdg==
X-Google-Smtp-Source: ABdhPJz8mA5+qKq8TXk4kO+lD9LIsszxlWW/zHrrIHr4SjCq6c8Fk/Cwl+qGKKL/YPBN3XFy4kA7Tg==
X-Received: by 2002:a5d:6a83:: with SMTP id s3mr3877082wru.308.1589973945873; 
 Wed, 20 May 2020 04:25:45 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id v22sm2729265wml.21.2020.05.20.04.25.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 04:25:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Fabien Parent <fparent@baylibre.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Edwin Peer <edwin.peer@broadcom.com>
Subject: [PATCH v4 09/11] ARM64: dts: mediatek: add an alias for ethernet0 for
 pumpkin boards
Date: Wed, 20 May 2020 13:25:21 +0200
Message-Id: <20200520112523.30995-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520112523.30995-1-brgl@bgdev.pl>
References: <20200520112523.30995-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_042547_275906_4BCBEBC3 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add the ethernet0 alias for ethernet so that u-boot can find this node
and fill in the MAC address.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
index a31093d7142b..97d9b000c37e 100644
--- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
@@ -9,6 +9,7 @@
 / {
 	aliases {
 		serial0 = &uart0;
+		ethernet0 = &ethernet;
 	};
 
 	chosen {
-- 
2.25.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
