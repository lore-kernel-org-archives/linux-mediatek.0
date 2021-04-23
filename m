Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24ECDC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 07:53:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98CAA61422
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 07:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98CAA61422
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PeeGYRvwIp698Si8mI+BJoP856XaXQtk7FrO+tOhSIw=; b=jH2gxWgXXSLI2b4zmZZy3RvIwv
	IWFQDR77IjARg+ssuKRay3t8qi6mSgS2BvZi/rrxtiSX+onf5R33c1t21HQ+D4JMH0zwIRZiWB7mJ
	B7v++f+1a4f7oT+t4JWsoEFKbb7uR4Oyw9+WYkxrLfQqDQ/eGM1/XxgQVyLyelEnDH6bJBS8srXuS
	tiE8MBG5KpIV050Qf72Q6jZOJ0EzSXxq4aBn3VR50Bip9bpSABai4klKfoOfVQpJ5Vb7jyyySn6GR
	UmO4zq6bIGFJnH02vA02sPFBELvaLR4QBzXt5058G8bgs5nYttICD3YQXUXEbo7URviOJLY5lQ6ZM
	uCEbdzwA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZqcl-000zZJ-5s; Fri, 23 Apr 2021 07:53:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqcY-000zXd-Gt; Fri, 23 Apr 2021 07:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=k04y0Pg5jTSFevOD/rZK1MqErSV1xyapNzwCMhxf4eQ=; b=25LZhRj/F8YXmpBpC0dFf6uaB6
 ecqpUro2AEWyA224WccrYtayjIZ5iPwzZN1vdz7cG4wqLqKJ3SiLpAaEdO8/IJCkpmmsgQ5MakcvZ
 w0lahH+4O3HHeRDuVY4r40oiP8Swc5gZ/Pss8GPWyFjBqu8ew/fS4YEu28nPo2hK7hICrWXakMcYQ
 hp2AepkiB8lBgyFIfmamtkg7sWXdLNLTiQqIoj6Tjp5kkmIu4GboGErRIm4JWG6TjJRXpPQG2zRH8
 Gk+u64QmY/yg6bO8SLsSCkyk12PZrKkEVft2BnKKbBphZHwHUhDO0Nw+Vhm4Dg1aLqOy41Cq76lLv
 TXDjkb0Q==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqcV-00EEPk-Ot; Fri, 23 Apr 2021 07:53:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A42351F43399
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Collabora Kernel ML <kernel@collabora.com>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, hsinyi@chromium.org,
 Anson Huang <Anson.Huang@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Max Krummenacher <max.oss.09@gmail.com>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: Allow Mediatek boards to boot from the mmc
Date: Fri, 23 Apr 2021 09:52:50 +0200
Message-Id: <20210423075250.2616275-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_005259_956218_EC0B458D 
X-CRM114-Status: UNSURE (   8.56  )
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

Enable the MMC_MTK option necessary to boot Mediatek boards from the
mmc. Booting from the mmc is the common method used for a bunch of
boards, specially Chromebooks, to boot from. Hence this driver is
built-in.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4be3807b6d..acb718160345 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -851,6 +851,7 @@ CONFIG_MMC_DW_K3=y
 CONFIG_MMC_DW_ROCKCHIP=y
 CONFIG_MMC_SUNXI=y
 CONFIG_MMC_BCM2835=y
+CONFIG_MMC_MTK=y
 CONFIG_MMC_SDHCI_XENON=y
 CONFIG_MMC_SDHCI_AM654=y
 CONFIG_MMC_OWL=y
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
