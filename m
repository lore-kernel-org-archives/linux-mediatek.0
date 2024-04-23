Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1CCC4345F
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Apr 2024 10:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAFxdVj+QJSc3D0b0AStu1rB1dgQkpNFaKNtBQEfYug=; b=slV5i26l6ok8AzD1WWpr33wLDh
	X57kVhBRZF2n1fRhRuwIUMiSvUBny5dgOeHx95Cyt6EZDO5ehU4z12whUZ6XkYm8en1AAP79trHBl
	o5Ft1EtAFz1cj6Kq9rWRfjbU36fEes9+p3cORIiNtfuHyxcDkfeevAqz49BEBRUdQkGJdm3w4CehM
	vXF6lXOSLs1xaI6BxLW+0Iz45/23ZwMcK69FnDWgZuDJa1pDpuv6UtsVWKAkZPn7NxApw8f4bPPUr
	B8yv8eaU3rLL5TZK1pe4MsLoXR6f8vJiG37OtSfNYMHooWWZTfyKbSJu4tWCoCmcrtt1qTPdLp0SC
	bFZ7IJfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzDPN-0000000GqRX-2BeM;
	Tue, 23 Apr 2024 10:29:53 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzDOv-0000000GqGM-0TFO;
	Tue, 23 Apr 2024 10:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713868161;
	bh=IiWauZeXanDlluFAPprUQdbikX6q3CijGw67XDNnEEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Fgd/8/yI1y/TS24LWNczszOryq0wp0cUMFjKb5/OFfyEpj2WvZASiVat4/pQfmO8/
	 4fMUX6WutX/6MKG95WrDBBw8yxpmbwb8Yf/o9GpzBftLL3I1vUuSdMME95U4xXBGJt
	 hZJm/y9sCtDPhd4EeqdeY+Y2qCAFGETW4Ejb4GkhIuTUJnbTLeNbOloRLpVMsYxkog
	 L+5Dptk1xEPbSPMdsxtCrcmksogLhSow3n8h2XJVCPz3ix76K1o0ofqTg6iEoKYwy4
	 3tGBDj28EyRuS2R34BMcTxp5D1c2VJWt6kXjDgJ5aFxgZ76SQywKKNqKSBkEIro84t
	 nVcPg0Zpp7Xxw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 14CF8378208C;
	Tue, 23 Apr 2024 10:29:21 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/2] MediaTek driver fixes for v6.9
Date: Tue, 23 Apr 2024 12:28:58 +0200
Message-ID: <20240423102915.371782-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
References: <20240423102915.371782-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_032925_361065_AD5EE782 
X-CRM114-Status: UNSURE (   7.87  )
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

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-soc-fixes-for-v6.9

for you to fetch changes up to ab6cd6bb33cc0bbb8dbf8cc264a1013b2019561e:

  soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS (2024-04-23 12:09:12 +0200)

----------------------------------------------------------------
MediaTek driver fixes for v6.9

This fixes the MediaTek SVS driver to look for the right thermal zone
names, and adds a missing Kconfig dependency for mtk-socinfo.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      soc: mediatek: mtk-svs: Append "-thermal" to thermal zone names

Daniel Golle (1):
      soc: mediatek: mtk-socinfo: depends on CONFIG_SOC_BUS

 drivers/soc/mediatek/Kconfig   | 1 +
 drivers/soc/mediatek/mtk-svs.c | 7 +++++--
 2 files changed, 6 insertions(+), 2 deletions(-)


