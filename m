Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107D6C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:45:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71C6923B6B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 11:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71C6923B6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CYeIm4JKLTYXGg39Y+4DQ/M3KkTYDqBKv5B+XZHe0MI=; b=vOJMf05mQVSNYx8MjI/uTAXm2N
	T6jhzqbim1ItKecpe+2eacW98bTCJlxLuV2DRnEvCgfLfveh2wgmgyuPb/ierORO0nrCUasihyXBo
	uQvOIYEB0k4GCShp6RF7mE7Qg5b9TiVsViNoVZ7u9Mc2egxUveT1cdUcfLycxtSVo2IKfYE4oJ3cH
	QWPoOU+eSV+GaJPzfgqdWy3BWwS599AutjLWOxaesttfDQ9YBl9cXb5W2A4jNSIrkHBCnab5c36J1
	9KQ9cb6hb78GZwwa7rH99MMxpzMfYft9yHNO/86bqL554wswK/sQ9t/fqMaY2JWPEquhSSYCIF/np
	O//3m8Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmxtv-00014P-Lx; Wed, 09 Dec 2020 11:44:55 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmxtr-00012p-Vn
 for linux-mediatek@lists.infradead.org; Wed, 09 Dec 2020 11:44:53 +0000
Received: by mail-ed1-x542.google.com with SMTP id b2so1213869edm.3
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Dec 2020 03:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3zBnoEd2BLvViOa+U8szKTE6OyLng93MHF1miQwX9o=;
 b=Byyh+WzGJwB9hb+hsnXSoHIvv+Tr7CA98iS13mEF37Dm62Y+yT8PAW5ZANj12pQ5sA
 xvYJQCYfDnP/mmuw0CNmbpbbk8YWu1rSlBZ04EPWvksHnWIRBBi6berkz8TuWyaS8kvV
 ep3ZCcV26ZEqwMuVeobHq7u/RFQ16VCoAjsvcZBtRakby1zzJCMCskm2VQjt/nx+30GA
 FKC23QCKr2trZC/BtbKKaJBPacLMroHcsHd8cj2y338s8XiSqWx9IgJV/766AeY/QMto
 Y5fG7Ls6ljj3PceYbWChqlGyj6fMRbV7NWK6UhJyvGIRlzw0Ttbfk5Go3apzggTfZm2B
 k1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p3zBnoEd2BLvViOa+U8szKTE6OyLng93MHF1miQwX9o=;
 b=ajvU7StW5E/NaZlGIdkXtTruKyZHb84bYPgRUqSFIuQH6gqDPh5IhbeUZFIquH5FEb
 2UAJXTP+P1BVthwyepj56A3wbknrWhFzvdwBzj85/vIIFboKeUvEgOAriRFbgT3k04F2
 Epm1K9lNSRmjOhNJ5bGvag9eZB5lHaqCfN1JMDx/nnSbXRs9KziYYyLsvEACxYj4uUdJ
 JmqXGACcGBFHBhRrEDjMO4rhTdj6bVjcDMCMVgdtQLEPgKizY7FF5Ri0iaZzzXSvnNrw
 wYFJc2VricI2+hFJUzUsDGr5kZhYi8FkIDRnE6VKKKsQecRfGvyLyt/1vOG/arq2Cil6
 kMiQ==
X-Gm-Message-State: AOAM530lqiZRvykFMBQVf7rCQ1Ut3x41ajh1UwazIyodS7GA/58pwfi4
 1yh5gwPr56L8WV8zDXGzHkQgzw==
X-Google-Smtp-Source: ABdhPJzXaWJEsxBqW/suyQOFajp0LZEwwhaXnTCIKtAoFuT+paYDZO6DqYGylmK2TXlZJjMUrzx4qA==
X-Received: by 2002:a50:cdc8:: with SMTP id h8mr1602775edj.293.1607514289034; 
 Wed, 09 Dec 2020 03:44:49 -0800 (PST)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id c25sm1260327ejx.39.2020.12.09.03.44.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 03:44:48 -0800 (PST)
From: Fabien Parent <fparent@baylibre.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/2] =?UTF-8?q?=F0=9F=93=A4=20dt-bindings:=20dma:=20mtk?=
 =?UTF-8?q?-apdma:=20add=20bindings=20for=20MT8516=20SOC?=
Date: Wed,  9 Dec 2020 12:44:39 +0100
Message-Id: <20201209114440.62950-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_064452_172341_157C98CB 
X-CRM114-Status: GOOD (  10.25  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add bindings to APDMA for MT8516 SoC. MT8516 is compatible with MT6577.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---

V2: no change

 Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
index 2117db0ce4f2..fef9c1eeb264 100644
--- a/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
+++ b/Documentation/devicetree/bindings/dma/mtk-uart-apdma.txt
@@ -4,6 +4,7 @@ Required properties:
 - compatible should contain:
   * "mediatek,mt2712-uart-dma" for MT2712 compatible APDMA
   * "mediatek,mt6577-uart-dma" for MT6577 and all of the above
+  * "mediatek,mt8516-uart-dma", "mediatek,mt6577" for MT8516 SoC
 
 - reg: The base address of the APDMA register bank.
 
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
