Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937FBC77B60
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 13:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zQCnz9JM+nshwOTROAwicIu+F5vqbnF8OOyT2n28/+I=; b=EhVkTatJh3uW8b74MLogp6IaZR
	mVJ7mY5iQ7YQ8dkecc/74JgzNgoaRY0f3Mz2fwb1jgCxFwxIRw8QkYLPLAHOd0/pJX+tTKsRyYdpK
	+tUNbbtv/jefz76ysWaDCyfPqFETWHFYWxJEpfYJG5lSpl/Z3wcAJacO2VJ6Bqrwhru3GsVKyPlrl
	O9qkT0f33oQpriIy8jsfCPvMjJJTcn5SfQcZfOPaoB87px+wMNH/m8dNRqxwGTf9WzNd0f4Nbwtrz
	k1+Z72mp3DE/8uQA4hLDCXwaqarNjJ8Kp4kpcycToQ7XN7E5XILPtmUH4LZs38Cjthy8lAYf8LGkY
	a1N5JvlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKH7-00FSs0-2d;
	Mon, 03 Apr 2023 13:31:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjKH1-00FSqA-2W;
	Mon, 03 Apr 2023 13:31:05 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF2216600013;
	Mon,  3 Apr 2023 14:31:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680528661;
	bh=Ud9yCIjB8jwMmXsFScRcYrf42votU0cIRo7MP8MJdsY=;
	h=From:To:Cc:Subject:Date:From;
	b=DztboHq63LfR00xbNZy1e6rjnslVuZLtPvi5e9+0B3QHJSGFlmpKpR7lqvd4UoV6C
	 dKAU34GLYM2wh8nQVA1bJBDoYheifd7teJ8akpt9aMnyPVj4S39D3QA0/YZMhV54PO
	 F/gn56tFNb+fgVkvIBu0I5LAv+hgX7OhQT+aemWf+xTuyr/s/AWeMo7YbbqEZCzav9
	 sHhsv/ztLZoXRNzuMn+hHs/VoO/STx8O0gkruTB2PFpwguiK06jgFegBjMoDHj4wty
	 DfEWRYuaJ4vL8g6oAaBfBrpzl02RnL/nW5FxH5BPXt1aFyW/QgZ/nO612BBiDnSa7Q
	 GJyLSknky4+Xg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de,
	matthias.bgg@gmail.com,
	weiqing.kong@mediatek.com,
	jitao.shi@mediatek.com,
	linux-pwm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH RESEND 0/2] pwm: mtk-disp: Fix backlight configuration at boot
Date: Mon,  3 Apr 2023 15:30:52 +0200
Message-Id: <20230403133054.319070-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_063103_990503_17F7BB4E 
X-CRM114-Status: UNSURE (   8.43  )
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

Since the pwm-mtk-disp driver was fixed to get PWM_EN state from the
right register, an old two-wrongs-make-one-right issue emerged: as a
result, MT8192 Asurada Spherion got no backlight at boot unless a
suspend/resume cycle was performed.
Also, the backlight would sometimes not get updated with the requested
value, requiring the user to change it back and forth until it worked.

This series fixes both of the aforementioned issues found on MT8192
and similar issues on MT8183 Chromebooks.

AngeloGioacchino Del Regno (2):
  pwm: mtk-disp: Disable shadow registers before setting backlight
    values
  pwm: mtk-disp: Configure double buffering before reading in
    .get_state()

 drivers/pwm/pwm-mtk-disp.c | 34 +++++++++++++++++++++++-----------
 1 file changed, 23 insertions(+), 11 deletions(-)

-- 
2.39.0


