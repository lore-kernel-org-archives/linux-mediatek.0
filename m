Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A815CC5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 12:18:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14D15221FB
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 12:18:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m0uzIGRO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tze01Uvq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14D15221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98v57KCp3yimbU82QtsjN5t+0YFiYrEhdjf04q8VCcQ=; b=m0uzIGROn7oVomuE7DpzG4uIP0
	o0HR9psLRCpCnZpm4NjaTyAbgaFGT437tQONGdqUA3/pjph4aVzPKjZNB1MrI0+2JRweFZLwVrJF2
	czioiqTW6qV1CdtIzBI1crQxhxsnkcslyfzLjLC2REHlCze6QD0PxVspd4yaWc0Df36ZIFSiaCL5m
	0SO3i1WdvYZ/FCW5YYSQ+aH0Zatc2HynE5fvMdYtx7IoYs8fLrMcP8/kVKUJ4p4yPPkxrVHt6U8Ow
	sRYDu0sscsTyFbXi25I/rjiWO2HOoZVh5UB+L9ugHTqpO2eiRKRmwTdlU5SQt/MD5muYsW0pYxX+s
	vcx/H6MA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfMPY-0000YD-Tk; Wed, 18 Nov 2020 12:18:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfMPV-0000Wh-4i; Wed, 18 Nov 2020 12:18:06 +0000
X-UUID: d10e086836e14ddbabe53f11de3137d5-20201118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=K8L2lLMrZ5zB5NcxiRVsQcok4TZyBEeHrw9CcbG+AOo=; 
 b=Tze01UvqdmgihipWgF1H2SgluSRh82SJutIl/Ku2EWUzcNz1Ze79QH88W4LZLzodBIENgSt6HSO2ev5878m4b2Ltlbsy+xHFAKjKPrzEaVC7DvTKrEdTGBa9XBQe5KizGfNDbgUtOgjXSVdlpKxHvv1afnk3vnE5EkyU01u6AwA=;
X-UUID: d10e086836e14ddbabe53f11de3137d5-20201118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1236900420; Wed, 18 Nov 2020 04:17:46 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 04:07:58 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 20:07:57 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Nov 2020 20:07:56 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <fshao@chromium.org>, Argus Lin
 <argus.lin@mediatek.com>
Subject: [PATCH v4 0/5] Add PMIC wrapper support for Mediatek MT6873/8192 SoC
 IC
Date: Wed, 18 Nov 2020 20:01:29 +0800
Message-ID: <1605700894-32699-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_071805_331913_EB49FCC3 
X-CRM114-Status: GOOD (  12.75  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for new SoC MT6873/8192 to the pmic-wrap driver.

changes since v3:
- refine some coding style about PWRAP_CAP_ARB capacity for better code quality.
- make struct pwrap_mt6873 const.
- add pwrap node into Mediatek MT8192 dtsi.

Hsin-Hsiung Wang (5):
  soc: mediatek: pwrap: use BIT() macro
  soc: mediatek: pwrap: add arbiter capability
  dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
  soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs
  arm64: dts: mt8192: add pwrap node

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |  1 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           | 12 +++
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 90 +++++++++++++++++++---
 3 files changed, 92 insertions(+), 11 deletions(-)

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
