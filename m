Return-Path: <SRS0=Hp3b=MR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 064E9C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jul 2021 16:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA72C60F37
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 Jul 2021 16:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA72C60F37
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kKCvHl6szjtvTvBefLicmc1eZ28uvsYBLsFrN6niey8=; b=b6fgQ/7365hCHj
	SBF49wOCyYV6rSEFMn5h7o29Z6WEF45X8yQfniUnJEAOcgxhAP7g1m20dcfa0IBid2I14d0aU+Nhs
	NI66OkRf+BkmCSpkZT0ZrYsoAPTi3x1vT2uAufrWAllLhVoG5H57JAEZB8YDTXBtO6ewXXplEBtbB
	GU/uOwTmT/JmukU6/9lGU5WPghnHjGl1xznWpWiB0eLRsRL8VBhxrZ5B1DvKy4XGfcnAIaWO4g+FD
	MBD53p+2eZdha1MzcBGJyUM5M4J1DH3NYF2vFQJQEiA6iFweeNuB1cuJibHKg/jxQKkbI+w/GSjBa
	r1fdNjVrmfyL2XSC6dgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7h5x-008qPd-2R; Sun, 25 Jul 2021 16:35:17 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7h5j-008qO5-QS; Sun, 25 Jul 2021 16:35:05 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
 by mxout1.routing.net (Postfix) with ESMTP id 95A893FE0A;
 Sun, 25 Jul 2021 16:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1627230896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=Lg1oxsELMZqDQIrjH4RSgZ9fqtlF3mLOVTFIS4nov8g=;
 b=o5maxEdrEe49lcIYpRM5ZHrnwMiylZPtlTDNW8qWdz9gjwfmB1xF56jNKZzSGfVoDlKXkY
 02tkghIUpwlnzDuFxrvI4v71yLfo3zVKs43p4HTLMuaksu3tqV9WVdDFbtf904gQ6FLFmz
 6TQAiXKH5li5nQ3EHpJoFrNAZviPo5w=
Received: from localhost.localdomain (fttx-pool-80.245.77.24.bambit.de
 [80.245.77.24])
 by mxbox1.masterlogin.de (Postfix) with ESMTPSA id E80F440126;
 Sun, 25 Jul 2021 16:34:55 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Cc: Frank Wunderlich <frank-w@public-files.de>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm: dts: mt7623: increase passive cooling trip
Date: Sun, 25 Jul 2021 18:34:51 +0200
Message-Id: <20210725163451.217610-1-linux@fw-web.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mail-ID: aaa04f1c-3dcd-4e4a-a25e-3c7da6c05f12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_093504_047112_32722112 
X-CRM114-Status: GOOD (  10.61  )
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

From: Frank Wunderlich <frank-w@public-files.de>

MT7623/BPI-R2 has idle temperature after bootup from 48 degrees celsius
increase the passive trip temp threshold to not trottle CPU frequency at
this temperature

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm/boot/dts/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
index b7247ab082aa..11933494e03d 100644
--- a/arch/arm/boot/dts/mt7623.dtsi
+++ b/arch/arm/boot/dts/mt7623.dtsi
@@ -160,7 +160,7 @@ cpu_thermal: cpu-thermal {
 
 				trips {
 					cpu_passive: cpu-passive {
-						temperature = <47000>;
+						temperature = <57000>;
 						hysteresis = <2000>;
 						type = "passive";
 					};
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
