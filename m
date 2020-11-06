Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF594C55178
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:11:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43EEB20825
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gMuX/Sxi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9mSDvj3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43EEB20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igBTbdkF4IFrTOxuaWOL7ENVmEkX8g8rGyrvNdQxnZ8=; b=gMuX/Sxi88wkup6fPhYgT2xx8d
	1S9HtaFPrHfTlqQpf7rr7fw743puF2L0+dGJcvFisUEIksuDtgYOrAhOSGkzTOlk7kNrOw0xdN8mU
	RoGbxdap5LasE3CC7MtfGIZA3L3tJSNR1VVPl8kkPRVO5V8H+5UWkLbACqQLF0Dws0OaGwfxMEd/y
	q0Denpa5bOQ8UwxBwZyCZN00FzrNKLsB78m+2pdwnyy6EDGJBA2OTVcFj8zWvwnccBEP4XinGIFY0
	kyrh5+t+q8kcq0Mf33A2O0GFvc+bpV9VOgS7X+8vKsYJRUg8AvA1lrttkoezfTlg4pYv0OzlY0ZhU
	knhJ2j7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaywS-0000Nl-44; Fri, 06 Nov 2020 10:26:00 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaywJ-0000Hc-0z; Fri, 06 Nov 2020 10:25:51 +0000
Received: by mail-pg1-x542.google.com with SMTP id t14so614794pgg.1;
 Fri, 06 Nov 2020 02:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=dBXfFm02ABja54Il3Ns8zFaadLu9ijtBeVpM6C5JJKM=;
 b=F9mSDvj3aiysbsXywu3vPBQXfbTMXTZDaUkdrVL0vNSlMce8ZE+a/kq98+Jv9Ly1F9
 NnCFFGjk/JhloQaksuKF49vOkVKs/k5/qmnkqVffr6/A2Z088iNh65ZxbXf8KnWHIMu6
 e9lkZHQPAZ1hM/QdZbfxw4wUhaSP8DXD3UtSCztAEAiavV36OJFoPswoi3eEhmkOTyii
 JRMHDuGB44vFC0kN6hrnF8JmLn5EQdHvzFl1Jgq6gRnbnDKQpfN1do1R+sp7LaRgdvGo
 whIaQSad+kh+bRvvirq/DZK0kw9s/ReFpfua/ihT5fE9Smqafbt1cSsxrZtkgPSF62hT
 P8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=dBXfFm02ABja54Il3Ns8zFaadLu9ijtBeVpM6C5JJKM=;
 b=MoAG1xYGWDDOlQUCdoLmHKziR5bkIoEjWs0j7tqq2Okwxc/sMWHuZprIm4AjMaWUGz
 o6uRYyvj0+qoBrAuAJoGfP2nkddYyubqIhWhEK9W99ojX02wjaBhy8wzVcMKu0zvJq8n
 ARrX0MHgnMn/gCDxCh4qYog2OroSYGFm8QnCtk4vMz0CGEMZ1Pk+Q3HYIkmW7DlLIISf
 NdJZjCXwsuMGctXcP7Iou29e9dcb8geGdCZBsqmBYmwTM8+4fMxUZ2ugI0BwNVh2wIYN
 VDERKdUDHOrmOxaltV/hNYdE+9YJZrD3MoCW0Pfp7YGuLD4P32ZwGPm3lmO1v2+6qWkF
 XEHQ==
X-Gm-Message-State: AOAM531tKa3YY2jBOOp0W8agp2sQSS5um7B+QWvcSg2BxVozZ/0s4gx3
 DrBNXXfcenJ0qCEERT8a533HPkeyvP4=
X-Google-Smtp-Source: ABdhPJyOoEl2EyBaEKDHqV+DPOhHyR4+tKumhbZ85FjJmKhuLm3MQdmT5CSPZNaFDXLZQh47CTS6SA==
X-Received: by 2002:a17:90a:f314:: with SMTP id
 ca20mr1829215pjb.191.1604658349132; 
 Fri, 06 Nov 2020 02:25:49 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id g3sm1260633pgl.55.2020.11.06.02.25.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:25:48 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v6 01/11] mfd: mt6360: Rearrange include file
Date: Fri,  6 Nov 2020 17:53:42 +0800
Message-Id: <1604656432-10215-2-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_052551_090768_9D4E7615 
X-CRM114-Status: GOOD (  11.62  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Rearrange include file without sorting by alphabet.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index e9cacc2..c7a955f 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -5,15 +5,14 @@
  * Author: Gene Chen <gene_chen@richtek.com>
  */
 
+#include <linux/crc8.h>
 #include <linux/i2c.h>
-#include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/core.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
-#include <linux/version.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
 
 #include <linux/mfd/mt6360.h>
 
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
