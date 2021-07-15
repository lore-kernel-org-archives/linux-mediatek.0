Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D71A9C07E96
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 12:12:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A417F61360
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 12:12:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A417F61360
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DWbvxhOMeO6LhBqAHXH6WHgXlH6C43PLT581bgV4s7U=; b=ePtOmmQdcAOiTn
	SEBUMZrK0QfhbAfTVUFM5MlP9mHd4o4FhXI6QCY/SsIn2iuijWOt+6ySCXkgiF8lAPKGI1XRGDQ2A
	e8clT1GO33oWvmKlgt9lMh3tYs8TcycZRromLsnFYsClOlths9do5ojALxlODyDTxVC2gLKusr/Tu
	IWuGYHNGLI8CH/AV2pwjHH5Mqg+nYf8I16e6S5wNs45tISts9PFmCQpQ4Qg6b9/BHIUUHg1l+f8qi
	+lA5OuXxgbrqwp1nAloiNWlXPN1O8+gfNxkELcbj7/jpyNooJZMeckkvx0+aOr0vGRCvWPznbBcYa
	NzOUu2oCVdW2vRR2cVQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m40ED-000ipb-Kf; Thu, 15 Jul 2021 12:12:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m40EA-000inW-8R; Thu, 15 Jul 2021 12:12:31 +0000
X-UUID: 3c2f1cd9e75647f299b154422ad7b082-20210715
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vhtNi1BFdf8Uc6ckTM0/FumhStAQg4/i2oRAhcPdSTI=; 
 b=PrcfCZZTK3YJSHjyFvWnJknfhVGzHlyRXevAV3ax7uPmxlkk056Lwp/8hxRvP/PmJPs1WNJdpWgkgaJWZ++1OkntqCOejtx/x2cFs1aYBANM1Ga8rsRZpdGkftlsYXmBQJ8o/J67cPJUYdJVyrDV4grSDK6GKmxCj6K+AtxDIMY=;
X-UUID: 3c2f1cd9e75647f299b154422ad7b082-20210715
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 671074869; Thu, 15 Jul 2021 05:12:24 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 05:12:23 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 20:12:21 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 15 Jul 2021 20:12:20 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>
Subject: [PATCH v2 00/11] MT8195 SMI support
Date: Thu, 15 Jul 2021 20:11:58 +0800
Message-ID: <20210715121209.31024-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_051230_356343_D179EBDB 
X-CRM114-Status: UNSURE (   8.70  )
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

This patchset mainly adds SMI support for mt8195.

Comparing with the previous version, add two new functions:
a) add smi sub common
b) add initial setting for smi-common and smi-larb.

change note:
v2: rebase on v5.14-rc1
    1) Adjust clk_bulk flow: use devm_clk_bulk_get for necessary clocks.
    2) Add two new little patches:
       a) use devm_platform_ioremap_resource
       b) Add error handle for smi_probe

v1: https://lore.kernel.org/linux-mediatek/20210616114346.18812-1-yong.wu@mediatek.com/

Yong Wu (11):
  dt-bindings: memory: mediatek: Add mt8195 smi binding
  dt-bindings: memory: mediatek: Add mt8195 smi sub common
  memory: mtk-smi: Use clk_bulk instead of the clk ops
  memory: mtk-smi: Rename smi_gen to smi_type
  memory: mtk-smi: Adjust some code position
  memory: mtk-smi: Add error handle for smi_probe
  memory: mtk-smi: Add smi sub common support
  memory: mtk-smi: Use devm_platform_ioremap_resource
  memory: mtk-smi: mt8195: Add smi support
  memory: mtk-smi: mt8195: Add initial setting for smi-common
  memory: mtk-smi: mt8195: Add initial setting for smi-larb

 .../mediatek,smi-common.yaml                  |  31 +-
 .../memory-controllers/mediatek,smi-larb.yaml |   3 +
 drivers/memory/mtk-smi.c                      | 572 ++++++++++--------
 3 files changed, 356 insertions(+), 250 deletions(-)

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
