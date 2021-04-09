Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE76C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 09:33:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42598611BE
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 09:33:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42598611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xmVL7mnEsV39RpItalOk4xyV+0sa6Cpauj3W7wEXbvg=; b=JXJT+omBtmWlJYf0ihkcK1XL/h
	97T1cBIWvfk++pO9wDUitN00CrU9J5MviaxuXhsDGxC8e1coof0NfVnBUnxP+7WISOS66DEn271li
	KZ+MFTQ+ujBA1BbDRPyzeCU7wusBnZb4w/+PzDm0rYe4ObRrsK2lFCUEOZEH9ZN//5iYxMjHvWLxO
	BZRVeW03wZsmSA/3mUF0AGRIzYVonii51SjaGEubjISYMYL1Vq8aF3WbLodjVny74I0+pjdldLlJS
	tnDxJh6BWwcA9RWkpz+r4qjf3iAIqmMpheUyDFu1jclIbVQ5MX281/1+T+NG8NTYacym05IVYz0bH
	0NnHoflw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUnW4-000Flq-Fx; Fri, 09 Apr 2021 09:33:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUnVZ-000Ff9-9o; Fri, 09 Apr 2021 09:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=n5OlWWbhg1dGfp7Th6NPDc4P6SGSdyPsSWeBqj7diYY=; b=xQzwmUG2Sco31c4ASzyN0zTntn
 Bkf6fmheOsMepeZWE6uC3xUeVQCleSSLfmEr63IH2PVW4UZRyQF+Q8jgJdXc1qWXtYBmvcGATEDkV
 OKTRtNfj0HPwO72LVuLERikRYbvEIoEcw+yhWcD24xRmYklrjyiOWcybFX9GkpaK4ChwVvpwYjvw6
 1fyy74jlVpXjrVJWYUBUIQXh0VVjBOZ2ufRlN+kAGb40DAA6Pcf76tHL57anc8Trxb3qfSEUQX/xi
 NkvhieoxLU6lB8mS++1rymUtktLSpONHv/Xbbm/9C/z98MQWS5yDTyGeXIvoV/TkOtUuUakYuBtfB
 sbtrQd/w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUnVW-0042W7-Et; Fri, 09 Apr 2021 09:32:56 +0000
X-UUID: 43b2b72460e6449db0c0ebbafff95ba0-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=n5OlWWbhg1dGfp7Th6NPDc4P6SGSdyPsSWeBqj7diYY=; 
 b=meQtJedeFeg059v/fqSyZOSO8prhj7TIrgSy5ZmvIMsOHSnklqifWr13s77NUzyBkDy0q4hdFkVBpIEYCXwgstWyY4cypoGvDvY+9j3XAc9hhJbgsjkwJw0EjGoy5LwZ90oG6uEFqVSwUoVZ3FF5N8Anleo00zHK+Wi4YUwDG/8=;
X-UUID: 43b2b72460e6449db0c0ebbafff95ba0-20210409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1221413713; Fri, 09 Apr 2021 02:32:50 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 02:28:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 17:28:30 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 9 Apr 2021 17:28:30 +0800
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
Subject: [PATCH v15 0/7] soc: mediatek: SVS: introduce MTK SVS
Date: Fri, 9 Apr 2021 17:28:21 +0800
Message-ID: <20210409092828.23939-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: FBE5666FC0708B3FB2884FA1601AE6E93921481FF5B270E183F00C307BBCA6EF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_023254_542535_18F3CD19 
X-CRM114-Status: UNSURE (   9.40  )
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
After retrieving subsys device, SVS driver does device_link_add() to make sure probe/suspend callback priority.
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

changes since v14:
- fix coverities
- call regulator_set_mode() after regulator_enable()
- save SVS registers into svsb->reg_data[SVSB_PHASE_ERROR] when svs_error_isr_handler() happens

Roger Lu (7):
  [v15,1/7] dt-bindings: soc: mediatek: add mtk svs dt-bindings
  [v15,2/7] arm64: dts: mt8183: add svs device information
  [v15,3/7] soc: mediatek: SVS: introduce MTK SVS engine
  [v15,4/7] soc: mediatek: SVS: add debug commands
  [v15,5/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
  [v15,6/7] arm64: dts: mt8192: add svs device information
  [v15,7/7] soc: mediatek: SVS: add mt8192 SVS GPU driver

 .../bindings/soc/mediatek/mtk-svs.yaml        |   92 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   18 +
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |   34 +
 drivers/soc/mediatek/Kconfig                  |   10 +
 drivers/soc/mediatek/Makefile                 |    1 +
 drivers/soc/mediatek/mtk-svs.c                | 2500 +++++++++++++++++
 6 files changed, 2655 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
 create mode 100644 drivers/soc/mediatek/mtk-svs.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
