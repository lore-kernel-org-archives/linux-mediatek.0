Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145AAC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 08:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RhWC3iU0RbmA2VmUaBdeMEP+3jf7jHi+nRpb7qpbsGg=; b=TDqK6hOMvBwa6J
	Ox4ojLABqNSLkABV1rzrB2z58gLVUibkhHysQgt+Q8irbbWIHbCtsvEd5/pGBTxGkuLwAoOBubbaK
	caWcd6NQUUgbsJt0ERTQO2d6csptMyGj99lk8rgyVJAG2VmZ1+AmlOYi+qnDIvd4n6YgXUDn/TZfB
	2j4xzrlZuBGrkm2RvCQ30pmJK/Vn/75JqS1ao9vWh1YoYq7ArnM7vjSMW7zWJvHbCJwczX9yt83vH
	PA5UB4M5M0lGIbqUUYPhhnyPXqh4Zkg1RSENzRYMw6qjps2GQzg/FERHHTLdcBrZxNkxcm9zDUiKQ
	mtDPrnkwqS2Z2w/pWnag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGzTu-009MeW-Ke; Mon, 07 Feb 2022 08:34:42 +0000
Received: from mailgw01.mediatek.com ([66.171.122.165])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGzTW-009MWD-Hz; Mon, 07 Feb 2022 08:34:19 +0000
X-UUID: feba9f926e5d436c843c0fad3ee01036-20220207
X-UUID: feba9f926e5d436c843c0fad3ee01036-20220207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <johnson.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1948128134; Mon, 07 Feb 2022 01:34:14 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Feb 2022 00:30:43 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 7 Feb 2022 16:30:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Feb 2022 16:30:42 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <angelogioacchino.delregno@collabora.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
 <johnson.wang@mediatek.com>
Subject: [PATCH v3 0/2] Add PMIC wrapper support for Mediatek MT8186 SoC IC
Date: Mon, 7 Feb 2022 16:30:32 +0800
Message-ID: <20220207083034.15327-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_003418_618812_B70E10F9 
X-CRM114-Status: UNSURE (   7.73  )
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

This series add PMIC wrapper support for Mediatek MT8186 SoC IC

Changes since v2:
- Replace meaningless suffix _V2 with _MT8186 because
  these IPs are only for MT8186 SoC.
- Remove not used capability PWRAP_CAP_MONITOR_V2. 

Changes since v1:
- Fix the conditional logic in pwrap_probe() function.

Johnson Wang (2):
  soc: mediatek: pwrap: add pwrap driver for MT8186 SoC
  dt-bindings: mediatek: add compatible for MT8186 pwrap

 .../bindings/soc/mediatek/pwrap.txt           |  1 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 71 +++++++++++++++++++
 2 files changed, 72 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
