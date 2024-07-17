Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE78C3DA4B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 05:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UDXvGo454Wflvuu7pSAKn16dv0f6rJd7w4AjxVhwn+U=; b=HolfoMLokWH1ev51/yHTgOeBBR
	Tgo7u1u7mLJ/WveQg8UJlWezaB9PWTYCQ2fAwlgVltO7eSPwYS2h75nty/3xUF/cK2c46Dy14hDHy
	IrRHzTfLXDBu7i7kse0ADkbSxmKIVHLBta5kgNl8U1cjUXsI3gq6m8O8WawB6lyjaOPKfiGIG4IdD
	pYLq0jHAtnuxBq58i+Tjvuz+Q7trBOzs8yYEX8HGaccK901ZdbpSxzR5bbaNZ2vUin3FXvqMYDvXt
	zf07LojCgJOaTOxYhDqj8luloq64gWA9P3Bd2EmdWl4MEUrDugMuWhexUVbv/15ekMmF/7RER1P+D
	y9a8bzBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTxA6-0000000ChHD-2DEB;
	Wed, 17 Jul 2024 05:25:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTx9j-0000000Ch8x-2J7S;
	Wed, 17 Jul 2024 05:24:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9110961362;
	Wed, 17 Jul 2024 05:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10677C32782;
	Wed, 17 Jul 2024 05:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721193886;
	bh=Vp7p44aMYOx+W/3oDa9KRPvAbAMMO3I7LRS7pOl1nxQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cT+EVE30qqDOPx77JlU6a1Rc6BS16f7s8CdRdhMoTqSNwhvY7VCV4u3JSxrT6wqdt
	 CfPSe/EcjaFA6c9jU7sA8YFLz1toAnOM3jxfKxuQXnXZuMm9Mu0pXPQ8OW638zusZ2
	 8xt4QwwvjwFYiRNCiUUoO7JCOeKKvc7U3uVt7gBVRw4LAn0XQ5fr9njx8nfuyXiMA5
	 1duOE+R/RqxmePhI/I5zKlDVSEc/xar5fhCaW6Kk7Dm/OItA7LbK7QowStJ0CwwLd/
	 DLR+hr3jz0KjbOSWLai8q+xeodfSN3lRvyBhx/jcrxfO/6TsLKYA3FjYu1P4+C8YPa
	 KlpoH69Hlbh+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE29C3DA4B;
	Wed, 17 Jul 2024 05:24:45 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH v4 0/5] Support alpha blending in MTK display driver
Date: Wed, 17 Jul 2024 13:24:40 +0800
Message-Id: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhVl2YC/33OQQ6CMBAF0KuYrq0ZBmjBlfcwLkoZoBELabHRG
 O5uhYWJIS7/JP/9eTFPzpBnx92LOQrGm8HGkO13THfKtsRNHTNDwAxkAlz1Y6d41ZOtjW05CIl
 lnksoRMpiqVKeeOWU1V2s2Xvfx+PoqDGPZeV8ibkzfhrccxkNyee6+gJhlXlIOHCJQgJI1Arhd
 KPaqImuBz3c2AcJ+C1uPBYwCnVW5ZCTKAtQG0L6X0ijgEWpk0I2pRbNjzDP8xsk0D81PwEAAA=
 =
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721193884; l=1512;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=Vp7p44aMYOx+W/3oDa9KRPvAbAMMO3I7LRS7pOl1nxQ=;
 b=+A8fttIjotYhj8wUeKovyfjjqKhR+tv2ri5BcloeuhTVq31xjLyG3wh3H8ppI9q8gkU+M8u50
 U6OUuROaJmgAEsuPzXOHDTTy2Z54rv7ObsgnLk9nciTQ6u+5Db778DJ
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=VRlGZ3diQkQtpDd8fCL9/mx+TpZStm08pg8UPaG1NGc=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240710 with
 auth_id=184
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_222447_710924_80FD7A6A 
X-CRM114-Status: UNSURE (   7.04  )
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
Reply-To: shawn.sung@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support "Pre-multiplied" and "None" blend mode on MediaTek's chips by
adding correct blend mode property when the planes init.
Before this patch, only the "Coverage" mode (default) is supported.

Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>
---
Changes in v4:
- Add more information to the commit message
- Link to v3: https://lore.kernel.org/r/20240710-alpha-blending-v3-0-289c187f9c6f@mediatek.com

Changes in v3:
- Remove the Change-Id
- Link to v2: https://lore.kernel.org/r/20240710-alpha-blending-v2-0-d4b505e6980a@mediatek.com

Changes in v2:
- Remove unnecessary codes
- Add more information to the commit message
- Link to v1: https://lore.kernel.org/r/20240620-blend-v1-0-72670072ca20@mediatek.com

---
Hsiao Chien Sung (5):
      drm/mediatek: Support "None" blending in OVL
      drm/mediatek: Support "None" blending in Mixer
      drm/mediatek: Support "Pre-multiplied" blending in OVL
      drm/mediatek: Support "Pre-multiplied" blending in Mixer
      drm/mediatek: Support alpha blending in display driver

 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 36 +++++++++++++++++++++++++--------
 drivers/gpu/drm/mediatek/mtk_ethdr.c    | 13 +++++++++---
 drivers/gpu/drm/mediatek/mtk_plane.c    | 11 ++++++++++
 3 files changed, 49 insertions(+), 11 deletions(-)
---
base-commit: 8ad49a92cff4bab13eb2f2725243f5f31eff3f3b
change-id: 20240710-alpha-blending-067295570863

Best regards,
-- 
Hsiao Chien Sung <shawn.sung@mediatek.com>



