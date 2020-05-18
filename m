Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDDAC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 09:25:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E618B20787
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 09:25:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rz4VyDhn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Va6hluz4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E618B20787
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uUmALTM3pXb2ECK/v5MZUKT1MY8w/4xAj+r/jipuf+s=; b=Rz4VyDhnBVyetH
	N7tPYttFA6Ed4RfNo1Fgkx7MOdg/X3FM3TmPcoOlforDk5ZbHja4nm1Yst/W8Rzm7gdOrfCTg8ir4
	O/JDzZkRKVJ26KX9OsrEbWGq9xE/bVfndwrO5FX3VqutpvGoMhwURm8KFbHqmFlbhrN3LSpMclJr3
	HBeeId/hCmbxs+LFQclnZ+Gs0JE+rkUgnUFk4S0iPBp6WU11KjfC8DJxTqHTovWDOpssNlABtkijd
	Q4jKmMdd4VdGNaU7WxJsOm0jfoQovXetud1YBuZGJtq8zeUyBhNuGNzVXdyPBOAWtaHi/+jDrZ8jK
	TaQXoUfwRDvZuwe9pg2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jac16-00068y-3b; Mon, 18 May 2020 09:25:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jac13-00067o-KJ; Mon, 18 May 2020 09:24:59 +0000
X-UUID: 6b503ae948b542649b259568cd64efcf-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0DTYtg7DH/aaZsHajF1M0GEhpPDj6HE4U9Su4EW4ZBg=; 
 b=Va6hluz4/bYSptacD8bkhsa7nqDZ2RFMyTranQOalM8PvJkJFDufyvfFqfxrt16Eu3JTqNK1zXkkWjaYPe4/rTWrbAF32VKsT7VVlBavvczJ9jN19kkFozRrtllCR0Kyh2vL+FHwLlmDezX0unYUnglb0LuuuzxNYqAEFeq5e5w=;
X-UUID: 6b503ae948b542649b259568cd64efcf-20200518
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 546234437; Mon, 18 May 2020 01:24:44 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 02:24:48 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 17:24:45 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 18 May 2020 17:24:45 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v8 0/3] PM / AVS: SVS: Introduce SVS engine
Date: Mon, 18 May 2020 17:24:01 +0800
Message-ID: <20200518092403.22647-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5934DDCDEAF0C437AC4DD8F51EBED5FD5EACA359D2BA842B5D2816D48513A4412000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_022457_664592_2F9B343D 
X-CRM114-Status: UNSURE (   8.25  )
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
4. SVS dts needs power-domain [5][6] and PMIC regulator [7].

[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/patch/11304935/
[3] https://patchwork.kernel.org/patch/11423009/
[4] https://patchwork.kernel.org/patch/11316495/
[5] https://lore.kernel.org/patchwork/patch/1236875/
[6] https://lore.kernel.org/patchwork/patch/1236878/
[7] https://patchwork.kernel.org/patch/11284617/

pending discussion:
- SVS sub-node architecture concern in below patch.
https://lore.kernel.org/patchwork/patch/1175994/
https://lore.kernel.org/patchwork/patch/1175994/

changes since v7:
- Add "mtk_svs.yaml" for device-tree binding document.
- Add svs_add_thermal_device_link() in driver for svs device (consumer)
to link thermal device (supplier).
- replace pm_qos_add_request() with cpu_latency_qos_add_request() for
letting CPUs leave idle-off state.

Roger Lu (3):
  dt-bindings: power: avs: add mtk svs dt-bindings
  arm64: dts: mt8183: add svs device information
  PM / AVS: SVS: Introduce SVS engine

 .../bindings/power/avs/mtk_svs.yaml           |  141 ++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   16 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   41 +
 drivers/power/avs/Kconfig                     |   10 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/mtk_svs.c                   | 2119 +++++++++++++++++
 include/linux/power/mtk_svs.h                 |   23 +
 7 files changed, 2351 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
 create mode 100644 drivers/power/avs/mtk_svs.c
 create mode 100644 include/linux/power/mtk_svs.h
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
