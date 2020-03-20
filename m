Return-Path: <SRS0=3B0C=5F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73914C4332D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:33:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 420182051A
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2020 07:33:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YwdF/qtC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ostzrSed"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 420182051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uObEevdXD2Jbdy3DCfUgxQMn49JPQWNp3rmvTFA2QHg=; b=YwdF/qtCI4izBa
	7oHV0QsbgsQ/z6qxcPZp8dSVp89331kucf1PowgmvyHNXfAWAGwwS1zKk4q6hGKFkuZ4j+AizmkK9
	F7rTlZWTkpglefaKPo1oCsNaHos2Z5pOhpkyW8bjYVhqzHfRnGGx9cCaYg4QAP1RwJZRPazvsHRDA
	GQyjfzdPTEqGJHdl5IjN0o3qPswYuu8g5QszSYwEt7HFmKwDJPtBU+r5HaB8Cmpva01IjXsAafc+7
	3kKEgT/7kf0sva9lmgDBTcqEIBsQZ+5r4HmHZn1Yxd66n2nKFM9oYfikYTuP+P1g12jnz0p2ByErY
	xXZawpx1NM0nTejlhKQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jFC9t-0003qG-1Q; Fri, 20 Mar 2020 07:33:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jFC8w-0002xX-9k; Fri, 20 Mar 2020 07:32:36 +0000
X-UUID: 65ae4af537d74e3286bbba74b8b73ec3-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9ByvZaSP7wgDUAP7dbCeQuybeA2KfOGIgSwyXg+RiC4=; 
 b=ostzrSedWS+EDhrLWhTxAOFGstvtlVetoNoRGil8r5vZMxvaCpuJUIg0BNotZnHmZ3qIPxPRFY/3lQWnfIWEUpC2cJraoMafxcNh7bT2GpRZoe/WB9QKA4NYCceexArP44klK9KLiuSowD1xBrompwOM4krjlZOP24JxHjvxxM4=;
X-UUID: 65ae4af537d74e3286bbba74b8b73ec3-20200319
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1335510678; Thu, 19 Mar 2020 23:32:27 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 00:32:59 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Mar 2020 15:31:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 20 Mar 2020 15:29:18 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Rob Herring <robh@kernel.org>, Sascha Hauer
 <kernel@pengutronix.de>
Subject: [PATCH v13 00/11] Mediatek MT8183 scpsys support
Date: Fri, 20 Mar 2020 15:32:09 +0800
Message-ID: <1584689540-5227-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200320_003234_399907_17B959B4 
X-CRM114-Status: GOOD (  15.37  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.6-rc1

change since v12:
- separate the fix of comma at the end into a new patch [PATCH 09/11]

changes since v11:
- re-order patches "Remove infracfg misc driver support" and "Add multiple step bus protection"
- add cap MTK_SCPD_SRAM_ISO for extra sram control
- minor coding sytle fixes and reword commit messages

changes since v10:
- squash PATCH 04 and PATCH 06 in v9 into its previous patch
- add "ignore_clr_ack" for multiple step bus protection control to have a clean definition of power domain data
- keep the mask register bit definitions and do the same for MT8183

changes since v9:
- add new PATCH 04 and PATCH 06 to replace by new method for all compatibles
- add new PATCH 07 to remove infracfg misc driver
- minor coding sytle fix

changes since v7:
- reword in binding document [PATCH 02/14]
- fix error return checking bug in subsys clock control [PATCH 10/14]
- add power domains properity to mfgcfg patch [PATCH 14/14] from
  https://patchwork.kernel.org/patch/11126199/

changes since v6:
- remove the patch of SPDX license identifier because it's already fixed

changes since v5:
- fix documentation in [PATCH 04/14]
- remove useless variable checking and reuse API of clock control in [PATCH 06/14]
- coding style fix of bus protection control in [PATCH 08/14]
- fix naming of new added data in [PATCH 09/14]
- small refactor of multiple step bus protection control in [PATCH 10/14]

changes since v4:
- add property to mt8183 smi-common
- seperate refactor patches and new add function
- add power controller device node


Weiyi Lu (11):
  dt-bindings: mediatek: Add property to mt8183 smi-common
  dt-bindings: soc: Add MT8183 power dt-bindings
  soc: mediatek: Add basic_clk_name to scp_power_data
  soc: mediatek: Remove infracfg misc driver support
  soc: mediatek: Add multiple step bus protection control
  soc: mediatek: Add subsys clock control for bus protection
  soc: mediatek: Add extra sram control
  soc: mediatek: Add MT8183 scpsys support
  soc: mediatek: Add a comma at the end
  arm64: dts: Add power controller device node of MT8183
  arm64: dts: Add power-domains property to mfgcfg

 .../mediatek,smi-common.txt                   |   2 +-
 .../bindings/soc/mediatek/scpsys.txt          |  20 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  63 ++
 drivers/soc/mediatek/Kconfig                  |  10 -
 drivers/soc/mediatek/Makefile                 |   1 -
 drivers/soc/mediatek/mtk-infracfg.c           |  79 ---
 drivers/soc/mediatek/mtk-scpsys.c             | 654 ++++++++++++++----
 drivers/soc/mediatek/scpsys.h                 |  90 +++
 include/dt-bindings/power/mt8183-power.h      |  26 +
 include/linux/soc/mediatek/infracfg.h         |  39 --
 10 files changed, 707 insertions(+), 277 deletions(-)
 delete mode 100644 drivers/soc/mediatek/mtk-infracfg.c
 create mode 100644 drivers/soc/mediatek/scpsys.h
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 delete mode 100644 include/linux/soc/mediatek/infracfg.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
