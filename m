Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F96C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8rw/4yrLFl99hRaPLQQDCs2elQYKz9h3aJPT8Ka9qPs=; b=CWlFwZlzcGZV98
	vS6CtaWeL9Hw6HrRQ1wWFB5jBIclcV1hXRqMX34ayxvgkbzpC83RFFGCTFj6ykY/tHAzy0fiZz2zq
	IUgNtjefvykwI0Fyph//cHQlC8UcHb7vhKC3yvJEYQHWcL8Q1AmS6nQrQn1JvYS45YaMjx2N8pTE/
	sQtKM7ASBKubZomRYJwb129C3gw7yHf/MWcTrYhsSg3VF3/5fLmM6jCLwlkzdoxctpL6ijPWBeFYj
	E5uhbHZG0yo5l7pRHvDmOWOqMgE3dU3FSWiRegt0ywJ/82yazlVHfQ/BQqi8WeKq7IR3rMoYJ8tNH
	mEJUu+/9W5noc+Rj4+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niSRp-005c7z-AS; Sun, 24 Apr 2022 02:58:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niSRd-005c43-DF; Sun, 24 Apr 2022 02:57:54 +0000
X-UUID: 5d12fdac6ba74cbb978d049780338f32-20220423
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:308eaf8a-30ec-4813-ba6d-208dc06254f6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:c229b9f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5d12fdac6ba74cbb978d049780338f32-20220423
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1379361510; Sat, 23 Apr 2022 19:57:44 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Apr 2022 19:57:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 10:57:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 24 Apr 2022 10:57:39 +0800
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
Subject: [PATCH v3 0/1] Mediatek PMIC patch 
Date: Sun, 24 Apr 2022 10:57:37 +0800
Message-ID: <20220424025738.32271-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_195753_491609_BCBF6E09 
X-CRM114-Status: UNSURE (   6.39  )
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

This patch fix pwrap time out issue.

Changes in patch v3:
1)add fix tag in patch commmit message
2)fix file mode from "100755" to "100644"

Changes in patch v2:
1)add explation commit message on the patch.

Zhiyong.Tao (1):
  pwrap: mediatek: fix FSM timeout issue

 drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--
2.18.0



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
