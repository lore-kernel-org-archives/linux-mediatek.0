Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AA0C001DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xdqRhyBG/ruU9wLu1dxq5Te9rcpUpqS7DObIN034KeA=; b=0VbzTiZFMDFxXILxdV6dn/CZ8Z
	6ORL+Ehn99Pm+UkqJkLYRSeRlhBU9Pf9lGEdtVvdOH4o/+GSdYr3HAFmatNxlQSEArlele9mq2ww5
	QSB75D8U6SBxGnivwA7pWl0Bovl5CkNkTGjr1I+GR+cSp5P4S1Jke1JfYxAEPPr4pnZ4zfK0POrQ3
	O2PXx4vj8b2/gOjxIPlOkbeI8tdRZ12e1yTkN+STUgqkgYCf7u5U8Z4/uhe47krwFgTU3MmT3O2iF
	Y4q2JxzG9il0g9n5MKNSPb3lH9gFWotkkUGEnXxAVjVa7+zOYPqQPMaLKxMpmWmtvCXNxCyY5i0Mc
	Icg/cLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHR46-0021x8-1k;
	Thu, 06 Jul 2023 15:38:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHR42-0021um-2I;
	Thu, 06 Jul 2023 15:38:40 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F32F86606FD9;
	Thu,  6 Jul 2023 16:38:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688657914;
	bh=YtEw57pQl1u5j7kjoL9FMCgBqCbc54t/fOoETI0WtnM=;
	h=From:To:Cc:Subject:Date:From;
	b=S8tuXTraa+8ofdyz9TCNT4AAyvTRMBzIUG/O5SQBwf6Lx4/X9o/4Y7ePkfsTrkifF
	 n9kwhBPYBoYUISK1sQAefLgAxhlgo9Q33iFi2csLXL+y7FDt8JmNtu8Zs6lxb69neW
	 AT8dc9b9S9irmqcMa94PRrffHP+N91aUUezYx58SMKBOQ6YX8OK/TjctgTSzWNbk/u
	 LyM3r3d/2wPuvJpMwKtn7Ea9qD4VXRnjMdjf+erLfpgJ0jQzJBoNIk4OYbctf++yKW
	 PT2K+4Hl6mv5yuCxWGg+qjIX8AWSNY22se9+GZNbd1F1f+XNM9jOzZy8g9YyPqxuDb
	 T9wkTFN9FxuOQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Alexandre Bailon <abailon@baylibre.com>,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 0/6] thermal/drivers/mediatek/lvts_thermal: Fixes to the interrupt handling
Date: Thu,  6 Jul 2023 11:37:31 -0400
Message-ID: <20230706153823.201943-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_083838_962194_299211DC 
X-CRM114-Status: UNSURE (   9.12  )
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


This series fixes interrupt handling in the LVTS thermal driver. It not
only solves the interrupt storms currently happening, but also allows
the temperature monitoring interrupts to trigger when the thermal trip
temperature is reached.

This series was tested together with the MT8192 support series [1] on
the Spherion Chromebook (mt8192-asurada-spherion).

These are standalone fixes and don't depend on anything else.

[1] https://lore.kernel.org/all/20230530195132.2286163-1-bero@baylibre.com

Thanks,
Nícolas

Changes in v3:
- Reworded cover letter
- Split bitmaps for immediate and filtered modes into separate arrays
  (patch 2)
- Removed duplicate code for setting MINIMUM_THRESHOLD (patch 5)

Changes in v2:
- Added commits 3, 5, 6 to get working interrupts when crossing thermal
trip points
- Updated commit 4 with interrupt flags for the offset

Nícolas F. R. A. Prado (6):
  thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
  thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
  thermal/drivers/mediatek/lvts_thermal: Use offset threshold for IRQ
  thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
  thermal/drivers/mediatek/lvts_thermal: Don't leave threshold zeroed
  thermal/drivers/mediatek/lvts_thermal: Manage threshold between
    sensors

 drivers/thermal/mediatek/lvts_thermal.c | 152 ++++++++++++++++++------
 1 file changed, 115 insertions(+), 37 deletions(-)

-- 
2.41.0


