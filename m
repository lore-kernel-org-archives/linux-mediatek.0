Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E13C433DB
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 05:19:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFD6F64D9E
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 05:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFD6F64D9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=phEs+XBBzsT3MPCO+oC712vLlmLOE90yA8vq846pnq8=; b=AEYqKjibS6lGyap/aecWHqvO1Y
	d2CJxPJXAsx8Jb2TrMdj1YzeqRmgDkY8VkJ5osme9ZjAJ6pKwPSgp/gUmv+T5JwJpyn8H2RsOQIPW
	r4fEC4TpWWuGbrqO6TbEUO5Jk04fElKQ9fwS7HUOCtKGK5iNTjfDWd7XdFGvxCfbHF+LJB1YQZDQV
	PGBPzd9D2r/Lxjnn+UGmI33zCI2JBqR5OOZfCxPmLr3YCVxon8yNfIEcJwH/ofc7naPOs3I4t/O2E
	r+ZriJObwHZaLsBmkJ+e0PAU+ENYZvGGZo1ZpagljqxGcab39r3fesxO5BPA9h6lqGIaokZHCizGn
	idWMFlrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8cTs-0004rm-K1; Sun, 07 Feb 2021 05:19:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8cTm-0004qg-Q8; Sun, 07 Feb 2021 05:19:29 +0000
X-UUID: cda1694d1bcd4c9ab1deb3a1830bb865-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=acItFB2Sx3I+jSBinrQtOGXq6AoTEYNT9y+Hf1UaZY0=; 
 b=LNcPPMIz/cs5WHTFgMfgC1txiDrUSPu+6WvRAriGehScgTkjbnXqTDbfPmY3ncKuwSiDTiVoyBPwit7Sl1GOpVIG1RMk+/tcQk9XznFP6oT3KcNT6iT7y9lr2CzaNM18mxf6xMVkvrfHdJtN2IRj2jnK42ZiYe+YFj1Qnn2/5qQ=;
X-UUID: cda1694d1bcd4c9ab1deb3a1830bb865-20210206
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1469279297; Sat, 06 Feb 2021 21:19:22 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 21:19:20 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 13:19:19 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 7 Feb 2021 13:19:19 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <drinkcat@chromium.org>
Subject: [PATCH v6 0/4] Add SPMI support for Mediatek MT6873/8192 SoC IC
Date: Sun, 7 Feb 2021 13:19:10 +0800
Message-ID: <1612675154-2747-1-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_001927_628947_65078B62 
X-CRM114-Status: GOOD (  12.34  )
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
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for new SoC MT6873/8192 to the spmi driver.
This series is based on Weiyi's patches[1].

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1608642587-15634-7-git-send-email-weiyi.lu@mediatek.com/

changes since v5:
- fix the yaml error.
- refine the spmi-mtk-pmif driver for better code quality.
- fix the build error about MT8192.dtsi

Hsin-Hsiung Wang (4):
  dt-bindings: spmi: modify the constraint 'maxItems' to 'minItems'
  dt-bindings: spmi: document binding for the Mediatek SPMI controller
  spmi: mediatek: Add support for MT6873/8192
  arm64: dts: mt8192: add spmi node

 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      |  74 +++
 .../devicetree/bindings/spmi/spmi.yaml        |   2 +-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  17 +
 drivers/spmi/Kconfig                          |   9 +
 drivers/spmi/Makefile                         |   2 +
 drivers/spmi/spmi-mtk-pmif.c                  | 488 ++++++++++++++++++
 6 files changed, 591 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
 create mode 100644 drivers/spmi/spmi-mtk-pmif.c

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
