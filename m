Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A101C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 11:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bkPUgqzjmk/NZzthIDEd2otZ5U4UuyX4FROiUPq5do0=; b=W5lE/fLdodPQtlYB3mtpf2ZLGj
	Aozb29RpHp4uBmLKhngWficSsHCsVyeJHEFih6N88cX6BLLnW3O7Ks+4hkZYCUPg0TZrBQw7XecVS
	iMPppK1T23WBl0JPaTjc5p7tN5FjcHzz+SKdXV88cowEb2U+XVIf8IRkkqqm9r1uAD23pS7hX8OVW
	weUNTb/5IEeK9Za8WchqxYCeNLpdolLiSNhTdQ8Ux+8FHzm/cEQzBYx5N+UR6QMCCwDxmPhuyptUA
	Yd/z3PiQlH2GQ2v2JQvGSoheOKUxjIo3e2mwql3nxRc8mUJk2bu1Fo40/zfboP05ViVNV0S4m7z2l
	/4APjOYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9s4-00000001klP-2e4W;
	Tue, 09 Apr 2024 11:42:36 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru9rv-00000001kem-08J9;
	Tue, 09 Apr 2024 11:42:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712662945;
	bh=UwWalpfea6BpAefdcOj18pnh4N5zMuVvU/mhh5HYwDM=;
	h=From:To:Cc:Subject:Date:From;
	b=AYmFZ+ll3W7MRJDDqSCbXOlIxvsbh/aTvWC5cIt8us13rMJxtz+JFErlT7x0m58hy
	 HMoMhX53YJvSt+KewuvR/JTI2zBaoDrzqXAQmeRiU+egDTWZMN/jaYqfWxTbyjoSt/
	 +RtEFinW54+jdQhJ5j3B24hRLEyfCexX0Kf8sLFZ9V0N3ohSgh3Md+LdtJfnZcLZTy
	 EHRoU+ZtrxC2WasUF+J6VJhzZql6nRsXgvuphYbmjlWWjs9jaC3qVJ3ziSn7Y+Cb0L
	 Yq9mGlYfyolEYO8z7YBfRiKe7VHAtyBN65yOE5r07k/qlzgxY2/+B6MRpUX3LkkFaC
	 ds5suqA9azKVA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F0EB337820F5;
	Tue,  9 Apr 2024 11:42:24 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/5] Radxa NIO-12L: Supplies for CPU/GPU and improvements
Date: Tue,  9 Apr 2024 13:42:06 +0200
Message-ID: <20240409114211.310462-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_044227_304958_31C186C9 
X-CRM114-Status: UNSURE (   6.95  )
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

This series performs various improvements and enables PHYs and USB Role
Switching for proper PM support and to stop relying on the bootloader's
pre-boot configuration.
USB Role Switching doesn't include Alternate Modes yet, as this needs
some more work.

As for the regulator nodes, those were not probing correctly, producing
unability to resume after PM suspend.

AngeloGioacchino Del Regno (5):
  arm64: dts: mediatek: mt8395-nio-12l: Fix MT6360 regulator nodes names
  arm64: dts: medaitek: mt8395-nio-12l: Set i2c6 pins to bias-disable
  arm64: dts: mediatek: mt8395-nio-12l: Define RSEL in microamperes
  arm64: dts: mediatek: mt8395-nio-12l: Enable PHYs and USB role switch
  arm64: dts: mediatek: mt8395-nio-12l: Add power supplies for CPU/GPU
    scaling

 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 106 ++++++++++++++++--
 1 file changed, 94 insertions(+), 12 deletions(-)

-- 
2.44.0


