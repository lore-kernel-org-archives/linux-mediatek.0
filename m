Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949AEC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 07:05:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9D8613C6
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 07:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9D8613C6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gPPBdnwfMnAopSVtRleQyllFp66QP8q0SxWaYfICZOI=; b=PIFj4V6ngbZ5Q9fj3pBTLH1tkt
	9mrVnnGiWYfgysZbG1M8262e1r27GFHcc/wjn2HqREQkmrCisooR4xzxGPnPJOI5VDaUGDwbyyUsy
	MkJ4f/RfxoPStfk4sjjvWW7S0svsxOV6M3hYhBed+tr+Gl2C+DEAU4JxXhSJKw1dO563lC2sEBaz8
	oN4t3ZvgyMRLjflfkoYXlz6r0X9ArbzqNQ7SprjaG9YMubK8uylMSoDvf+ZPOVdqH2ggZOGDSX6x1
	gUs7M9AZ/FNBIuX0nsVhWNUUnxmsyYwZN9msKwB1YQ/0l8GIkGMKhA5rWM+mo/CEKOrIhlqbPhcEc
	QX7PCwfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbeFn-0031Po-Or; Wed, 28 Apr 2021 07:05:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbeFP-0031MY-EN; Wed, 28 Apr 2021 07:04:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=70kzKT8Ff7LBNHtJqFbfmpxVk5VXm4yEAbYu32AbqGM=; b=jMvbTXX9udohYUTWkh3GaavSJy
 6O7tHQ8YEnZ0+TDurV2EfMU0MWJF1/1J4cZXyfSuk8f0vj+Y5IngrLngayPJdTdkrkuMc9U6fpbLM
 8zA4DNmzTZfdlm5WTMAWD30hGPmjwTM5J7dXUrl8/6NrYOq7fiWZKH1I3OX50xnJ/9u8trcp7fZSl
 FwLnoLx1rUkkx2qNcI6Yhq6n0OXs1+X4rkUcXbkKqBmfzoBW5vjiFsWOhFgqhwOuToJ5FzW7+z1xW
 uGRQC7+9BYMgZLdfc/60iQs3d5EpVxzee+4jsuEvI+jK04Q2qSA/J83xNzW7qEAEUqE4yhBQFoqRG
 xpUJVMbQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbeFM-00HEgR-Ga; Wed, 28 Apr 2021 07:04:33 +0000
X-UUID: 9634b3f10bec4095b8fe868d921c1437-20210428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=70kzKT8Ff7LBNHtJqFbfmpxVk5VXm4yEAbYu32AbqGM=; 
 b=SpihRnqLZK83kACGCzHauuDBLyCVSLDFToKJt6W0TozMpb+V8mYD03e4VeBAHQcBfFq2KdE8RFGrkQLHo8urZxgfOc1UDN/Mf0+YEQw97phkgXPfQzGRnQEFklQ3mmbCFCpbE/dQRqXnhKpR8hGsR/Hs+SnBHrgpAa5apgwZktc=;
X-UUID: 9634b3f10bec4095b8fe868d921c1437-20210428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 223096960; Wed, 28 Apr 2021 00:04:25 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Apr 2021 23:54:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Apr 2021 14:54:42 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Apr 2021 14:54:42 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v16 0/7] soc: mediatek: SVS: introduce MTK SVS
Date: Wed, 28 Apr 2021 14:54:33 +0800
Message-ID: <20210428065440.3704-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8A017A44F8733E750C40E683018EB1E5CFA6C167E86658109DCCEFA8E6B206AA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_000432_580191_20D1D25D 
X-CRM114-Status: UNSURE (   9.88  )
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

1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device().
After retrieving subsys device, SVS driver calls device_link_add() to make sure probe/suspend callback priority.
3. SVS dts refers to reset controller [4] to help reset SVS HW.

#mt8183 SVS related patches
[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20201013102358.22588-2-michael.kao@mediatek.com/
[3] https://patchwork.kernel.org/project/linux-mediatek/patch/20200306041345.259332-3-drinkcat@chromium.org/

#mt8192 SVS related patches
[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20201223074944.2061-1-michael.kao@mediatek.com/
[3] https://lore.kernel.org/patchwork/patch/1360551/
[4] https://patchwork.kernel.org/project/linux-mediatek/patch/20200817030324.5690-5-crystal.guo@mediatek.com/

changes since v15:
- Put (*set_freqs_pct) and (*get_vops) in struct svs_bank because they are part of svs bank's operation
- Add define "SVSB_INIT02_RM_DVTFIXED" and "SVSB_MON_VOLT_IGNORE" to make control clearly.
- Remove unnecessary parenthesis

Roger Lu (7):
  [v16,1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
  [v16,2/7] arm64: dts: mt8183: add svs device information
  [v16,3/7] soc: mediatek: SVS: introduce MTK SVS engine
  [v16,4/7] soc: mediatek: SVS: add debug commands
  [v16,5/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
  [v16,6/7] arm64: dts: mt8192: add svs device information
  [v16,7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   92 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   18 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   34 +
 drivers/soc/mediatek/Kconfig                  |   10 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mtk-svs.c                | 2524 +++++++++++++++++
 6 files changed, 2679 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
 create mode 100644 drivers/soc/mediatek/mtk-svs.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
