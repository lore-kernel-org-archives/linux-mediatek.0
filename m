Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B02C5C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 09:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vvl70Tp/hgYpcXeZ7OBC6Efaz6kRLV6swPoGL6vHgV4=; b=kuIDg/ivUXIHdZ
	RpKlqwg5cMNZX/iKBYWfk+1mdRQaDrwn12RMH1U75TztfxF1u+C8+++OjR/uyE6s49L86ljtuGB1A
	BjCgciO56IQLDVbISCA9JxJNeDgK/7GHMO78vGYuNbAeGjU4FEFfT+o6MbCxMdF4eHPc1HX5rQUPK
	Azng8UPkQOzkSY2K6IC1XOlgMpnvA/UMQk+EB0u8Hc1A5NdJRqftSe+TorWEPXcQjl0Z/6VRgluxy
	z9eprbo3vX06uk31AXh5dR5sdFWZ0O6LVBnduiGHWg29vnoBHlLfAA0+lB4Ds0jrtpoLuLV2U2JcI
	XuSEzx2AwuIDP/gdP7iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntQx0-007Qff-Km; Tue, 24 May 2022 09:35:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntQwg-007QXi-6n; Tue, 24 May 2022 09:35:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8719C1F42BE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653384912;
 bh=HPhSCFsRWt1WRYsQVwuXJfLERolxskKrILtU/HHC2QY=;
 h=From:To:Cc:Subject:Date:From;
 b=QRpNuS60XWbSPl2Q/45n7UwTA7/71z36HzZZwU+6jRJbt6Wfe4YAjV5IWbLPUYWAn
 cq3pw96Fo2Z+QyjZ4DF/PTXju3aHl+JSefwagEB6dMmpWKMMMfgZ+xYm6TQMdeq/bG
 YSIV4w48bCZPc5gC+AqmpUDnq9/EmFjwtJJGeg8GJd1ITyGJH++zGEux1Sjz3JW2wP
 OWZ4YQOkjRO/Fp2SI38vP7D9tAtzK6RAu/Wu+I4xs00k2rlEObjEGpiLsuDm7G88w5
 i1dt/3BYN8XnxTsqkxF9eSP9kUWUkMZrl1XQ5dMK66AjWlzuxJukU+3lJqdNweZLrR
 qgBbC3O81NOxQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3]  MediaTek Helio X10 MT6795 - MT6331 PMIC Keys
Date: Tue, 24 May 2022 11:35:02 +0200
Message-Id: <20220524093505.85438-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_023518_426223_143F7F28 
X-CRM114-Status: UNSURE (   9.86  )
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

This series performs some cleanups in mtk-pmic-keys and adds support for
the MT6331 PMIC's keys.

Adding support to each driver in each subsystem is done in different
patch series as to avoid spamming uninteresting patches to maintainers.

This series depends on another two series series [1], [2] named
"MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper" and
"MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD integration"

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

[1]: https://lore.kernel.org/lkml/20220520124039.228314-1-angelogioacchino.delregno@collabora.com/T/#t
[2]: https://lore.kernel.org/lkml/20220520124617.228808-1-angelogioacchino.delregno@collabora.com/T/#t

Changes in v2:
 - Dropped first two patches, as Dmitry pushed a different solution
 - Refactored on top of [3]
 - Dropped Mattijs R-b tags from patches [1/3], [2/3] due to the refactoring

[3]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=644484

AngeloGioacchino Del Regno (3):
  Input: mtk-pmic-keys - Transfer per-key bit in mtk_pmic_keys_regs
  Input: mtk-pmic-keys - Move long press debounce mask to mtk_pmic_regs
  Input: mtk-pmic-keys - Add support for MT6331 PMIC keys

 drivers/input/keyboard/mtk-pmic-keys.c | 66 +++++++++++++++++++-------
 1 file changed, 49 insertions(+), 17 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
