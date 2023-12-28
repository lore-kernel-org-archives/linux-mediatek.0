Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32543C47073
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 11:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ac0KFGx6djY5Thm/v+rASdAvFaPpu6llRnEoG95HMwQ=; b=MKfWeIgBBziLCEu/XkLt68aFDk
	aAdY08gTh8rW4QL6QAKv0eckjFGTlCctEGZwiSr2iWurZF4FPy4lzg4XMvF1zFUPPRpSH1xXVigtE
	Vc0pbUaLm+1J/UHgPsJD1EMgPKas5v68wbhA+HFMNJaKvnbxv5KRLuFyHkwxakv21wxwxRqhU0AqY
	z+pWhbRAXbmYoY8nCY2++Y9KhP/GA2W8bFplk1vu0nNLhPjg5KqF/RnyXYsoJw0JPO3NGOumYhZpn
	LHmcGyAtyv8NLRH80OjK98tSj1rNfeyYdyNRpJ69hWzl16s2eC4RPC1u29+Z79dGEGPjqVlRB/o/P
	Us8IC7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodX-00Gfwj-0K;
	Thu, 28 Dec 2023 11:33:15 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodI-00Gfng-0m;
	Thu, 28 Dec 2023 11:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703763175;
	bh=H+p65aUaK9evKJt3enmqsrg8ME3wuAMZvoXwXZVX8Bc=;
	h=From:To:Cc:Subject:Date:From;
	b=E5P1ammQWbyCeX9t0SiIGu5Ct5h2/6FJMJt03TnMKPdEYBY0bcht87BFCAli94FLc
	 3J64pKc3R2UmsMi7u0Hf9TQFslrZu4cwxl61yjzm1g94X1V4VP6AQM7vP0pz2X4PFX
	 YcqkzM9dhtc7efd9pcEa3Ssj5z9zZG2Q92l4dCSufS0xT0OXBDv+10WfhbLgXS0Ieq
	 cSi94H3dZnmqFfdROEDqmURM/4vpUhIworix0bTdsSTrWFg74CTruEHyrpQT67/Pl2
	 aZdryzm92Nq62AAncS7Rj6g+jC8rPUgIukpzp+BC3kl7JQbtiJ+04BdTOfLxVP7mDR
	 GFIyVsQawwIng==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B21123780436;
	Thu, 28 Dec 2023 11:32:54 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org
Cc: eugen.hristev@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 0/6] video encoder on mt8186
Date: Thu, 28 Dec 2023 13:32:39 +0200
Message-Id: <20231228113245.174706-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_033300_483081_6E99D5A0 
X-CRM114-Status: UNSURE (   8.95  )
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

This series adds support for the video encoder on mt8186.

Few patches fix the binding, there is a patch for the DT node,
and one patch for the driver that fixes an imbalance.

Changes in v3:
- removed the patch to add dma-ranges, because this was intentionally
removed (e.g. https://patchwork.kernel.org/project/linux-media/patch/20230303013842.23259-3-allen-kh.cheng@mediatek.com/ )
also removed dma-ranges and cells from the DT node

Changes in v2:
- change log in every patch

Eugen Hristev (5):
  media: mediatek: vcodec: fix possible unbalanced PM counter
  dt-bindings: media: mtk-vcodec-encoder: fix non-vp8 clock name
  arm64: dts: mediatek: mt8192: fix vencoder clock name
  dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
  arm64: dts: mediatek: mt8186: fix VENC power domain clocks

Kyrie Wu (1):
  arm64: dts: mediatek: mt8186: Add venc node

 .../media/mediatek,vcodec-encoder.yaml        | 31 ++++++++++---------
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 23 +++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8192.dtsi      |  2 +-
 .../vcodec/encoder/mtk_vcodec_enc_pm.c        |  4 ++-
 .../vcodec/encoder/mtk_vcodec_enc_pm.h        |  2 +-
 .../mediatek/vcodec/encoder/venc_drv_if.c     |  5 ++-
 6 files changed, 47 insertions(+), 20 deletions(-)

-- 
2.34.1


