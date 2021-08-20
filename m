Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADDEC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F2E6610CB
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 11:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4F2E6610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nVO23cwvs1luLxjiR43O1N4ahtCYSp6+fcAvo4BtWe8=; b=KKiJJl1WqErPUA
	E/nfpzYNa+OJoRi6lUKQiBgci5zueKV6Xzi1IeJEIwcQ2OTEHIkkfs/cH30Die+QTf6gOLFsJg2DX
	NvTmC9zp/FH8njLcSykd/wugl5KNATINlUsS/o23RA7iIT0bWSLbcuRFBCQiZQxoF/k6TaTOc1BHz
	CVJ+Kwem3YvocDGlMNFWBuyB4NeuLqO5XKFogtoNufQeL2CGcN+gZN9GXjp+LHNVhLNtV8OM2hvFZ
	geQe3vlDfXT1zKc3oHqa3G4EKxUkMDZnhr8RKZheo0vnKK9xx61Ht7Lr28iKkAafYoh+SkDSdX51a
	z9sIiwibU2ZAfhxS8J4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH2Vz-00Alph-6o; Fri, 20 Aug 2021 11:16:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH2Vs-00Alof-Bm; Fri, 20 Aug 2021 11:16:45 +0000
X-UUID: e494c06b8f614f9b811bdcc541c07478-20210820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mxZUOj0AWbHAt//olhZb0GMD8/Ve97pBVUF3F1W0AAg=; 
 b=T2tx1zpQUPkHhyjfGadCdUPnEfXoKDD3p53DPOqqzaBCOZ3elJIYDHdQY9GWsqxQw5v5Q0iN1MFqBut4duXnaReDThDNV2sf+QFpfFh85YLmrq9lY2FSrdyuyN2JyVD4Zj19x5HBiTgkZaOPQDzZiMUjI7izzb59vv/Gdi/fqPI=;
X-UUID: e494c06b8f614f9b811bdcc541c07478-20210820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 918069127; Fri, 20 Aug 2021 04:16:35 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 04:16:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Aug 2021 19:16:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 20 Aug 2021 19:16:32 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [v2 00/24] Mediatek MT8195 clock support
Date: Fri, 20 Aug 2021 19:14:40 +0800
Message-ID: <20210820111504.350-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_041641_860500_7A3B38A4 
X-CRM114-Status: GOOD (  14.51  )
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

this patch series is based on 5.14-rc1 and depends on [1]
- for makefile dependence (patches 7 ~ 19 in [1])
- for common driver dependence (patches 3 ~ 6 in [1])

changes since v1:
- fix resource leak if error condition happens
- refine clock name to match datasheet
- remove redundant data in mux parent source
- seperate clock driver based on IP architecture
- change to dual licence
- refine dt-binding file
- remove audio clock driver (handled in [4])
- integrate vdosys0 and vdosys1 clock registration with mmsys in [2] and [3]

[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127
[2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=531695
[3] https://patchwork.kernel.org/project/linux-mediatek/list/?series=519617
[4] https://patchwork.kernel.org/project/linux-mediatek/list/?series=528369

Chun-Jie Chen (24):
  dt-bindings: ARM: Mediatek: Add new document bindings of MT8195 clock
  clk: mediatek: Add dt-bindings of MT8195 clocks
  clk: mediatek: Fix corner case of tuner_en_reg
  clk: mediatek: Add API for clock resource recycle
  clk: mediatek: Fix resource leak in mtk_clk_simple_probe
  clk: mediatek: Add MT8195 apmixedsys clock support
  clk: mediatek: Add MT8195 topckgen clock support
  clk: mediatek: Add MT8195 peripheral clock support
  clk: mediatek: Add MT8195 infrastructure clock support
  clk: mediatek: Add MT8195 camsys clock support
  clk: mediatek: Add MT8195 ccusys clock support
  clk: mediatek: Add MT8195 imgsys clock support
  clk: mediatek: Add MT8195 ipesys clock support
  clk: mediatek: Add MT8195 mfgcfg clock support
  clk: mediatek: Add MT8195 scp adsp clock support
  clk: mediatek: Add MT8195 vdecsys clock support
  clk: mediatek: Add MT8195 vdosys0 clock support
  clk: mediatek: Add MT8195 vdosys1 clock support
  clk: mediatek: Add MT8195 vencsys clock support
  clk: mediatek: Add MT8195 vppsys0 clock support
  clk: mediatek: Add MT8195 vppsys1 clock support
  clk: mediatek: Add MT8195 wpesys clock support
  clk: mediatek: Add MT8195 imp i2c wrapper clock support
  clk: mediatek: Add MT8195 apusys clock support

 .../arm/mediatek/mediatek,mt8195-clock.yaml   |  254 ++++
 .../mediatek/mediatek,mt8195-sys-clock.yaml   |   73 +
 drivers/clk/mediatek/Kconfig                  |    8 +
 drivers/clk/mediatek/Makefile                 |    4 +
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c  |  145 ++
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c  |   92 ++
 drivers/clk/mediatek/clk-mt8195-cam.c         |  142 ++
 drivers/clk/mediatek/clk-mt8195-ccu.c         |   50 +
 drivers/clk/mediatek/clk-mt8195-img.c         |   96 ++
 .../clk/mediatek/clk-mt8195-imp_iic_wrap.c    |   68 +
 drivers/clk/mediatek/clk-mt8195-infra_ao.c    |  211 +++
 drivers/clk/mediatek/clk-mt8195-ipe.c         |   51 +
 drivers/clk/mediatek/clk-mt8195-mfg.c         |   47 +
 drivers/clk/mediatek/clk-mt8195-peri_ao.c     |   62 +
 drivers/clk/mediatek/clk-mt8195-scp_adsp.c    |   47 +
 drivers/clk/mediatek/clk-mt8195-topckgen.c    | 1298 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8195-vdec.c        |  104 ++
 drivers/clk/mediatek/clk-mt8195-vdo0.c        |  123 ++
 drivers/clk/mediatek/clk-mt8195-vdo1.c        |  140 ++
 drivers/clk/mediatek/clk-mt8195-venc.c        |   69 +
 drivers/clk/mediatek/clk-mt8195-vpp0.c        |  110 ++
 drivers/clk/mediatek/clk-mt8195-vpp1.c        |  108 ++
 drivers/clk/mediatek/clk-mt8195-wpe.c         |  143 ++
 drivers/clk/mediatek/clk-mtk.c                |   21 +-
 drivers/clk/mediatek/clk-mtk.h                |    1 +
 drivers/clk/mediatek/clk-pll.c                |    2 +-
 include/dt-bindings/clock/mt8195-clk.h        |  864 +++++++++++
 27 files changed, 4330 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8195-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-apusys_pll.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-ccu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-infra_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-peri_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-scp_adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vpp0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vpp1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-wpe.c
 create mode 100644 include/dt-bindings/clock/mt8195-clk.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
