Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4931CD1284
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 11:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZkWuWrBWFv8oRc4EnnO6eHDVPwBh4k48pWdLeKJmmBU=; b=1hKrBwjf6NzHG3XzKI+AZGik5j
	JI4rdvda0SX8zUjjXv9Jj1EOvMRp/5eDizb74WX1fxzCDZU3tT7E+mPLsDDv8l99uNtVCtTMhzPS1
	IHtyVsiWG6d7oyd8JQ11ODhpKQT4RHsz7FB9cTJSQFvE7tK8I2etW2OY4MltHkvzyK0afpNQ99tGU
	xrZ42oSge+Fv5SV4ERas8mgjONW0ieZJvXh4f0NN52MnIcfxv7ZgX3dr90+YkCCJuZqjyHsnndSou
	CsYQgov7eXitK+AuWspjdwxf2k+45RPkCNPWLp80L/bTSUnXID8ITqinTsA58Yfhx+ESj84dNBV8m
	eVjoSWmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rusq0-0000000Bm4n-3X4R;
	Thu, 11 Apr 2024 11:43:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruspf-0000000Blxf-0v8I;
	Thu, 11 Apr 2024 11:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712835785;
	bh=hZOqM1m3fh6Pq5Sr9fpO6+gQjVeXP2CN8smO/JG0VAs=;
	h=From:To:Cc:Subject:Date:From;
	b=k7ulCCAuOzpzMtCSSwJbToT4VvETX+O+bmx76FwmVxTB56ycdPpWvbmYTO2D8Rw27
	 278feKMJpxmNQX/zYDmA6NUF5apyPXCV4+mqb1PBul4EVNRZlIoO4Y87+yajpz7wSU
	 raO/0wToFReAHXlskJ563wsQlst8BG0MVGCsM3FxMyaeFTga0LiD6BcUoK414GoCtq
	 vpKeoAmEvvwQc+zfs0CQBVHQEwM10C/EEmf0IWmcSX8piRJA41m2gDjjoyCiDSlZdR
	 /6Z47bX6wUecgnr9nxL3DT6aewxd9BwFEJbttrNb8SBCyaKdgDuTduRF8CvQdqdd1a
	 goSDMWIlBbSjQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF20D378208C;
	Thu, 11 Apr 2024 11:43:03 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	chu.stanley@gmail.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/8] MediaTek UFS fixes and cleanups - Part 1
Date: Thu, 11 Apr 2024 13:42:52 +0200
Message-ID: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_044307_583929_B3DAF043 
X-CRM114-Status: GOOD (  12.29  )
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

Changes in v2:
 - Rebased over next-20240409 (because of merge issue for patch 1)
 - Added ufs: prefix to patch 1
 - Added forgotten ufs-rx-symbol clock to the binding


This series performs some fixes and cleanups for the MediaTek UFSHCI
controller driver.

In particular, while adding the MT8195 compatible to the mediatek,ufs
binding, I noticed that it was allowing just one clock, completely
ignoring the optional ones, including the crypt-xxx clocks, all of
the optional regulators, and other properties.

Between all the other properties, two are completely useless, as they
are there just to activate features that, on SoCs that don't support
these, won't anyway be activated because of missing clocks or missing
regulators, or missing other properties;
as for the other vendor-specific properties, like ufs-disable-ah8,
ufs-broken-vcc, ufs-pmc-via-fastauto, since the current merge window
is closing, I didn't do extensive research so I've left them in place
but didn't add them to the devicetree binding yet.

The plan is to check those later and eventually give them a removal
treatment, or add them to the bindings in a part two series.

For now, at least, this is already a big improvement.

P.S.: The only SoC having UFSHCI upstream is MT8183, which only has
just one clock, and *nothing else* uses properties, clocks, etc that
were renamed in this cleanup.

Cheers!


AngeloGioacchino Del Regno (8):
  scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-support-va09 property
  scsi: ufs: ufs-mediatek: Fix property name for crypt boost voltage
  scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-boost-crypt
    property
  scsi: ufs: ufs-mediatek: Avoid underscores in crypt clock names
  dt-bindings: ufs: mediatek,ufs: Document MT8192 compatible with MT8183
  dt-bindings: ufs: mediatek,ufs: Document MT8195 compatible
  dt-bindings: ufs: mediatek,ufs: Document additional clocks
  dt-bindings: ufs: mediatek,ufs: Document optional dvfsrc/va09
    regulators

 .../devicetree/bindings/ufs/mediatek,ufs.yaml | 29 +++++-
 drivers/ufs/host/ufs-mediatek.c               | 91 +++++++++++--------
 2 files changed, 80 insertions(+), 40 deletions(-)

-- 
2.44.0


