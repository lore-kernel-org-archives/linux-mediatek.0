Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFD1CFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 10:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3+nMwTV5/n3rsxEzFL9MBkV3WS2EPmdPaaYMljZdPpg=; b=KcXvTw1FINmSm8
	tq80iqhmqbleSvOF+rSJd7GSV2XEj85oFbT+sexhutOWihC3JLfV3AGVvm+4MfzNH9M8aREzh5Qic
	v6ZBgidcXV1cnoakFrql8nYxCNregsErRfpFhz/Le3YqAerd1lJMSIBD3NKFNlkOBhUmr/VwCEE3C
	YimNv3q1dUDmdQKXqREkvnrZjuk0b73uR0fKoNRWL2Grs2FtuYjjlQ9c/PJjvryxNzIkEPXeTkdYh
	brOvBr+gVidR9h5i92Iq6511YQJFUu8d336hk1+Kck1q07aOahEMPnstqk3rz1p50/ZrRphSA9RMu
	G5SewazpNXku5kCbeqaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxOQ7-0000000HW6W-3oZL;
	Sun, 06 Oct 2024 10:23:23 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxOOo-0000000HVuV-3lLL;
	Sun, 06 Oct 2024 10:22:04 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 38DA01000DE;
	Sun,  6 Oct 2024 10:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728210121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3+nMwTV5/n3rsxEzFL9MBkV3WS2EPmdPaaYMljZdPpg=;
	b=UA9W/xf+nbCtz/TtyRaBRBin0m+V8BWd0g83PNz8GiI1yo9XfOZ6d7zNIhJ6jUGBL8Rd8w
	Iel3nf4I6KO69rSYJgRwnziIpJUe1DJayxDx17hLToYFID+p/onysaqHbsRbwzqbXYt1hY
	2mIlbFExgP8tT/ZSgG/gT91vOeLFFnw=
Received: from frank-u24.. (fttx-pool-217.61.153.101.bambit.de [217.61.153.101])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 24A28360092;
	Sun,  6 Oct 2024 10:22:00 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v1 0/2] Add mmc support for mt7988
Date: Sun,  6 Oct 2024 12:21:47 +0200
Message-ID: <20241006102154.17087-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ee36cfc9-6920-4636-8d11-cdccd9f85891
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_032203_103926_1C8CB173 
X-CRM114-Status: UNSURE (   6.13  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add MMC-Support for MT798 SoC

Frank Wunderlich (2):
  dt-bindings: mmc: mtk-sd: Add mt7988 SoC
  mmc: mtk-sd: add support for mt7988

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
 drivers/mmc/host/mtk-sd.c                     | 14 +++++++++++
 2 files changed, 38 insertions(+)

-- 
2.43.0


