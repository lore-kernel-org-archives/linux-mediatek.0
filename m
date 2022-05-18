Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114C1C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1L5xtX+SoNws3fPPb7wPe90Uis8oTJ8Q2QOVbiNU+g8=; b=kmBwWgOqtiy9Xk
	LIdN0Z57/bS7DpQzIhlWdo8Xg37bRmWNGxO5DHPQL0PrJvd6V17baw3aC9bhCuwLblcLNYa0pcYC8
	N0t3KYTHYRFW2t3+67cQggGr9qIw1ofa+HsZydXycEAi/R5A+gWD16kQ09kUm2TP1b6qrn+enIc2I
	k8Csyq6FSS3UDwjhHyrRoqZ6oSTlb9DZmvercGVYbUXZ3rz8B2KpYQ8bQC+tNKO954qs1KccbAPmb
	/0Ugv2dIs+P0j2PIRSQQiqOwlnui/Mydix7/MDQS4BmI683nvpEngw1oYSrC4Ddr1sF/Q2au6tb3w
	rFP1eLNxvo6yPxVZMNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrHxa-001aM6-UF; Wed, 18 May 2022 11:35:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrHnI-001Vng-7x; Wed, 18 May 2022 11:24:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D609C1F41EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652873079;
 bh=aTNle9KArjSkwZPxjRCPDIWdKxMDxqxTEvqJionGghc=;
 h=From:To:Cc:Subject:Date:From;
 b=aJkxOINb39+ULvOjftDlYIQVRTrztYqukxC1mEgvjUtBREtipWw29uol/pDyCTag2
 trU/E5tPrjfQwZrBZ5o/W1HkUrT21ydS7jenfqe//H75xu9h9Vl+Z9JEqTw0eQ5C8D
 rsMdHQPVHY7Sm4Y/VfoR9jzknYZwntyc62st+LUbsmGJRkQGZ+6igQf5VDlRnlUsWl
 FTQIXLVmcCVnktgXA7xrgls7nxSgTa3pWpbF0weX6HvXPlDT64/AeOt/whrzPC27Av
 exl9VPA9A5baloYidCdkpHcFBkwVWMj4uqIXWIU4QHZ63eLNrRElfG0Aly710MCDIi
 V0klT+Dd2EmNQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/2] MediaTek SoC ARM/ARM64 System Timer
Date: Wed, 18 May 2022 13:24:33 +0200
Message-Id: <20220518112435.241116-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_042444_554599_7E6555E6 
X-CRM114-Status: UNSURE (   8.46  )
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

This series introduces support to start the System Timer for the CPU
cores found in various MediaTek SoCs including, but not limited to the
MT6795 Helio X10 - and will most probably unblock many developers for
the upstreaming of various platforms.

For a broad overview of why/what/when, please look at the description
of patch [2/2] in this series.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Changes in v3:
 - Merged mtk_cpux_{enable,disable}_irq() as one mtk_cpux_set_irq() function
   as suggested by Matthias

Changes in v2:
 - Added back a lost line in commit 2/2 (sorry, commit didn't get amended...!)
 - Tested again for safety

AngeloGioacchino Del Regno (2):
  dt-bindings: timer: mediatek: Add CPUX System Timer and MT6795
    compatible
  clocksource/drivers/timer-mediatek: Implement CPUXGPT timers

 .../bindings/timer/mediatek,mtk-timer.txt     |   4 +
 drivers/clocksource/timer-mediatek.c          | 114 ++++++++++++++++++
 2 files changed, 118 insertions(+)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
