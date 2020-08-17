Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF308C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 02:56:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF81E20658
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 02:56:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7r4PidG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YVJsx2Mk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF81E20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lbOVLBGVbJVXp0YCgzqdSkbJnrwoCnQ9b1i1e0aQlUQ=; b=X7r4PidGMf6Aw1xZ0gzaEmj7tc
	Byt4LCmyiYBoXbgOHDez+JWBk0r1rfewvTuFKcPSbYuJ91ZTzlextgb8Wo8NmATHhQTMWkPJTF0nh
	0ZIqCvrvrRf5BIuNRnA34vz+8gTQ1ynY+Sr3Ku6TvO1/Ym/DcsEE/JDZ21Ta/8AJz27GfQtevVIgP
	7jIi1PDWuGIiaC8PgDSONCsjrtEFXi3jR0XQHcilqbWtQ+NxpbSgV0i87G5TjU44GjgVFjUhgMmCC
	O3c8s1+vBeqDkboi9hkaR5RTiY+39qCaP8+Gold9Zo38HE1IEqHoIO9z18BhDjmVQpYiDJr3P0YFx
	JXqEk8jg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7VKA-0005sl-Vd; Mon, 17 Aug 2020 02:56:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7VK3-0005pq-3l; Mon, 17 Aug 2020 02:56:32 +0000
X-UUID: 96995071ebfe42ca9fcdc982a442e524-20200816
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=nXcU1Hc02thK0kndiWW9wjNDJvWYN5PNOdsuyKQXNMw=; 
 b=YVJsx2MkcK/1OskF3r85MZd+NidokJyZh5apF5CZHL2nHJdPbSQ3EiUpRCdCgO/j4IZmtXd7e9PkgWaMZaRPnqBL5OLgQMLFdIcWT5zboE33h4aJry6miniFuv/TD0ceJkyR8MPg2cjlOXDvS24S3dX40s+1V3Zhzf3LEMOZCW0=;
X-UUID: 96995071ebfe42ca9fcdc982a442e524-20200816
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1008781338; Sun, 16 Aug 2020 18:56:23 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 16 Aug 2020 19:50:11 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Aug 2020 10:50:09 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 17 Aug 2020 10:50:08 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <p.zabel@pengutronix.de>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v3,0/6] introduce TI reset controller for MT8192 SoC
Date: Mon, 17 Aug 2020 10:48:38 +0800
Message-ID: <20200817024842.5289-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200816_225631_357743_C1C2C8D7 
X-CRM114-Status: UNSURE (   8.66  )
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
 linux-kernel@vger.kernel.org, afd@ti.com, fan.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, s-anna@ti.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

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

Crystal Guo (4):
  dt-binding: reset-controller: ti: add reset-duration-us property
  dt-binding: reset-controller: ti: add 'mediatek,infra-reset' to
    compatible
  reset-controller: ti: introduce a new reset handler
  arm64: dts: mt8192: add infracfg_rst node

 .../bindings/reset/ti-syscon-reset.txt        |  6 +++++
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 11 +++++++-
 drivers/reset/reset-ti-syscon.c               | 26 +++++++++++++++++--
 3 files changed, 40 insertions(+), 3 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
