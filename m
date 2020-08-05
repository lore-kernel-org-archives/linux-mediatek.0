Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F2C9C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 11:30:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6AF2322D04
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 11:30:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tNuTtDAh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DC8aYJFt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6AF2322D04
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7+zKu3j2tRCIk+TAB8gVvHALW/XTCH+sAYvUGkoCok4=; b=tNuTtDAhBAi+yTm5LxH7bWRzb
	QyoUk5lZG+KzzZrnnfaGnLkjLaVZtcyoBPnREfwgTnKY7dxRT85mT5a50rHnujDr/1FFxxqEGHC6k
	HaPrzlEU4iQhWiQNTDE2io1U6HFUq/iqq5O/uQSMorQiFEAYkO8N0u5ejecwYh7VblpDoAubxpO+/
	YZkCFSO9B69SQJPtLXoHY1YNCntBqvr8BZiGSHu0t0YmbH2j2ufQsx7p2BrKd7jMh2o7IjJqofm3R
	fmW//nlHaqXquNVC2A3sLU+e7wSSmbrNRcxWhkrQXZ+0JteiciABSuF6Aie5G3DMc8l9kB1B8GIoz
	OxwUFhY+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3Hcn-0002fi-N7; Wed, 05 Aug 2020 11:30:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Hcf-0002by-Tg; Wed, 05 Aug 2020 11:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=J08654X7H3kbc58/m2gL+bfcL2jyb0HzXVeKBQozN18=; b=DC8aYJFt9cO5OYGZXYZ4pk5oxV
 +8JcsbVbK3VPyo8Rqa1zrayMTV25RJIgCiEFVYdntVbNcbl/W/L8yxfEDBIZxqO7ExarM07ZZLIXF
 /DfydtCqSvavDLR0MTVFO/RKveDDydmsL67zqd02pXJf1i6lK0XPCNARjPP5QG1lVKPo/nOZgIiXH
 kKto+7OnkDAbfE6fGtfntJiJslatSVyIfBpqIqW0R6ofjAhlbBppIAqr/Xu5JC9b/3WP3jyY21ACY
 DFd0XOgngt31L6mWcqKubsxBwHcyGopOuxQzNlWx02B8ygbE/ejNAP/7nr3ygleS1IJbek2tw+PiA
 OYbmVQSg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3Hcc-0007nH-4c; Wed, 05 Aug 2020 11:30:14 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.93 #3 (Red Hat
 Linux)) id 1k3Hcb-00BavU-NB; Wed, 05 Aug 2020 12:30:13 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: [PATCH 1/3] arm: dts: remove stray /dts-v1/ from mt7623a.dtsi
Date: Wed,  5 Aug 2020 12:30:11 +0100
Message-Id: <20200805113013.2763510-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <8ef96e4d02ef82e171409945ee6cc0348c4fe594.camel@infradead.org>
References: <8ef96e4d02ef82e171409945ee6cc0348c4fe594.camel@infradead.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Frank Wunderlich <linux@fw-web.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: David Woodhouse <dwmw@amazon.co.uk>

This isn't needed in dtsi files.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/arm/boot/dts/mt7623a.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index 0735a1fb8ad9..a96075206cce 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -5,7 +5,6 @@
  *
  */
 
-/dts-v1/;
 #include <dt-bindings/power/mt7623a-power.h>
 #include "mt7623.dtsi"
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
