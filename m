Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3143EC5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 07:38:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E001206B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 07:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sQmgbz1f"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E001206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PUi7h9OYiHM44QscwJueJhkrAf5cNUdMbm2niSCN2JI=; b=sQmgbz1f9z3msPBF8tNZiaemJ3
	bd72PioGPYXvYy1OU8TcgBsppgEB4hXtDIwICeKMmqkDieOHwwznTgaPcvKxgiuJ4llztfFi9xVcM
	a1oZ4/Joo+ZVZ5QL12qG8lgpgCGxdpykkHDF3hQw+doTJIFjXz609fTT64BIIk3A5+dmvCTMq01d/
	zBBO+8rY4PdSVNaj0m+JjT6IgfPF8A+ZN5anZ3mL0JrpPwVotHDWfu7jejXlFgzHZztW5J4cADmxV
	zK1fXsYo2ef1RM/Gg/h6b1aiXJ55eW96GE+m9KOKbUz8HZyxgRtZYErwxiEetlsdzRXAhjU40LNUU
	vUcH/8dQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khpNL-00017b-Bb; Wed, 25 Nov 2020 07:38:03 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khpNE-00013m-Fk; Wed, 25 Nov 2020 07:37:58 +0000
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxytHJCb5fJnAWAA--.50625S2; 
 Wed, 25 Nov 2020 15:37:46 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2] phy: mediatek: Make PHY_MTK_{XSPHY,
 TPHY} depend on HAS_IOMEM and OF_ADDRESS to fix build errors
Date: Wed, 25 Nov 2020 15:37:45 +0800
Message-Id: <1606289865-692-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9AxytHJCb5fJnAWAA--.50625S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWfXryfGF1DJrWrAr1xAFb_yoW8ZF48p3
 93Ka10kry8XFyDCw4xXFy7GFs8CFZrZ3y5GrsxWw13Xa15A3y7AwsYy34agFWUArWv93y7
 t34rWayUGaykJFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkm14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
 2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
 W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4x
 MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
 0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
 wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
 W8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUYgAwDUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_023757_145338_86C422C0 
X-CRM114-Status: GOOD (  10.52  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xuefeng Li <lixuefeng@loongson.cn>, linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

devm_ioremap_resource() will be not built in lib/devres.c if
CONFIG_HAS_IOMEM is not set, of_address_to_resource() will be
not built in drivers/of/address.c if CONFIG_OF_ADDRESS is not
set, and then there exists two build errors about undefined
reference to "devm_ioremap_resource" and "of_address_to_resource"
in phy-mtk-xsphy.c under COMPILE_TEST and CONFIG_PHY_MTK_XSPHY,
make PHY_MTK_XSPHY depend on HAS_IOMEM and OF_ADDRESS to fix it.

The above issue is reported by kernel test robot <lkp@intel.com>,
through the discussion in the v1 patch, as Chunfeng said we need
also do this for config PHY_MTK_TPHY:

drivers/phy/mediatek/phy-mtk-tphy.c:1157:		retval = of_address_to_resource(child_np, 0, &res);
drivers/phy/mediatek/phy-mtk-tphy.c:1123:		tphy->sif_base = devm_ioremap_resource(dev, sif_res);
drivers/phy/mediatek/phy-mtk-tphy.c:1164:		instance->port_base = devm_ioremap_resource(&phy->dev, &res);

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/phy/mediatek/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
index 50c5e93..f44800b 100644
--- a/drivers/phy/mediatek/Kconfig
+++ b/drivers/phy/mediatek/Kconfig
@@ -5,7 +5,8 @@
 config PHY_MTK_TPHY
 	tristate "MediaTek T-PHY Driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
-	depends on OF
+	depends on OF && OF_ADDRESS
+	depends on HAS_IOMEM
 	select GENERIC_PHY
 	help
 	  Say 'Y' here to add support for MediaTek T-PHY driver,
@@ -29,7 +30,8 @@ config PHY_MTK_UFS
 config PHY_MTK_XSPHY
 	tristate "MediaTek XS-PHY Driver"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
-	depends on OF
+	depends on OF && OF_ADDRESS
+	depends on HAS_IOMEM
 	select GENERIC_PHY
 	help
 	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
-- 
2.1.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
