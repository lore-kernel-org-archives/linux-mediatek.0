Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A759C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:36:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22DA6138F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E22DA6138F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWuFKR+2eQymSUFXXjWEkqG+HfFOmC1STJvdrCk/7Vo=; b=OqPBrtCvQbBPh8
	xEbytIM8NxpuCtuC+8s+6yEakodl1o9ChxyeA44ifWwHYt0DTDGIU5VnNOfT6ABFZhIFCD0LyT89G
	dGdXk7SMnNQYhpdYTsSTjwJ+RJQSpX3KK06nhiInN15ThVHbDLSgqOywClDBX+w3/l3QCCRuq0B7M
	J5I5Ev/Wgd0KM75RxdnXOZPMaeb7YAwkCjq+jA90lG7mu4osqQPm+oawWkiQ1umWE2bZYeMTohRoX
	tDyzP/EFV5D41kZGDGag9+sybPXXoCADzkMjfadEdyekB7tJJm7YkB/hgCmXiBI4in5uPkLdzBaYa
	gA7Or+IX0g32LGuqMowA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mclY3-000gFw-No; Tue, 19 Oct 2021 09:36:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mclXq-000gBA-4K
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 09:36:32 +0000
Received: by mail-wr1-x42c.google.com with SMTP id e12so46579652wra.4
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 02:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=31i1xoK4zj6WYEXJeZOG+hCuryOlTysPNDj29OD14Qs=;
 b=Y2eamLP67cGTLHdzxPbLdUPEYihkfZRXjLmtnxWMV7V8ha/xCyyiXWo24W7cKen6+2
 AGmoxk8bAW1ZE6wRgyRZos2ZQJMvNmw3sEuikrcYvIIJYL03YACYQOa86okD3Erk21lV
 zAulkyr2f+gShgG97UnqzhdNrdO4Ua/xG4LPoWuamUHLjChfopvT3lP+voMhWfkt75tD
 zuNwqbKJobK755qHzpRhFHg3/uXIWAqhCAsc34J2OyIwWG2lZJkVUYczpRjmhcaddgYi
 S+iJFqHmqysc2aP70TNig3aAyHEkcBamDT9NGvGMwzizmPHMQZX9kKJlZVFcn3mFIdL5
 Ioew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=31i1xoK4zj6WYEXJeZOG+hCuryOlTysPNDj29OD14Qs=;
 b=NQ4bWbVDR4KK1lHb2aSziE3Y9r8eOkE2vNjbxpLPcS1tWSaiCYJh8U6eVHtn1QEAP0
 y551VwUtfjIFzFftfAA0k7LcXc2b5wtxvEljkld5Q7YOsm+qlHpsrKGj1kJhW5t4tbrO
 nkrrIsdGhx4hX/BIHRbVvv4eMhZ+1GSLKLtVFuoPzHTLOFMGCU0GoSIeIurRDFjSJ+Z2
 Ub2cdszY8Bj0Bo+S5ckqsKH45IWDHBvbsFCqxWi7GjekRmnp3ZDOI65LbapB//Brw/ic
 BPS7ArJfHqbgfWnmCJBDkQX3trIAzGu41ARsPaQGhILmVPuYIGOvwpxfGA0XHzRoPllc
 m/Qw==
X-Gm-Message-State: AOAM530GgL3U+QVtPWc4H1IKeTbaWut/QoDU092iP07umu1xIsr9J1iV
 k8hYwWZdyzP4vYTfwfwu+yVljQ==
X-Google-Smtp-Source: ABdhPJw4NYs7gbiGNwWpmbKhDuahGeNvec/NydYON0RX/wR9CskYqy79yYN2c7zZkDO3NcrXwh+8DA==
X-Received: by 2002:adf:f812:: with SMTP id s18mr5519018wrp.347.1634636188391; 
 Tue, 19 Oct 2021 02:36:28 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id o23sm1765765wms.18.2021.10.19.02.36.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:36:28 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 2/4] thermal: mediatek: Fix apmixed error message
Date: Tue, 19 Oct 2021 11:34:02 +0200
Message-Id: <20211019093404.1913357-3-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211019093404.1913357-1-msp@baylibre.com>
References: <20211019093404.1913357-1-msp@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_023630_194406_77CB5563 
X-CRM114-Status: GOOD (  11.88  )
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

Seems to be a copy and paste mistake, this is the apmixed address, not
auxadc.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Fixes: a92db1c8089e (thermal: Add Mediatek thermal controller support)
---
 drivers/thermal/mtk_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index ede94eadddda..93ee043d70da 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -1050,7 +1050,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	of_node_put(apmixedsys);
 
 	if (apmixed_phys_base == OF_BAD_ADDR) {
-		dev_err(&pdev->dev, "Can't get auxadc phys address\n");
+		dev_err(&pdev->dev, "Can't get apmixed phys address\n");
 		return -EINVAL;
 	}
 
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
