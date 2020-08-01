Return-Path: <SRS0=bqbO=BL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D3A8C433E5
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2020 04:34:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DE6A20716
	for <linux-mediatek@archiver.kernel.org>; Sat,  1 Aug 2020 04:34:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vPaMa1mE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bkvMTwgR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DE6A20716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UhfyUC/PBe/BftxytqJyosJGV/Ir0KlvcPpc0ODVy2k=; b=vPaMa1mE4oDihOZYP6BUs8MpJW
	YtjBc3RI23ITzaaX7yGe5AcRfmJk7+GmcJmWTyP9EHIYr+Gnjq8mHphXcGrMcvnwgEtA9tdRbDWCs
	cjNqjKIGkB4itWckvPwceNaxXa481Kj06lYj6mUOUEHht+ggTrgJoXMC75NBfx+AYfTsRWhRkhHJR
	z32hRiIFMOMLahJhc9l6gYkRIjhzq4+QODbozcyy+TLC068vS1ihN+swyBZPjDk39Lr3Fd7Gvkyho
	4aRYzMdU7WDAdM+Aw5+X7i1xSMzRalESBq91+zLI6+m2VCNZ27vxr7KEJCkxEYE/8xEmXaLWc98yx
	SLoUXs4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1jDk-0008PW-B2; Sat, 01 Aug 2020 04:34:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1jDe-0008MG-Tx; Sat, 01 Aug 2020 04:34:03 +0000
X-UUID: e09a4c41e6c8406a97fe2fa2da78f345-20200731
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=VSXHzuVe7TyPrG7V1dalxToyvgZ0VM2OicojizCUcAM=; 
 b=bkvMTwgRrP94DoVh4i+wuu9QvGZCkPx5NrjE2GXcbY71+vAERFZTOuUz2wofZuc9D9cxg4wZPMBlfA0U9A9nEBPvNQKsnBJTx6CNmWgxF2cyuoFaAzlslghEpglP8uO+nShUl1bLrGFFRV9fO+yz8GxsHFcPdeZ/wGDRsnHXHvM=;
X-UUID: e09a4c41e6c8406a97fe2fa2da78f345-20200731
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1674240036; Fri, 31 Jul 2020 20:33:50 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 21:33:50 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 1 Aug 2020 12:33:36 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 1 Aug 2020 12:33:36 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
Subject: [PATCH v2 0/3] Mediatek pinctrl patch on mt8192 
Date: Sat, 1 Aug 2020 12:33:00 +0800
Message-ID: <20200801043303.32149-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B470880E776B38862319ED4C7CBD9BC1D5990EA650C3814ADCD0175DDF9A736D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200801_003403_129597_835F9FB5 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: devicetree@vger.kernel.org, sean.wang@mediatek.com,
 srv_heupstream@mediatek.com, chuanjia.liu@mediatek.com,
 biao.huang@mediatek.com, zhiyong.tao@mediatek.com, erin.lo@mediatek.com,
 hui.liu@mediatek.com, seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 hongzhou.yang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, eddie.huang@mediatek.com, jg_poxu@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series includes 3 patches:
1.add pinctrl file on mt8192.
2.add pinctrl binding document on mt8192.
3.add pinctrl driver on MT8192.

Changes in patch v2:
1)change maintainers name in pinctrl-mt8192.yaml.
2)remove unused description for "reg-names".
3)change 'subnode format:' which is not a child name to "^pins".
4)add ('|') after "description:".
5)remove "i2c0_pins_a: i2c0" and "i2c0_pins_a: i2c1".
6)add properties for pin configuration nodes.

Zhiyong Tao (3):
  dt-bindings: pinctrl: mt8192: add pinctrl file
  dt-bindings: pinctrl: mt8192: add binding document
  pinctrl: add pinctrl driver on mt8192

 .../bindings/pinctrl/pinctrl-mt8192.yaml      |  151 ++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8192.c     | 1453 +++++++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h | 2228 +++++++++++++++++
 include/dt-bindings/pinctrl/mt8192-pinfunc.h  | 1344 ++++++++++
 6 files changed, 5184 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8192.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8192.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8192.h
 create mode 100644 include/dt-bindings/pinctrl/mt8192-pinfunc.h

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
