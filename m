Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022D5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 08:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0eds/7SUcNePwFpWahkk/pyz3aUcJ4mFdf2Xpc8kngU=; b=v7wYCoU9aNm098
	0hKSo9ov4pCOA2RlNA54NWNxRgY3JZzufSd+tjhDxzGOldhCEUzoYqJ7oP2eGgu/q31BBd7NRvIQq
	1BK/pv1jK7AMt0YDZYxs6FyTaQ4LueWIM0uXqYCGx/seLemCO2j5rq0I7GeeL1aTDaKdZ3qRSvqOt
	FO+WhlEBibYJavu+4gmGAbS605bye9geB4fpnTNfZgRmTkb0aUSmx6N2qCdAUzuC6Rk2kfBk45a8T
	LzkZeVhO93HlrLQlEZ1pu8VGIR29tjiT/U8WSwhdn4lFnzVilRauaOI6YPZ/rhwqrSALRZCOysmmC
	npNCI6OfUy+IWFPw62hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzE09-000TD5-TB; Thu, 09 Jun 2022 08:58:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzDjA-000KC8-7z; Thu, 09 Jun 2022 08:41:18 +0000
X-UUID: 454449744f044033bff0d44af7b07815-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:2141c405-0733-4876-be61-62f84c8c461e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:2a19b09,CLOUDID:6d473ce5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 454449744f044033bff0d44af7b07815-20220609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1366841008; Thu, 09 Jun 2022 01:41:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 01:31:06 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 9 Jun 2022 16:31:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 9 Jun 2022 16:31:05 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>, "Mark
 Brown" <broonie@kernel.org>, YC Hung <yc.hung@mediatek.com>, Curtis Malainey
	<cujomalainey@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 0/3] Add MT8186 ADSP dt-binding
Date: Thu, 9 Jun 2022 16:30:58 +0800
Message-ID: <20220609083101.24195-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_014116_354066_96DB27BA 
X-CRM114-Status: UNSURE (   8.59  )
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

v1 -> v2:
1. Change mbox-names from mbox0/mbox1 to rep/req for both mt8186 and mt8195.
2. rename clock-names and remove unused headers

Tinghan Shen (3):
  dt-bindings: dsp: mediatek: Use meaningful names for mbox
  firmware: mediatek: Use meaningful names for mbox
  dt-bindings: dsp: mediatek: add mt8186 dsp document

 .../bindings/dsp/mediatek,mt8186-dsp.yaml     | 91 +++++++++++++++++++
 .../bindings/dsp/mediatek,mt8195-dsp.yaml     |  6 +-
 drivers/firmware/mtk-adsp-ipc.c               |  6 +-
 3 files changed, 99 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dsp/mediatek,mt8186-dsp.yaml

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
