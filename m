Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFBBC4727C
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:48:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B445207C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 13:48:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pBtp0M5n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UNZVSSCw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B445207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6opjJc8ymhvvXL+WEJP8W8MgqTRJu5hBvuhe1wZksIQ=; b=pBtp0M5ns+2Y/TvjJjQr0wuut/
	RrRJAaIsZNB50E7TfdyRKYeFTLfN3pz+YAZuZTdNuJ+wKfW0t2WungDxqiX8C180mcB4R2nZy6zWN
	7eQ13ZXT+fC+SNfOeO3dbQqECY0FXiQlOhZmD1fTdEikz92Eu+uUr6ElBixUgPT2RcovZ1YvhByrT
	6/3T8TCnsRKYU8k9816l6Iu1imsBG2rUZjcHj4TPDiN/20fhUV/LYk2P2za7Wx4+Vj2raAtdtmlmK
	xgveO+C5NPk8JfRyFO+i6y7tRpH+H6XxV9JIiJC06bCrsZUH+JrVfLq5bJ6QRWw0tt1VqWhY6wti3
	JpnL1RSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNFzK-0006Ej-L3; Tue, 29 Sep 2020 13:48:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNFyF-0005n5-Qm; Tue, 29 Sep 2020 13:47:13 +0000
X-UUID: 7c98edf9f373431ba776f90c80733ce8-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=BdSCULrhdfeC57PSNC1Tcx2pJe2PGvOBvyLTmGWEl9Q=; 
 b=UNZVSSCwjqibJRBiBIU8G8NHCaPN+R+ox7yifndUKb+AR6rwM3iEqNsguGAYodGNf2IQuLFkB67Bn7eDQZ0PqvsUCQxMS67Z0RNoNLXmR+JGdpMiqHiQXpZedJwz/Qjr0CG6qhJboe0eKHMmIS5tisJagfkftE2AVX+w/Vlq6sw=;
X-UUID: 7c98edf9f373431ba776f90c80733ce8-20200929
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1879022215; Tue, 29 Sep 2020 05:46:54 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 06:46:51 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 21:46:49 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 21:46:48 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v5,0/3] introduce TI reset controller for MT8192 SoC 
Date: Tue, 29 Sep 2020 21:46:39 +0800
Message-ID: <20200929134642.26561-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_094708_077368_D5E32554 
X-CRM114-Status: UNSURE (   9.03  )
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
Cc: devicetree@vger.kernel.org, yong.liang@mediatek.com,
 stanley.chu@mediatek.com, srv_heupstream@mediatek.com, seiya.wang@mediatek.com,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, s-anna@ti.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v5:
1. revert ti-syscon-reset.txt, and add a new mediatek reset binding.
2. split the patch [v4, 3/4] with the change to force write and the
change to integrate assert and deassert together.
3. separate the dts patch from this patch sets

v4:
fix typos on v3 commit message.

v3:
1. revert v2 changes.
2. add 'reset-duration-us' property to declare a minimum delay,
which needs to be waited between assert and deassert.
3. add 'mediatek,infra-reset' to compatible.

v2 changes:
https://patchwork.kernel.org/patch/11697371/
1. add 'assert-deassert-together' property to introduce a new reset handler,
which allows device to do serialized assert and deassert operations in a single
step by 'reset' method.
2. add 'update-force' property to introduce force-update method, which forces
the write operation in case the read already happens to return the correct value.
3. add 'generic-reset' to compatible

v1 changes:
https://patchwork.kernel.org/patch/11690523/
https://patchwork.kernel.org/patch/11690527/

Crystal Guo (3):
  dt-binding: reset-controller: mediatek: add YAML schemas
  reset-controller: ti: introduce a new reset handler
  reset-controller: ti: force the write operation when assert or
    deassert

 .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
 drivers/reset/reset-ti-syscon.c               | 44 ++++++++++++++--
 2 files changed, 92 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
