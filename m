Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020E7C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 07:53:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 835DB61452
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 07:53:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 835DB61452
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LpbcatbAfL36dm095ZI+6ABEpstMTbsucVDNW2S541g=; b=IbP/qIVd2evt1J3i7EHbnj846w
	jWTE1n4wkGjr4g0skv02f7Rw0/qOMvuS3CKLO4Vqw3PnJYJg+3r2wnJUwNYTfUcjGL/yF/nu9DDuW
	dcU7Wsv91WQpYwy12TFmoibwj9ST743JBoBQO+r/x8h3HwFo48FC6vlDnuUecWSZ37AZh5nhAewvW
	v5cnTQklAIcYlHLuzdLUxcLJs3sWg9cF8M6gSVwVMcygqcZHJpJuv7sAZU5HnyOLqEkLMA4vzvLGy
	Xd78sUZg8bi0bOL/ci3y+x8oualM4s7ShQdYpf2XB+H6EnV1DnS1jTVEKoDTbvXoe3ET32CVD4lHQ
	iiwLPBig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZqcH-000zVZ-Ec; Fri, 23 Apr 2021 07:52:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqbq-000zTL-1l; Fri, 23 Apr 2021 07:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=dcDx4kxH6ecbbCg9Ctln1CdWVKNlXSSENzd9xSVSzfE=; b=IgVmIjtQOpzOsPPH/1VFG3MrDb
 cSJkkQRc8bbZU47e4HWiC+jtX4TmXRM8UpuGXCngo9nmJ7LeY9stgrfDnXORifZaMYlA9Z8muBPOi
 AB07mAvbxu9Hjsh3d1ANlsU6+73wPg8DKEqr+Db+3l3h6HhGLIJaNtpnys0/vSQ+bv3R6MAOWgyeQ
 ORrPhx5Fkdl8X8RarPaUMFNWF2ip7O+gXaJGWpsPH97R/fHh+kQxk9cJiL1xxOm4v4kR45xk5Mqx4
 wtxWPvapH0NTTyuZisKyizopKONvqKA8VMBwk/SpMVZCYhcLNM0L3k3sNa/qhLlONZovkCZ0EmgoZ
 eaf9lQPA==;
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZqbn-00EEO7-5y; Fri, 23 Apr 2021 07:52:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 547BB1F4387B
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Collabora Kernel ML <kernel@collabora.com>,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 drinkcat@chromium.org, hsinyi@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Max Krummenacher <max.oss.09@gmail.com>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, Shawn Guo <shawnguo@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm64: defconfig: Do not override the MTK_PMIC_WRAP symbol
Date: Fri, 23 Apr 2021 09:52:01 +0200
Message-Id: <20210423075201.2616023-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_005215_375391_AC8D4902 
X-CRM114-Status: GOOD (  10.26  )
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

Commit 'fbbe38309d56 ("arm64: defconfig: Allow mt8173-based boards to boot
from usb")' added the MTK_PMIC_WRAP config built-in. It needs to be
built-in in order to be able to boot from USB or the MMC without needing
a ramdisk, but that symbol was already defined as a module so now we are
getting the following warning:

  arch/arm64/configs/defconfig:996:warning: override: reassigning to symbol MTK_PMIC_WRAP

Remove the MTK_PMIC_WRAP=m from the defconfig to remove the error.

Fixes: fbbe38309d56 ("arm64: defconfig: Allow mt8173-based boards to boot from usb")
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

 arch/arm64/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 08c6f769df9a..9907a431db0d 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -491,7 +491,6 @@ CONFIG_SPI_S3C64XX=y
 CONFIG_SPI_SH_MSIOF=m
 CONFIG_SPI_SUN6I=y
 CONFIG_SPI_SPIDEV=m
-CONFIG_MTK_PMIC_WRAP=m
 CONFIG_SPMI=y
 CONFIG_PINCTRL_SINGLE=y
 CONFIG_PINCTRL_MAX77620=y
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
