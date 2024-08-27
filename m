Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94927C5472F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 14:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QP+L30dly//4UPsPo5l+pGciAh+N2F3bQ72IGkBnuqQ=; b=YxsleyOzuNiTFySjUQVB0hO7rn
	9IYDZnULVlOu8D93GBi9k1tcaadURv+7bVsGZI1pG8Hviox8AedZA8nxO8COMwjyv5qtVjeGraySO
	w8ALZgfFQ7rI3Ffp54QV3sPOVPwAdFUTdDNkP8oUlU3VvqwXRln1B52TWCOscxX12ubBK532ugGMj
	evp//0uxnfG5NG7anqmbQ1himt9D6GXcuTeujh4gt7uznR4K1YJY+HCYGEqdCYKZ66ypTq/aRCXNZ
	j9EX/+NPzYUksADiImYA4gaFiJlk8ajuZVGtWUifbn65uLM83SGPuKEiO2h7LmLkC9HIxq3EREEcL
	XEmVRq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sixdC-0000000Bl10-0Ro1;
	Tue, 27 Aug 2024 14:57:14 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sixc2-0000000Bket-1ZAC;
	Tue, 27 Aug 2024 14:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF174A41B5E;
	Tue, 27 Aug 2024 14:55:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5085FC4FDFA;
	Tue, 27 Aug 2024 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724770560;
	bh=QZQ5u0mI5GTvIERqL7sO8uE4R1i9WTqn8mFJ1e8m6Cg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=BWGWjKPD/AvbpNJKSvtRj7sGxxg8NP2mnJKLSXpT/MCkEvGdfhcX45YwzSp907+Fj
	 5WzZ8QZmJEPureIe0j5U277lDDnJyo4M24GQGTkPdA9QauhMxhuM5fWW+eeBew9/09
	 AMFcvGjr7wx5mbUaFyhRRLqbTlSA4rEJthfxUEiXvRC8qpTrmmAgvCeEUqTW23Gly8
	 uNKCmneoeoKdQrRRdJlMdhGBYn5mhTA2zQdFbz6l7LqKkY6NxiqWV2RuwYoXxiZC+a
	 +hkiJlwPSqC9kOkjxAWUZKQin4kyyj+4OamshVvEBYs8fzBJyn+4r6PT/ol85MuBzT
	 +200DCkqRtAmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45D75C54734;
	Tue, 27 Aug 2024 14:56:00 +0000 (UTC)
From: "Jason-JH.Lin via B4 Relay" <devnull+jason-jh.lin.mediatek.com@kernel.org>
Subject: [PATCH v3 0/2] Fix missing configuration flags in
 mtk_crtc_ddp_config
Date: Tue, 27 Aug 2024 22:55:18 +0800
Message-Id: <20240827-drm-fixup-0819-v3-0-4761005211ec@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANbozWYC/0XMQQ7CIBCF4as0s3YIFA2tq97DuCBlsFMFGqjGp
 OndJd24/PLy/g0KZaYC12aDTB8unGKFPjUwTjY+CNlVQyvbs+xUjy4H9Px9L3jQXxS1Ths/OgP
 1tGSq6xG83at9TgHXKZP9Z4zUSmotO6Gk6jtUONuSIs6TeHEcAjm2Kz3FmALs+w+OtgfXowAAA
 A==
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 CK Hu <ck.hu@mediatek.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724770559; l=663;
 i=jason-jh.lin@mediatek.com; s=20240718; h=from:subject:message-id;
 bh=QZQ5u0mI5GTvIERqL7sO8uE4R1i9WTqn8mFJ1e8m6Cg=;
 b=vtG4j8YW0CdzhCv8m6K3/A14B+OP06kMhQBxegBLibqv5A+ThNrS9j9AtzKCmfL5WKoGsUltR
 pkKWr0ek2bACtvFDpM7Yc2/BNhHDyMbTxGxk84DGDUjNJmsCM1zIoJP
X-Developer-Key: i=jason-jh.lin@mediatek.com; a=ed25519;
 pk=7Hn+BnFBlPrluT5ks5tKVWb3f7O/bMBs6qEemVJwqOo=
X-Endpoint-Received: by B4 Relay for jason-jh.lin@mediatek.com/20240718
 with auth_id=187
X-Original-From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_075602_515488_795EA19D 
X-CRM114-Status: UNSURE (   5.97  )
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
Reply-To: jason-jh.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
---
Change in v3:
Change config_lock from spin_lock to spin_lock_irqsave

Change in v2:
Add spin_lock protection for config_updating flag.

---
Jason-JH.Lin (2):
      drm/mediatek: Fix missing configuration flags in mtk_crtc_ddp_config()
      drm/mediatek: change config_lock from spin_lock to spin_lock_irqsave

 drivers/gpu/drm/mediatek/mtk_crtc.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
---
base-commit: 469f1bad3c1c6e268059f78c0eec7e9552b3894c
change-id: 20240819-drm-fixup-0819-f51e2d37fcd7

Best regards,
-- 
Jason-JH.Lin <jason-jh.lin@mediatek.com>



