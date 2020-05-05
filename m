Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB69EC47254
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:06:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A77FF20661
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:06:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ScpX21Le";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="LQwCci65"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A77FF20661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rB/QYMKvJuLMt1uKsrnMb1Wd6aOdfEMqRzSZl1Cgrjo=; b=ScpX21LeyCzwyx
	uEaOvQgHHHWMVPqJD7ISM7D+QHDY8U1R1zN1stAKb/yTKu1M4Xd4NVbSLjeKMGgE/ZTr/1uw98wiG
	Vy/Eu6wa2V/v4raxNgxA+WSGLJHj8r/GaXVw8+AQZT5h9YI2E2H9j2FCLtxcYAKE5aPLhxlYJapeb
	GQYFHCRTFf8TSoJxPajIJL+WYe7OgJVMyc7xMbkK0JHVETtSLAVjiRVKo/P2LVa/RrkrVQpdd4A3U
	zH7ZoiTbg8scF9JOHOWyO2fgrHV3VZGk6koLF57/8dFqwMtlZ1Uq4kXtROupanMNRawC0a3evSv0B
	MKz+CLdN42lSkSZMRHnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVyCt-0007Q1-EF; Tue, 05 May 2020 14:05:59 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVyAI-0002PP-IB
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 14:03:20 +0000
Received: by mail-wr1-x444.google.com with SMTP id e16so2893799wra.7
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
 b=LQwCci65NzZKH7S/k3KLNL9uDqCmT0NhL3+vr0FbsT08zlA7KCjEKKJA3sZtnf2+C9
 MgO3OOfj1iU8OOWJHAIFg37vsHsbgcG/ty8jsHreNlysA9n/Au6JLGB7Xxv750eTBgT+
 Sl+iLzCZd3APUglRO82tTPfZvQVLMJ3uavNHAqLe/avFh/YZADgXqEMvzVqRopDktCy2
 JBbLkT1YWVum/i0H4xsIcA/O3SnOtyCQ72Fc/9gVx/ow94+06PK5wjuMsmA86t5vb78a
 f1BNH1aOQZ6Kmm6CjzEh853K5kHs/8DpEoorye+0Q8Vxs8MX0SzFaarHH6cmphLUotuV
 jc4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1qePp19LiRiOBXtccpgQ+eI6GUOhz0auoBWQ11adkXY=;
 b=twAVUHFn85Iqb2y7lgCyhaIBJXu/m5DpDkLSv2bMrycxkjmmuZld+pMl6uLb07mlfv
 aWOj5z36dtDC5SBu9Ou52E3AHGv8QGQiN9XGRGMWaKuRhkSGWLuxOTXIAJPv4FTYLYCZ
 wCDZ8XkKNm1a9A3uLx4vtHLQuuiFCJaqznAhSc7rdqWliwMcfy0LxuCXJCezdOYdpF8K
 w4jdJeRPPauJzkD14B5dwxTU4lIHtEe0ksw5eBY/d4SnuwXuEnHrr5eGlunydmolrwy7
 OJA1tNixn4V4fAyBIrqzqcMyBglhTa64eUQp/FnSfvUw4tVnJbqL5v0L+ubBIuiWrUe7
 y3hg==
X-Gm-Message-State: AGi0PuYtLeDB4fBXP0Q9bTM5MImbY7yaUFA5aKWevZRUokaeJt/QKhz5
 pOmidavL8X/37w+MkKMpzRM0og==
X-Google-Smtp-Source: APiQypKqTKjLTaeehBmyF8ZBLt7Ztsq7bEei0OsGAye1X2D3s2hQaZgytBvFg7WpUlAYtX37tEZNHw==
X-Received: by 2002:adf:ab5c:: with SMTP id r28mr3827494wrc.384.1588687396984; 
 Tue, 05 May 2020 07:03:16 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id c190sm4075755wme.4.2020.05.05.07.03.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 07:03:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>,
 Matthias Brugger <matthias.bgg@gmail.com>, Felix Fietkau <nbd@openwrt.org>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Jakub Kicinski <kuba@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Fabien Parent <fparent@baylibre.com>
Subject: [PATCH 09/11] ARM64: dts: mediatek: add an alias for ethernet0 for
 pumpkin boards
Date: Tue,  5 May 2020 16:02:29 +0200
Message-Id: <20200505140231.16600-10-brgl@bgdev.pl>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200505140231.16600-1-brgl@bgdev.pl>
References: <20200505140231.16600-1-brgl@bgdev.pl>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_070318_767026_54E6565D 
X-CRM114-Status: UNSURE (   9.24  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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
