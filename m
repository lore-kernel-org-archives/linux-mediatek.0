Return-Path: <SRS0=UyV0=DN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34AEEC41604
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 19:33:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C10AF206BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2020 19:33:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dE6U92wl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C10AF206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nYht7yt05LqK7lOWQl82SfVefReV3lGbp3Q9JlM96u8=; b=dE6U92wlRl65gbG8DuB2u3mvwR
	tXLesCaOx4F7oCnWNVc1ujAnIiSFF6zjVVoIMTTReAMem4KqToKCxbpx/P02DZD+iOmrno0SaQJlW
	aok+R3xwMwsBIDeaPfxQXzap10C7juWEnpFyRiWbtFdieQQ0n1aaDZGCctz4aXNUNNI4WMl1jTBoJ
	pDh0SnghH4T5X17/QSCo6edZf9q6eVm2TSgJ3vJf2TSHucjfTvRxrJrqJ1neC9GxZV6O70rf7DMzs
	tfmJxaWMK3llXgJ8l0opuBQgC4e7CtyTknq8WtOkRXjsQRuKpk5S+tKvjAaGX7gv3dmuTmzCW6hr+
	62BopQsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPsiQ-0001UZ-PD; Tue, 06 Oct 2020 19:33:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPsiI-0001RP-MC; Tue, 06 Oct 2020 19:33:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 6FABC28A7A9
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] soc: mediatek: Prepare MMSYS for DDP routing using tables
Date: Tue,  6 Oct 2020 21:33:16 +0200
Message-Id: <20201006193320.405529-1-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_153330_806291_CC2627F0 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: chunkuang.hu@kernel.org, drinkcat@chromium.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear all,

The following series are intended to prepare the mtk-mmsys driver to
allow different DDP (Data Display Path) routing tables per SoC. Note
that the series has been tested only on MT8173 platform and could break
the display on MT2701 and MT2712 based devices. I kindly ask for someone
having these devices to provide a tested routing table (unfortunately I
didn't have enough documentation to figure out this myself).

For the other devices (MT8183, MT6779 and MT6797) DRM support is not in
mainline yet so nothing will break.

Thanks,
  Enric


CK Hu (2):
  soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
  soc: mediatek: mmsys: Use an array for setting the routing registers

Enric Balletbo i Serra (1):
  soc: mediatek: mmsys: Use devm_platform_ioremap_resource()

Yongqiang Niu (1):
  soc / drm: mediatek: Move DDP component defines into mtk-mmsys.h

 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  34 +-
 drivers/soc/mediatek/mtk-mmsys.c            | 429 +++++++++++---------
 include/linux/soc/mediatek/mtk-mmsys.h      |  33 ++
 3 files changed, 263 insertions(+), 233 deletions(-)

-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
