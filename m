Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAD6C77B7E
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Apr 2023 19:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jL8ly+CfKo6LhwXU7c3qJpMEIgPsmgnoE5p5hHdViHE=; b=kjZifODmOQZjVQV7I2UVf3gJQM
	mbjapdOR0qcUFUyp2h7xyY0n+zHjAY4YosyN6Ip2MOX4AXXzK9GKZUtqus6avBmylJ8SE5Puj6DLD
	YNK3rmnIla2kqrP8B7YHTzC6MGM/TcwyCzIDznqQwrLcnfih2VYpAaVP+MiHzsfa3vMFGSEnWtzTG
	hdBT5Brg6Ulz2z8vcvDzOBYuP4I9M3jvIscN4wZmVjO/7BBrFzitA9Nevy/uTmclFbFCCEgZhshfa
	LP1Z3KW42wzKZLoFL8F3wm6YvNEicHHkdi3mVSkrBYq+ohSUMT6H/v/xOzcXtwh9HJkzlLJcXiEOn
	e6Cht2WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psUAS-00BfLF-09;
	Fri, 28 Apr 2023 19:54:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psUAN-00BfJP-1g;
	Fri, 28 Apr 2023 19:54:05 +0000
Received: from notapiano.myfiosgateway.com (unknown [194.36.25.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 106F766032CF;
	Fri, 28 Apr 2023 20:53:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682711638;
	bh=JJHjN58c2mTlQgbqU0pQ4tNlxG5r2+HmlKXQ3BAuk+o=;
	h=From:To:Cc:Subject:Date:From;
	b=glQT9Nc5Fm1X0sY7HRriotmjWXWM8rHX7Ssnhp8NSKuX3Q2C9ke2dwBfsmOvjiOSb
	 4a2NH9EUemf4HwmsCO2aPJLDXXuAoP0ARcDqRbAnGIt0tvvusDgEA7NtPdDrlKFN7c
	 eBXhnxz4PE7wszf4ySAXakrgFMQBmTqaLb9IyCTlM4Jp74zOsjKDfTaWZB4g17ducj
	 zpnNgtGehzWhsPyJlBfU2jPTNzSGJIx2388uQ9/gl+7AmxIONZlRX6fPBk0AUvxjLR
	 fakUBs5ZKNVzvqifBEsnkRmq20LXaEOoSVZiMkyeMqi8W5UeTLjFB2kg1qtIsjYwHI
	 LcEel/B38M7ag==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	kernel@collabora.com,
	Chen-Yu Tsai <wenst@chromium.org>,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: Fixes to the interrupt handling
Date: Fri, 28 Apr 2023 15:53:44 -0400
Message-Id: <20230428195347.3832687-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_125403_790331_D91FBEB7 
X-CRM114-Status: UNSURE (   7.55  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Fixes in the interrupt handling of the LVTS thermal driver noticed while
testing it on the Spherion Chromebook (mt8192-asurada-spherion) with the
MT8192 support series [1].

These are standalone fixes and don't depend on anything else.

[1] https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/

Thanks,
Nícolas


Nícolas F. R. A. Prado (3):
  thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
  thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
  thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts

 drivers/thermal/mediatek/lvts_thermal.c | 54 +++++++++++++------------
 1 file changed, 28 insertions(+), 26 deletions(-)

-- 
2.40.0


