Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B555C4727C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 02:32:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3D9320773
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 02:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dLc21eLY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QojONuku"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3D9320773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pRueSyvLA9lQWafJ3/foWWud07M8rsUPQ0mJmdWZM/Q=; b=dLc21eLYZ18OGRV1avDTqgsRJw
	her6PAYwSToq/uCsIRmafjmNdOMRMOXi/kX33XrPMvVJ6bQliVv0+Vm5opLYdQ7mjOA+wGBlSZqSR
	WtCkGFvX7sR1op3wvQOm81/Yc8qDf8lMp6M/1cOS0rG5b5TTCra6VHXudYA6puyqcBWWiB23S93D5
	Fxf5M6gLmQU0LK2tyaYYAod048c9mh7av8RbDqcKfCMgE2GdLpWM4NN+3ROfX+hllb6eKoMlM2ogG
	uUCsAhjNFbbRqFJkIXHDtrwUxZbCWQfblYTPabP6elbiVDp4XvrI+EoucUH0Cd9VT/ZoaBYR4zYH2
	W9YcBTcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNRue-0000dl-Ig; Wed, 30 Sep 2020 02:32:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNRua-0000XL-Bc; Wed, 30 Sep 2020 02:32:09 +0000
X-UUID: 9c4e3fc5fa6944609d5829952429fe9e-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=JX7akOCDOz/KF/q9+MC39vGN4lTkjsgc3qGvCIP0NBE=; 
 b=QojONukuqLYXzyZcFl8w7lN/UQO555tm9MOJlq7adBQZeSnMh8glX16ywwBAkMPmtEAy4WdmW2UOHJ4P+w4qs+1e4gXT2COoiRyEmd2J8iDJ5+RpQ1pkeQDAw71bDwwr93j/crv9swh9a4TRF2OGW3O/y41JE7bLZfThNCG9S6c=;
X-UUID: 9c4e3fc5fa6944609d5829952429fe9e-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 227677186; Tue, 29 Sep 2020 18:32:05 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 19:22:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 10:22:02 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 10:22:01 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v6,0/3] introduce TI reset controller for MT8192 SoC
Date: Wed, 30 Sep 2020 10:21:56 +0800
Message-ID: <20200930022159.5559-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_223208_545549_DE886BF7 
X-CRM114-Status: UNSURE (   9.60  )
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

v6:
fix the format error of mediatek-syscon-reset.yaml

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
