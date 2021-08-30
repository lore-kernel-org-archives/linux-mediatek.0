Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B71C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 00:36:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0976360ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 00:36:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0976360ED8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JuFGlcRTCyMLR/SxEFJHaeE3E6iK3Dzvg2qWGKyB6Zw=; b=c5S/gR7BFRw1fh
	xS4mfzl8nsRp9bny6tnDRx2HVANKdbRh0qxLAsYf9imHAT0QZ1R9CkB2HkG1okYMFR/HmpuSCWXN7
	QKvgi1vyMsAZ4WB/90JkYJ3mIN8TSd0lqmRi/XDpcQNT4dH2rndBQjbIVdJsopvDGwcjcPXB0r8ie
	HrEMBLa3OVao4BinSpUFygTqe3QeTKcATWmDZKQADOloVpua/R6C6Vmy5VhMpm0WOsAJMns/sdg2P
	zdhM/vWE5BPUN24ag0NGkZQkmJxthvYCw5tnVRpkZkBZdtl31M9ZbPB16wywOFdw9N3Ugidbq3ffa
	o2Cm4MqCGOVJlpT6TCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKVHh-00GB8F-EK; Mon, 30 Aug 2021 00:36:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKVHb-00GB6r-Ng; Mon, 30 Aug 2021 00:36:19 +0000
X-UUID: a2a4eb253a2c4ae387c6e20d3cefb6ad-20210829
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4awovMC81x36U36NM/7t4SQiankndE1vLXVqVgmJR2Y=; 
 b=FRmrEs2bhFloX1ENtz1UDnvQ8HsqJMaUVfNWo+cW0eDl+1bPdgUQUt4/KrYGkYouQj52PeMjc1IlN3dI9KD7T53gfVR8FO72ew81IDkF41aI2XfBV6Dqcmzf+iVrJnVw47QUpQw0Ohyp+xihz6E+gm2ONr3aoo1dJ2/QshE93ck=;
X-UUID: a2a4eb253a2c4ae387c6e20d3cefb6ad-20210829
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 539369511; Sun, 29 Aug 2021 17:36:09 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 29 Aug 2021 17:36:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 30 Aug 2021 08:36:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 30 Aug 2021 08:36:05 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>,
 <light.hsieh@mediatek.com>, <biao.huang@mediatek.com>,
 <hongzhou.yang@mediatek.com>, <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH v11 0/4]  Mediatek pinctrl patch on mt8195 
Date: Mon, 30 Aug 2021 08:35:59 +0800
Message-ID: <20210830003603.31864-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_173615_823269_DF39A6D4 
X-CRM114-Status: GOOD (  10.51  )
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

This series includes 4 patches:
1.add rsel define.
2.change pull up/down description
3.add pm_ops.
4.add rsel setting.

Changes in patch v11:
1)add pm_ops fucntion support
2)change pull up/down description
3)add resistance value feature support.

Changes in patch v10:
1)fix PARENTHESIS_ALIGNMENT of mtk_pinconf_bias_set_rsel
2)fix LONG_LINE warning in 615 in pinctrl-paris.c.

Changes in patch v9:
1)fix "mtk_pinconf_bias_set_rsel" build warning.

Changes in patch v8:
1)add rsel define patch
2)avoid  CamelCase
3)add pinctrl rsel setting patch which is another resistance selection
  solution for I2C on MT8195.

Changes in patch v7:
1)add version in patch and fix spelling mistakes.

Changes in patch v6:
1)add "pintcrl: mediatek" as prefix.

Changes in patch v5:
1)document and driver patch are apploed.
2)change '-EOPNOTSUPP' to '-ENOTSUPP'

Changes in patch v4:
1)fix pinctrl-mt8195.yaml warning error.
2)remove pinctrl device node patch which is based on "mt8195.dtsi".

Changes in patch v3:
1)change '^pins' to '-pins$'.
2)change 'state_0_node_a' to 'gpio_pin' which is defined in dts.
3)change 'state_0_node_b' to 'i2c0_pin' which is defined in dts.
4)reorder this series patches. change pinctrl file and binding document
together in one patch.

There are no changes in v1 & v2.

Zhiyong Tao (4):
dt-bindings: pinctrl: mt8195: add rsel define
  dt-bindings: pinctrl: mt8195: change pull up/down description
  pinctrl: mediatek: mt8195: Add pm_ops
  pinctrl: mediatek: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  32 +++-
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     | 134 +++++++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 181 ++++++++++++++++--
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  35 +++-
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  24 ++-
 drivers/pinctrl/mediatek/pinctrl-paris.h      |   2 +-
 include/dt-bindings/pinctrl/mt65xx.h          |   9 +
 7 files changed, 387 insertions(+), 30 deletions(-)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
