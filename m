Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3AFBC433EC
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 03:05:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9230A2065D
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 03:05:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z5urZWFJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MsruNvkL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9230A2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=d634Cq6ryiOtTqNS0gkFtoP1hIik+ZWWSNlP4cO9IhM=; b=Z5urZWFJfkrdZ4WbCcR19c4RV
	YwF0ayKugDOVNzchFkzgswzPPGsYyi8iHzdNRrWzeQiO2NV10LWwKDe8rVhR07bf1vjnIigMKeW4z
	o7dlTqeKpynCIkO+D+y+bpJ+VdL3caoSol2nJNpHOFWKL105odkRJXSfNzmRbsfvIcHKhS0eZDhoy
	W6zx4db7rKWcgYP5bE6xhdljebmzwxoU3v07kBy8taX/ZYEbzCBw6rfx07Lfl5e75YfZ4UMOUMgk7
	EbwjlmBY+nBvqXEDKG8iHqLAi8vkICRDRhYwPVVkkFuvrN7IRZlQSG5hGHy4IeQpfSEnG7WRrVGa5
	RA0IfX7MQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7VSV-0006vA-Ja; Mon, 17 Aug 2020 03:05:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7VSQ-0006sn-Qk; Mon, 17 Aug 2020 03:05:11 +0000
X-UUID: c60dd5bd07c7458d89dfffbdd1fe5c26-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JJlKMP7ee02ays8KbIJqTQ/xkRTBFEVByYajjiFisPk=; 
 b=MsruNvkLyuUFU/gLaYnStdITTrk2LG3mKzT9a2QZlaZLbcNu3jtjFeiXGXMB+8G6dxLrtsC0zc8qIxuEuEIln4hGwT6ZuZRE0z6bsmnKQ7Siq8KgWDJbkN5whrXme4HepB0uAvpYkO4oLaY6hiYsVkbesVP6t13haPOwNS8v8m0=;
X-UUID: c60dd5bd07c7458d89dfffbdd1fe5c26-20200816
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1618530009; Sun, 16 Aug 2020 19:05:04 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 20:05:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 11:05:00 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 11:04:59 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v4, 2/4] dt-binding: reset-controller: ti: add 'mediatek,
 infra-reset' to compatible
Date: Mon, 17 Aug 2020 11:03:22 +0800
Message-ID: <20200817030324.5690-3-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200817030324.5690-1-crystal.guo@mediatek.com>
References: <20200817030324.5690-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_230511_009961_A797EBFA 
X-CRM114-Status: GOOD (  10.74  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 stanley.chu@mediatek.com, srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, afd@ti.com, fan.chen@mediatek.com,
 Crystal Guo <crystal.guo@mediatek.com>, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, s-anna@ti.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The TI syscon reset controller provides a common reset management,
and is suitable for MTK SoCs. Add compatible 'mediatek,infra-reset',
which denotes to use ti reset-controller driver directly.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
index ab041032339b..5a0e9365b51b 100644
--- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
+++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
@@ -25,6 +25,7 @@ Required properties:
 			    "ti,k2l-pscrst"
 			    "ti,k2hk-pscrst"
 			    "ti,syscon-reset"
+			    "mediatek,infra-reset", "ti,syscon-reset"
  - #reset-cells		: Should be 1. Please see the reset consumer node below
 			  for usage details
  - ti,reset-bits	: Contains the reset control register information
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
