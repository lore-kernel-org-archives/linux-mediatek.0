Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E92C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 01:28:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFE2A64FB0
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 01:28:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFE2A64FB0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CnjOA+6Tk1kkK6GXYJTMxAU9hTggz1zV7v29bKlIDy4=; b=D9ulY/LnV30JRJFcdpcv9xIbXP
	woAvioc1saixU0Eq1QCxtGAUtC2fIpTUcHoVdRZo8HVNkEYjuLzmG/SjocMYBA/SvJ3OPuOoGNtE7
	VxYr1Xu09mDc1fSKPjDQJdWMRJNtG/GyfySmNRpdHRFtfZDSPg15/FS8X8pLa0W48U6I9x2IAmRPV
	CZ9kCAj6yexAkZgTM7K2mrfysiA9SYJA3wVga9K3pnD70G7ctzdbD9rKAVOeATbzbcrQqBIAQKY9B
	LnHAL4lXpABeuAFmQhXJVh7zJ/+KJ00vwPbJZAhM98fb8fqJeeuhqlF9efHlm2GmsUUTUDzot0GWG
	vpdU1HsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7pvI-0003z9-LC; Fri, 05 Feb 2021 01:28:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7pv6-0003vj-Eo; Fri, 05 Feb 2021 01:28:27 +0000
X-UUID: 3384097c05bb468889249e4e96383753-20210204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OxFj7RCDhSyOfN/nFIfc6z3XRfwJpdtzhDOY8q9FU6o=; 
 b=FK46S2uMqSWss/FhZv7FmsYXcivZFRhsVC6/PjlzgAz3rSqebJ/gjW1DVvf/qVcZhWjgM5rw0mCmOVOlyqjd9FWr5RLXpN3fa0cNFnnJJB0BSXmitB1FDd07SQehu/Jbz8Mwgm/JT2aU4H+pplKioDa1mjnTH8QA+peMtzmPZdE=;
X-UUID: 3384097c05bb468889249e4e96383753-20210204
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1078365446; Thu, 04 Feb 2021 17:28:16 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Feb 2021 17:28:15 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 09:28:13 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 5 Feb 2021 09:28:13 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <drinkcat@chromium.org>, Argus Lin
 <argus.lin@mediatek.com>
Subject: [PATCH v5 0/5] Add PMIC wrapper support for Mediatek MT6873/8192 SoC
 IC
Date: Fri, 5 Feb 2021 09:28:06 +0800
Message-ID: <1612488491-6149-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_202825_290814_B9E359A5 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for new SoC MT6873/8192 to the pmic-wrap driver.

changes since v4:
- refine code about PWRAP_CAP_ARB capacity for better code quality.
- update correct pwrap node in the Mediatek MT8192 dtsi.

Hsin-Hsiung Wang (5):
  soc: mediatek: pwrap: use BIT() macro
  soc: mediatek: pwrap: add arbiter capability
  dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
  soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs
  arm64: dts: mt8192: add pwrap node

 .../bindings/soc/mediatek/pwrap.txt           |  1 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 12 +++
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 97 ++++++++++++++++---
 3 files changed, 95 insertions(+), 15 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
