Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC50EC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 03:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XBDApH/Diqo+lt+zto9lK1Qs6DfgcDXXX/82URD+j08=; b=I7V0cYcYe+VXIn
	Pn/1BiyAxE1fyiiHIDSpvePFKRzJHgqEJY0Lbrxmb7p06ftDh0zAsVk3pdVTCUBUY+CVgewCvfVwQ
	rMwefAOzzTyBASuSyetKfMv7yytZERYKPYhbZSsUtDpnozqkLRRQC8XfYmhaoF6dcuyXkVR+C1K7D
	RMy6SSM0TO3RFeTVxl0ykk514thOSqavthlht2ATQWOYj7/IuOdmsh4aNTOccM+RgB1xn6ox1j3ky
	C2g9MyWiuIb2hqWCAEYoL6wqaji5sE5kvJWzsdJU3VV8paZE5s8HAl6TzIvUvqTJ03lQOTwD/eXv7
	Z3zIZc2+KEoQaUkgkrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5JSH-00GJSv-Q1; Thu, 06 Jan 2022 03:28:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5JS3-00GJOb-VO; Thu, 06 Jan 2022 03:28:33 +0000
X-UUID: d97e1e6eecaf460b93bf23acc5c20737-20220105
X-UUID: d97e1e6eecaf460b93bf23acc5c20737-20220105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1468467774; Wed, 05 Jan 2022 20:28:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Jan 2022 19:24:23 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 6 Jan 2022 11:24:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 6 Jan 2022 11:24:21 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <nfraprado@collabora.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <drinkcat@chromium.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v2 0/5] Update MT8192 Clock Setting
Date: Thu, 6 Jan 2022 11:24:15 +0800
Message-ID: <20220106032420.11544-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220105_192832_055110_A2E9D2E9 
X-CRM114-Status: UNSURE (   7.24  )
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

This patch is base on v5.16-rc8,
series "Mediatek MT8192 clock support"[1], [2] annd [3].
[1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=521127
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20210727023205.20319-2-chun-jie.chen@mediatek.com/
[3] https://lore.kernel.org/all/20210825011120.30481-1-chun-jie.chen@mediatek.com/

changes since v1:
 - update the commit message

Allen-KH Cheng (5):
  arm64: dts: mediatek: Correct uart clock of MT8192
  arm64: dts: mediatek: Correct SPI clock of MT8192
  arm64: dts: mediatek: Correct Nor Flash clock of MT8192
  arm64: dts: mediatek: Correct I2C clock of MT8192
  arm64: dts: mediatek: Correct system timer clock of MT8192

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 92 +++++++++++++-----------
 1 file changed, 52 insertions(+), 40 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
