Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E845C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 01:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/uPahTIDt1UzwuCRttVpCred5skdDD6utw/JpM35eLY=; b=36oCwrcpwcX/eL
	IGtW8HUAjT2Qwc5tWTd4n/FB+22M0p1hnaZzh6Qr9gq+AWlJ3FtWRoiua9UeNpa6qnkZFtFnKAXHM
	Pjyx/dMmVcnohdWNCY/gRD8ylbzzUOdJsWRI4rIbC0G94oZVFq/3JHF+Be5zoYaE8eOyBUSvrHp8X
	r3kpVRkrMCbXGXWNhoPlCFcKqmjG2gYIHyAe1tgIJ9FYCLf5k6+QfDuyLiB0octbjwlVk4x3P6J/X
	OQBs6Hvbn29HWhKaTPSeVyR8xdRCYsuZTaoQ+49LMRQowHQqXuFvto898xhpaSGxqTn3UFsS/CWeT
	uriD8p8E8KMx2CtzPgEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndjDY-00686X-8M; Mon, 11 Apr 2022 01:51:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndjDN-00683O-Ie; Mon, 11 Apr 2022 01:51:38 +0000
X-UUID: a7b07ec48eb14cb3a2f5818b43218a52-20220410
X-UUID: a7b07ec48eb14cb3a2f5818b43218a52-20220410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2058534417; Sun, 10 Apr 2022 18:51:30 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Apr 2022 18:41:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Apr 2022 09:41:26 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 09:41:22 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <tinghan.shen@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hsin-hsiung.wang@mediatek.com>, <sean.wang@mediatek.com>,
 <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 0/1] Mediatek PMIC patch 
Date: Mon, 11 Apr 2022 09:41:20 +0800
Message-ID: <20220411014121.15015-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_185137_655986_585017C5 
X-CRM114-Status: UNSURE (   6.97  )
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

This patch fix pwrap document for mt8195.

Zhiyong.Tao (1):
  dt-bindings: pwrap: mediatek: fix pwrap document for mt8195

 .../devicetree/bindings/soc/mediatek/pwrap.txt         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

--
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
