Return-Path: <SRS0=onLQ=J6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B777CC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 05:06:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C7A613B3
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 May 2021 05:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C7A613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NfxEw2mfMTBUsb5ztymeNMA49to4RR+p8zc3lwxCc6A=; b=WgHNmc9vZx99lG1p2DeNUmSK9
	Rj1Uk21Y+WFR0ArVXJra1HFlRUxv9+c5swyyRg5YHkDCAM2HwNKQge/60jqMZEJ5yF/NTOezug8IN
	MN/nMsyfdE8b2JVL//ZS4gkqJQEAPO9131x8aWqV4swBgrasuXPLzkY4s4OlcoDP3HO/lE0BnWM93
	1lFc9FPG0dM4itWNXwgWVTivDD+naKpyEANEszW0gWdH2UaqGjrw7Zbmaf9tWUAo9xXEM29OxuZL8
	2xVfxuq2/jVqN4ATB9eQSwWjHlhRLJB0BWs3gy+HbkrMq/AsLmSrdTjG/UXfD6h+/ZtSqV6NasSY2
	kZ2mLRmsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldQmg-00DCBZ-IG; Mon, 03 May 2021 05:06:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldQly-00DBzi-Jw
 for linux-mediatek@desiato.infradead.org; Mon, 03 May 2021 05:05:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-Type:Content-ID:Content-Description;
 bh=Gd+q5isoBTEaO167JYZlFPuozG7kopSgX/B2WmZT4CU=; b=fQ1bCBNry0h8TLJ0iGz5xOjUkH
 LCWDyx4J/G4P/OuK1a4CmfMnUu0fPkvCq7x4snEdCGREUjXS3bkRLPsBdj/dQ9rUVE8bJwypFust2
 RXQWBz+R7B6YkowzR1pzZzMUGnZcl/wzKIu5Ku3oikoTwzGYEkgIBMFc1a/TPj1DrjuL7m4hdHVLp
 XVsJZJD/xL9ieOW2W6u66CupSid+d7BUAYx1KGR00PqY0hIyfGDuljaByeVSMmoiNzjAQ7iPev22E
 qYMFcva7xCTSQigZ/a6wzqOS0YMrC6ePGGtng3hbD/CXn/K1RIjK8fbbPbPMXLCygfWV3rq86xLyy
 bOewG46Q==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldQlu-002pXt-Ez
 for linux-mediatek@lists.infradead.org; Mon, 03 May 2021 05:05:33 +0000
Received: by mail-pl1-x633.google.com with SMTP id b21so2199827plz.0
 for <linux-mediatek@lists.infradead.org>; Sun, 02 May 2021 22:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Gd+q5isoBTEaO167JYZlFPuozG7kopSgX/B2WmZT4CU=;
 b=lSkSIsRdhK8drnieHGaWU5Z3g0S5yMaBlkNsgsDMY3lvBXhgUlv0SUc4MJ1Xqe5GAB
 evI5zV66b80zQU0tftjWz08/TIs9qYdfswLM3vDfLBeGrNDwfJJbppalGGEYeTMGsdsP
 40SVzfFobjxQAC/vuSSP1ApIuSeidLvTdWZpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gd+q5isoBTEaO167JYZlFPuozG7kopSgX/B2WmZT4CU=;
 b=uGspPu16g2SFGM09/2vm5/1adnZyORMTlAWU/75/6LSGGVNneN9w/aNvwu7bAJSNrW
 Up7CLSwJNTYHo2YEI3bQlp9KeKQJBT8zGChw4jGzZj/MIIypraN36Lgm4HNrFtI1dbNw
 MlcRXlGCf17KMj7gmYVjdkcPh/s1U8xdKkNxnQ4j7uFB53RK7q9zGT1gl0YvfDwN86aQ
 xYZEPyag2l3cw+B4kUMp/mgGoRK+oG9P3+voofqogzKalKK/eixmFFZP33We1UOIPfaK
 EFqlexBAunF5iP6tSZYKVLi7CfG+jTsWTAR+W6DT11Z6wnPu0OXTLjrJgemurjznxFjt
 laeQ==
X-Gm-Message-State: AOAM533A0mOyyOkIxPxzRl+x5Fga6/Z5ja3dLAWk+ZfISzdfZ512LrLa
 dqkd5BZhV4vqWINKb/b+OJkLBA==
X-Google-Smtp-Source: ABdhPJzr0YgdF6zJDMGKSd8q835/nBnu4xKXG1psfhQlDWIKQuWD9DbhfQLmkZ2QLfxMzWvV/OJmcg==
X-Received: by 2002:a17:902:d204:b029:ed:19aa:c364 with SMTP id
 t4-20020a170902d204b02900ed19aac364mr18594442ply.34.1620018329259; 
 Sun, 02 May 2021 22:05:29 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:63a0:c726:475a:ace5])
 by smtp.gmail.com with ESMTPSA id 14sm7854600pfi.145.2021.05.02.22.05.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 22:05:28 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 devicetree@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: mediatek: Add optional mediatek,
 gce-events property
Date: Mon,  3 May 2021 13:05:23 +0800
Message-Id: <20210503050523.2571758-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503050523.2571758-1-hsinyi@chromium.org>
References: <20210503050523.2571758-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_220530_521976_FD6594D5 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mediatek,gce-events property is used by gce clients.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,disp.txt  | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
index fbb59c9ddda6..939b2da3bdc5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
@@ -75,6 +75,10 @@ Optional properties (RDMA function blocks):
   mediatek,rdma-fifo-size of mt8183-rdma0 is 5K
   mediatek,rdma-fifo-size of mt8183-rdma1 is 2K
 
+Optional properties for display mutex:
+- mediatek,gce-events: GCE events used by clients. The event numbers are
+  defined in 'dt-bindings/gce/<chip>-gce.h'.
+
 Examples:
 
 mmsys: clock-controller@14000000 {
@@ -209,6 +213,8 @@ mutex: mutex@14020000 {
 	interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_LOW>;
 	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
 	clocks = <&mmsys CLK_MM_MUTEX_32K>;
+	mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
+			      <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
 };
 
 od@14023000 {
-- 
2.31.1.527.g47e6f16901-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
