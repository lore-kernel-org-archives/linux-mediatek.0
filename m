Return-Path: <SRS0=nwzH=E4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75A5C5519F
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2020 12:01:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 322DE20760
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Nov 2020 12:01:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GLCeJDM4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5YD5yth"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 322DE20760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rrUvENAdRlFglmff4X2Lq7CH4AF3D0p5kKZ2n2CmBfs=; b=GLCeJDM4ZL1k9i6JGljP2QZmvw
	oG0VqzPavc3epY9cIQBz0ldg8JvLTQbfhvKfIpeW2/uKSnH2udzOXrTxEwfiRiX9TnbG7Eg8JsxVk
	B5qznY87OAq+1y5j/dPbttWtBYIHNuULvEW0XcNAItyU/Haoo4ijMdWG4EgY3Z/kiDszsegH59FOU
	tEWgUmkp1AjqreD5XHhG/2zkUoZZZHJk7exn4Dtd2aLdzqrbpM8zcc2WHC4BK0KRlLIqPHzXB2Jlv
	qSLy2kCb2fA+6tmlZTYhWeY9GhXRFvYDAbR3eYr879QM1mysSLMERXfpLjrtRPsmWAIaxl/X6iy7L
	yDTIDhmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgo3H-0006Iw-Qq; Sun, 22 Nov 2020 12:01:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgo3D-0006I5-DK; Sun, 22 Nov 2020 12:01:04 +0000
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9A5C320760;
 Sun, 22 Nov 2020 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606046461;
 bh=I3DWUk0+LK+ydDC0aqmE7JEsQMt1l8GP+vkzk6BY8RQ=;
 h=From:To:Cc:Subject:Date:From;
 b=O5YD5ythL2AleZsH8SsIXqhZZ+oidLXKa1/eONV0YqDFU31Zv6RoqnIzUCXCx8GKB
 ZzB2wJrRy5b74D2az5OWzU3TzBUIqBkF6VeCUfU6lVC3ykx72vfrT8HT1JLuzaR60I
 oxcPswxkO0UssD1+VWjpIolRK7koq3kZBJXEz178=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Baolin Wang <baolin.wang@linaro.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] mmc: mediatek: depend on COMMON_CLK to fix compile tests
Date: Sun, 22 Nov 2020 13:00:56 +0100
Message-Id: <20201122120056.100045-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_070103_580771_FC4CF4F7 
X-CRM114-Status: GOOD (  14.07  )
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
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MFD_OMAP_USB_HOST uses Common Clock Framework thus it cannot be
built on platforms without it (e.g. compile test on MIPS with LANTIQ):

    mips-linux-ld: drivers/mmc/host/mtk-sd.o: in function `msdc_ops_set_ios':
    mtk-sd.c:(.text+0x2bbc): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mmc/host/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 310e546e5898..bfe912ec8955 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -1023,6 +1023,7 @@ config MMC_BCM2835
 config MMC_MTK
 	tristate "MediaTek SD/MMC Card Interface support"
 	depends on HAS_DMA
+	depends on COMMON_CLK
 	select REGULATOR
 	select MMC_CQHCI
 	help
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
