Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A065DC4452D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 10:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HkiTl57wDS7X69+6kUhI+1Fo7bLLYISa1jB7B/B/i1c=; b=HiuttigH1RK/ck
	C/f1675pWYDFQO6QqCLfYVOB10BNGnMLCD05ySskPKUHZ0mmNqxYHA9AJ+Jk4oHpoVlcSpj8QU8Vm
	g/+pzWJSCmF2M58Sshy49QyHbYtBrdsNh6aghk7bBIyxmHVapYvu3/IlfIV0k6LzKrQKJb8A64pFI
	R4tKz2zkk03jijPjkHB+w0Sy7iOPXk1ergvc+eHbRmLAybodUWrNQgx7MoQROLJZ9vrywU1btbFSJ
	qQnYB0g2SkvvEY1+nMEjZz2IFd95emCeY9Q1/aLEQ5CwBd9kQ4Up8yFw0539WKW4sVUbkxxcGXxRB
	iUloNOeAZF3zo4OHTZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm85c-00000009Fvw-2BKR;
	Tue, 21 Jul 2026 10:52:44 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm85Z-00000009FtZ-2g4n;
	Tue, 21 Jul 2026 10:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784631158;
	bh=IE0/DT969J20WiRXnHeQOk9wuv1AU7HlTvdptMoSXeo=;
	h=From:To:Cc:Subject:Date:From;
	b=oI/t3ZWUlB9zvviRmVd9Il609jFQp5zpoFYOqzYA2/b8k+GE9rKQOvLfQJbkfKmdt
	 a1TF/yLQJ4+7xZJliY9G0wZn2HBt//j+HnFcuFt+OOH7yz+YPYfzrvp3RAwZnGmobw
	 QSpibDAtH3WGGu5yS9s7vruXO7TVmTH8OK/Qk4bJROTpRRwFgvRK/39xEuaAzFsjJM
	 vCS2iijJkpAhXLAn/jDp/fZig3d7wf5vv/ZUPbr1LFDMxpl4D26eBHcRX/L/iDG190
	 j57z++ntrI4McJKIvBYS598cwkKvnCiDXcg5+u9Sv5FbFilDZx9qVuNVEUZNJGh/1O
	 3BUudo5y85DIw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CCB7B17E010F;
	Tue, 21 Jul 2026 12:52:37 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: rafael@kernel.org
Subject: [PATCH v2 0/2] lvts_thermal: Make reset optional for MT8196
Date: Tue, 21 Jul 2026 12:52:28 +0200
Message-ID: <20260721105230.101906-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_035241_833107_ECBAE271 
X-CRM114-Status: UNSURE (   8.20  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, kernel@collabora.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org, wenst@chromium.org, linux-kernel@vger.kernel.org, jiapeng.chong@linux.alibaba.com, laura.nao@collabora.com, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, p.zabel@pengutronix.de, daniel.lezcano@kernel.org, matthias.bgg@gmail.com, rui.zhang@intel.com, bchihi@baylibre.com, krzk+dt@kernel.org, lukasz.luba@arm.com, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes in v2:
 - Added change in bindings to allow resets to be optional on MT8196
 - Made the code change simpler and without paranoid nonsense checks

AngeloGioacchino Del Regno (2):
  dt-bindings: thermal: mediatek: Make resets optional for MT8196
  thermal/drivers/mediatek/lvts_thermal: Make reset optional for MT8196

 .../bindings/thermal/mediatek,lvts-thermal.yaml   | 13 ++++++++++++-
 drivers/thermal/mediatek/lvts_thermal.c           | 15 ++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

-- 
2.55.0


