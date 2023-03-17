Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C485DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 15:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TDhQL06bwybuvijWfPquue79gyq1yUmwDLPZetsiGbc=; b=EsZBWNL60kdlb+GH+++JHz2+5n
	uXd6kF1bvLx2jbqBERCHlm/0KIQNz6VtGV+vMOS5EJ5JwohMAufZRiF7d9bPVmsPvKBXpglJW7Z4a
	HsrtTIdx2DswaeJJgipoPF+GpJHdzILRuWVreahc4kuKLYGPMThnDSWuR1V1PO3zsfvpFXsW3PqjH
	t6T0pr+EEw4ODp09/5KzrHMRGt0E6sNuL4plK5f5VfuCf+QOq7OoVEXkUA2oQGoCRUFhJD/pNCa8c
	4ajhvqcgwIVWEpaqyLZWn5qRHoZ4qzr01a6CP/MLsek7CThjQGJyavBMmLXgdhxbfhh9I4LuCuNR7
	QncsM0Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCEi-002eHV-1m;
	Fri, 17 Mar 2023 15:43:20 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCEd-002eG7-38;
	Fri, 17 Mar 2023 15:43:18 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTP Server V5.0(14117:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>); Fri, 17 Mar 2023 23:42:42 +0800 (CST)
Received: from ex4.rt.l (192.168.10.47) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Fri, 17 Mar
 2023 23:42:42 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex4.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Fri, 17 Mar 2023 23:42:42 +0800
From: <cy_huang@richtek.com>
To: <pavel@ucw.cz>, <lee@kernel.org>
CC: <matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<cy_huang@richtek.com>, <chiaen_wu@richtek.com>,
	<jacek.anaszewski@gmail.com>, <linux-leds@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] leds: rgb: mt6370: Fix implicit declaration for FIELD_GET
Date: Fri, 17 Mar 2023 23:42:40 +0800
Message-ID: <1679067760-19098-1-git-send-email-cy_huang@richtek.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_084316_443673_3D0E6D1A 
X-CRM114-Status: UNSURE (   7.78  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ChiYuan Huang <cy_huang@richtek.com>

0-DAY CI Kernel Test Service reported the implicit declaration error below:

drivers/leds/rgb/leds-mt6370-rgb.c: In function'mt6370_check_vendor_info':
>> drivers/leds/rgb/leds-mt6370-rgb.c:889:15: error: implicit  declaration
   of function 'FIELD_GET' [-Werror=implicit-function-declaration]
  889 |         vid = FIELD_GET(MT6370_VENDOR_ID_MASK, devinfo);
      |

Add the missing header 'bitfield.h' to fix it.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202303171729.CcgyFx17-lkp@intel.com/
Fixes: 55a8a5c16eb3 ("leds: rgb: mt6370: Add MediaTek MT6370 current sink type LED Indicator support")
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/leds/rgb/leds-mt6370-rgb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/leds-mt6370-rgb.c b/drivers/leds/rgb/leds-mt6370-rgb.c
index 9c1e6d5..bb62431 100644
--- a/drivers/leds/rgb/leds-mt6370-rgb.c
+++ b/drivers/leds/rgb/leds-mt6370-rgb.c
@@ -7,6 +7,7 @@
  *   Alice Chen <alice_chen@richtek.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
-- 
2.7.4


