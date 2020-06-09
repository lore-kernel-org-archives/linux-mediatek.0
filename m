Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F175CC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 10:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE706207F9
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 10:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dUDfdVJw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cSb5SjzB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE706207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L3SUsFk/tcP6GYVLdDL1jT4ZS1mo0PYXG5lksRqvHEU=; b=dUDfdVJwDNhsLX
	99elM0GL4D7vOEGFGii1ZniNVaRD5Uax1NO+rvCgzZ3C60CCyQpv42PbEsxLBmgtJzMRUpZ/unCGN
	Z5q0MRtPCcZNcY4/jxKKqQdRyeHE6TdPA/2H+ggkQ9WxfRDMFJjPIlMIsF2MxaBdMfZ9A3Q19dquT
	0qljP3u3KOrDH3pydcd2hcdIu9o8xWo5CeK8gTrMDTJI4T0BgErAb2sJ6EknqSs+EUhh7oE/DUqQD
	Dblccod8QccKOe9qge1l/NEEsqJMJ1v5AiFXCBeoIHrqDTqwRGSNago9hlh6n4QVcWligef42wmGj
	gJVMk6KEBYY29hlVrJ/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jibm4-0002CB-Ec; Tue, 09 Jun 2020 10:46:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiblT-0001Xp-LN; Tue, 09 Jun 2020 10:45:57 +0000
X-UUID: 4e79ad7feeaa4963a98f586d22e29215-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5ak6B9yXDQG+uLwRfImrZ4YOAgSKcMnvfKkqDlCtExY=; 
 b=cSb5SjzBUj4ISAuCics3f92/5QhVtl8yDQG7vW3xfESkUfLoc0ynCLA7gaO2EpvLu+pZ8PWmEjXCF0t9uqj0LEJP86UEvycMuUOCkVIP1Lk7q5oFD3jIgyfgNsFyLUBM0QlP0wGHIQHEHsKSLNcAt+DpjHhaNsPu1e4+KnVMQoQ=;
X-UUID: 4e79ad7feeaa4963a98f586d22e29215-20200609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 331988338; Tue, 09 Jun 2020 02:45:55 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 03:45:48 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 18:45:34 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 9 Jun 2020 18:45:34 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH v9 0/3] PM / AVS: SVS: Introduce SVS engine
Date: Tue, 9 Jun 2020 18:45:30 +0800
Message-ID: <20200609104534.29314-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: F4A1B644A6F609D5CDCAC8C6F33835685D4DC4EB39D55BA2913EA8ECA89702732000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_034555_806758_F3CA00AE 
X-CRM114-Status: UNSURE (   8.34  )
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

changes since v8:
- Add svs driver documentation for helping understand it
- Make svs driver become a module_platform_driver()
- Seperate svs debug feature from svs main driver

Roger Lu (4):
  dt-bindings: power: avs: add mtk svs dt-bindings
  arm64: dts: mt8183: add svs device information
  PM / AVS: SVS: introduce SVS engine
  PM / AVS: SVS: add SVS debug commands

 .../bindings/power/avs/mtk_svs.yaml           |  141 ++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   16 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   41 +
 drivers/power/avs/Kconfig                     |   10 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/mtk_svs.c                   | 2180 +++++++++++++++++
 include/linux/power/mtk_svs.h                 |   23 +
 7 files changed, 2412 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/avs/mtk_svs.yaml
 create mode 100644 drivers/power/avs/mtk_svs.c
 create mode 100644 include/linux/power/mtk_svs.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
