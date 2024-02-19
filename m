Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3C4C48BC3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 13:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j79Vnqn+p+2WvMTqankUNBFAOdENvf0dUNhLLO0Tji8=; b=Lnp++xMtItAMoaLJiBQPoGPfAI
	/n5IkktP2jHZouRTd8/p0r8y/ZPBCUCdM7IsKyRiaib4bifLfhlc96+p4tbyN2bFu60c8nGYLrqGm
	0rDHl5fNAzh4yz+tNsPIORhl4HOxOnCq9IJYSJMI//mxL2/Wfs1+7rt7Rtd1kPBO64BXn7HGEgMyZ
	0l6LvebIlD5R04Z/NUfXj2gWriG/KzJZjrGx2tObw7+t+MjlhzbB58CjaxPCHq0Vm8Y+f8o8R1IUp
	6gJWMyY6xaLToPlgzvipFxPjrP1GVC3GL4ct+aEvGbs94ID105Evl8IhXrr7FaUKTRXBHvZM6bJ4g
	D93g66Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3Rp-0000000AZvu-3TNh;
	Mon, 19 Feb 2024 13:12:41 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rc3Rl-0000000AZtv-0Iyg;
	Mon, 19 Feb 2024 13:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708348355;
	bh=OoYJXfbff7Gspv7yl5dq0o/qXCHZiJTyhWFMKa/hC6Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eWjNxx03q3oh2Rkk8ilacpB3btEsjLlfmhcUS4lQITV0uNVlQnWvhnrvyeXUAoAON
	 CKG5lWNBO1Y7yPvzdM85x5Q/4SylUgKUtMqLnM+uQ8Qu1CZeRjrwEddn2VNW/ezXVX
	 yB8f5ID/Ti85SLQ8e71KoLdC9BZ8+1vgx/PtVNKpZ6uiHtQyOkAt/znrb5AHij5SVp
	 GGw07PUy47x0DmBjqYIIPfoGdV6ilnK6jEZHdY/jwOzapITUuY+ZNtaTehYLh6v6yI
	 Q6qYDNQp2HAISUwVb44LCUZRaDXIzpd0flbIs/j0Gr4Vca5EgzVcDnVQ8/KgNG/qLI
	 fGTfQUA90pmEg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7C4F337820C3;
	Mon, 19 Feb 2024 13:12:35 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com
Subject: [GIT,PULL,2/2] MediaTek soc driver updates for v6.9
Date: Mon, 19 Feb 2024 14:12:26 +0100
Message-ID: <20240219131230.157792-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
References: <20240219131230.157792-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_051237_268170_0FEDB1EB 
X-CRM114-Status: UNSURE (   7.90  )
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

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.9

for you to fetch changes up to 54d21dea6a6c117f3cab4caa1f9c3ffafb515dd6:

  soc: mediatek: mtk-socinfo: Add extra entry for MT8183 (2024-01-31 09:41:43 +0100)

----------------------------------------------------------------
MediaTek soc driver updates for v6.9

The only addition here is the MediaTek SoC Information driver,
registering socinfo for various MediaTek SoCs.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      soc: mediatek: mtk-socinfo: Clean up NVMEM cell read
      soc: mediatek: mtk-socinfo: Add extra entry for MT8183

William-tw Lin (1):
      soc: mediatek: mtk-socinfo: Add driver for getting chip information

 drivers/soc/mediatek/Kconfig       |   9 ++++
 drivers/soc/mediatek/Makefile      |   1 +
 drivers/soc/mediatek/mtk-socinfo.c | 191 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 201 insertions(+)
 create mode 100644 drivers/soc/mediatek/mtk-socinfo.c


