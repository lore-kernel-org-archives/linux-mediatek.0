Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24796C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 15:10:25 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA89061584
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 15:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA89061584
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BBuEqS4ZrQCf+sk+fFG4xNGDBz3y1mIKEAj/weu2a1o=; b=wvqKEkiDJw8FK7
	rfHIWhtcBVPcrdXjQDiZvG6BQa1u7ukTh9pBMHrxBtqtREEmGW1xdyzdUfHFMtYR6+vf3f/3toxA8
	znn3pVrETxQPW5pvsJgYWpe2vpEjfKApuEyKlHye0ZWZ71PG/m7JKLciEAHrA+W06MeuhyGBryME8
	5kHP+2tr+D2S9OUMjY5fEgnJtupXFkNV95Qw0rMfeQbcvQS6t2QnaTcNeNj+1GXW/xfR8SqQN57mv
	eG+06FoF/HIoRZd56CPINV01HMU0WxhjDzW4W7KgtNK+0Zyp0O5i9zzVUprSWezvI7zN+193KLB3m
	O8j+60WYl3071j93HLQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltAhJ-000qXL-MY; Tue, 15 Jun 2021 15:09:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9NA-000DDm-U2; Tue, 15 Jun 2021 13:44:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=bOFgGrEnqiwcoV26dB+3oovWMqhzRgOdvJBWCzOe2X0=; b=jNSeJLPg+kxEwrLc5RS3u5VLms
 0F0b2HayA+MtgZRwcrkJo/syX8qvR3dZCjd6iB6KDCPqDtuEX2ku9DnfkB9YJX48LIA66b1BYbte3
 fC0ESgCFQ+vnU5GgW3HAJiOJxGx8pUpVwzzZauoPUjcqWIqZms4Oti5wvikD0hcxn2DvaGmydLw38
 Y/BYTE3UjKo+Dn9xMQuwXXy8ul27OpP0HWPE9+XlAqi0xNnh0w9DMLUf0iW+usQv3ynWjG9sX7v9V
 weOuHiAr7wZaolfxD12x0/yGK2yUs5zetCxcHNKGfQCjU7EqU6Sviih3xig7c9HhbfmndTIk6pFs8
 i4KPnaVQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt0o7-007KgU-J1; Tue, 15 Jun 2021 04:36:23 +0000
X-UUID: ed53818bc84240679d8c8d2574ff6e4e-20210614
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bOFgGrEnqiwcoV26dB+3oovWMqhzRgOdvJBWCzOe2X0=; 
 b=FL7ZpBusvEkMoCNd4z1xpPrJfywCOPD8rFguYih3JM0AQJVHn6rQLeSC0ZbTj+pAWMX//dWAthZAAcoYMMc7ucEo6kTBvYSzYrd08dBCON/X35nljaUf7IMUjpfszp9lszZKk2PpDTMOkktrFXWUpthsuvh5+Q05pbUZkhVxNvA=;
X-UUID: ed53818bc84240679d8c8d2574ff6e4e-20210614
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 67343163; Mon, 14 Jun 2021 21:36:10 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Jun 2021 21:36:09 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 12:36:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Jun 2021 12:36:07 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 0/4] Mediatek MT8195 power domain support
Date: Tue, 15 Jun 2021 12:35:59 +0800
Message-ID: <20210615043603.20412-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_053619_369414_26A3DDB6 
X-CRM114-Status: GOOD (  10.75  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds power domain support for MT8195
and is based on 5.13-rc3.

change since v1:
- fix signed-off name
- describe more detail in patch 3
- move modification of removing redundant macro to single patch

Chun-Jie Chen (4):
  soc: mediatek: pm-domains: Move power status offset to power domain
    data
  dt-bindings: power: Add MT8195 power domains
  soc: mediatek: pm-domains: Add support for mt8195
  soc: mediatek: pm-domains: Remove unused macro

 .../power/mediatek,power-controller.yaml      |   2 +
 drivers/soc/mediatek/mt8167-pm-domains.h      |  16 +-
 drivers/soc/mediatek/mt8173-pm-domains.h      |  22 +-
 drivers/soc/mediatek/mt8183-pm-domains.h      |  32 +-
 drivers/soc/mediatek/mt8192-pm-domains.h      |  44 +-
 drivers/soc/mediatek/mt8195-pm-domains.h      | 738 ++++++++++++++++++
 drivers/soc/mediatek/mtk-pm-domains.c         |  12 +-
 drivers/soc/mediatek/mtk-pm-domains.h         |   8 +-
 include/dt-bindings/power/mt8195-power.h      |  51 ++
 include/linux/soc/mediatek/infracfg.h         | 103 +++
 10 files changed, 1013 insertions(+), 15 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
 create mode 100644 include/dt-bindings/power/mt8195-power.h

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
