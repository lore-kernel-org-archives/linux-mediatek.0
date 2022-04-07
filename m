Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 11:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JPiJO2aVlybrPnFZUcvlt8RQNz2rCU/AcBcglUoSoyQ=; b=keR9Kq6yyIGorg
	be4ZPitcb4zUemGXWsUNbYdXGPwOyBmSfJv9Lp+3k6PNj2mhoRBGN7jLs+LD8Fk/Jp+AaNYWiOwKH
	NQzNty4mRGJcaYvNntjueQ/tW2GZ7SuAl5F3hBrHCjkPcM0t5L/7/UwdyaOM5xE1ojz4tGZfRCeqV
	m2Z7ahoEf/LLPc+be1GzRrPIOKd/24AfD0aez/IVJ53v/Eafgw8No2fTfeGkpWphzD8RvswbKUmfL
	s/cSWxhUri1Zr7Dt34aS1vzlULalJCJPxEKP5Yig2cUPSjtzLlNvV7L/TO+AVfz3tjcZWBPBYYkti
	uHGXe0bT/tgfZ7mOQirQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncQS0-00BZYA-0Q; Thu, 07 Apr 2022 11:37:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncQRv-00BZWy-EB; Thu, 07 Apr 2022 11:37:16 +0000
X-UUID: 2da674db7501424e98d1674719577b14-20220407
X-UUID: 2da674db7501424e98d1674719577b14-20220407
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2118351152; Thu, 07 Apr 2022 04:37:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 04:37:06 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 19:37:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Apr 2022 19:37:05 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Chen-Yu Tsai" <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Hui
 Liu <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 0/1] mt8192: Add mmc device nodes
Date: Thu, 7 Apr 2022 19:37:02 +0800
Message-ID: <20220407113703.26423-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_043715_522215_8FBC0EDA 
X-CRM114-Status: UNSURE (   8.32  )
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

Take mmc device patch from series 20220330133816.30806-1-allen-kh.cheng@mediatek.com/
This series are based on matthias.bgg/linux.git, v5.18-next/dts64

In mt8192 SoC.
mmc driver would directly read/write register(11f60000) to control clock configure.
Alos there is no other module using msdc: clock-controller.
In order to not cause duplicate unit-address warning, I remove the clock-controller
entirely.

changes since v1:
- remove msdc clock node

Changes history of mmc:
- mmc: diable the msdc clock node, drop reviewed-by tags.
- mmc: reserve msdc node
- mmc: reorder clocks as specified in the dt-bindings
- mmc: use single line for reg

Allen-KH Cheng (1):
  arm64: dts: mt8192: Add mmc device nodes

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 34 +++++++++++++++++++++---
 1 file changed, 30 insertions(+), 4 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
