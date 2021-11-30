Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE65AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Nov 2021 18:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KYJGtGp6KDXHSBpmy0wn8r5QJVVkIF2FI1nhXEgmT3I=; b=YyqwLflCwTCPIU
	cmmKC5KRG3Sc+Nwj+fS+KtLOFaQprmELwT0tp1BSCXiT3RGyVtDRS/AM8ArW8bkOwLCUJZhoEI8fy
	Y5O2IRpscIoD4AX5y5SnOV1iHv5b4HPDFOeEY8xGuDNfeDH+p5qaU5xtuoMxxOwW44iX78ZaGrAjl
	eTwg8my2kP15lb7D/qbfml287lbm7PF2swIklY5V91LoTyd7fusB5UKjXw8ytb2Zo+p8copZQR92i
	gM0eXURHLvgQGu4MVrSprIMfUXxB/4ygByQiTTBz6LHAt5dNjzPiB83sopoLW+6J0c4NkflmlrQ/V
	jxFsPmybN8vxq7ZRsgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ms7fe-006Se5-Hl; Tue, 30 Nov 2021 18:16:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ms7fb-006Sd7-O4; Tue, 30 Nov 2021 18:16:00 +0000
X-UUID: ddcaa2ae32b74062b3f808d27255d8fb-20211130
X-UUID: ddcaa2ae32b74062b3f808d27255d8fb-20211130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1347717490; Tue, 30 Nov 2021 11:15:57 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 10:15:55 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 1 Dec 2021 02:15:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 02:15:53 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <tzungbi@google.com>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, jason-jh.lin <jason-jh.lin@mediatek.com>
Subject: [PATCH v3 0/2] Fix mediatek-drm suspend and resume issue
Date: Wed, 1 Dec 2021 02:15:50 +0800
Message-ID: <20211130181552.9928-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_101559_807868_1104F6B0 
X-CRM114-Status: UNSURE (   8.86  )
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

Change in v3:
- fix return typo: modify -NOEDV to -ENODEV.
- add missing complete function in ddp_cmdq_cb.

Change in v2:
- rollback adding cmdq_mbox_flush in cmdq_suspend and add
  blocking config mode for mtk_drm_crtc_atomic_disable.
- add return error when device_link_add fail.
- change the first parameter of device_link_add from dev
  to priv->dev.

jason-jh.lin (2):
  drm/mediatek: add blocking config mode for crtc disable flow
  drm/mediatek: add devlink to cmdq dev

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 31 ++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
