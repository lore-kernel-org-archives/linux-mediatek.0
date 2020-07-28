Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56E0C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:24:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C4802064B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 11:24:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mZ2iCJIm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="S+wM/wAa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C4802064B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EY1Hb2KIqSK6DFuWlcNyq3nwdFgZqpkQ6WL7uceovOI=; b=mZ2iCJIm/3ASkJOe/nXiB56xQo
	/lb7ZB7T+czx7CKbMQC7Ee4NEvfu5lKc1CDQP3RwJiLNGhjvSHnEEw6wLgkVdra3UMIVIOVNux0KE
	LMI8SJy6VH3BGuZz3DBtW/ZNF7f6ePwLX8ipRDsEXoZDsGxvWIhvr5t/QsYCyMSk99ZQJ5l0jsId0
	G2BP7+4WQ8wh9gW7Yv/t4STDqM5fG5AuTjJLu62u1HViRG4P50+MuwvgLBAfi9Yge+WjK61DswT4C
	QaSrAZ6DuvBxfEXZsx1NKQef2pw+gQnMC4n6ZCbSUoZhG+N6i3pwsG8XUNfXns2D3Z/qPVw1JMiDu
	7J1ZueBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Ni9-0001Py-Ic; Tue, 28 Jul 2020 11:23:57 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Ni6-0001PH-VC; Tue, 28 Jul 2020 11:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1595935431;
 bh=kKz6J2TJMa/GicbvTCv76Ky9V4fO/FV3yZh5V+NhgHA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=S+wM/wAaXHLNJuOGHR/kmNSo3NzHgl3u4I3Yf+Jctfcu7TqlXDkou7o5QklMv44RX
 p2+1oqqLX3WBUTkhG8C7FGTLaMEMth2EKAgwhLI18tm1IsF/OJ0nmyPMt8Hor0soVO
 ih2LTcB3S+QT8QsH5jepYSQqqPmZ3CGMikFINpE8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([80.208.215.239]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MEUz4-1jym7135gI-00FzVD; Tue, 28 Jul 2020 13:18:17 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/5] make hdmi work on bananapi-r2
Date: Tue, 28 Jul 2020 13:17:55 +0200
Message-Id: <20200728111800.77641-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:+y5CoX8QurDPY0IO98TiGJ9LRNcAE9xACEixzFfMq7Rc9pJV6/F
 VIOEtUITqe74q6u2ezJ4CIbpDVVJNTJugvVeL9HglsnPh8Husf3ag6TligX+Syc5hziPW09
 ER2o83PdhsHrZ1mvkVFnWBMYpn1ixkPjVaA30e4evKXJ+WzDhFbNGkKNRPet6RUPF6aFX69
 ZYJDeR5cZL/ysODW/uUsg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:G3AHFkQI4No=:n7GF6rIqM26MFvWu8OeyUs
 jzEzJcJwCrM+myesS9srOs2eNr2352XSiox3AdhsQaMI6dISjLLNGDO/5xiVCgiDn+z+KSQg7
 SLoGLYTxFynb3JSsJxV2NKvNTff5eEeNoeTzfjBqw32tmUJ00iqZ0hwoGZrrSjVc5rmYN0rVd
 XMxd3ICQj+fF4wzv47BYvnhDns+y1KXXefAzWt3d643SutqCWwlBkfTryNq7aTCljogs01mah
 tTphgY531h1OnmYH8cyDvUQWohE/Etr0ZFgTTHBy9fBudd6KBleQJhX7A3tKp0eVOoJMfjPkC
 8zix4n/S2k90HRMxvThlRcuN94J7+mR3bL2yUkCSQDkEbRq9miLKHH4mYWDY2fQ7h2hJ2hz/X
 6uhajgQjHh2cDbcDnGKOFmSHAx4RcutrNkI2mBq66hDVG4VRYSMPzdmia94IgDzpSSboWo+4A
 0Pm7LxQWzfTYW+O/FplW49cOpbbIOfucxOxCpfSs7TOB1NY0OdX8k1+xONTAFBgZ72vD7/URg
 xrRC4OGIDBmdOAzVEqoTN+PpoDm5Q3sRgizghqqP9ODDY80QDK79HUdi6HBYNZeHLcUH0bzWQ
 cpKyGRzZPlUoz9XPIfHbrlUDqADklwC/QUh715E+gN3QOZ78VctacRLt7IJ8vgLrvtCsBpGvZ
 eUhXF8KwCjMaDy+0/QI5m9u/gdhmnnKl5i60JLS7qQwaeURX0RhpRCcQBLuzpTUUTckbDIJc5
 KAz8kqH6hbImDAW2RbvDNHTQjauKtJEXiDxCDD3OqHvDEbUiS3rEnkE50wIB6c4p/pmre5Szb
 lMilHwxcOOXGvex9ZZ8oistlcvyc/8J3xQR4js5fV0E2jBlgxQAXoCaPq2VMpiQqiQ7EIsO22
 U5NXvPfdeT+pq6RE+mBtV2L91YL22kFSh3PuxK/JsdfmReJxqjdwP6I4bjtSoHKsdgJzPQBYY
 Dd1Drhs5ianhz5vkyYAj6rwfppQdogtQnBLegLowspuR/JRnnA5EmNxG7rtBBAQIPXJGVohV5
 Wj03KT8f0duZbXlNvfuss/M3qKojYAIu3fT1FOyNx+yocHY7NW+fwdGfDEn8T6nMvBxINPTS9
 OeDwC7bqBuAnjsqOKF8LwYJaixJNFCP7WItkbv9lFzpf+2101GIxXY1hcDMkN+ocAfDM8DilV
 A+csLH5mySWd+XHnOcExsgtb2Xrpl5cLsBjhUryOpHiZSFO81GZnGID1X52JvyH+60/2HBERh
 NrjY1e0aFpo1KrLpuvXp2rOf++I3xPaN9rgAX/Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_072355_223052_3087B2F6 
X-CRM114-Status: GOOD (  13.19  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Frank Wunderlich <frank-w@public-files.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This Patch-Series adds missing Patches/Bugfixes to get hdmi working
on BPI-R2
This is v2 of series https://patchwork.kernel.org/cover/10903309/ after
getting mmsys done

v1->v2:
 - using get_possible_crtc API instead of hardcoded
 - drop unused dts-nodes
 - refine commit-messages as far as i can :)
   "config component output by device node port" is needed to fix a WARN_ON()
   "fix boot up for 720 and 480 but 1080" fixes flickering,
     which may cause also some resolutions not working on some TFT (had some problems on my smaller TFT)

2 Patches were already posted, but not yet merged into mainline
- config component output by device node port
  https://patchwork.kernel.org/patch/10609007/
- add display subsystem related device nodes (resend)
  https://patchwork.kernel.org/patch/10588951/

Bibby Hsieh (1):
  drm/mediatek: config component output by device node port

Jitao Shi (1):
  drm/mediatek: dpi/dsi: change the getting possible_crtc way

Ryder Lee (1):
  arm: dts: mt7623: add display subsystem related device nodes

Stu Hsieh (1):
  drm: Add get_possible_crtc API for dpi, dsi

chunhui dai (1):
  drm/mediatek: fix boot up for 720 and 480 but 1080

 arch/arm/boot/dts/mt7623.dtsi                 | 177 ++++++++++++++++++
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |  85 +++++++++
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |  85 +++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |  42 +++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  46 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h        |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c            |   3 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.c       |   3 +
 drivers/gpu/drm/mediatek/mtk_hdmi_phy.h       |   1 +
 .../gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c    |   1 +
 12 files changed, 442 insertions(+), 10 deletions(-)

--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
