Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B664DC433E1
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 828FB21D7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OWRmPjSx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="l0QPdh0C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 828FB21D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YL780zHb0ompDgSjKZ0+imFx+7rDAjniOPIQdLZKVww=; b=OWRmPjSxSJfV7VjCxRojUai8jV
	7VyKmAt8Zk5Yif9OFCUCAR1qRLUKX6Z6C98TeEXfvxXVuyKIJe1qt0hrulK7pXwI4uIFXH8erbELZ
	AkJb30nhGg5GWYMwkRhpjY8UzYxG4iawZnYlzJJlZBkd1urXkOLr4jAdqMZXMeLwoa5v76bVfqvGj
	1sS4ppCCexerQWv+26vJ9vFrK+zraQwEff4/N1WFi0XMvKrZxnQDSXzg5YedDn86i2iM4dgtXeN0V
	F5t3q/fXhAr1BX2+fmPBcUb5jh0bY66C1RA1i+Oqi3DhwC2PboHORlH/2iJCt3Ru78ceiKOHJRRoo
	OKuHe9eA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHkg-0002TV-V3; Tue, 14 Jul 2020 10:01:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHkd-0002R3-AC; Tue, 14 Jul 2020 10:01:29 +0000
X-UUID: 912b65e026a84fecbdfb9790058624fa-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xiCp+OBjegRdQn5GWMKIY6rpngUfMrca0NKfJdPGP8M=; 
 b=l0QPdh0CVRGMhELGGFyAzYk/NXa8si0+gKisDxAnGpS3P4fZwhhkE2bKJQlz/wDqXUGDOtYE2QcJIMTdzC0Qjia+fcNDLuoip/brl5r9+xC9wOcBQ5TcE8vfH52Au50QLm7wJVtWXsRBm4g/bZiUjfmdFZWkHfSq/cC5W1q0V6Q=;
X-UUID: 912b65e026a84fecbdfb9790058624fa-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 605898061; Tue, 14 Jul 2020 02:01:25 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 02:54:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:54:04 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 14 Jul 2020 17:54:06 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Argus Lin <argus.lin@mediatek.com>
Subject: [PATCH 0/3] Add PMIC wrapper support for Mediatek MT6873/8192 SoC IC
Date: Tue, 14 Jul 2020 17:53:49 +0800
Message-ID: <1594720432-19586-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_060127_516704_A0FF42D2 
X-CRM114-Status: UNSURE (   8.95  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for new SoC MT6873/8192 to the pmic-wrap driver.

Hsin-Hsiung Wang (3):
  soc: mediatek: pwrap: use BIT() macro
  dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
  soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs

 .../devicetree/bindings/soc/mediatek/pwrap.txt     |   1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c               | 102 ++++++++++++++++++---
 2 files changed, 90 insertions(+), 13 deletions(-)

-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
