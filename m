Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24181C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D59D4235DD
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 08:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D59D4235DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ECeFZVXKekroGc/W2D62EcL2BXiGfju+X5B31suEoY0=; b=Id3DqGrFAMTi5vAsxreMc4zWe
	JSfpSWaGAkCo5aubiqwmIyVju8PYG9lhXYOyPN5Vbq3Iarq1hXapIxpI6pp5OsmvFE2uGy33bFaw9
	34yKwAV/0Tcq0EsqM6FbDbHoGHRDKQ9NdWirgtxYQQ8GYn7sh8PwbxGxOtAy8Kr+keiZGRZ1w+wGE
	PoHLOj4Xj47IXH2CHu5QOeD5l6mW9yYDUah6VMvCmsV7/jiqb6/Ya4rcVL2hdBzTbjIbtJhlc/Lgx
	pkyTej4n12nl3KEesKy9QUYqcQOLY9NsCW+iTWgd9WdEjICXY3nauzUWWQKcE+vJswogpWw+TM7YS
	EhzQaP8KA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxmyI-0003A6-8d; Fri, 08 Jan 2021 08:18:10 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxmyG-00038f-5o
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 08:18:08 +0000
Received: by mail-yb1-xb49.google.com with SMTP id l126so14973639ybl.10
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 00:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=bI+0dIEYVTi9BtzYNPAvr6WiFZISRySVGENe/QVVeXw=;
 b=Iyscw6HOMElHAJAqxy6xFyo6nkn4oDAvWAg+pUIizUYF/vLoLvVh+XHIA75PrE2M69
 dduZxqboECIIG01/0rGLNzDPeZxb7bnQYF9lFkxuOCXGQDyMFbfa8FA1+v3qDAybmn2H
 I6huQgDIThU7nbf8A+IZtNO1r5Qtjz+jdLWVOzBryoFrJKTutnQDSGRZ+iEP04Rv9khF
 MnWRbYRgHNgBGsrbDMS4jWu3pCeo+uVvmWLHwQUN1IXXrRgRsK0ibfUj2qwDTo78idJI
 kmTOVtuIr9Y2cgngOalOyhzyfsTBaFGLWlOcwutTD0spWf9sBmblvs92aZ03PRch+atu
 Yy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=bI+0dIEYVTi9BtzYNPAvr6WiFZISRySVGENe/QVVeXw=;
 b=qVcMFNnk8hZbP4/rDt9jnrE2dM6S2Rliwp78aIBAR622FgZoY+reQNp6GcLaZXTH7v
 lTgw9TF5vxw74hyapDuPAVvUsgIGfh+8kx9iVHJKdcjdcw7K2ipq08RuMiD3GVVRU07p
 q5y75zk2UsRGL95hEZNdMtqeujIswCZcTJtJmVugcdPFOdC8pxBPXwaXKoASH14sE+RC
 Cx05Rj5XB4u5fQEblNhtTX7K88OGLtkF6RTqKmiutd8I8oKvBMhrgX65RTmtgNwU/1MJ
 MFtestXtqedQoIG8QDMTpdKIXHjgvNAEa0CT2cH9PMYx+uR4PbnESUyWlwlP8JLzlLmH
 ON2A==
X-Gm-Message-State: AOAM533Oj86znVd+1iwTN8/w8qKqpTO/5sdE5uvoU5ryhNRrLwyedTfM
 A671Q9gjYgu5MbwTl25MwUlzUXD98rg6
X-Google-Smtp-Source: ABdhPJygnrtyISlSlZ02dPQVOsCdCcsdrrSWjhpY98JkLLd5qOr7KV+rZKsNbB9nbQf38IzFNJeKIP5MZsSZ
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:c5c1:: with SMTP id
 v184mr4291137ybe.449.1610093884486; Fri, 08 Jan 2021 00:18:04 -0800 (PST)
Date: Fri,  8 Jan 2021 16:17:37 +0800
In-Reply-To: <20210108081738.2175224-1-tzungbi@google.com>
Message-Id: <20210108081738.2175224-4-tzungbi@google.com>
Mime-Version: 1.0
References: <20210108081738.2175224-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
Subject: [PATCH v2 3/4] dt-bindings: remoteproc: mediatek: add L1TCM memory
 region
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_031808_233331_0E88F078 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
 Rob Herring <robh@kernel.org>, linux-remoteproc@vger.kernel.org,
 tzungbi@google.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Adds L1TCM memory region.  The reg-name is "l1tcm".

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 Documentation/devicetree/bindings/remoteproc/mtk,scp.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
index 3ba668bab14b..3f5f78764b60 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.txt
@@ -6,10 +6,10 @@ Mediatek SoCs.
 
 Required properties:
 - compatible		Should be "mediatek,mt8183-scp"
-- reg			Should contain the address ranges for the two memory
-			regions, SRAM and CFG.
-- reg-names		Contains the corresponding names for the two memory
-			regions. These should be named "sram" & "cfg".
+- reg			Should contain the address ranges for memory regions:
+			SRAM, CFG, and L1TCM.
+- reg-names		Contains the corresponding names for the memory regions:
+			"sram", "cfg", and "l1tcm".
 - clocks		Clock for co-processor (See: ../clock/clock-bindings.txt)
 - clock-names		Contains the corresponding name for the clock. This
 			should be named "main".
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
