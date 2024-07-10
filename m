Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DB1C3DA49
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 08:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/1tqd2l3Rjj8wuziY1dx5H0ws0TkLj+YsaUZlLx0dT8=; b=HysKIP12jM0rV1/63amuodThD/
	BAlSPXPL5lZPrfjeaQB5Q6fw+d1zg9nAovbcb1iKsPdg2ht8byW8+/I8LY/tq/mKArj/hF971PIJJ
	qVrdZ1uzrGzC9bt+qDpIJ3aLICB7PdC9RqJTEPL/miEM+y8F3scAfXhla/3fxUQ44MQBqEXujC67M
	gSRLN3oDPVA2Y0LMxSTFo+LQ5+7K88/TdJRNlf7Yz9twDvWxIRdas/0Q5S+I5qUjR7a22q7Yp/6fQ
	dEVjYsK4Ydyz72Ple85XFD/nLOc7cBziCtXgASGsnPYGv6qQc5WrOygrnpaCwC3eD7la0yrzFG4MC
	k3/bt9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSqL-00000009upb-3aeC;
	Wed, 10 Jul 2024 08:38:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRSpI-00000009uIu-24ra;
	Wed, 10 Jul 2024 08:37:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C779C619F4;
	Wed, 10 Jul 2024 08:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9158CC32782;
	Wed, 10 Jul 2024 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720600642;
	bh=nlmPSyxX9qpxoDNYTGreHvGaR6e8CTjlqGKzsgnia6M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=cAjOYz6Fbq0FNo/yNWXaqCtiOGQGkOChWPaS62jBM65HmAKku8Te7i/TF/CEfj7FW
	 Qxrwfq0qKjatN1ma+kMRNWUYz0v5VIy73aB2dRh6T6yERYqYq2gZqL5FFEEVBQ5gsu
	 FJmqSI5Y2y0cr0tO0Pet6+4unLtxsXnU188f7yMmYCf3kIc/WkSDarf16zhdR7sW4J
	 Pr8Cp9t9ZwtH5ivBVcufAcljVVWyTqn8aW5B4HVGNxLXPMFuRlDbuHP5mULrIvYdv/
	 g1vwta7EGGRuJG1Q8iS4LJQZhLLb1/CK5nxqSNesMTSI14h15ycq6R+1JeIXEhM6Hm
	 C+rTru9AkGn8A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CB3C3DA45;
	Wed, 10 Jul 2024 08:37:22 +0000 (UTC)
From: Hsiao Chien Sung via B4 Relay <devnull+shawn.sung.mediatek.com@kernel.org>
Subject: [PATCH v2 0/5] Support alpha blending in MTK display driver
Date: Wed, 10 Jul 2024 16:37:18 +0800
Message-Id: <20240710-alpha-blending-v2-0-d4b505e6980a@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD5IjmYC/yWNQQ6CMBBFr0K6dsxQpVVX3sOwKGWkE0shLRIN4
 e5WWL6fvP8WkSgyJXErFhFp5sRDyCAPhbDOhI6A28xCojyjLhGMH52BxlNoOXSASstrVWm8qJP
 IUmMSQRNNsC5r4e19HsdIT/5slUed2XGahvjdonP5X/d/JXF/hrkEBC2VRtTSGon3nlo2E72Od
 uhFva7rDwKqYJ67AAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
 CK Hu <ck.hu@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720600641; l=1214;
 i=shawn.sung@mediatek.com; s=20240710; h=from:subject:message-id;
 bh=nlmPSyxX9qpxoDNYTGreHvGaR6e8CTjlqGKzsgnia6M=;
 b=BdG6PnMbvs0sjxTdr+ziYt58EoMkDr3qc3N4Se8q7d5oHpLOA7lU7oBNSuFkDExAvdlTPqodq
 DaxQKgl/vNUBHQhTqfjD2UutH4EJr/dRwIIiWRPm9uEcGOlBAnA7c/K
X-Developer-Key: i=shawn.sung@mediatek.com; a=ed25519;
 pk=VRlGZ3diQkQtpDd8fCL9/mx+TpZStm08pg8UPaG1NGc=
X-Endpoint-Received: by B4 Relay for shawn.sung@mediatek.com/20240710 with
 auth_id=184
X-Original-From: Hsiao Chien Sung <shawn.sung@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_013724_663827_93AFDD6C 
X-CRM114-Status: UNSURE (   7.29  )
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



