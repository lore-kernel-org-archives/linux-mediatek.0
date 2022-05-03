Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87325C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 10:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bs0/UZ6milu6CiWtO8uA+iPA7GyPRdwqTFzWr+wE5JI=; b=hBL6Lu5UtJMj76
	qP474Vr85i+E/S3UuMKY0l/jpVDyEzFFfHkV6XeA6hcbBnh2atXDaC9X7OlW9jOquBu4rsK6ydt9K
	+DjBOB+pI9a6peFf+Um7dN/62keUSqzny1SXFGae5Bx3k2KfClPTuJniQ08CsbxHnMYnrB+AoZVx7
	HxgTowZ07TjdPG2tBKDXOby26S/N29GoSb9PDgwuno1TAOysgkD2CHaNAdOHYwVsbs5CfapjQKZqP
	AhsTWJaB1NmplE8RbTESGrL4rSfyV0DIqLFRI4X3fu6K9KwSggyBfEf2sOd2Xwx1c13qbYlqhOy63
	9op7MbA+42GU5X8YvmmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlqAJ-005Oht-4l; Tue, 03 May 2022 10:53:59 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlq9r-005OPb-6c; Tue, 03 May 2022 10:53:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 95CFB1F43E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651575205;
 bh=DmdsdXPUSOFXBQpmitusBnyiDtXQO80VoTWdNn6WKfA=;
 h=From:To:Cc:Subject:Date:From;
 b=HAkZtg1GPWzlwHe/TTfYeEZrf676FMHRcizYzPv9pXT1MeFSspEVUpbTdYo1nNMD+
 p3kiYBvxhKAWIp0xTYG5CyBQ+ydIoF0ae6Y60/Mf7gUMtd/L6xUfMUBCUCjPgbkRxK
 E6t1V8at431FO4garL+MTXx0C854ejQEsSWNtNe2QS6r+WGofB7Ex8W7si+iZDuiuq
 ci+P1JkKNy5VFCOpr4eirqeXegDm+bamEBSt4xzyZ3hYIK8BhDixrjWD2LNEr7c10J
 Zq/mysq7LpeBJynVIgV0gCsxlGCX7qIAT3atF79LOYR4zI13Z2y++/Og8nVQpdN6JH
 L5iD5s3bzgqSw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linus.walleij@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, sean.wang@kernel.org,
 angelogioacchino.delregno@collabora.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, nfraprado@collabora.com
Subject: [PATCH 0/2] MediaTek Helio X10 MT6795 - Pinctrl driver
Date: Tue,  3 May 2022 12:53:15 +0200
Message-Id: <20220503105317.54696-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_035331_519400_DEA60369 
X-CRM114-Status: UNSURE (   8.81  )
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

AngeloGioacchino Del Regno (2):
  pinctrl: mediatek: Add pinctrl driver for MT6795 Helio X10
  dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings

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
