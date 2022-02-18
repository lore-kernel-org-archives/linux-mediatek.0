Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC16C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 09:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hGI7nmj8gDI/WirdWCNozFX/PPbKsa9pxeDZ9+YURUc=; b=lkPJzGHLGykgKM
	bh4b8r5mooZZedx2XByJUKhODkgH7nBH4ad+q1iZcmZ2ER+IZB1AJ/THewSNWJBdYGJfTNpMN1SkL
	R1ZVG+vFlu+Mc9rAaI55+xusH0dJ9uT4xF2dPd98zGGMkLzMWs0c78tKVQI6I6IBHXkgutv8Dcz9P
	2A5G014JpbSIFGfZ5WqRn3eI9SrGv1slY8tCxsqtaqW6kPBXy5m4Y0fArSwoJRJnDs4UaPeYGUFKo
	2pAT0MwxWdvnwULUM8DrxgPZRIsdr/A+wqHEbAi6enzFAlIU6cxLi9/3Pa/xoEi/Pbek6YbDfRMka
	vELBgMQA8n0SvLqMyIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKzQH-00DSVR-Ky; Fri, 18 Feb 2022 09:19:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKzNx-00DQmv-5l; Fri, 18 Feb 2022 09:17:07 +0000
X-UUID: 6b95b7f7c37042539b2efb0ccd178e01-20220218
X-UUID: 6b95b7f7c37042539b2efb0ccd178e01-20220218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 877601756; Fri, 18 Feb 2022 02:16:59 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 01:16:37 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 18 Feb 2022 17:16:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Feb 2022 17:16:35 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, --to=Krzysztof Kozlowski
 <krzysztof.kozlowski@canonical.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Chen-Yu
 Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 00/23] Add driver nodes for MT8192 SoC 
Date: Fri, 18 Feb 2022 17:16:10 +0800
Message-ID: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_011705_247254_8A378146 
X-CRM114-Status: UNSURE (   8.76  )
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

This series are based on tag: next-20220216, linux-next/master 
and apply the below patchs 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220207094024.22674-1-allen-kh.cheng@mediatek.com/
https://patchwork.kernel.org/project/linux-mediatek/patch/20220217135620.10559-1-allen-kh.cheng@mediatek.com/

There some patches are missed in PATCH v1.
I resend series again and also add display related nodes in PATCH v2.

changes since v1:
- add usb-phy node for xhci node
- move infracfg_rst patch in front of PCIe patch
- add display nodes, i2c aliases and pwm node.

Allen-KH Cheng (23):
  arm64: dts: mt8192: Add power domains controller
  arm64: dts: mt8192: Add pwrap node
  arm64: dts: mt8192: Add spmi node
  arm64: dts: mt8192: Add gce node
  arm64: dts: mt8192: Add SCP node
  arm64: dts: mt8192: Add usb-phy node
  arm64: dts: mt8192: Add xhci node
  arm64: dts: mt8192: Add audio-related nodes
  arm64: dts: mt8192: Add infracfg_rst node
  arm64: dts: mt8192: Add PCIe node
  arm64: dts: mt8192: Correct nor_flash status of mt8192
  arm64: dts: mt8192: Add efuse node
  arm64: dts: mt8192: Add mmc device nodes
  arm64: dts: mt8192: Add mipi_tx node
  arm64: dts: mt8192: Add m4u and smi nodes
  arm64: dts: mt8192: Add H264 venc device node
  arm64: dts: mt8192: Add vcodec lat and core nodes
  arm64: dts: mt8192: Add dpi node
  arm64: dts: mt8192: Add i2c aliases
  arm64: dts: mt8192: Add display nodes
  arm64: dts: mt8192: Add dsi node
  arm64: dts: mt8192: Add gce info for display nodes
  arm64: dts: mt8192: Add pwm node

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1000 +++++++++++++++++++++-
 1 file changed, 989 insertions(+), 11 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
