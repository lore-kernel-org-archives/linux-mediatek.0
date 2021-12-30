Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F352C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JQm6FPROfwMvn7WyEmaR2pKZe2E62eWh8cvBZc7z+Hg=; b=SOpFHQxsM5/mKW
	8GxUBoq856C3JCjLewA6BBU24HyXo40wXjWQ3sn5SUKxjbzEFH8Z1ORrre84bMfRzsXen+nAoBwfS
	HLcUejP5lC+Wwwk8Rcm4HMbeWZbYZOTyWS4hrXJ/0B3F3MW1NPETMguJboTaWUfssoJzOG9Fhf8ED
	5QgEWpGKnsmbFW/OciAea/3i3G77ZanI7iXttVJ5Cjaifecmz9TW2pvEngNnr6zUVa9qcI9NXG3LW
	iPb89orgOTbk/tMxDIYp1NZB6hHCfQEpmtPSkQiytRqnt+KSDmfbxMQp+XrbdoBOs3IC6Y1gVUDxF
	Q3ztWEr5iIJgrZ2YSvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2pQS-003ivo-FO; Thu, 30 Dec 2021 07:00:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2pQR-003ivZ-Pb
 for linux-mediatek@bombadil.infradead.org; Thu, 30 Dec 2021 07:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Df28b8xczL8Swe9ADPk5krcRc1pVZeamJT80H7i4WT4=; b=K2ayCqjW24rrMlSUIu+VQQDQTw
 IXPeU3xuEVohTL/LEheh8jh4L3DxCXGTjNoTf9r7700Jh21v8kkXNyRyTo27WFuMEy72HV2IwoYug
 tf+ERfcYrE1KYT1UHqKp61NOg4/Eain75h8hn+7ehBwOSC1LaKCiXdm7xKJF8FiBFxQqa/vI024Po
 gJHxlGlKaFHgIOaDQvA/zsd7eg5F2iEMWbspMSjETZq6KzMCqMp3bys1kwMJAuwuni9c0r5Ib/O/y
 OugOlIUuaJioWVeQ0taO1EJoGyMLr9j5giPbdGgg0GYxbl2igeC3NsEIsINbdqkNbWrhXgfYoOa6M
 WH7ycokw==;
Received: from mailgw.kylinos.cn ([123.150.8.42] helo=nksmu.kylinos.cn)
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2pQK-004KiL-1v
 for linux-mediatek@lists.infradead.org; Thu, 30 Dec 2021 07:00:31 +0000
X-UUID: 771ee2e28b8640a08c7d907ed69f04a5-20211230
X-CPASD-INFO: d7f15e09085144dba0866a0570069e28@rYegUWKXXmlcWHd9g3evnIFhaGZnjVC
 EeWpQZmeVXliVhH5xTWJsXVKBfG5QZWNdYVN_eGpQY19gZFB5i3-XblBgXoZgUZB3s3mgUWWTYA==
X-CPASD-FEATURE: 0.0
X-CLOUD-ID: d7f15e09085144dba0866a0570069e28
X-CPASD-SUMMARY: SIP:-1, APTIP:-2.0, KEY:0.0, FROMBLOCK:1, EXT:0.0, OB:0.0,
 URL:-5, T
 VAL:172.0, ESV:0.0, ECOM:-5.0, ML:0.0, FD:1.0, CUTS:295.0, IP:-2.0, MAL:0.0,
 ATTNUM:0
 .0, PHF:-5.0, PHC:-5.0, SPF:4.0, EDMS:-3, IPLABEL:4480.0, FROMTO:0, AD:0,
 FFOB:0.0, CF
 OB:0.0, SPC:0.0, SIG:-5, AUF:0, DUF:28668, ACD:148, DCD:250, SL:0, AG:0,
 CFC:0.299, CFS R:0.093,UAT:0,RAF:0,VERSION:2.3.4
X-CPASD-ID: 771ee2e28b8640a08c7d907ed69f04a5-20211230
X-CPASD-BLOCK: 1001
X-CPASD-STAGE: 1, 1
X-UUID: 771ee2e28b8640a08c7d907ed69f04a5-20211230
X-User: weirongguang@kylinos.cn
Received: from localhost.localdomain [(116.128.244.169)] by nksmu.kylinos.cn
 (envelope-from <weirongguang@kylinos.cn>) (Generic MTA)
 with ESMTP id 1037458564; Thu, 30 Dec 2021 14:00:22 +0800
