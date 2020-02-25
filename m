Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C2B2C35DE1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 11:48:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12CFA20CC7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 11:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QhIDD3eI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JOArML+X"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12CFA20CC7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b1vzkB9LLtuD8xCHZ5VBCDBXCCavTDjQ1I5ua/O2EYY=; b=QhIDD3eI3UMM58
	lAONyTqPfROhtfeuQWwz39tEQns2zhfMgVF2FjCMeeYr9Tm/H/SjEbDfe9ukUq5P6VYT/nyjozYWR
	3PJ2QM/bKIfxbU2bPNDA+v5sTv1SjvuwlITaQVqiCVCzhAT2S7wHAfBx146zZ2Uck7q/4hcT23C7n
	knQgkEUgoR4f09YzJc20+MgPaZE4eni/0l+47GwIUpysRjOnMq91ty1NkuGeJr4FX74Gh2a9mQ9Ue
	t4B/lhWF2mD6VbYGbRgv20knEz5FX3YXFsC8Z7vnH0b/NL1uGlaJrABGjp9lMnP9ZWSDStfQZGxUf
	+95GwykHQGnW9GFCWvBQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6Ygy-00080S-PQ; Tue, 25 Feb 2020 11:48:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6Ygh-0007lY-4Y; Tue, 25 Feb 2020 11:47:44 +0000
X-UUID: a62ac6fb6a86436799594bf7a3700a29-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=tEuIuqbj8JcbuuArgO1nPH3pErg0cD0oQ9Q5Xkop0Zw=; 
 b=JOArML+X7PQWj2lXxm+uN287ND+vJ64UPJKoQFc/pjMgmh7U59L0X8mi3i2F3vM9bvAAs3f2Wvnnn+CyochRzDgPEbaXzTQINNBDVy9C190Z5fVfpEUYLORAHxEPUE7Bmg3SI5M0itJRjolTDtlP2whQRDHmzHLUrYZL9x05YJw=;
X-UUID: a62ac6fb6a86436799594bf7a3700a29-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 958604703; Tue, 25 Feb 2020 03:47:41 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 03:48:16 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 25 Feb 2020 19:48:12 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 25 Feb 2020 19:46:16 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/4] Config mipi tx drive current and impedance
Date: Tue, 25 Feb 2020 19:47:26 +0800
Message-ID: <20200225114730.124939-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: DBA67982F7B2CBA2F3BB6E7444224D083ADD37C79BB3BC4FC5858E737CCE96102000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_034743_179789_8E29DA2F 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v1:
 - fix coding style.
 - change mtk_mipi_tx_config_calibration_data() to void

Jitao Shi (4):
  dt-binds: display: mediatek: add property to control mipi tx drive
    current
  dt-binds: display: mediatek: get mipitx calibration data from nvmem
  drm/mediatek: add the mipitx driving control
  drm/mediatek: config mipitx impedance with calibration data

 .../display/mediatek/mediatek,dsi.txt         |  9 +++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.c        |  6 ++
 drivers/gpu/drm/mediatek/mtk_mipi_tx.h        |  1 +
 drivers/gpu/drm/mediatek/mtk_mt8183_mipi_tx.c | 64 +++++++++++++++++++
 4 files changed, 80 insertions(+)

-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
