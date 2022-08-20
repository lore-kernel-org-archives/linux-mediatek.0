Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6199AC25B08
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 Aug 2022 08:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PUarByM2j1FNLpVpanhoJ3I2PsMoMzMbXYJwfEpiVIc=; b=ZSbHMIcikEgzzbMENSI7SSMclY
	xVYihQQg+FPFQyXcXHMxsBCdoiA6InvTPmwt3WEmpVtaP0XdoV8IcUhlII/VsBFA88JXHQ32GB5op
	ocIO0Um08R6GRCWoaskciVpc8+lPm+IQwTGhHzdszC4n6qZmTBqEzjh4I56k/UhbCist7Uh7eUNwL
	+nvabYVj3VWON3sn46skhyQRX263HF63D49QZQv771If8mWegVCbWH+hwx9o/CuLs6RbMR7+Nx/8T
	JC47JU291W4Vf1fl0d5UVM1/x0KMXHxSX0s+be1F9qO3y9n5xDvJEah06Nu2ZAQPUCyr4+cDmJEcy
	DaXC7o+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJw7-004wUb-Hc; Sat, 20 Aug 2022 08:34:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPJw4-004wP7-VT; Sat, 20 Aug 2022 08:34:30 +0000
X-UUID: 8cf69ac23ccd477db68fab15a5549b09-20220820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PUarByM2j1FNLpVpanhoJ3I2PsMoMzMbXYJwfEpiVIc=;
	b=nbEExJ7UJBQRUYs7V21SEK62lfrowYhaphfFhMdVIfmThPx/H8T77HwrWLJd2QBRuHoY9su3nRVnK1Dc3MYaaj5Q/V4cLldu19OTt0TXTIMu6cBF3ukGcPAqlqYDTct6ya/geg9r9vtqKVsKFtgjGH9Ce5VevPmU3eS3oxk2fhs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:a42406e5-8514-4748-a745-a478dec205fc,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:aad3c567-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 8cf69ac23ccd477db68fab15a5549b09-20220820
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 625553928; Sat, 20 Aug 2022 01:34:23 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sat, 20 Aug 2022 15:53:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 20 Aug 2022 15:53:46 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<nfraprado@collabora.com>, <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <matthias.bgg@gmail.com>, <jiaxin.yu@mediatek.com>,
	<devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<project_global_chrome_upstream_group@mediatek.com>, chunxu.li
	<chunxu.li@mediatek.com>
Subject: [PATCH 0/2] dt-bindings: sound: Add SOF field for mt8186
Date: Sat, 20 Aug 2022 15:53:41 +0800
Message-ID: <20220820075343.13993-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_013429_055188_6E7A13C1 
X-CRM114-Status: UNSURE (   5.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "chunxu.li" <chunxu.li@mediatek.com>

These patches add SOF field for mt8186 machine driver

chunxu.li (2):
  ASoC: mediatek: dt-bindings: modify machine bindings for SOF
  ASoC: mediatek: dt-bindings: modify machine bindings for SOF

 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml  | 10 ++++++++++
 .../bindings/sound/mt8186-mt6366-rt1019-rt5682s.yaml   | 10 ++++++++++
 2 files changed, 20 insertions(+)

-- 
2.25.1


