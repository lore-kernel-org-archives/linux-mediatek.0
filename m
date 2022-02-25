Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE869C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 13:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=reY7VsJEshu/eApYYYy4mI3/dBeBwEBcSNS1bybfp/o=; b=hTjqm8YWsCIIDX
	1pBy0Pzffiy5s/lqgPjP3IKQsd4l6heOyV1R0N+sJuDWY2L8lJQzmj9mshoqc/CQvbZj4ApBPGZ6e
	gEaFXsYZyoTO7mOGc5Ns2p+ID3HSaDQTcb2KhNcaTVzuooa+4Nbb7ae9ZC6CvQe1ew7QosWa4Ovbb
	i4uqff559iiL0uRONnZekSmky7M7P2idUpjQVpc6n70F6Q1amfvdPSjNVlUZyfG4hrCty0u1vkSv5
	gtqzLGzbkyrZkXGATNWUfzwu4VZUVR3u8lav9mL5A5jPEfCv8X6fjsER770ts01VTLz3ND4vDxObS
	UFL/MYMWfGxOMj5x2MPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNb0K-005FBx-Ks; Fri, 25 Feb 2022 13:51:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNanH-005AGP-MJ; Fri, 25 Feb 2022 13:38:06 +0000
X-UUID: 5d01d38db4ea467daac51aa5cf6708a7-20220225
X-UUID: 5d01d38db4ea467daac51aa5cf6708a7-20220225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 656326957; Fri, 25 Feb 2022 06:37:52 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Feb 2022 05:27:50 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 25 Feb 2022 21:27:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Feb 2022 21:27:48 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Tinghan Shen <tinghan.shen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>, Allen-KH Cheng
 <Allen-KH.Cheng@mediatek.com>
Subject: [RESEND v5 0/2] Add SCP support for mt8186
Date: Fri, 25 Feb 2022 21:27:45 +0800
Message-ID: <20220225132747.31808-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_053759_768656_DCD661F3 
X-CRM114-Status: UNSURE (   7.64  )
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
