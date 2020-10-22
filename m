Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560E3C388F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:00:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C942122267
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 13:00:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U3LW9at0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TAtNC9tV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C942122267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nNszv5+QAmrCGS9NMBCszdC4KmIIki4AvP/UO28B8zc=; b=U3LW9at0fP/tJj7r2iQ2SBV4fb
	xSl8cyfZAxoKLQcvU4CLglV1GPX7nWOPlIFX6/Dv6n6OgT4aKOMSPPp9al3cEsdjSgKxGiJ+Ha5Fu
	Qi4L9dGeLbhTpyyAOvy437374SVVOIOVbbGUNeWI1+j07RHUkQ4sYBmZjlIBe9nwHkwwzS5LmBF7r
	WoETnjWjBBqY8mJGIfga5WNm2q0m4zu1sBycAteIQ9H2C0bt5KBhekrG8t8KdaVN9qQSFjR5e2HIu
	ri02UfTkpW3PVQVSLVkyQUs+s99+cCMo1k2j7DwEG1ReLmgQqvFYyeg8BGb8FEIuCpPr8ntE6PZRp
	IFj7Tb+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVaCu-00051C-TD; Thu, 22 Oct 2020 13:00:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa1E-0007BO-2T; Thu, 22 Oct 2020 12:48:38 +0000
X-UUID: 941c50fdebca43a3892f1dba3f48cb5e-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=XvPErSZpWjrvcm1+QkD4UGQ0oryX23O2RK+dpXdrlKA=; 
 b=TAtNC9tV7sIMHCnAqrX13q9PjIw2Y3m1rjkjfzjGBFupU8y3O0xpvvu9FNhCexyGjmnQOjMAsM1h1vkY1gQ0Va7LVd01ifx947DgrdIC+S65t9aNOw7MMIgSgkP9u6FRvTX/yoBlIPhd/jtrd842BRnaIoly1ADVAIDvny+4KZY=;
X-UUID: 941c50fdebca43a3892f1dba3f48cb5e-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1658546443; Thu, 22 Oct 2020 04:47:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:47:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:47:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:47:39 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh@kernel.org>
Subject: [PATCH v2 0/4] Mediatek MT8192 scpsys support 
Date: Thu, 22 Oct 2020 20:47:33 +0800
Message-ID: <1603370857-30646-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_084836_266170_9219E5B3 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.9-rc1, MT8192 clock v4[1] and
soc: mediatek: pm-domains: Add new driver for SCPSYS power domains controller[2]

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=368799
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=358429

change since v1:
- add patch of default power off flag

Weiyi Lu (4):
  dt-bindings: power: Add MT8192 power domains
  soc: mediatek: pm-domains: Add default power off flag
  soc: mediatek: pm-domains: Add support for mt8192
  arm64: dts: mediatek: Add mt8192 power domains controller

 .../power/mediatek,power-controller.yaml      |   1 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 201 +++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         | 313 +++++++++++++++++-
 include/dt-bindings/power/mt8192-power.h      |  32 ++
 include/linux/soc/mediatek/infracfg.h         |  56 ++++
 5 files changed, 596 insertions(+), 7 deletions(-)
 create mode 100644 include/dt-bindings/power/mt8192-power.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
