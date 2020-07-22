Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 724FEC433EC
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:10:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C37E2064C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0R5pNRzp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AS/nqx36"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C37E2064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ud8S+bKM7FpocuUHtpH5FRIX3D0HjR0BSULRQo6UwZM=; b=0R5pNRzpgcUY9Zfj0q7naQeSn
	T+57r7h6m0GvLGbmY+5WGUoPMSnXVc6SWzr9GevMiLoAj9fr6fbWAc5NObmoyvhb1e19SvpJ2B9Hn
	idPMiWboPQn2MGHYuzkB8Qdb3in8L3l9Kj1oCwnRuyG3LRtI1pT9oMeXXcfluKrDMkCA+tD5qnzYe
	/eVG75imN3rzZFUNJBoJPXEoJfVPVKK98K6M2bNtt0+lyW318CiVsPT2V9gW8DrRf3TYFxSK0GaiD
	GwsWYkJX8RjqNOKuimpPmQ9196g4243OnFXD58Eb4LhdgooSDIVYSjQMcatgAG39aKlqCwdiT+hJe
	ILfmPEPvw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy596-0003VL-P8; Wed, 22 Jul 2020 03:10:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy590-0003TP-Vw; Wed, 22 Jul 2020 03:10:12 +0000
X-UUID: 6d40043e8fb6452d937e513cd1d4e3be-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UCdWr5LacAICSYEsyImGK0yGxPx4v01rG3yvP5bnIFE=; 
 b=AS/nqx36T8nCrO+CVu93+4st2+27gkaI/jhu/QmOgtwF9pWYHB66+oSmD27FxPbzhuFhgyjJIUmcv/RB6vp61XcLWr5NgEquN09hm6KVkKAD0AJy4sB7f90Wb52JvBOcGdlTrBIRhnpLHYGMfHjEbgSSdd1KZUmjRe3VDtDhgQk=;
X-UUID: 6d40043e8fb6452d937e513cd1d4e3be-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1653825811; Tue, 21 Jul 2020 19:10:04 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 20:09:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 11:09:58 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 22 Jul 2020 11:09:58 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: remove UART3 clock support
Date: Wed, 22 Jul 2020 11:09:56 +0800
Message-ID: <1595387397-13110-2-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_231011_237098_9E168A75 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Hanks Chen <hanks.chen@mediatek.com>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

remove the redundant clk interface of uart.

Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 include/dt-bindings/clock/mt6779-clk.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/mt6779-clk.h b/include/dt-bindings/clock/mt6779-clk.h
index b083139afbd2..2b5f2354d7eb 100644
--- a/include/dt-bindings/clock/mt6779-clk.h
+++ b/include/dt-bindings/clock/mt6779-clk.h
@@ -229,7 +229,6 @@
 #define CLK_INFRA_UART0			21
 #define CLK_INFRA_UART1			22
 #define CLK_INFRA_UART2			23
-#define CLK_INFRA_UART3			24
 #define CLK_INFRA_GCE_26M		25
 #define CLK_INFRA_CQ_DMA_FPC		26
 #define CLK_INFRA_BTIF			27
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
