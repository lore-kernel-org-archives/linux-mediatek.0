Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255E4C5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 08:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=; b=gv9OsHaxscb1G8t85RrpWqVRhf
	lnCR47Vw5V6G3arZoXnf380hT7y/BTDj5toEJSNU54CsQUONOpj0RZ/iydjXZ+/A410nJZdaVtWMn
	YM4aAv0A4bpyl0aULcsAJDMpSrTbYUZJ3GGAQqqmwN0JJ8FAdOIyi1WJ61ZDC1cD8yUqDWDGKyg/D
	IeGQc/iGW9XMucJ4bjISAxDJdZtLkIb+fB9UGoQCNg5BWYaBN8JlVwBeTp38yB1GO45SWLgCZakDQ
	tV4qkTklFKSpfxOOd8MtPiDS00FMq9WA5srNc1yvWNqqgaFbpVLBycUXYBo5qz+8WRMDdaxftmSKr
	8lcT8KfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFla-00000007OdX-48xQ;
	Fri, 07 Aug 2026 08:17:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFla-00000007OcO-2a2b
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=; b=VxCtPlfXyz2xY3Ye3q1x006How
	xWR+oNn4MslnYv5gHiMiAR25Z4+uPLbBkmlmhzPPQhLJMbRUFU9X2SP5h8iPtPZZ5ryNW/4GcANy0
	Gc34cLzx2Wo0oGSD458FVgMpIHtnI27JwyNcPdvvyF/y3iogHc/qEAyn/iSWv0yMBiOLr2HhljlIK
	Q5oUsIFEbztAnA0Sa1UJISkl3guTW+BewPRJ/OFTDuCuVoTO7uP6lyBzaVxhvJg9xDa9cFmL36q4n
	XHLfL5XB8Rp65CcALdOa04LkqGcygAHD991TSsdRwG3PQEvDhO/QTx8VnyQB4qnymPaceYsU10jT/
	eQF7t2Vg==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFlX-0000000CBcT-3cZR
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 08:17:21 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3811f512167so3735629a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 01:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786090637; x=1786695437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=;
        b=LdZSTS183joQnvECNMFQhof6tnUQ1UJoUXyec8HKDz2LqhfXUcmmYeiyEzbXw5QxTw
         1t86ORAAezfQe3wwqqVMde3wDR13VQBqe/q22u3ZkZ2uN5PjtPdQJsSGvTp7F95Hq9LP
         Ie2gPiQEJIuTXl/cK4pFHqZhRQRgljqWQiAm/HJ6XDyslBgLU8q3qH8sCwChR4KhjpxK
         nRu7xar1Q8H7Lz9JGOJhlH0JnYNGTrbFhXLxaEA9cDQtkS3zWWlZ6Qa8lhXgp6lwcaWw
         7ORNH6ZkRx1ld3Bg8jM1daYROITc9ayy8Rzc+g9P9xZEcZ/OESJ9vDamwm23EHlAQJVI
         HsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090637; x=1786695437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PRtunFUAHa1sE6x3tYfwm8b9CkZHcpqXiGycwufdeh0=;
        b=dR9IcfJcS1A7TUFf08yIvwTwX+pn5xTmddl4Zbeo4DAk+zWFcl2RBhfXqRH5FJX1fv
         qWJ8w7GdOtk0BQRoaYqmx4cwwrhBrDpv+6+zHj38itAF6GyjcY5dm2N8NhmYM7NDfaEs
         cdvFmYTUMdWetbLfqM2GjAKVpMm0BHJJr2mX6rwnrpo1/N2VefpTPE19Snohe9nIb2V3
         9dRq/QWDUS33hdGZbrnl9ZkMNXCs7HlQKoeQcEUNIIXL+tXa7rWhX8uvL2ruq5rENyXm
         znMvXcKY0rAe3Z4y4lbMJAQc1yQdz1roqfUeAIGB9w+4hcLaAdHCxuVUWc6FHIOpShA/
         akSw==
X-Forwarded-Encrypted: i=1; AHgh+RoZBcKn7s4l2khkyAKXYxOMRnZwwsOjf5h7Vm9ogojgPspa5/TTMziFQ66+Sn42OShyxY3zfe0njGFsgSXltA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOAUp9wvNhUlzsWkQtIQs4DajuPCTQ5pXqKFhT2AbUBq4QC1r0
	7KzWca++KD4GeYzLdhu8/PGwKclh8quCBxhUeiM+tlH1ERKRjOD4qPUs
X-Gm-Gg: AR+sD1197nPgqpeVDfUPNP2PfgOeR30h1rGxrEHhU3XeDOm0ojhPfSIrF2vd36N1wPe
	F1AgX0UpftyB0kayFF9Txm+yolUxyGAXgQhhkG3/zanFJx79Iv838KAxof7NXGNg9Khw7Q34j/G
	9hEo7XBx4LNcY+llPUExCn70PR16ArzTBr3lkrhwgoLdbBUtJ3QYZK9/sXD9mT/wA/i1I+aUtro
	jRGExfO3BHkbHkGxprW/9UMSr6iHuNXEwDS24RLOsx8ReW6ZqoTd1t4sz9lTRkm/TPv7LSw5eau
	kA+uB+raIZ/qTXObFr+xEZi1WHbs2KnBOLkNaJ9/eQ94IoKLP4486gLK8M0Bq1dHBi5F1vo/hBC
	WZOXRRJA03n4CX6pM6sGau4u1ebXfYBY7N8mQ6//psVGb4sUJJqO3GrJhx50HWeK8YLAPWTvCnF
	l7vn73zX1O4J9ZjJi1lXE+9tVhghyVBd1R9lwl9V7JdSCkAM9H3ywhXWA2mXJLh2HZr453+oha4
	kCXlKn9au5ScyDvlakj0Ki1NAZPxnIrzyKHB2Kgs07o1V2L+AKMLIA4XQZJT6Jg1wuPY6IA7aRU
	g2Ml
X-Received: by 2002:a17:90b:3a8d:b0:38e:57a3:f218 with SMTP id 98e67ed59e1d1-3903c5b9f70mr18650486a91.13.1786090637616;
        Fri, 07 Aug 2026 01:17:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm3913377a91.6.2026.08.07.01.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:17:17 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/4] watchdog: dw_wdt: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:16:51 +0700
Message-ID: <20260807081652.38692-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091719_996492_F3C79695 
X-CRM114-Status: GOOD (  12.00  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/dw_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/dw_wdt.c b/drivers/watchdog/dw_wdt.c
index c3fbb6068c52..39031445d754 100644
--- a/drivers/watchdog/dw_wdt.c
+++ b/drivers/watchdog/dw_wdt.c
@@ -611,7 +611,7 @@ static int dw_wdt_drv_probe(struct platform_device *pdev)
 
 		dw_wdt->wdd.info = &dw_wdt_pt_ident;
 	} else {
-		if (ret == -EPROBE_DEFER)
+		if (ret != -ENXIO)
 			return ret;
 
 		dw_wdt->wdd.info = &dw_wdt_ident;
-- 
2.43.0


