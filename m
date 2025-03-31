Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8DAC3600C
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 09:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gyNLHvEybcwwvjD28BxI9Y6rE3vY2z3bBuLlHo59IOI=; b=BZypX6oV/lT98Kgo2E3wlvLxt/
	Ujha68+4jXBVaar4vLuAMqwYyh633ua0AiSx4ezyEiGPi5OP/qSFEBqX74zuYM9YFW/sOnT+Fvjc2
	AiCczZObWeqz1nD4FEfJ2jFPvxxko3DZu5K1Hh+zd2fSu4UWg96I0NO7NJh75qRg4E6gGggfPgvly
	oxT5SLUydpglY+SJPLbLyP3/2Fz+W4tNqMmTn00SHYjXULcMH98pjyOiCH9pgPC2qA6Ub2dPNsdRf
	b456hswLmKjAdSV1KRIr5/XJnw3u76u2a5Uj4xuGKSqJGsb54ZCUIRYToDu8PpVoScWvRvnIFmvis
	MTdJJVNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBQq-0000000HW0w-24Ek;
	Mon, 31 Mar 2025 09:27:48 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzBP5-0000000HVqA-04NZ;
	Mon, 31 Mar 2025 09:26:02 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4ZR5Ms4BDzz51SXw;
	Mon, 31 Mar 2025 17:25:45 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl1.zte.com.cn with SMTP id 52V9PVjp073794;
	Mon, 31 Mar 2025 17:25:31 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Mon, 31 Mar 2025 17:25:34 +0800 (CST)
Date: Mon, 31 Mar 2025 17:25:34 +0800 (CST)
X-Zmail-TransId: 2af967ea5f8effffffffc4e-3c31b
X-Mailer: Zmail v1.0
Message-ID: <20250331172534353mkMR1nv-dsjFTZTXCPY0a@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <j@jannau.net>, <liviu.dudau@arm.com>, <chunkuang.hu@kernel.org>
Cc: <fnkl.kernel@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
        <asahi@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <p.zabel@pengutronix.de>, <matthias.bgg@gmail.com>,
        <angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <ye.xingchen@zte.com.cn>,
        <tang.dongxing@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvNF0gUmVwbGFjZSBjdXN0b20gY29tcGFyZV9kZXYgd2l0aCBjb21wb25lbnRfY29tcGFyZV9vZiBpbiBkcm0=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl1.zte.com.cn 52V9PVjp073794
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 67EA5F99.002/4ZR5Ms4BDzz51SXw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_022559_218399_8124FCAD 
X-CRM114-Status: UNSURE (   6.86  )
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

From: Tang Dongxing <tang.dongxing@zte.com.cn>

Remove the custom device comparison function compare_dev and replace it
with the existing kernel helper component_compare_of, as suggested in
the review feedback. This simplifies the code by eliminating redundant
logic and aligns with the pattern used in other DRM drivers like
hdlcd_drv.c and malidp_drv.c.

Tang Dongxing (4):
  drm: adp: Replace custom compare_dev with component_compare_of
  drm: arm: hdlcd: Replace custom compare_dev with component_compare_of
  drm: malidp: Replace custom compare_dev with component_compare_of
  drm: mediatek: Replace custom compare_dev with component_compare_of

 drivers/gpu/drm/adp/adp_drv.c          | 7 +------
 drivers/gpu/drm/arm/hdlcd_drv.c        | 7 +------
 drivers/gpu/drm/arm/malidp_drv.c       | 9 +--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 +------
 4 files changed, 4 insertions(+), 26 deletions(-)

-- 
2.25.1

