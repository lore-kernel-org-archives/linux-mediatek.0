Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F65C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 06:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YJruvXG7kiwPmKxC/nF7gon5wmgRUYksNeIoAbOzgU0=; b=mSzvjRKOkz3zE6Vjwz6pF/b7DD
	VX9EiivApNU9p4HJch1C4CXNcsI3IJoCi7Cmdb1h+dFS7yG/s48zKp1VGPtYXjjom3UPiQfPaeF+x
	XVEmuacMEApGg4uwirCuaoRWACb2iPfnRDlQtd6u+ut8dwLEA1D9TTPvPq/6Q7xUR1RQxg2SSKmhA
	kjEIUz/npk9LsG57ZCa8qs7scgD/FkUG8mhdlSZIKfLCKgrjoq9mLfq/BBatwbHiXj2ubi3H04p6r
	UY8ieA1DiSr1hur0a00DP+KiYxnwSHPnwzxYn18G901AsiUIRJqmBsdpUtkU3naWTXimI56QEAZ9T
	ULT6kPlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDoB-000rxg-WC; Fri, 13 Jan 2023 06:45:00 +0000
Received: from [2601:1c2:d80:3110::9307] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGDo2-000rw1-Kd; Fri, 13 Jan 2023 06:44:50 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] thermal: mtk_thermal: fix kernel-doc function name
Date: Thu, 12 Jan 2023 22:44:49 -0800
Message-Id: <20230113064449.15061-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Use the correct function name in a kernel-doc comment to prevent
a warning:

drivers/thermal/mtk_thermal.c:562: warning: expecting prototype for raw_to_mcelsius(). Prototype was for raw_to_mcelsius_v1() instead

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Amit Kucheria <amitk@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
---
 drivers/thermal/mtk_thermal.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -- a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -550,7 +550,7 @@ static const struct mtk_thermal_data mt8
 };
 
 /**
- * raw_to_mcelsius - convert a raw ADC value to mcelsius
+ * raw_to_mcelsius_v1 - convert a raw ADC value to mcelsius
  * @mt:	The thermal controller
  * @sensno:	sensor number
  * @raw:	raw ADC value

