Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2420AC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 22:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cnsv7PhcVKxPeApzW0FUhCEbA9Nl3K7Di68vjzhgTUM=; b=W1NLIWK9gjOVEVJI47lTGcgOFE
	8BwvNYg19WYBgPMPtsDucl4U6bsw5/Oh7B64sQKz3xvOh+MVHNMyllH5H3FDS+La2vN8F0DvL6Qiz
	a2A1LRwnt4kExj36kfB9T6tEmYGdNR6LHP4NEQCKybgvcYIAgqN31BKDc4wwLz0Ub/u0IIosklV1D
	CKRYhAJIDZFEOVKX3a1XpGGXzJbPuF4WyWs6rPGsBjo4y87KBNS2eaji33H7tZI9pEQNeLcl6Is0q
	PbNevL4WOFdKVQLw7zdfHukQ7yaqXZIeiTYijuwvoqL2fZffvCMOopUtf7hECX7SbpmwmUG0bTVLB
	DXMd0+6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rFe-006bA0-O8; Mon, 12 Dec 2022 22:26:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4rFG-006b2N-Ue
	for linux-mediatek@lists.infradead.org; Mon, 12 Dec 2022 22:26:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4rFA-0004ea-BO; Mon, 12 Dec 2022 23:25:52 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4rF7-004777-Rd; Mon, 12 Dec 2022 23:25:50 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4rF7-004boV-Vk; Mon, 12 Dec 2022 23:25:49 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 0/3] soc: Drop empty platform remove function
Date: Mon, 12 Dec 2022 23:25:46 +0100
Message-Id: <20221212222549.3779846-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=903; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=9Yqk7LGk8vsN1xLwr87+BsL2JAMEBNXdS9ZNHOAdVxM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl6peqTXm1Zx9NKzokMGKZQZSwYOUvxD/gnhcUpA/ UQjbZzqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eqXgAKCRDB/BR4rcrsCaK1B/ 4oIK1BL6SDADD6LcuQe6Vsa6aKJmXXgR3STJ4wsSKPXnYiCAC/9THyfxl8k2xY1pz76wXoGGpsv3n6 nx/FwuiOJvQMLSaq7cikPEXGBM9KLDUEb16XsRoG0iniCd38O2eORUQEHsChm0McPvqgQbBmccJA1w 4wULbfw28dt9LwvXTHkSLNET79AidBbXCrktJIe1LO4OatyB/N/8t7VcLlryAW48jTn2Nz/Kv/KWWw xmzyct/oVFDgC1LB+pO8L33gWeSlWsnbzQxSn/ERJDlfModX0FhRGGmaP6aUuRxeT7butXbwlOBj30 imqj5ub3nTf8Gw1G4yN5MKRpufu8iA
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_142558_996942_4F3FB727 
X-CRM114-Status: UNSURE (   7.39  )
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

Hello,

this patch series removes all platform remove functions that only return
zero below drivers/soc. There is no reason to have these, as the only
caller is platform core code doing:

        if (drv->remove) {
                int ret = drv->remove(dev);

                if (ret)
			dev_warn(...)
        }

(in platform_remove()) and so having no remove function is both
equivalent and simpler.

Best regards
Uwe

Uwe Kleine-König (3):
  soc: bcm: bcm2835-power: Drop empty platform remove function
  soc: mediatek: mutex: Drop empty platform remove function
  soc: tegra: cbb: Drop empty platform remove function

 drivers/soc/bcm/bcm2835-power.c      | 6 ------
 drivers/soc/mediatek/mtk-mutex.c     | 6 ------
 drivers/soc/tegra/cbb/tegra234-cbb.c | 6 ------
 3 files changed, 18 deletions(-)


base-commit: 830b3c68c1fb1e9176028d02ef86f3cf76aa2476
-- 
2.38.1


