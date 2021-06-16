Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DD1C49361
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 22:49:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1EA60613EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 22:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1EA60613EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f6cisN/uEwdl8sd78E7/W1Z8lFymabOx8ChuKjGdeZA=; b=0R7/Bahge6t/Zl
	GheCokSP5fl39+ACN9LIxHfwtJTIA6A5/lR7PCuVY/ZAuRKcrtz5d4NNTmKNpEX2fmwkAsi5lWemF
	IgTxozOeOgVVX9mqifOrzpqZBuHZe436Ip24TOpe2kpItnSxbWInDKYPKs1HGZ/hu8gE8SFy6KLia
	J6mRw+0zQEkYdyLyPoeRYGjYsGNV1IPXVGnIUrrhI+tuitF1XsKDREMBey9DhO/tDmYJr6mUBpGWw
	tbOB/M4+f9OsKMuo3mP5+W0ycEzHMkcf9XNVnPNsKgxRTSHO64UdgI6PcriwFGWU0EqAfr5Bxrtdl
	zZEEqG57+BhON39tmCUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteLS-007vPv-Tj; Wed, 16 Jun 2021 22:49:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteLP-007vOy-JV; Wed, 16 Jun 2021 22:49:13 +0000
X-UUID: 082e5669ce52453794c26aaec8dad8a2-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/LTxiXxeLM+uoCRiebIB9kD+3udC7ZtT0kzKqp/FSFs=; 
 b=mQUkdbOPW91oki5H22nO1IYg7gQ1kDwT39DiAQofFqUnPOS50JrlT9zTK+19UzbynrnA8K4gJnfV7BSxNOdgotPSJPBAsLmLPIqGvO4TrqwK5IpJAb30KYTAkeYRcwxvlf7sFjPHwtQ8D9rc35zTplM36ZSAAMpumdZwPv871uM=;
X-UUID: 082e5669ce52453794c26aaec8dad8a2-20210616
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1395608302; Wed, 16 Jun 2021 15:49:06 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 15:49:04 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 06:49:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 17 Jun 2021 06:49:02 +0800
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, Rob Herring
 <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 00/22] Mediatek MT8195 clock support
Date: Thu, 17 Jun 2021 06:47:21 +0800
Message-ID: <20210616224743.5109-1-chun-jie.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_154911_695077_06FA9A04 
X-CRM114-Status: GOOD (  10.61  )
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

this patch series is based on 5.13-rc3 and depends on [1]
- for makefile dependence (patches 7 ~ 19 in [1])
- for common driver dependence (patches 3 ~ 6 in [1])

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20210616003643.28648-1-chun-jie.chen@mediatek.com/

Chun-Jie Chen (22):
  dt-bindings: ARM: Mediatek: Add new document bindings of MT8195 clock
  clk: mediatek: Add dt-bindings of MT8195 clocks
  clk: mediatek: Fix corner case of tuner_en_reg
  clk: mediatek: Add MT8195 basic clocks support
  clk: mediatek: Add MT8195 audio clock support
  clk: mediatek: Add MT8195 audio src clock support
  clk: mediatek: Add MT8195 camsys clock support
  clk: mediatek: Add MT8195 ccusys clock support
  clk: mediatek: Add MT8195 imgsys clock support
  clk: mediatek: Add MT8195 ipesys clock support
  clk: mediatek: Add MT8195 mfgcfg clock support
  clk: mediatek: Add MT8195 scp adsp clock support
  clk: mediatek: Add MT8195 nnasys clock support
  clk: mediatek: Add MT8195 vdecsys clock support
  clk: mediatek: Add MT8195 vdosys0 clock support
  clk: mediatek: Add MT8195 vdosys1 clock support
  clk: mediatek: Add MT8195 vencsys clock support
  clk: mediatek: Add MT8195 vppsys0 clock support
  clk: mediatek: Add MT8195 vppsys1 clock support
  clk: mediatek: Add MT8195 wpesys clock support
  clk: mediatek: Add MT8195 imp i2c wrapper clock support
  clk: mediatek: Add MT8195 apusys clock support

 .../arm/mediatek/mediatek,mt8195-clock.yaml   |  287 +++
 .../mediatek/mediatek,mt8195-sys-clock.yaml   |   66 +
 drivers/clk/mediatek/Kconfig                  |  116 +
 drivers/clk/mediatek/Makefile                 |   19 +
 drivers/clk/mediatek/clk-mt8195-apusys_pll.c  |   84 +
 drivers/clk/mediatek/clk-mt8195-aud.c         |  198 ++
 drivers/clk/mediatek/clk-mt8195-aud_src.c     |   60 +
 drivers/clk/mediatek/clk-mt8195-cam.c         |  144 ++
 drivers/clk/mediatek/clk-mt8195-ccu.c         |   52 +
 drivers/clk/mediatek/clk-mt8195-img.c         |   98 +
 .../clk/mediatek/clk-mt8195-imp_iic_wrap.c    |   68 +
 drivers/clk/mediatek/clk-mt8195-ipe.c         |   53 +
 drivers/clk/mediatek/clk-mt8195-mfg.c         |   49 +
 drivers/clk/mediatek/clk-mt8195-nna.c         |  128 ++
 drivers/clk/mediatek/clk-mt8195-scp_adsp.c    |   49 +
 drivers/clk/mediatek/clk-mt8195-vdec.c        |  106 +
 drivers/clk/mediatek/clk-mt8195-vdo0.c        |  114 +
 drivers/clk/mediatek/clk-mt8195-vdo1.c        |  131 ++
 drivers/clk/mediatek/clk-mt8195-venc.c        |   71 +
 drivers/clk/mediatek/clk-mt8195-vpp0.c        |  112 +
 drivers/clk/mediatek/clk-mt8195-vpp1.c        |  110 +
 drivers/clk/mediatek/clk-mt8195-wpe.c         |  145 ++
 drivers/clk/mediatek/clk-mt8195.c             | 1958 +++++++++++++++++
 drivers/clk/mediatek/clk-pll.c                |    2 +-
 include/dt-bindings/clock/mt8195-clk.h        |  989 +++++++++
 25 files changed, 5208 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8195-apusys_pll.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-aud.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-aud_src.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-ccu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-nna.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-scp_adsp.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vdo1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vpp0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-vpp1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195-wpe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8195.c
 create mode 100644 include/dt-bindings/clock/mt8195-clk.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
