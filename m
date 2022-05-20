Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FCEC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4QzRUuwmPusZpauYt5m9tMJVgb3l+ibHdx620gzt5CA=; b=v1nmY9S5b5rvbi
	En54+VZa0+ofofqWeUt6EPJvRBjpdybyfWbKFCbdoWc+HNIPv9zEAEwOAntLqWIwB/nKD5twP4/as
	M7xVQ80UIB9tjmBXtR9G5k43mHGVdE8V3Cv6deXwnsFEI7eCSGcW2TTZ3TsqdQ6xolRnZubFoBPJu
	umD+aS6qdh+nMV1ic9eloRTGUGcekMrpDFeiiTyRWAmKiD4yBTmrkIT72oc88Q0+VmYRn2KPejq/Q
	6whgH7Cg5/qyNo4rGKywWkVj392bghs4hwxc9Nr7fUR4VJHx3B/k721NjSslZLAwGvnJl/q98GSAL
	UHpAzeeGrkbEREBGm5TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns21t-00CRS8-Lo; Fri, 20 May 2022 12:46:53 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns21R-00CRFH-RK; Fri, 20 May 2022 12:46:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B4A6C1F462B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050784;
 bh=JxsQV1uov8Evle/1BqSEqQbrTff9TG41/lJE3/vz1ts=;
 h=From:To:Cc:Subject:Date:From;
 b=EWnEKiuSnKe7D1bj4FAEa5tXhyVGepGO00Za8nwol5eJwj+9yFJ7hu/Jce/OdYxL0
 7mpr5HHrNji+rvzG858+wXZyPssgAbSepu00VnqX5W2Nlt7HOhd9VvWCGn5QArGNk0
 FNTkwXshtO0VOEGT75hp8fdcDf4FVQ8jNoBM5VNrrJspcPl7XaE1LZJi8CeoOkZB8g
 P+wd2RetGywcJ8NjA2v0SrA5CWClIWMFXYzlIyMSZN2qlvsi+r/YkIV2wUggvctZ+U
 4b+kCYqWaFPXvukE6QR2TudZKx+kMnhshulil4ouaK77XkMA5wzYPBYUElbjYnddIN
 QUwazKIt8h7Cg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 johnson.wang@mediatek.com, hsin-hsiung.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD
 integration
Date: Fri, 20 May 2022 14:46:15 +0200
Message-Id: <20220520124617.228808-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054626_051943_54C478AA 
X-CRM114-Status: GOOD (  11.12  )
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

This series adds the necessary headers and support for the MT6331 with
MT6332 companion PMIC in the mt6397 MFD driver, along with some basic
devices.

Adding support to each driver in each subsystem will be done in different
patch series as to avoid spamming uninteresting patches to maintainers.

This series depends on another series [1] named
"MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper"

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.


[1]: https://lore.kernel.org/lkml/20220520124039.228314-1-angelogioacchino.delregno@collabora.com/T/#t

AngeloGioacchino Del Regno (2):
  dt-bindings: mfd: mt6397: Add compatibles for MT6331 RTC and keys
  mfd: mt6397: Add basic support for MT6331+MT6332 PMIC

 .../devicetree/bindings/mfd/mt6397.txt        |   2 +
 drivers/mfd/mt6397-core.c                     |  47 ++
 drivers/mfd/mt6397-irq.c                      |   9 +-
 include/linux/mfd/mt6331/core.h               |  53 ++
 include/linux/mfd/mt6331/registers.h          | 584 ++++++++++++++++
 include/linux/mfd/mt6332/core.h               |  53 ++
 include/linux/mfd/mt6332/registers.h          | 642 ++++++++++++++++++
 include/linux/mfd/mt6397/core.h               |   2 +
 8 files changed, 1391 insertions(+), 1 deletion(-)
 create mode 100644 include/linux/mfd/mt6331/core.h
 create mode 100644 include/linux/mfd/mt6331/registers.h
 create mode 100644 include/linux/mfd/mt6332/core.h
 create mode 100644 include/linux/mfd/mt6332/registers.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
