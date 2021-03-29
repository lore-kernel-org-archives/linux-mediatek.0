Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077FBC433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:13:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 730ED61969
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 730ED61969
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x2uCV5nx3fEEusQqAsVbwNEFnR4m1WkYupgA0IKWVLI=; b=mNnZnP8LgvVtIeElJ8ipnanhNb
	iMFDIoWN4oH2+ErLbgBBR9e51rDLuO+ZBDQkb/ulhSr7kK3SZaYvW8naNgI+NgpYlTWm5gS7IYE83
	fOktlL7l6sTo3kdKMk2FAwIbagfvlYlWBN/G3yvbscJVFyQ97TIUaf0x3HwdvbiNfkZgZ50jq7B2j
	xmUtg4mc7PNLiiqkDY+rvVfXvzhMgUzHDSmNJY9uJqXh2LpCqswz/LwNJvaVtMCIVDr+YYHan+Nx0
	/kJbCT1IztBINM+vH3u4i3oeK5Rh0U0Tf5DDx+nc4rf7xSvsoT3mlzsiSEI3pZhNELtnYcixfPvWw
	I4wNJeDA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxJm-001C80-UH; Mon, 29 Mar 2021 19:12:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQq71-000cPo-Cy; Mon, 29 Mar 2021 11:31:18 +0000
X-UUID: 5c57396ec23140109340717cde51382e-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=uu9fiywOIiyeEmqM9+LBoxL1aIM8eP22jEZAeLyyfCI=; 
 b=f/I/0Bt2jtEntmlgblSh70SBqgV5K4EuxcDmHdD7C4ni5S3s9JTy1j8DOHWKYnJlf1MjSl+5JCxHeIUGkbahBmQjiaGu9OJmfTA7eiyIqj0sQl7xfdb6zkdcNxiYz5b65Y2N9pvN9ns5IS9z3roJaV2kgZMWdcAeZoBhG4P4HG0=;
X-UUID: 5c57396ec23140109340717cde51382e-20210329
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 339024417; Mon, 29 Mar 2021 03:31:09 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 04:31:08 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 19:31:06 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:31:05 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, <sean.wang@mediatek.com>, <seiya.wang@mediatek.com>,
 <sj.huang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: [PATCH Resend v0 0/6] Mediatek pinctrl patch on mt8195 
Date: Mon, 29 Mar 2021 19:30:57 +0800
Message-ID: <20210329113103.11003-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_123116_193801_0F1A6212 
X-CRM114-Status: UNSURE (   8.41  )
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

This series includes 6 patches:
1.add pinctrl file on mt8195.
2.add pinctrl binding document on mt8195.
3.add pinctrl device node on mt8195.
4.add pinctrl driver on MT8195.
5.add pinctrl drive for I2C related pins on MT8195.
6.add pinctrl rsel setting on MT8195.

Zhiyong Tao (6):
  dt-bindings: pinctrl: mt8195: add pinctrl file
  dt-bindings: pinctrl: mt8195: add binding document
  arm64: dts: mt8195: add pinctrl device node
  pinctrl: add pinctrl driver on mt8195
  pinctrl: add drive for I2C related pins on MT8195
  pinctrl: add rsel setting on MT8195

 .../bindings/pinctrl/pinctrl-mt8195.yaml      |  152 ++
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |   21 +
 drivers/pinctrl/mediatek/Kconfig              |    6 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt8195.c     |  872 +++++++++
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  |   29 +
 .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |   14 +
 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h | 1669 +++++++++++++++++
 drivers/pinctrl/mediatek/pinctrl-paris.c      |   16 +
 include/dt-bindings/pinctrl/mt8195-pinfunc.h  |  961 ++++++++++
 10 files changed, 3741 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8195.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8195.h
 create mode 100644 include/dt-bindings/pinctrl/mt8195-pinfunc.h

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
