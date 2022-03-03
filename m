Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6ECC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 06:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sNZZE4BO6V3szGtD9G8hTRd6GIPJ4ib/iwlRL8tXuos=; b=JJOyTD6fzQGdIo
	nPnMO7wL29jb/FzTYZmARImENQ3iwJvzpKSR24Wnbesm5IU0jBmh5JaTMn88VXYKlf7TpEVMGIwuR
	2QqCnqVpNmssl+78RAJjZF5NaMkPc2vxyfvn1EPNCpqXBI84ou3QOxcbkSh5bIGqsFdc2oXaf4OJr
	L9qSCoGxi7rb/zkc4lf7xNtEUK9BSLEEBv6eP9zXdoZNzKQo2wglI8UCcDTRZAr9l6ddGaIw4rTW5
	swArNSEDB1RTOyEx44s4UEgn2ZLqxXesIefLOWNmalZxiIU/xJS6ePWKj3tVl9AN55IyEnp1EhYYf
	FHxM1Ilg9JTjb6oQ+MFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPfQh-005TRx-7L; Thu, 03 Mar 2022 06:59:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPfP5-005SRj-5l; Thu, 03 Mar 2022 06:57:38 +0000
X-UUID: df7f9d7654f24abda2493afeb0a491a2-20220302
X-UUID: df7f9d7654f24abda2493afeb0a491a2-20220302
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2031509542; Wed, 02 Mar 2022 23:57:30 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Mar 2022 22:57:28 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 14:57:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 3 Mar 2022 14:57:26 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
CC: <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <jassisinghbrar@gmail.com>, <fparent@baylibre.com>,
 <yongqiang.niu@mediatek.com>, <hsinyi@chromium.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [RESEND V6 0/5] add display support for MediaTek SoC MT8186
Date: Thu, 3 Mar 2022 14:57:20 +0800
Message-ID: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_225735_269496_D06EB307 
X-CRM114-Status: UNSURE (   8.78  )
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

v6:
1. Remove mmsys patches which are accepted.
2. Fix error of dt-binding.

v5:
1. Add binding patch of aal for MT8183.
2. Revise enum to const.
3. Change to use enum for mutex.
4. Remove patches which are accepted by maintainers. (mmsys and mutex)

v4:
1. Remove binding of dsi and dpi.
2. Revise aal binding.
3. Fix indention in [4/5].

v3:
1. Modify display binding based on mtk display binding patch. ([1])
2. Remove patch: drm/mediatek: separate postmask component from mtk_disp_drv.c
3. Remove compatible of 8186 ovl because we can re-use compatible of 8192 for 8186.
4. Fix issue of space before tab on mutex patch.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-next&id=4ed545e7d10049b5492afc184e61a67e478a2cfd

v2:
1. Add binding documentation for mmsys, mutex and mtk_display.
2. Remove duplicated definition of postmask registers on mtk_drm_drv.
3. Add disp_ovl support for MT8186.
4. Add detailed commit messages.

Rex-BC Chen (4):
  dt-bindings: display: mediatek: add aal binding for MT8183
  dt-bindings: display: mediatek: revise enum to const
  dt-bindings: display: mediatek: change to use enum for mutex
  dt-bindings: display: mediatek: add MT8186 SoC binding

Yongqiang Niu (1):
  drm/mediatek: add display support for MT8186

 .../display/mediatek/mediatek,aal.yaml        |  7 +++-
 .../display/mediatek/mediatek,ccorr.yaml      |  5 ++-
 .../display/mediatek/mediatek,color.yaml      |  7 ++--
 .../display/mediatek/mediatek,dither.yaml     |  4 +--
 .../display/mediatek/mediatek,gamma.yaml      |  4 +--
 .../display/mediatek/mediatek,mutex.yaml      | 25 ++++++--------
 .../display/mediatek/mediatek,ovl-2l.yaml     |  4 +++
 .../display/mediatek/mediatek,ovl.yaml        |  8 +++--
 .../display/mediatek/mediatek,postmask.yaml   |  4 +++
 .../display/mediatek/mediatek,rdma.yaml       |  7 ++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 33 +++++++++++++++++++
 11 files changed, 76 insertions(+), 32 deletions(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
