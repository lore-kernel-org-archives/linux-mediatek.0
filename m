Return-Path: <SRS0=yT6o=PW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F94FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 23:04:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0F47611C4
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Nov 2021 23:04:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0F47611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bipLaRd4zkewyyouGrDz4mGJ0LfKUxONT2bRE9rs2UU=; b=XEL0U/8/TsclEa
	c0S7EB5FpqSXHjnxD5ofE+niaLH7ihcFgknr+ArIflojldKRSfhn4VuMpX41tz75AEBogGrG+WxZc
	5r1s9hb+TMnjZ0p38DHjQjbyobyuI8Z+3NHCrg1wevhw+5cB2U0EnLhoNwAASEoIofLvFexxQ+znB
	FFou7Ns+x6Qv2+++iIZjosMlZeDaDb6QB+GOUQmFU7y8H7FwKt7Qw3HfhWTMrQZzfX7/k9Hdhxwnc
	ZZSaXttzQd6iz2LWYB7oRfvhe1LrsXV7GGOllCoygS/RWZqW5WaNzabSLurxV0A4296s5YcHQTwFj
	uWYWV7Noc1i8Bz3+uSWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miPIZ-006sXX-9j; Wed, 03 Nov 2021 23:04:03 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miPIW-006sWV-8G
 for linux-mediatek@lists.infradead.org; Wed, 03 Nov 2021 23:04:01 +0000
Received: by mail-pf1-x433.google.com with SMTP id s5so3948369pfg.2
 for <linux-mediatek@lists.infradead.org>; Wed, 03 Nov 2021 16:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NS4eT639BOwvF4y/0Jri0aipGFDU+GOyeNwMYhJ1CsI=;
 b=ty211RcINhjstR5hvJ6vOlvNuK2U2UPclVemOWPNOv+RZAnKeJopU68QRFe2L/JRUl
 8hLDX/IT6xv6UQFfBLJEAwwvXgdwfIZg7UBEu+oqaHI1BZNUx3fnTTGpbUV3Wsf9ZUy4
 7miviuW++N0oDU+/ilKbv3A9RXQBqTYTnJ+AHkUqMw9x4s6U7q/iWZg55uuma9Jc+AF5
 00NRbWmxAhmnB5rJwtCEGAjFoZQkplzh0QqClwj1K5VgdpOVRTF9Cnc93VnqKj7XPVkn
 Jq8f0PZ3taqfiQCW+kJb+B5xz35AiXMMwesxd2L1YevFsWcStkK+HPZAX5b70bGCJG/3
 Amfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NS4eT639BOwvF4y/0Jri0aipGFDU+GOyeNwMYhJ1CsI=;
 b=TLLYWj+sz3GQ+/En20k9elevsymmtQSCbRm4Y6qSxpuJW4bbQh5mdaH0oMXiJO6gGd
 mvGVvKkEV2mhB+FCnhLOmJVzWSAFoYTST4jr4vaP2Xb4pTvbsCdEgUsTGSwnmrRhgUJB
 io15oayOH5FC0m9BHrChtvxCw8N4BCXdYVuntM70a/9SqdpApTKQSJmRjhsSr19Nuqf+
 7ezr+jhY3JtxUwvzpTTJEsuSwQX4cUOVFjUQCyPxS/SjveI8BDOhzG0dEvCOqHulhe1B
 OtTUKK3zs/FwGElXTglnlb9p4tDilizk8aEAeCkNKnJKymH8PL3Dd1JWtJx2gHd30SoV
 b3Ug==
X-Gm-Message-State: AOAM531YaC3WXeF6ZOT85AHOTOOyln+dnAgonoa3KBYu/yoZavREggvw
 8QzLqKEvc7MJs3Ry9HRYsoZkCieAcJglO+HS
X-Google-Smtp-Source: ABdhPJz2SB8By8BJklvuj+Exd4PWOudvGfWoAsy72NJgERh9sYTaGsqL7TUqf2f9ujv2zJAok/v6FA==
X-Received: by 2002:a63:6f4c:: with SMTP id k73mr35716833pgc.61.1635980635076; 
 Wed, 03 Nov 2021 16:03:55 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id r25sm2584900pge.61.2021.11.03.16.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 16:03:54 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: linux-watchdog@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Fabien Parent <fparent@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] watchdog: Kconfig: enable MTK watchdog
Date: Wed,  3 Nov 2021 16:03:53 -0700
Message-Id: <20211103230354.915658-1-khilman@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_160400_368219_931C7829 
X-CRM114-Status: UNSURE (   8.01  )
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

Enable CONFIG_MEDIATEK_WATCHDOG when ARCH_MEDIATEK is enabled.

On some platforms (e.g. mt8183-pumpkin), watchdog is enabled by
bootloader, so kernel driver needs to be enabled to avoid watchdog
firing and causing reboot part way through kernel boot.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 drivers/watchdog/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index bf59faeb3de1..00bebbb8f877 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -836,6 +836,7 @@ config MESON_WATCHDOG
 config MEDIATEK_WATCHDOG
 	tristate "Mediatek SoCs watchdog support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	default ARCH_MEDIATEK
 	select WATCHDOG_CORE
 	select RESET_CONTROLLER
 	help
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
