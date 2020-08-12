Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A66DC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:48:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A67A20838
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 09:48:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k8Lka6MR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GaivWfKy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A67A20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wh4dKpbM2pWXWDw+NP/q8YMx7wZPLNduAE5NTpDPYDg=; b=k8Lka6MR2FBU4j6QkeRWUAcrfx
	rOyccj+qlUM6wHC7AC7NxiRhBgmgFlROik/LvMq6XAjr3B8tCybd9G5vnTx+8JgOsmcE8skMG2tn7
	+9BGoJDh+d0wiacxJpFhnlOgkESWOOxlJwa9TuUC2UyiZcyX5qsXxAYkO3MGsLnkUBcr06zY07TTy
	LXqDFYGSPTSeSDrL308TfnWwlDTi4heCr1mYeFe6wS/yZHAhEn6Oi0R/5ZBVurpNbJZFgdt2J9S7X
	CwHTAvEeTA3BMd5BC32XU97r8kffVhSX6ov/wmW1mvSdi9nxz2uLkSAZLauhyIMtHvM/aHvwN4/NT
	5sCPN5wA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5nN7-0000y8-MA; Wed, 12 Aug 2020 09:48:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5nN2-0000uC-0A; Wed, 12 Aug 2020 09:48:33 +0000
X-UUID: 9134dc06c5094d07a5b353d3e3c9f27c-20200812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xVTG3i3NZ+1cOXWR7yCUvveG4pS/BEjPy1kRWzM1V+Y=; 
 b=GaivWfKynI2L6k5ae8TAln6yDo2XrEp3QqwuBEjHpk+b1NrtuSHM0P7PksYOreCZoOKPX7HBpD4xYXfT84QgCB01U9h8t1aDZ4Zv+746WrRc9ZjCevyreIhxqj8dhiIxZT6pX6/WIz039YJSdL4TfOEAALwwjNkdSWGQIUtozZ4=;
X-UUID: 9134dc06c5094d07a5b353d3e3c9f27c-20200812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 763785288; Wed, 12 Aug 2020 01:48:28 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 02:38:25 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 12 Aug 2020 17:38:24 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 12 Aug 2020 17:38:23 +0800
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/3] mmc: mediatek: add optional module reset property mmc:
 mediatek: add optional module reset property arm64: dts: mt7622: add reset
 node for mmc device Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++ drivers/mmc/host/mtk-sd.c |
 13 +++++++++++++ 3 files changed, 17 insertions(+)
Date: Wed, 12 Aug 2020 17:37:23 +0800
Message-ID: <20200812093726.10123-1-wenbin.mei@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_054832_268927_2F15D3BC 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
