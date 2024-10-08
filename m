Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E1ECEF142
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 09:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c0wFIIAqZxzfodqLbrp1Uz7oamK9sEUTas8FicVwR1g=; b=Y3oJlTT7IUWDJvdueHcjDBQwGO
	mRXaGKtLYOO1wTv4YsRRWXGf5VH8OKcGn0A1purs6Y0If2NmtJeOXDHSJdD/jXAKo23cGJ5WkECmC
	84Mv1K2QToOUko/WywBtfVKCoNtHplQrZWPmzfZW4KgsJ6n6o8IbQyXoRZ+5zNJPOjjvWuw5k5zqt
	HgKT/N+xVrZv9hWz32qDT1r3ktbRCSBOL+ouue0MuXHEZo05YGNMHutk7BPjqBY5zzRsVIkN24FM+
	HNNWQXe/RIpOAK9OpURtayYVV3JHY1tuuKQWPnNWz648S2h9Mkvv+djZU/KjmP6/R3OzBRB2diEsj
	fZIQcibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6bN-00000005KGT-29uC;
	Tue, 08 Oct 2024 09:33:57 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy6Zu-00000005Juj-34ok;
	Tue, 08 Oct 2024 09:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728379945;
	bh=HPEnd6JAQnIjP10NZU8CZCrm6mNCa9dhz9UrqrI5cRc=;
	h=From:To:Cc:Subject:Date:From;
	b=juekqoKnoOg06UxSpktYZj4iIPllNyx/OYz696QBawWxFCerBChQegtfCH8cRib8n
	 86ZrUM+lrAJD0u/uwHBlYdK/kAIIzlt8Deti5m0vZkidA/2dvXyftngm9ibb8N/8yb
	 OmlY7Vy8cnJi4rI9KSm4kthWBV5K9sObOKs7LASD3J+lZffHs8dBQLm+zCQOQlMTSW
	 fN85AUkVW+TiX0FaQu6dZvLFKgJaNHP3rAhocucT/DA2huj+f/YT7gIcT2YXPmj129
	 NS+omApiExc0Af79AXjtM9RyVW2q+U8n6j3XjOeMSGs0vz5pq/sh0Q55wCeju6lrl6
	 NsKaLm9ZekT3w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CEE8417E0F7B;
	Tue,  8 Oct 2024 11:32:24 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/2] soc: mediatek: mtk-cmdq-helper: Various cleanups
Date: Tue,  8 Oct 2024 11:32:18 +0200
Message-ID: <20241008093220.39734-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_023226_946299_41F449DD 
X-CRM114-Status: UNSURE (   7.21  )
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

Changes in v2:
 - Dropped patch marking very likely/unlikely branches
 - Removed useless .mask=0 assignment in patch 2/2.

This series performs various cleanups to the MediaTek CMDQ Helper lib,
reducing code duplication and enhancing human readability.

This also avoids double initialization struct cmdq_instruction as,
in some cases, it was stack-initialized to zero and then overwritten
completely anyway a bit later.
I'd expect compilers to be somehow smart about that, but still, while
at it ... why not :-)

Tested on MT8192 Asurada, MT8195 Tomato Chromebooks.

AngeloGioacchino Del Regno (2):
  soc: mediatek: mtk-cmdq: Move mask build and append to function
  soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration

 drivers/soc/mediatek/mtk-cmdq-helper.c | 230 ++++++++++++-------------
 1 file changed, 106 insertions(+), 124 deletions(-)

-- 
2.46.1


