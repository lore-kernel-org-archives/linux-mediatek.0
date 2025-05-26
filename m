Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708DCC54FB3
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 May 2025 10:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GAsd9eNeTAxwTsjxWBsXwdLIVBhMhnuoasv/118TESw=; b=X+6bIltNg0tEwxaAQ2juFwtC4n
	xJYDvVZqKF77meNLqSAiAENMX5n/CJEkiJSCIh6SLG21ijbmY8nUCM0W3jBJZO+G7gY9/NH9ISKuG
	TvKXRBcXom8V645ukaarRVePt11qBzqlRSiAj7XjXrf/8YYytmmgjK4TZ0sMv5OMGrUPgyaFBHjYy
	hg98g0QQcmwXDa2k1ne9Hrjy/lBXWwJoIZKz+KjVyy8PSgmXexRMc5CSK+TyfmspfQBCxVma0Xxk7
	APNWep9brdCoCnReqRVQKq2eBhoT/VYMbD4E5/AvSzvYPRSeRnrwItv6/bIB6QMFbiMt37e7ocyDw
	eNz0l+/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJV77-00000008cjz-1qyM;
	Mon, 26 May 2025 10:31:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJV4x-00000008cMm-1mJV;
	Mon, 26 May 2025 10:29:12 +0000
X-UUID: 3fe95fca3a1c11f0bed96b30c12bc3d6-20250526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=GAsd9eNeTAxwTsjxWBsXwdLIVBhMhnuoasv/118TESw=;
	b=Y81Efuj7ph0c55XAV2JEUAxkpG08fbsWoyqMcJ6uSQdpiYmlS5w7qbPoaJDQaM6igZjwDjEDWa+fnP4yJbEBBJyQTOCNz80b38G4VwNV9We8UlfnPWB7g2jSJlD5Cyo8F7JD984tgcW8VW9kLnUp4Mz4spa6cta7Ie3xi8uI+1Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a7e3e1c6-949d-42df-9062-3f2e0352c773,IP:0,UR
	L:0,TC:0,Content:56,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:26
X-CID-META: VersionHash:0ef645f,CLOUDID:e8564af1-2ded-45ed-94e2-b3e9fa87100d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:3|50,EDM:2,IP:nil
	,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:
	1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 3fe95fca3a1c11f0bed96b30c12bc3d6-20250526
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <mason-cw.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 552467373; Mon, 26 May 2025 03:29:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 26 May 2025 18:28:59 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 26 May 2025 18:28:59 +0800
From: Mason Chang <mason-cw.chang@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
	<nfraprado@collabora.com>, Julien Panis <jpanis@baylibre.com>, Nicolas Pitre
	<npitre@baylibre.com>, Colin Ian King <colin.i.king@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, Chen-Yu
 Tsai <wenst@chromium.org>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Frank Wunderlich
	<frank-w@public-files.de>, Daniel Golle <daniel@makrotopia.org>, Steven Liu
	<steven.liu@mediatek.com>, Sam Shih <sam.shih@mediatek.com>
CC: Mason Chang <mason-cw.chang@mediatek.com>
Subject: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: add mt7988 lvts commands
Date: Mon, 26 May 2025 18:26:56 +0800
Message-ID: <20250526102659.30225-1-mason-cw.chang@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_032911_470108_A6ED5291 
X-CRM114-Status: UNSURE (   7.14  )
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

Add the LVTS commands for Mediatek Filogic 880/MT7988.

This series fixes severely abnormal and inaccurate LVTS temperature
readings when using the default commands.

Signed-off-by: Mason Chang <mason-cw.chang@mediatek.com>

Mason Chang (3):
  thermal/drivers/mediatek/lvts_thermal: change lvts commands array to
    static const
  thermal/drivers/mediatek/lvts_thermal: add lvts commands and their
    sizes to driver data
  thermal/drivers/mediatek/lvts_thermal: add mt7988 lvts commands

 drivers/thermal/mediatek/lvts_thermal.c | 74 ++++++++++++++++++++-----
 1 file changed, 61 insertions(+), 13 deletions(-)

-- 
2.45.2


