Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C523EFF8875
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2026 08:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sCM3Q+hq1Cqi4ySQTqgjsAUh8mcJKJ/Em8XWfQ+AMPU=; b=cmut4MioT/GtIJ7SvkESTgPjxh
	jgbOkXcR6w21yjmvHvnmavECEKIYA8MaXyw0k5GONu1lEXMAichL0tfmwn5JDns8jeJ30PUm9zDby
	F76Rqa+0VF39m0jWAFZKxr69+5uUJ85W1rN65z+dz6bfsuy7EnkVkHbcavpXVtr73936l5PRgPmXa
	h4WX6MsylNPFPhSvLEFl3y1HscB3lS7lzxRkyXV8K15jt76k/2f8d856klEQPmIFUnl7GkM1FBszx
	HQt6WZd/KavJFD1/T9BmjEHijCN6jKedCPESKpqWiOLN2omx93/WcWAgH2QjTmScoe0PMgjE+Dgth
	Vw+w0OYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqN-0000000514T-333P;
	Thu, 30 Apr 2026 08:33:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMqJ-0000000510t-1YPA
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Apr 2026 08:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EBFB943903;
	Thu, 30 Apr 2026 08:33:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7BF5C2BCB4;
	Thu, 30 Apr 2026 08:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777538033;
	bh=7cebm5YPv+mGucLf4Q5+XECkTCK2rT5d7w8TTk15MGI=;
	h=From:To:Cc:Subject:Date:From;
	b=tqMMfLgn6fBcdopY5vSnOXlkgLZ4ZHed0koAx3pejdErGPtM9ZH6aLszqOW28rpQ4
	 zni7Mh9Ee/mI9MqiqDbhC36vzo9IO2QWtjx+uvw9C3eRh6C88+d3EA5FqPHXTSBfsk
	 tWqMEXwTlwkgzTaIRUy7fRwEsET6Z2RUCHDd3PGmu7nqx4dx5lgif0kgQ1w0fEHxEf
	 TMb51kC7cFJHHqRyoEMSAHPi0RXT/G1VPXd9fG1x4WRL4auxOlE+3RzRj2x/SY669U
	 aZzOnvXFo0xuh7m9c1291UiatOhoG10saFi7APAK1DHTH6iJJT/pkqtTHYBU0yWBpN
	 lUd/Y8oB+zKpA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wIMqF-00000000u08-1fCH;
	Thu, 30 Apr 2026 10:33:51 +0200
From: Johan Hovold <johan@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v2 RESEND 0/5] wifi: mediatek: drop redundant USB device references
Date: Thu, 30 Apr 2026 10:33:30 +0200
Message-ID: <20260430083335.215239-1-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_013355_430214_B1A0290A 
X-CRM114-Status: UNSURE (   9.76  )
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

[ This is a resend (with trimmed CC) of the five Mediatek patches which
  still haven't been picked up from [1]. ]

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop redundant device references to reduce cargo culting, make it easier
to spot drivers where an extra reference is needed, and reduce the risk
of memory leaks when drivers fail to release them.

Johan

[1] https://lore.kernel.org/all/20260306085144.12064-1-johan@kernel.org/


Johan Hovold (5):
  wifi: mt76: drop redundant device reference
  wifi: mt76x0u: drop redundant device reference
  wifi: mt76x2u: drop redundant device reference
  wifi: mt76: mt792xu: drop redundant device reference
  wifi: mt7601u: drop redundant device reference

 drivers/net/wireless/mediatek/mt76/mt7615/usb.c | 3 ---
 drivers/net/wireless/mediatek/mt76/mt76x0/usb.c | 3 ---
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c | 4 ----
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 2 --
 drivers/net/wireless/mediatek/mt76/mt7925/usb.c | 2 --
 drivers/net/wireless/mediatek/mt76/mt792x_usb.c | 1 -
 drivers/net/wireless/mediatek/mt7601u/usb.c     | 3 ---
 7 files changed, 18 deletions(-)

-- 
2.53.0


