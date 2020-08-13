Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8A5C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:45:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0F220781
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 08:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0BJF19sD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oxHBhMF8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0F220781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5tvsfvixfBhh1CYgptEhN3FHYiA4ACLgO38BrgsUI84=; b=0BJF19sDeaxXSwvqs+NJkcNJz
	91ktCGF2XJtgOIJZnsKNNmVYn4lXZaANvsRtXblK4iAXKaATGkrOCTTHTSnLZYWg2b+R89zGwbTZj
	omm0RLDnNoCuevz8AIp2rCZRLPNR5dSc/bqqBMlmObeQ8XvWsYUTwHaq3fNcoKVCKIsxctfVga6cR
	PNdUEIGkzSFr4eZcHWDNLsA3jBbHvsq0Jb18JBgELx/NPhr8qRBcmUfOFXAlPc2G29KQmCjr+Lgmf
	HW36WgTD6b+cwB7C9LbNSQkxeExXcKcCmWlpgHLYh/+L2SbXW04k9I3X9xiUcqZCuTAItTT/tmcBe
	wMd59s/nQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k68r1-0003Td-Ga; Thu, 13 Aug 2020 08:44:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k68qs-0003QU-Vh; Thu, 13 Aug 2020 08:44:48 +0000
X-UUID: b33343c043294ab3b5b37f709eb60611-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=UiYITuOicKAGf3efIhr1L/4MAUvnnb66uoIfzUsZtVU=; 
 b=oxHBhMF8vD5OcchOWcI/sOHZbfwKWbIyM0UJodoScWRy4STTC1kQMGROEN1fYDvtcubJ05a3wyp4uIsYW96CdNHato4/JBVQ5L7TYJMzTy6z1DlfRgJNir1QK7NxI9G/mRngoywoS2XQBYXweA2CT0R/GMikO6YjZcoUj8h62lw=;
X-UUID: b33343c043294ab3b5b37f709eb60611-20200813
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 784268315; Thu, 13 Aug 2020 00:44:42 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 01:44:40 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 16:44:39 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 13 Aug 2020 16:44:38 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [v3, 1/3] mmc: dt-bindings: Add resets/reset-names for Mediatek MMC
 bindings
Date: Thu, 13 Aug 2020 16:43:38 +0800
Message-ID: <20200813084340.27292-2-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200813084340.27292-1-wenbin.mei@mediatek.com>
References: <20200813084340.27292-1-wenbin.mei@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_044447_190232_A0E7DE30 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add description for resets/reset-names.

Cc: <stable@vger.kernel.org> # v5.4+
Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
Tested-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.txt b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
index 8a532f4453f2..09aecec47003 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.txt
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.txt
@@ -49,6 +49,8 @@ Optional properties:
 		     error caused by stop clock(fifo full)
 		     Valid range = [0:0x7]. if not present, default value is 0.
 		     applied to compatible "mediatek,mt2701-mmc".
+- resets: Phandle and reset specifier pair to softreset line of MSDC IP.
+- reset-names: Should be "hrst".
 
 Examples:
 mmc0: mmc@11230000 {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
