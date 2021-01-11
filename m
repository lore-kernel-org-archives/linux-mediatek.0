Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F8B2C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 12:35:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 250C722472
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 12:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 250C722472
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RZ3Nc6kyutnh7ZeDbjVQFZYptYrQ31nmv7V3DTX9fC4=; b=vbPemeTyoi1sjpFpQGpOZv37k5
	vx5KSaUGB6fI2Y3W5nnYPOlEk6Zi5CbmILzi9Tyfd6vnYTgh0+XjGesF2YJEpkc0C1of+uKF7zByW
	9mnqM8IdpRT9o+6WFp0G+UF7jOS900bpVIcSd1WZiagU2+eaE5eHFEvCBFiewxCmpc2luFaoOQ8a4
	E+1Wt9oN7fs+mtpSXprmSUKp2g38maRSpqnD3EcXFh1xx6pfDcoVPHkYQkwvrjr5Za1VcnIcKfQ3a
	WXm6niMl/HFy9PlPSSq1k5bvqpMlA6cKkz8CH/Tt0QmnkXSBZGn8B9V6j5lroeJZWWufR9Yhg7mZ9
	28S23hfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kywQ2-0002v6-6B; Mon, 11 Jan 2021 12:35:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kywPw-0002sp-1b; Mon, 11 Jan 2021 12:35:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0561E2242A;
 Mon, 11 Jan 2021 12:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610368526;
 bh=lyrqn/YKGeP0Jj9QNzTMSXTnF1LuV/RkfrUdbtb+apA=;
 h=From:To:Cc:Subject:Date:From;
 b=Unv1BIJ9Jm9n+7R6/SBgSgI2EeU6Gd8l6XFtjv3uktKBZDcM665rLGPm9XW8ILqCT
 MJ/79cu9oTuIo6OlkAOwDIXU/xH4/TtdQZRiSBYTxx5UO30qliRol/yVr9p8qiVGrw
 ZcSWdpWWmMB1fTDlCtB8wS5bgH7/Ef9WLsYSu/yzar+OMWwHKJ4RHReYE1euwDm6MX
 wcZsRS2riLLS7OqjhdiyThqGM2BJPNGEvdMcZcS5JwB+GCIwbsPshOX2yvoYAUefTi
 KYQfrTZZRFU4wzmuvRcbJOA8JqhX2JmlTt00vIN7bQ2FyD9NYIZgHjTphwEZnIVC32
 1ROC2WwKypFXQ==
From: matthias.bgg@kernel.org
To: Lee Jones <lee.jones@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Gene Chen <gene_chen@richtek.com>
Subject: [PATCH] mfd: mt6360: Fix MFD cell names and compatibles
Date: Mon, 11 Jan 2021 13:35:18 +0100
Message-Id: <20210111123518.30438-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_073528_193946_EF8188A3 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Matthias Brugger <mbrugger@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 ChiYuan Huang <cy_huang@richtek.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-mediatek@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Gene Chen <gene.chen.richtek@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

MFD cell names and compatibles use '_' instead of '-', which is common
practice for names and the standard for DT compatibles.
This will also fix the probing for the drivers already implemented
(mt6360-adc and mt6360-tcpc).

Fixes: 7edd363421da ("mfd: Add support for PMIC MT6360")
Fixes: 1f4877218f7e ("iio: adc: mt6360: Add ADC driver for MT6360")
Fixes: e1aefcdd394f ("usb typec: mt6360: Add support for mt6360 Type-C driver")
Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

 drivers/mfd/mt6360-core.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 4661c1b29a72..14e649ffe50f 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -292,18 +292,18 @@ static const struct resource mt6360_ldo_resources[] = {
 };
 
 static const struct mfd_cell mt6360_devs[] = {
-	OF_MFD_CELL("mt6360_adc", mt6360_adc_resources,
-		    NULL, 0, 0, "mediatek,mt6360_adc"),
-	OF_MFD_CELL("mt6360_chg", mt6360_chg_resources,
-		    NULL, 0, 0, "mediatek,mt6360_chg"),
-	OF_MFD_CELL("mt6360_led", mt6360_led_resources,
-		    NULL, 0, 0, "mediatek,mt6360_led"),
-	OF_MFD_CELL("mt6360_pmic", mt6360_pmic_resources,
-		    NULL, 0, 0, "mediatek,mt6360_pmic"),
-	OF_MFD_CELL("mt6360_ldo", mt6360_ldo_resources,
-		    NULL, 0, 0, "mediatek,mt6360_ldo"),
-	OF_MFD_CELL("mt6360_tcpc", NULL,
-		    NULL, 0, 0, "mediatek,mt6360_tcpc"),
+	OF_MFD_CELL("mt6360-adc", mt6360_adc_resources,
+		    NULL, 0, 0, "mediatek,mt6360-adc"),
+	OF_MFD_CELL("mt6360-chg", mt6360_chg_resources,
+		    NULL, 0, 0, "mediatek,mt6360-chg"),
+	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
+		    NULL, 0, 0, "mediatek,mt6360-led"),
+	OF_MFD_CELL("mt6360-pmic", mt6360_pmic_resources,
+		    NULL, 0, 0, "mediatek,mt6360-pmic"),
+	OF_MFD_CELL("mt6360-ldo", mt6360_ldo_resources,
+		    NULL, 0, 0, "mediatek,mt6360-ldo"),
+	OF_MFD_CELL("mt6360-tcpc", NULL,
+		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
 
 static const unsigned short mt6360_slave_addr[MT6360_SLAVE_MAX] = {
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
