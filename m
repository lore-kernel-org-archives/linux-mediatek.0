Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461C7EE14DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WtCoctKqrOuNL7YPM9mYObCf6Hdm7ApMb7s6UV96VRg=; b=y695fncA1IJoCRMNRPjw26f0M9
	IkcctynyA6pv3YkLbZU/nQboQ3Q7Cn2bVfaTFZm08HA0mWHLEjhae5rZ7Ddzlbu8hIo3DxpGmPK6e
	WQQvS1nzyTORTwwZ2jUgFlILspZmOuBaxIgxv2UlG0c9fpJRoOYWXBLwN5UMS3R32vLG6oFdtJDlv
	D8uKbh1sOq7dEjid1hI45DU+ASy8XVqaOreZXisDPrT6NFZUpgTXqEk/4DDoPQqojPcM4QJOdptSv
	B2pFoN+ALzZlNEAnw8boqhpJZzPK1mJA/pumT7ZhyXXxKSMX49Hokf2WJNQS9YbboxNqdV7sHaIEb
	6IDQw+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBjh-00Bj6C-0E;
	Thu, 07 Sep 2023 09:55:41 +0000
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBjd-00Bj4d-2V;
	Thu, 07 Sep 2023 09:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WtCoctKqrOuNL7YPM9mYObCf6Hdm7ApMb7s6UV96VRg=;
  b=HPx166wijMpi0SuqjYCYznd1XBpiCUbrQLc/PO/UMyEq3ZEUYTobIRDo
   3Rqqz8tTf3ziWlg9eiO0gtAOEfHBNxrgu+g1iTCYRdavySvFpyxmeL4HB
   GFAsE9lOiSmMbIKRRI/H8INxUF7Ej0oMCIoW7c5cwML7MMfndJw9rsVW5
   k=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.02,234,1688421600"; 
   d="scan'208";a="65324651"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 11:55:29 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org,
	Zhang Rui <rui.zhang@intel.com>,
	Amit Kucheria <amitk@kernel.org>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	netdev@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-mmc@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 00/11] add missing of_node_put
Date: Thu,  7 Sep 2023 11:55:10 +0200
Message-Id: <20230907095521.14053-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_025538_244247_6399180A 
X-CRM114-Status: UNSURE (   6.99  )
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

Add of_node_put on a break out of an of_node loop.

---

 arch/powerpc/kexec/file_load_64.c                    |    8 ++++++--
 arch/powerpc/platforms/powermac/low_i2c.c            |    4 +++-
 arch/powerpc/platforms/powermac/smp.c                |    4 +++-
 drivers/bus/arm-cci.c                                |    4 +++-
 drivers/genpd/ti/ti_sci_pm_domains.c                 |    8 ++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c      |    4 +++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c               |    4 +++-
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c |    1 +
 drivers/mmc/host/atmel-mci.c                         |    8 ++++++--
 drivers/net/ethernet/broadcom/asp2/bcmasp.c          |    1 +
 drivers/soc/dove/pmu.c                               |    5 ++++-
 drivers/thermal/thermal_of.c                         |    8 ++++++--
 sound/soc/sh/rcar/core.c                             |    1 +
 13 files changed, 46 insertions(+), 14 deletions(-)

