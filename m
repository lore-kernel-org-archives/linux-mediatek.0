Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 01:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=reY7VsJEshu/eApYYYy4mI3/dBeBwEBcSNS1bybfp/o=; b=V/xn0Hplcbk+H4
	S4n9duQ+U9A5q52m60ZStzqemsBX7wobzcewFrgmVp6ZvKOVXO760kL1W76OpynDOV0pkGuBJda2k
	ThR08wRE4Fqt+ypMmh9sorUHB4oMvnMK7G6pCcdlnZKM4murTCkHehm/094+1VmFIdECj1H11wYDs
	qw0K5a+rvaYjJla/ac/lzqt10nibSCm7ss9VI3DdypC2SoDP1lZuXJ3uhvPkUehXQPhJjFqm8F/Jc
	SnosFMIZqkFQk46Rqwm6DWh4P7tvXyzaq/LB1cyR3TIsLmQm3m5wV9q6LObZjYV8tCYd5Vsz7yzuP
	07K/uF+s3mopwg5mEkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9dej-00GnUG-NV; Tue, 18 Jan 2022 01:51:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9deg-00GnSt-8s; Tue, 18 Jan 2022 01:51:27 +0000
X-UUID: ba90f42c1bdc48c18481ce205d77bbc9-20220117
X-UUID: ba90f42c1bdc48c18481ce205d77bbc9-20220117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1205601954; Mon, 17 Jan 2022 18:51:22 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 17:49:24 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 09:49:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 18 Jan 2022 09:49:23 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Tinghan Shen <tinghan.shen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [PATCH v5 0/2] Add SCP support for mt8186
Date: Tue, 18 Jan 2022 09:49:19 +0800
Message-ID: <20220118014921.30146-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_175126_346638_A6515917 
X-CRM114-Status: UNSURE (   8.72  )
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

changes since v4:
 - use 'Reviewed-by:' for the preferred signature

changes since v3:
 - base on rproc-next

changes since v2:
 - remove redundant SoB

changes since v1:
 - use mt8192_power_on_sram() helper
 - add MT8186_SCP_L1_SRAM_PD_P1 in mtk_common.h
 - add MT8186_SCP_L1_SRAM_PD_P2 in mtk_common.h


Allen-KH Cheng (2):
  dt-bindings: remoteproc: mediatek: Add binding for mt8186 scp
  remoteproc: mediatek: Support mt8186 scp

 .../bindings/remoteproc/mtk,scp.yaml          |  1 +
 drivers/remoteproc/mtk_common.h               |  3 ++
 drivers/remoteproc/mtk_scp.c                  | 35 +++++++++++++++++++
 3 files changed, 39 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
