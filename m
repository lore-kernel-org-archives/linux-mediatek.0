Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC45BC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:19:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9B5F20672
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 06:19:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p3Ak0to/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qH73Jgme"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9B5F20672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e7ayqVAdCbwnmbK5cwzV+I0EvVFsMh+g49GTpJ4zdyA=; b=p3Ak0to/5sakICWowtWJMojgZ9
	gfPAQ/ZpdtW5s5mi45S/k7IoRNwKwWvlzapr5xk8k7xj5yzE9aUjppbn8QsU20Hm6ID4jm5BmMwrm
	nNYnInNwAdrPNzpTjs2u4zEERdVawwBZXK2Wu9AgTH6JDgwYbSgqDwgSMPCy53pSmPOciRCJrfbpP
	thvXENESN3DRgHXHAFadvAVrVF3/MFUYcUZwPvmVXmwPFbB/Rs5e+L+sWB7XY33oCbSR3TMn1PD8N
	88qLDNbBIUOmmrvZ2/w6zDjSVeVW87wqxkXyeWRBZUjTUoSEV4JkPCptycGVGLMj2cftw1EmJqA4b
	aBZk3njA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2ToU-0007Np-45; Mon, 03 Aug 2020 06:19:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2ToQ-0007Lu-61; Mon, 03 Aug 2020 06:19:07 +0000
X-UUID: 20abfcad33644a97b339f09614557fb5-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AxpoOF2EVqGDrkSgJE/mVxWLigpKfOKa6+0MTFuhn4E=; 
 b=qH73JgmevQF06n41to3tw+3EOSCUUtU5t1F3atsir4Kwa3q3ZLt7JQDqNPsGGRIwoTkYUMP28zvdMcbRd3NS5eu1bnjmLuboHMDGgS+2IFGREpBjD5aqDHuOHgeZ6GJijkkIJP0Fjd3m859y9BwYfKpJzNq9dD1lfxdAED0b030=;
X-UUID: 20abfcad33644a97b339f09614557fb5-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 99133333; Sun, 02 Aug 2020 22:18:57 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Aug 2020 23:17:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 14:17:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 14:17:06 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2,0/6] introduce TI reset controller for MT8192 SoC 
Date: Mon, 3 Aug 2020 14:15:05 +0800
Message-ID: <20200803061511.29555-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_021906_378593_2813197B 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: yong.liang@mediatek.com, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 stanley.chu@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v1 changes:
https://patchwork.kernel.org/patch/11690523/
https://patchwork.kernel.org/patch/11690527/

Crystal Guo (6):
  dt-binding: reset-controller: ti: add assert-deassert-together
    property
  dt-binding: reset-controller: ti: add update-force property
  dt-binding: reset-controller: ti: add generic-reset to compatible
  reset-controller: ti: introduce a new reset handler
  reset-controller: ti: Introduce force-update method
  arm64: dts: mt8192: add infracfg_rst node

 .../bindings/reset/ti-syscon-reset.txt        |  5 +++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 13 ++++++-
 drivers/reset/reset-ti-syscon.c               | 35 +++++++++++++++++--
 3 files changed, 50 insertions(+), 3 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
