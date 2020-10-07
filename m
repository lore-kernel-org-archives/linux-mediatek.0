Return-Path: <SRS0=2/VK=DO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED380C4727E
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 07:55:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7676D207EA
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Oct 2020 07:55:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d2oeYJNp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b6Fmr8Nk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7676D207EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YXtQPCYhYhhKxUjqBkhS2bjp4Vqv2qMPeyP1YUKq+Mo=; b=d2oeYJNpWNsuGceSs/xeil7o4v
	DR7OkVnUVnLYgFnzyXkBBMU4ymPcu4Kr1u6DLKpWa2zPN0YbQaFl3O50K0XDKMJeYr0HqMmNDYfHs
	XgOh4czbZ1ssAchsY9R3SjuTCBA1TAfp6SJmcxtCbVwnOzz82EUhf0oa+Se+niJmjuy5TPB/WQXgf
	oA/v0JD6Pe2Z3moklASzs+P2jDIpdnWirZmanrD9WuMQZ3GL17x3xjnQnNxnIRUyw08H+sO+kzRAw
	Vp0EtzWDGHTMMPQzjSy8pblrStUINFXNtO3oCirvwLiP6SLGGrrz4KYD7+OWNcHt4EyJqn1bcUF5B
	vlAwTTVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ4Hl-0006XX-Hj; Wed, 07 Oct 2020 07:54:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ4Hg-0006VA-Qz; Wed, 07 Oct 2020 07:54:51 +0000
X-UUID: 4f4fe720b13a4a2698601bee4ad499c8-20201006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=F3angfus8D4qiCoCshqcK9DbO+mBzjLtql8LLthz2OI=; 
 b=b6Fmr8NkB943gjcZ6xg6qH1lCMCmk3IrtVdMqAJqSveQsSZc/+sLh6QUKx+1UUJ4pe4jllQi2FntSSjNdXW7Xb7otaaB2wCjwJ06BljcvACq4/mnX5K8uF+b935NMJ74jKTneDxo03+Ii3oZZXpyyuiAiP6e6Oy0mdNdGdK1ETk=;
X-UUID: 4f4fe720b13a4a2698601bee4ad499c8-20201006
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <michael.kao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1528454404; Tue, 06 Oct 2020 23:54:42 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Oct 2020 00:54:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 7 Oct 2020 15:54:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 7 Oct 2020 15:54:39 +0800
From: Michael Kao <michael.kao@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, <linux-pm@vger.kernel.org>,
 <srv_heupstream@mediatek.com>
Subject: 
Date: Wed, 7 Oct 2020 15:54:34 +0800
Message-ID: <20201007075437.6002-1-michael.kao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_035449_056160_599BEBD3 
X-CRM114-Status: GOOD (  10.09  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eduardo Valentin <edubezval@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

m 308d530ee9c28c7c729a5020073405522d27e091 Mon Sep 17 00:00:00 2001
From: Michael Kao <michael.kao@mediatek.com>
Date: Wed, 7 Oct 2020 15:42:57 +0800
Subject: [v5 0/2] Add Mediatek thermal dirver and dtsi
This patchset supports for MT8183 chip to mtk_thermal.c.
Add thermal zone of all the thermal sensor in SoC for
another get temperatrue. They don't need to thermal throttle.
And we bind coolers for thermal zone nodes of cpu_thermal.

Rebase to kernel-5.9-rc1.

Update content:

    - Remove the [v4,7/7] thermal: mediatek: use spinlock to protect PTPCORESEL

[2/2]
    - Add the judgement to the version of raw_to_mcelsius.

Michael Kao (1):
  arm64: dts: mt8183: add thermal zone node
  thermal: mediatek: add another get_temp ops for thermal sensors

 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 84 ++++++++++++++++++++++++
 drivers/thermal/mtk_thermal.c            | 77 ++++++++++++++++++++--
 2 files changed, 154 insertions(+), 7 deletions(-)

--

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
