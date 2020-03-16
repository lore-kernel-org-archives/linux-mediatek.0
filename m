Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC7FC3F2D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 07:24:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E04D20679
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 07:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sd8IczyN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TEuM7M94"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E04D20679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/EflXnuF3bTUYQaKbTNO5wAlZZfCwtO2skkqQAcXEbo=; b=sd8IczyN9lZJc4
	yTDX44SUDEkNkKGH6rqtmJmWJkMhnaxWjWTD1YFG5E6fiSvMTb1XiQopl53v9yK7FfZcSL2K9xgqQ
	GpCwEInG8W3E5thFM+bzBUXr8USPpDNgIVGbzFR8IFgFuRRiLfFygJDdOjGIKYl5XqBkiexJFepQy
	Cx7fznFlrkMCuzKKEqxNG8l4g/rC7Mr3wcne9uvObYA8D1bicb6GoQdh5kRGsl5A381BpipCjE0jh
	o9T35eDf8xHqeOaguyaPu29PSU40mk7hLk9cFpoM6Gu1LWWZUoFYb2yqfLRRdLXv6ona8oCuclBE2
	hoLrMAPi2hedFWgXSgAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDk75-0004RO-W3; Mon, 16 Mar 2020 07:24:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDk73-0004Py-MX; Mon, 16 Mar 2020 07:24:39 +0000
X-UUID: 5c7e3b4545f2430c903b07190db869e9-20200315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SME2J3snLnpUKDZ+/mhvA9A9BXydvq2FK3+5529r+Aw=; 
 b=TEuM7M9480zmjH6HOjHEjnQC2v3iyUJKS1vHVOqQ4N0JqI67LVIPLJaknbBtkI2O81gvICQ8uvzTf+4E+LinJUlyXkSk9Tx+P65Y8EIo8p7w1npEbYmKrdygg1GCWKL9liNej+Y4IFX/SXNL9pnT+VRrChi6TPagiBGz9snH55Q=;
X-UUID: 5c7e3b4545f2430c903b07190db869e9-20200315
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1420860263; Sun, 15 Mar 2020 23:24:30 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 00:25:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 15:22:50 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 16 Mar 2020 15:21:29 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v7 0/3] PM / AVS: SVS: Introduce SVS engine
Date: Mon, 16 Mar 2020 15:23:14 +0800
Message-ID: <20200316072316.7156-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: FAAF471B3CEBE181E2299E54C03D13A8F639F8379D2227AA0B0EE8D05A49E7012000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_002437_746104_0B4E6B5C 
X-CRM114-Status: UNSURE (   9.02  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 Angus Lin <Angus.Lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Roger Lu <roger.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. SVS driver use OPP adjust event in [1] to update OPP table voltage part.
2. SVS dts node refers to CPU opp table [2] and GPU opp table [3].
3. SVS and thermal dts use the same thermal efuse [4].
4. SVS dts needs PMIC regulator [5].
 
[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/patch/11304935/
[3] https://patchwork.kernel.org/patch/11423009/
[4] https://patchwork.kernel.org/patch/11316495/
[5] https://patchwork.kernel.org/patch/11284617/

pending discussion on v7:
- SVS sub-node architecture pending discussion in below patch.
https://lore.kernel.org/patchwork/patch/1175994/

changes since v6:
- svs_isr_handler() function is merged into svs_isr().
- In svs_isr(), we find which bank fires interrupt first and check this bank
is suspended or not secondly.
- Use memdup_user_nul() instead of copy_from_user().
- Use U32_MAX instead of "(u32)-1.
- SVS needs to do resume after thermal resume in system suspend flow.
Therefore, change SVS pm_ops to prepare/complete.
- Add high temperature voltages compensation codes.
- Add irqflags in "struct svs_platform" for supporting different SVS HW setting.
- Set signed-off voltages to system when system suspend.
- Add SVS HW reset flag for future SVS HW support.
- Coding style refinement.

Roger Lu (3):
  dt-bindings: soc: add mtk svs dt-bindings
  arm64: dts: mt8183: add svs device information
  PM / AVS: SVS: Introduce SVS engine

 .../devicetree/bindings/power/mtk-svs.txt     |   76 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   16 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   41 +
 drivers/power/avs/Kconfig                     |   10 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/mtk_svs.c                   | 2074 +++++++++++++++++
 include/linux/power/mtk_svs.h                 |   23 +
 7 files changed, 2241 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
 create mode 100644 drivers/power/avs/mtk_svs.c
 create mode 100644 include/linux/power/mtk_svs.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
