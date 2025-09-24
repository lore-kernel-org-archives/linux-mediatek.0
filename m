Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A819CAC5B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 13:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jB8T5CJ44u1QpLKgwqzih3QYoxGjiituikGXg0U+j3o=; b=IMs1yTauZIe7izlEnsEKFGeAny
	CxiUWkJU4U9GkLffdtZ+hYBm98dS9fravZbu5dGftf4C1KdBoNvRoOnGEZxhCz5LexBKOl1QQbrCL
	9kyMW3o8c69XVgT+ujPdbcPWcpA1llG746AL/fO0JbYk6Zjc4Aqvunn90I+Sg6pwJaOEapKascYpA
	sXTgYgEFB2HkAy6Als6xrQf9VeQzEQ0RFq2TCp6jC1CyaZOMQoL3Oe9vgNO3fr/EBdCGJvlWonSYa
	dVxn3pEXOs5oMog64gIAbBM9PWtMLaMDHd8jK3sb/efmBK33DRaxqVD95uIUPvizJVwiOymWitB6W
	41nB5B2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Pfd-00000000Gpe-0ZI7;
	Wed, 24 Sep 2025 13:36:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1PfY-00000000Gk4-3BAY
	for linux-mediatek@lists.infradead.org;
	Wed, 24 Sep 2025 13:36:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 26D0544BD7;
	Wed, 24 Sep 2025 13:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEBE3C4AF0B;
	Wed, 24 Sep 2025 13:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758720987;
	bh=0eGbMVZE9ppAw4JKx2/t7b/9Qqfa2SiBgK+5orCgncE=;
	h=From:To:Cc:Subject:Date:From;
	b=W/m9EUBFg8e5Wh2gJL64hhHsELJfLetGpxwu6EJmwR/Ja+SrIW8LOusgf4QEmBMn3
	 r4YWqJJPE2ZfhaS+CG4j5bHfq9UsxH52bMOJ2j280kPwFykwWtJpi9OkRbpOXBsFVZ
	 sv36yt5kSWrhSNMbhCbtP8zV27nakdpWM20cf2g4RLji34X+ly3NE0noeIZiyjr7kq
	 CJq2WxlMwrxjR/DiuGzJUf/nv3EnZzvi+62ASdZGI32H3X3dfmqMul1yJkob8vLt9s
	 nrrw3bbE80b2IJq5f5LmvEK4NGYJej8d4DVdLNULP6J24vnfrwcS+tVSY8wm0W8QTG
	 XacDnTsp2rj9Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v1PfQ-000000007Vk-28ai;
	Wed, 24 Sep 2025 15:36:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hans.verkuil@cisco.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] media: mediatek: fix VPU device leaks on probe
Date: Wed, 24 Sep 2025 15:35:49 +0200
Message-ID: <20250924133552.28841-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_063628_839854_225AC5BF 
X-CRM114-Status: UNSURE (   8.71  )
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

This series fixes VPU device leaks during probe of the mdp and two codec
drivers.

Included is also a minor documentation update to make it clear that the
VPU lookup helper returns the device with an incremented refcount.

Johan


Johan Hovold (3):
  media: mediatek: vcodec: fix device leak on codec init
  media: mediatek: mdp: fix device leak on probe
  media: mediatek: amend vpu_get_plat_device() documentation

 drivers/media/platform/mediatek/mdp/mtk_mdp_core.c  |  7 +++++--
 .../mediatek/vcodec/common/mtk_vcodec_fw_vpu.c      | 13 +++++++++++++
 drivers/media/platform/mediatek/vpu/mtk_vpu.h       |  2 +-
 3 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.49.1


