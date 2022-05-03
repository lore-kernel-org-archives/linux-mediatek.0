Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FE08C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=togpnr2523IZFUv857H5/jFIeMSwRpSg85uQXvtV0zw=; b=f2LJ8WCLO1HtQK
	p/eiNQ+jbVOpxvHaP/P9bP1ynRRKQmyPnxat+CS5NCtJqSvEXV8WvhpM07pNnzIBj/+82lmkqaHNE
	868Zba4F74y7w4GFCFOKXHtnuDUUXUjH2hVXrbODk2fTsWJ0Dh7L5sl2h6cyP2pXtgqFXWz97aeMV
	vBiQY8INWO8pMiJbnbbfnJEtpIfwXpxtTt9m3KtgWWbiDvGLDJvhinORiVsgedRjSH3JAtqBQALm+
	jAifhmSAGv5fyzkG7lzZn+X8EoZqk4yY0WyALyPLvuul0uLodkqmUYjAsyfz/8lwaCCc0uR0JkycE
	hVtuavzGjq6JTp1dPFfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltTW-006FiC-CW; Tue, 03 May 2022 14:26:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltTK-006Fca-43; Tue, 03 May 2022 14:25:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CFF291F43CF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651587948;
 bh=OSfbrDUrVe70J9K2jP7JIoE1KkV5sv+mCi04aDwkksM=;
 h=From:To:Cc:Subject:Date:From;
 b=XOVaUqse8MFsLKBc1b9/W7RsrbglYlojHUwE8unQIm1yCMbDhY8m3VkGp3Ry6Xzv1
 +4hjBJqGEk5i0KzxcpEnHNpPyfwyExXir6g3RHGHBpfTA+HtnOWFXR24IDIqCfwY9a
 6qWXZTFiVVwQVNhOU5j73DTOdFb7ZoUHA6kGb5VJ0mixPEuEm8cglyjHF3bGRb84xl
 o2vYu/Uevmj0+AlDn3SGgq86mnLx39XsOpbVA00MN5Yk9mbrrx4oPHI0FbsbPUNSPy
 6A8+i9xjevscS//PZqPZNV17T+1kScbtEniM2ilanxpPvJba5+hXVyXl8TL6pjKwzy
 GJI1nfW+eqf5w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sean.wang@kernel.org,
 angelogioacchino.delregno@collabora.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, nfraprado@collabora.com
Subject: [PATCH v2 0/2] MediaTek Helio X10 MT6795 - Pinctrl driver
Date: Tue,  3 May 2022 16:25:35 +0200
Message-Id: <20220503142537.152499-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_072550_330582_BD236BCA 
X-CRM114-Status: UNSURE (   9.47  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces a pinctrl driver for the Helio X10 SoC.

Tested on a Sony Xperia M5 (codename "Holly") smartphone.

Changes in v2:
 - Reordered commits, dt-bindings first, driver last
 - Fixed yaml issues

AngeloGioacchino Del Regno (2):
  dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings
  pinctrl: mediatek: Add pinctrl driver for MT6795 Helio X10

 .../pinctrl/mediatek,pinctrl-mt6795.yaml      |  224 +++
 drivers/pinctrl/mediatek/Kconfig              |    7 +
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-mt6795.c     |  623 ++++++
 drivers/pinctrl/mediatek/pinctrl-mtk-mt6795.h | 1698 +++++++++++++++++
 include/dt-bindings/pinctrl/mt6795-pinfunc.h  |  908 +++++++++
 6 files changed, 3461 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,pinctrl-mt6795.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6795.c
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6795.h
 create mode 100644 include/dt-bindings/pinctrl/mt6795-pinfunc.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
