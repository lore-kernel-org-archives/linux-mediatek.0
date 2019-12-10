Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91A9C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 06:56:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8926F206D3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 06:56:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHJ9YRzn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YPjk6VtJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8926F206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pqsm++ScAONbOonyMcyGTtf+dOaDvUm5OeX7qDnVpd0=; b=KHJ9YRznIF6bcR
	+anG0LBHu2rM+j0NxdftlaiK48rhz1lwRXUJgBS0568I8aL5B44GXJ5LdRRM6ii0SDHvIgjttHwW0
	eJB3cGOr2USpzx+rxTKG+9X9CXD53K2AODo2vWaK2Mdp9SXXgVdr+diCxPT2A0MZQgpg2EY4M/FwZ
	d1NYjPNSDrcDbycuz8f/mwsGfhFXrpQ7lUQyJ5R5+EpceDYy4ReD2RSvOaEiAAqJWEqEFGEzmbStu
	9WcII1gEMB8Vhjrpisxvp/N9JXfd5tGWr0QjMfgRPaW9H+PugFX1xHiIbKPMw4meCmrSodtikGKdl
	eJNSHJH7PB7+O8SO176A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieZRB-0005KL-2w; Tue, 10 Dec 2019 06:56:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieZPP-0002If-TI; Tue, 10 Dec 2019 06:54:14 +0000
X-UUID: 99fc81c2a27142c1a9cbcfb0cc7dd11d-20191209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=c+JQZu06rnps/PbFJByt62MWheUf4sOHuIAnwN3BMkM=; 
 b=YPjk6VtJrl8cDG5r3PFAAuYJTRhuGHzoI5atvdK0uCAMQZkpmI1y/0laWaemnzfs+HJwFNkhheNUDTnNFOjca9Y3x+ZYC04r5OYUPsrYdLW4+iE4kGGYAjVHw+Y0WrF38UBdmQRvH+tTPATr5hfG68JIN+RR6mmQkJlAPlq77Io=;
X-UUID: 99fc81c2a27142c1a9cbcfb0cc7dd11d-20191209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 434987800; Mon, 09 Dec 2019 22:54:05 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Dec 2019 22:48:16 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 14:46:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 14:47:16 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v9 0/9] Mediatek MT8183 scpsys support
Date: Tue, 10 Dec 2019 14:46:44 +0800
Message-ID: <1575960413-6900-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_225411_989002_8A7CC32D 
X-CRM114-Status: GOOD (  10.18  )
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
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.5-rc1

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

Weiyi Lu (9):
  dt-bindings: mediatek: Add property to mt8183 smi-common
  dt-bindings: soc: Add MT8183 power dt-bindings
  soc: mediatek: Add basic_clk_id to scp_power_data
  soc: mediatek: Add multiple step bus protection control
  soc: mediatek: Add subsys clock control for bus protection
  soc: mediatek: Add extra sram control
  soc: mediatek: Add MT8183 scpsys support
  arm64: dts: Add power controller device node of MT8183
  arm64: dts: Add power-domains properity to mfgcfg

 .../memory-controllers/mediatek,smi-common.txt     |   2 +-
 .../devicetree/bindings/soc/mediatek/scpsys.txt    |  20 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  63 ++++
 drivers/soc/mediatek/Makefile                      |   2 +-
 drivers/soc/mediatek/mtk-scpsys-ext.c              |  99 ++++++
 drivers/soc/mediatek/mtk-scpsys.c                  | 389 +++++++++++++++++++--
 include/dt-bindings/power/mt8183-power.h           |  26 ++
 include/linux/soc/mediatek/scpsys-ext.h            |  39 +++
 8 files changed, 614 insertions(+), 26 deletions(-)
 create mode 100644 drivers/soc/mediatek/mtk-scpsys-ext.c
 create mode 100644 include/dt-bindings/power/mt8183-power.h
 create mode 100644 include/linux/soc/mediatek/scpsys-ext.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
