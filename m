Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8B6C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:27:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A9FD206E9
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W5vDWtT5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="o5FuR9vm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A9FD206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M2VrxC3SkZrkTqEWlTWnBjl5Gyl5qg3/LeG45D9Ja0E=; b=W5vDWtT5QcfSyuTjyvoj0B3KN
	g0SZ5/hB0s0iik21360/IbPXUrtPyi4PFa+dWeOSUDaMPLeobOeLs22M4zRl8wed+/vf0//heduZD
	xsrM5iEqlehJoHV7WjxZJu02W32iyjvgmJ9pNAiHchq9TcghFz6rXDPzpQxP+Kcns+TapJ94MeAr4
	csmh4svfQ6A31xIZC/RrkRlIf1Bd931Ofteg+N2KkXi04NTi3hNxaDhPX1IgNF5mW2NYBEYTMolnL
	pGL3ZLPGAo1l2PukaI4Pb3Kpz7+C249P67Tgfj767OEBV5O8PcEHfct51kIZzk5d5AnedOz2AWQOu
	ql+4uGe1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2TwL-0000bn-MF; Mon, 03 Aug 2020 06:27:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2TwI-0000b9-RL; Mon, 03 Aug 2020 06:27:16 +0000
X-UUID: a2584c9b4b4d4b47856f0368eec230bc-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Irp9/QjysrH0oJjoPG2VHXVZnPkCnGZYljixcmAEdkM=; 
 b=o5FuR9vmeu/sJjVz5wBz3PjUMa5IwuFs0cIZ5JGcwHbH2y7abkqg6Qek0B3YH0fIxthHZmiRwmIVvakk6FDtLFyBO2MWyWO3xWnOcer0L5WjXl/2Am0QE53l59fLHM+cQDPjDnNVartL5kSxSL/ITNPZOWXqECRUH8Ocu5Pl6QE=;
X-UUID: a2584c9b4b4d4b47856f0368eec230bc-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1181514455; Sun, 02 Aug 2020 22:27:10 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 23:17:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 14:17:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 14:17:09 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2, 3/6] dt-binding: reset-controller: ti: add generic-reset to
 compatible
Date: Mon, 3 Aug 2020 14:15:08 +0800
Message-ID: <20200803061511.29555-4-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200803061511.29555-1-crystal.guo@mediatek.com>
References: <20200803061511.29555-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_022715_057768_8F7A89BE 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Crystal Guo <crystal.guo@mediatek.com>, yong.liang@mediatek.com,
 srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 stanley.chu@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The TI syscon reset controller provides a common reset management,
and should be suitable for other SOCs. Add compatible "generic-reset",
which denotes to use a common reset-controller driver.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
index d551161ae785..e36d3631eab2 100644
--- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
+++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
@@ -25,6 +25,7 @@ Required properties:
 			    "ti,k2l-pscrst"
 			    "ti,k2hk-pscrst"
 			    "ti,syscon-reset"
+			    "generic-reset", "ti,syscon-reset"
  - #reset-cells		: Should be 1. Please see the reset consumer node below
 			  for usage details
  - ti,reset-bits	: Contains the reset control register information
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
