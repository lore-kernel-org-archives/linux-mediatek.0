Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664CCC4320A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 03:38:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D80FA60EB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 03:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D80FA60EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y1mhQJggJ9lGVYuIm0qsdaCQCEeqkMpn7R6Ze04tPQA=; b=rWqBGsX3LRtzKv
	V07QO42P/PHElmv+lAIAOw6PR7hBtBQv2rQYmwnoSwp+HCLUe0JhGVJLlwZgGn5ato267GqQPPlAw
	zLucewjXScrR1wsh1QgFxY3fbPpLGoGF9mt6UldzVCyL6IUG8W+01dYEpwC0qY8VukYJ4cNZOMQ0s
	CqXIlcX8VC4UkO92tq6PAKAguzyg+aFWzd7gCj7TClWSZT3ZVcSUwcN3vAbWKF7jaDfRnLhlxY2ec
	kzBJrGy4/lUb0v2GnEnSzgpggrk+0BK4IlA6yDq6KKLF+Wq9mwDQ5wPIeESXpKnaWnNX13DtYcqYd
	XCjdGayYFoEtU7XEF29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDf49-005U6K-Ao; Wed, 11 Aug 2021 03:38:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDf44-005U5c-1Z; Wed, 11 Aug 2021 03:38:04 +0000
X-UUID: 186532fc3a1b453c89d0c48f997ecaa5-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HyZJ0AX+CM/nO1iyCLM1PJ+GR5RqEgsBb39UO3yStQw=; 
 b=a2Rj+nMpQgmMJSv+4xZjxiZ2mDKX9HQWynPbzznO2ZEWloZomg2pouqSm6ImJ/PRnOk7NOLwrL6hVlp37o6fq1HgG6BK3j98T5gTPMUbQKqQdTQPqJKR0NsykQYhxeoCG0wstGZJrWDQMvt76ZtZm0Q3OIGPz7cC0WL73Do7rTM=;
X-UUID: 186532fc3a1b453c89d0c48f997ecaa5-20210810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yt.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1030946424; Tue, 10 Aug 2021 20:37:55 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 20:37:53 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 11:37:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 11 Aug 2021 11:37:51 +0800
From: YT Lee <yt.lee@mediatek.com>
To: <yt.lee@mediatek.com>, <roger.lu@mediatek.com>, <matthias.bgg@gmail.com>, 
 <eballetbo@gmail.com>, <khilman@kernel.org>, <robh+dt@kernel.org>,
 <drinkcat@google.com>, <sboyd@kernel.org>, <p.zabel@pengutronix.de>
CC: <srv_heupstream@mediatek.com>, <fan.chen@mediatek.com>,
 <xiaoqing.liu@mediatek.com>, <charles.yang@mediatek.com>,
 <angus.lin@mediatek.com>, <mark.rutland@arm.com>, <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <linux@roeck-us.net>,
 <louis.yu@mediatek.com>
Subject: [PATCH v2 0/2] soc: mediatek: SVS: add mt8195 SVS GPU driver
Date: Wed, 11 Aug 2021 11:37:47 +0800
Message-ID: <20210811033749.30490-1-yt.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_203800_140529_BE0FE943 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
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

this patch series is based on Linux kernel 5.14-rc1,
it adds SVS GPU support on mt8195 and depends on
"soc: mediatek: SVS: introduce MTK SVS"[1].

[1]http://lists.infradead.org/pipermail/linux-mediatek/2021-July/027128.html

changes since v1:
- Rebase to kernel 5.14-rc1.
- Based on latest svs driver (v20).

YT Lee (2):
  dt-bindings: soc: mediatek: add mt8195 svs dt-bindings
  soc: mediatek: SVS: add mt8195 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   1 +
 drivers/soc/mediatek/mtk-svs.c                | 207 ++++++++++++++++++
 2 files changed, 208 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
