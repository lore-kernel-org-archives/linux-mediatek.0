Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDDDC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yjFiJP6CKDfptTbZV5vZPlnPddVLZq7fAlZjIMFO8gk=; b=w1s4yTO/fY7DU5Ok/wR8R5rTDj
	/oKeJY1j8VFGn/Qf1oQyyUxcJ0Hsc+mgJk/KrZviY8njbMC30G16ReJi4IuTnogkPkLRW/REzTBpb
	b+VK8zqg2lTU0mqY+WpzSg4PO8LvL9RoDl4hFRK6GyQQ2gxFNOPQrQvFuDdlGckvVAUvavgg53+wf
	WNZMQ+se/B6ILscrX8BWC9Xhveb3OlD7KKnUaXqbptFpFRK6fFYlYe7IXO61OBl7HwxhQVpzOewJe
	A4w0+u2hu6bnzDNbCILMtwk+q2G6nPjwSue01QxLL1LKpxqD+hrFqUM5/0RwiPUw7rxBRAXS8KE15
	wNqdZ+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAW-00000007PG0-3lIw;
	Mon, 15 Apr 2024 07:54:24 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAP-00000007PAj-34rw;
	Mon, 15 Apr 2024 07:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713167652;
	bh=vl5BpkbTStY55bvHTyQ3BacPHOvSGMwq87YZ8SJnIzg=;
	h=From:To:Cc:Subject:Date:From;
	b=g9/UszsZSXZ7DApaQAOHTtwn9Xm+hPngJMc6TQcmevXbTBCusw5FDfTt+dqbe/zDP
	 yxe6GdOPwJ28a0LsFy2sC+9e+JH/ujUSixVYyr93/jpr+u+V+pP2QfCbF7Nqu7i2PM
	 vD0rU3Zui6X7HzBz+/GQq20U0Btg/5DIAVwok/TGmaNPwl+oWG1j4b/eI1V+X4Hk6B
	 SnOMXVqE6AVk0/xcpqqNS9Ekib7sqPnnGuBHD7pgOB33HVNv3UfyriKU/CmaPlfM8r
	 DK11VevgjQG6IK9lB7pPrLX9IapHRapNjIlYcttx/6ast077U2RZR/U9LPYuo96vmD
	 6E9Wmnfxc0ivw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id ADA1C3780894;
	Mon, 15 Apr 2024 07:54:10 +0000 (UTC)
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
Subject: [PATCH v3 0/8] MediaTek UFS fixes and cleanups - Part 1
Date: Mon, 15 Apr 2024 09:53:58 +0200
Message-ID: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_005418_069706_897EDA79 
X-CRM114-Status: GOOD (  12.79  )
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

Changes in v3:
 - Disallowed mt8192 compatible in isolation
 - Added maxItems to clocks

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
  scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-support-va09
    property
  scsi: ufs: ufs-mediatek: Fix property name for crypt boost voltage
  scsi: ufs: ufs-mediatek: Remove useless mediatek,ufs-boost-crypt
    property
  scsi: ufs: ufs-mediatek: Avoid underscores in crypt clock names
  dt-bindings: ufs: mediatek,ufs: Document MT8192 compatible with MT8183
  dt-bindings: ufs: mediatek,ufs: Document MT8195 compatible
  dt-bindings: ufs: mediatek,ufs: Document additional clocks
  dt-bindings: ufs: mediatek,ufs: Document optional dvfsrc/va09
    regulators

 .../devicetree/bindings/ufs/mediatek,ufs.yaml | 25 ++++-
 drivers/ufs/host/ufs-mediatek.c               | 91 +++++++++++--------
 2 files changed, 76 insertions(+), 40 deletions(-)

-- 
2.44.0


