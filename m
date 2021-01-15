Return-Path: <SRS0=P2Ib=GS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B90DC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 11:24:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0912371F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jan 2021 11:24:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA0912371F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1YYGpYg2/tuhFcjiwXM9OS3Ol/eWGVjTGDeQyhiSBR4=; b=y7+wDhQbYdbX2JdR7snl91p9jh
	x27sO3CDCiDkpmvtQB6DoWfio1ddUrQZ8sZFNZmGRSoQRntCKZK0wiTEcu83avpQHxKm7A/uS+lS+
	na3V0WbjNmUFbif/+iokYy5vI+SeOE4abZUNcIWmWSdCANuh3DQYb1E5mDtqJPw+GXhAdtPfPqSAc
	pSz5Lf/hfx9+hmEsoOhf9O+4urkLYRK7QJ7hJuiI0RK/7sXSSklxMfOzjb9dD84YURmvVwjnYPlVv
	MJvHx2c/1n/+zfS0p+Is70MObCyFfZVM1RvsLzYKlAbKTSEHZprWdzdicej+BULBe/kOTk14E770J
	IPdnthDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0NCn-00008H-HM; Fri, 15 Jan 2021 11:23:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0NCi-00007j-W1; Fri, 15 Jan 2021 11:23:46 +0000
X-UUID: fb845aa141f743349c33f17ae2033963-20210115
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QucQ1vJGJgp8R2zLQr85/bgSU4mknBAUbcR2WTYj+wc=; 
 b=ON/BqDkB77B6MTa97oXqhJg2xOoBqzxAQlDw3neFKZW8Gh5q/WKi91ti9anER2rM3spDJ7L2X1NDkAG+FTMb0cWOOx9ndOvNc+6uPvv8pail16+SeDfWY5q63lIeyO67pkIE+ekTBNAX5DQ918NOQdaHl3nB2/LHPUh6tIQIOdc=;
X-UUID: fb845aa141f743349c33f17ae2033963-20210115
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1648804285; Fri, 15 Jan 2021 03:23:37 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Jan 2021 03:23:35 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Jan 2021 19:23:34 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 15 Jan 2021 19:23:33 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, 
 <crystal.guo@mediatek.com>
Subject: [v7,0/2] introduce TI reset controller for MT8192 SoC 
Date: Fri, 15 Jan 2021 19:23:29 +0800
Message-ID: <20210115112331.27434-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_062345_804633_4775AB6F 
X-CRM114-Status: UNSURE (   9.95  )
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
Cc: devicetree@vger.kernel.org, s-anna@ti.com, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Yidi.Lin@mediatek.com,
 Yingjoe.Chen@mediatek.com, stanley.chu@mediatek.com, ikjn@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v7:
1. [v7,1/2] remove "mediatek,reset-bit" property from mediatek-syscon-reset.yaml in [v6,1/3]
2. [v7,2/2] use the flag "MTK_SYSCON_RESET_FLAG" to determine whether to call "mtk_syscon_reset",
which integrate assert and deassert together.
3. The patch "[v6,3/3] reset-controller:ti:force the write operation when assert or deassert" has been applied

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


Crystal Guo (2):
  dt-binding: reset-controller: mediatek: add YAML schemas
  reset-controller: ti: introduce an integrated reset handler

 .../bindings/reset/mediatek-syscon-reset.yaml | 51 +++++++++++++++++++
 drivers/reset/reset-ti-syscon.c               | 39 ++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/mediatek-syscon-reset.yaml
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
