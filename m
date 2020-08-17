Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2CFC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 02:56:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C706220658
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 02:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ub03/hn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uGAAkt5H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C706220658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JUzISJMcdC5nh9+8gB9Ck3UB3vgcsgTOaLDmyTzEbd0=; b=2ub03/hnHdZWs7FafbKbjBChv
	XLV+ExxRTozf4mQlNTY369BvH3VdwYNZPaTnQ0xKZZRRqGE7fwhltzEQgCkrsUnG9I1UAeNJ0+jwB
	ENCJ9fkPUYr07jFl5KJnPc8lAQxV6t89joFuaATQzPsj3Nd/VajVgn7aifD1UznCkDrHU4R7BuuFm
	B7JyJypUFndbUhmp5W1t3zDqFqur63JVmxCsRReRd5sYqMEXRzIgHnZ0x6afTEZYFd+r1dgEACsNS
	850B/p3o/c6BYlj8/DlCmdWlFgAgm2EczVRLiipvIhsdUzWaTFCK2LXLogf57IqeSNSn05Z1qMapW
	W6OiKpMUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7VK7-0005rN-H9; Mon, 17 Aug 2020 02:56:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7VK2-0005pm-C1; Mon, 17 Aug 2020 02:56:31 +0000
X-UUID: 2127bfeefb8947b1b540941ed0698bb8-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=t4ilFaoK0tLBNope3nohB/2oIAVf+4PK2ECy4GhL2WE=; 
 b=uGAAkt5Hf11C0SneHLchGrIX61KNoJ1yZosegm/aiMALt/022JHTW182tqfVC9MFoi06YarTIPKbGHAYQjfMhtNFGiXDOFTL/nACVAT6dqA8TYDbSGtT40AfmnPABxLhufkz0eWRP8kQcogkJ31VT3J5zMDwt5N+K9ZY1bsfaYw=;
X-UUID: 2127bfeefb8947b1b540941ed0698bb8-20200816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 414903955; Sun, 16 Aug 2020 18:56:23 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 19:50:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 10:50:10 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 10:50:09 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v3,
 1/4] dt-binding: reset-controller: ti: add reset-duration-us property
Date: Mon, 17 Aug 2020 10:48:39 +0800
Message-ID: <20200817024842.5289-2-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200817024842.5289-1-crystal.guo@mediatek.com>
References: <20200817024842.5289-1-crystal.guo@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: E94DD4ACC9153DF574A91C2DB754D011E245F7F99EBEE0F160CFC2196866DE2D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_225630_758753_C4442926 
X-CRM114-Status: GOOD (  10.57  )
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

introduce 'reset' method to allow device do serialized assert and
deassert operations in a single step, which needs a minimum delay
to be waited between assert and deassert.

Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
---
 Documentation/devicetree/bindings/reset/ti-syscon-reset.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
index 86945502ccb5..ab041032339b 100644
--- a/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
+++ b/Documentation/devicetree/bindings/reset/ti-syscon-reset.txt
@@ -59,6 +59,11 @@ Required properties:
 Please also refer to Documentation/devicetree/bindings/reset/reset.txt for
 common reset controller usage by consumers.
 
+Optional properties:
+- reset-duration-us: When do serialized assert and deassert operations, minimum delay in microseconds
+is needed to be waited between an assert and a deassert to reset the device. This value can be 0, 0 means
+that such a delay is not needed.
+
 Example:
 --------
 The following example demonstrates a syscon node, the reset controller node
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
