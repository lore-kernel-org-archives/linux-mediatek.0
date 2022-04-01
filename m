Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B759FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 05:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f745wudsR9kDwZzlEvZJQT4/nHBRiU92oPRS+/bMF2g=; b=fYS8Rmoa0AHbvH
	QjVHCp+Qdd3SBxzgEZQ4xRkoKYcI7JSTKoE8APBOgPwGq6cnp/jbhqqvDb8LhCIX1orXLQnBSggbS
	nrwlgb8bab+VzkpPiRQIYTxjwiuuZEXpcmBncG73CSCsi/gzQURjhtcpi/8XRZfQZM4akPp94XYNm
	03QQnk44mZd9VrN81fMfccDUip9tATmx0z4/atVNbM2+3/eUVsXTDSHym0yx/6dhDK79rQ+iMXACk
	ZNgggfRT73h5KSFtwxY8RPTJ3QYKjXVUoSE1T02LM4OP67oKapSV8UwrCXImh4FrgsM69gnnzRsiD
	7O96J4pBDaC0bM07W9vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1na9sP-004YRT-LS; Fri, 01 Apr 2022 05:31:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1na9sE-004YOC-DS; Fri, 01 Apr 2022 05:31:03 +0000
X-UUID: b9624aa3613a45518fe70bfdd45b7b06-20220331
X-UUID: b9624aa3613a45518fe70bfdd45b7b06-20220331
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1463702915; Thu, 31 Mar 2022 22:30:57 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 22:30:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 1 Apr 2022 13:30:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Apr 2022 13:30:53 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, "Hui Liu"
 <hui.liu@mediatek.com>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 0/1] mt8192: Add mmc device nodes
Date: Fri, 1 Apr 2022 13:30:51 +0800
Message-ID: <20220401053052.2160-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_223102_512514_2E72028C 
X-CRM114-Status: UNSURE (   6.36  )
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

Changes history of mmc:
changes since v5:$
- mmc: diable the msdc clock node, drop reviewed-by tags.

changes since v4:
- mmc: reserve msdc node

changes since v3:
- mmc: reorder clocks as specified in the dt-bindings

changes since v2:
- mmc: use single line for reg

changes since v1:
- none

Allen-KH Cheng (1):
  arm64: dts: mt8192: Add mmc device nodes

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
