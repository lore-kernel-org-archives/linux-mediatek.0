Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CADC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 12:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fkfn6Gaqs3JrRfXXmdlAlf96c1YBUhSne564Hg1IR78=; b=UDzWBtp4MsK925
	Fmgyi05bDUy7os0T7g2SN8WXh/y1avJILYQVsDubZ2+HoTH571aM6e34ESc495Te28heDoRBSwM6i
	VmS41SeqlheSaae+SMGdzPCdeUCLSd72IT34X4jTCiGLlBONS7X5w7Lm/b25SEvnu5XArHKo0whdG
	RCikXW9kAdwbzVIqQKsX71yM9KUaIJ8c8cE/RH4sYdTTtseSCMqk4uuQgIdoChRcBSmNh/EtUfhQ2
	6byqgbM6P/3lutH2jiIsT/vZLUSo6IPRoBTuDLPAVxd3ATbQjKG9GPqQlXyukl2Fxzi2U7gX23QWQ
	XAiv3QgJcpj61FTqTpjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU6kS-0095WC-MF; Tue, 15 Mar 2022 12:58:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU6kQ-0095Vg-2q; Tue, 15 Mar 2022 12:57:59 +0000
X-UUID: d0eb59ecbd794b29a942a037a5517a42-20220315
X-UUID: d0eb59ecbd794b29a942a037a5517a42-20220315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1044739438; Tue, 15 Mar 2022 05:57:53 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 05:47:51 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 15 Mar 2022 20:47:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Mar 2022 20:47:49 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Tinghan Shen <tinghan.shen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v6 0/2] Add SCP support for mt8186
Date: Tue, 15 Mar 2022 20:47:45 +0800
Message-ID: <20220315124747.30144-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_055758_141281_6A2AD52E 
X-CRM114-Status: UNSURE (   8.07  )
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

Based on tag: next-20220310, linux-next/master.

changes since v5:
 - set I-cache and D-cache size before loading SCP FW.
 - remove unused ipi_buf_offset.

changes since v4:
 - use 'Reviewed-by:' for the preferred signature.

changes since v3:
 - base on rproc-next

changes since v2:
 - remove redundant SoB.

changes since v1:
 - use mt8192_power_on_sram() helper
 - add MT8186_SCP_L1_SRAM_PD_P1 in mtk_common.h
 - add MT8186_SCP_L1_SRAM_PD_P2 in mtk_common.h

Allen-KH Cheng (2):
  dt-bindings: remoteproc: mediatek: Add binding for mt8186 scp
  remoteproc: mediatek: Support mt8186 scp

 .../bindings/remoteproc/mtk,scp.yaml          |  1 +
 drivers/remoteproc/mtk_common.h               |  3 ++
 drivers/remoteproc/mtk_scp.c                  | 42 +++++++++++++++++++
 3 files changed, 46 insertions(+)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