From: weirongguang <weirongguang@kylinos.cn>
To: sergio.paracuellos@gmail.com
Cc: linux-mediatek@lists.infradead.org, weirongguang <weirongguang@kylinos.cn>
Subject: [PATCH] PCI: mt7621: Fix the compile error in cross complication
Date: Thu, 30 Dec 2021 13:47:13 +0800
Message-Id: <20211230054713.1562260-1-weirongguang@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_070028_640122_74C522D3 
X-CRM114-Status: GOOD (  14.24  )
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

When I was compile the latest kernel in x86 platform and
the build environment like this:

Compiler: gcc
Compiler version: 10
Compiler string: mips-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110
Cross-compile: mips-linux-gnu-

It make a compile error:

drivers/pci/controller/pcie-mt7621.c: In function 'setup_cm_memory_region':
drivers/pci/controller/pcie-mt7621.c:224:6: error: implicit declaration of function 'mips_cps_numiocu' [-Werror=implicit-function-declaration]
  224 |  if (mips_cps_numiocu(0)) {
      |      ^~~~~~~~~~~~~~~~
drivers/pci/controller/pcie-mt7621.c:232:3: error: implicit declaration of function 'write_gcr_reg1_base'; did you mean 'write_gc0_ebase'? [-Werror=implicit-function-declaration]
  232 |   write_gcr_reg1_base(entry->res->start);
      |   ^~~~~~~~~~~~~~~~~~~
      |   write_gc0_ebase
drivers/pci/controller/pcie-mt7621.c:233:3: error: implicit declaration of function 'write_gcr_reg1_mask'; did you mean 'write_gc0_pagemask'? [-Werror=implicit-function-declaration]
  233 |   write_gcr_reg1_mask(mask | CM_GCR_REGn_MASK_CMTGT_IOCU0);
      |   ^~~~~~~~~~~~~~~~~~~
      |   write_gc0_pagemask
drivers/pci/controller/pcie-mt7621.c:233:30: error: 'CM_GCR_REGn_MASK_CMTGT_IOCU0' undeclared (first use in this function)
  233 |   write_gcr_reg1_mask(mask | CM_GCR_REGn_MASK_CMTGT_IOCU0);
      |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/pci/controller/pcie-mt7621.c:233:30: note: each undeclared identifier is reported only once for each function it appears in
In file included from ./include/linux/device.h:15,
                 from ./include/linux/of_platform.h:9,
                 from drivers/pci/controller/pcie-mt7621.c:26:
drivers/pci/controller/pcie-mt7621.c:235:25: error: implicit declaration of function 'read_gcr_reg1_base'; did you mean 'read_gc0_ebase'? [-Werror=implicit-function-declaration]
  235 |     (unsigned long long)read_gcr_reg1_base(),
      |                         ^~~~~~~~~~~~~~~~~~
./include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
  110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
      |                       ^~~~~~~~~~~
drivers/pci/controller/pcie-mt7621.c:234:3: note: in expansion of macro 'dev_info'
  234 |   dev_info(dev, "PCI coherence region base: 0x%08llx, mask/settings: 0x%08llx\n",
      |   ^~~~~~~~
drivers/pci/controller/pcie-mt7621.c:236:25: error: implicit declaration of function 'read_gcr_reg1_mask'; did you mean 'read_gc0_pagemask'? [-Werror=implicit-function-declaration]
  236 |     (unsigned long long)read_gcr_reg1_mask());
      |                         ^~~~~~~~~~~~~~~~~~
./include/linux/dev_printk.h:110:23: note: in definition of macro 'dev_printk_index_wrap'
  110 |   _p_func(dev, fmt, ##__VA_ARGS__);   \
      |                       ^~~~~~~~~~~
drivers/pci/controller/pcie-mt7621.c:234:3: note: in expansion of macro 'dev_info'
  234 |   dev_info(dev, "PCI coherence region base: 0x%08llx, mask/settings: 0x%08llx\n",
      |   ^~~~~~~~
cc1: all warnings being treated as errors

The problem is that the <asm/mips-cps.h> head file was missing
and it can resolved when include the file.

Fix: <2bdd5238e756> ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
Signed-off-by: weirongguang <weirongguang@kylinos.cn>
---
 drivers/pci/controller/pcie-mt7621.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index b60dfb45ef7b..8a009e427a25 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -29,6 +29,7 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <linux/sys_soc.h>
+#include <asm/mips-cps.h>
 
 /* MediaTek-specific configuration registers */
 #define PCIE_FTS_NUM			0x70c
-- 
2.25.1


No virus found
		Checked by Hillstone Network AntiVirus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
