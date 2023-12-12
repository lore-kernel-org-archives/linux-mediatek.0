Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1DFC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 11:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EG1pvniL7aSi+rGDpIwDbxqC50mamRjZN6IHwqrzrnE=; b=W2Su7yaqLJyt1YmLeoSM66fCkm
	DSJyXnfxMlT4HfWLIZtAsjfsA5O1PQKCuuR1XN0E7ubs6U3Vtg3rMmAGOw8eIOdt9tZNCW8AFsx3f
	ir0ZXoiAnqUorGM2O/0M3XMZ2EXUB3O8dIOujGj/+Gul1ifU8okPiKQBWM7PGb/jRtbCU56XxRvY2
	AU/A1RwAdcaIyEmOGqrJOviy1HhY0Ng00XDCEgUJjXi7lUdq/1GhrvZPAncQlnOHfaOjK+Cd2+i+X
	q0eB12zNgdXNWpcuFo8QPM0IbHhNALf00rS+2n708oVJfqifmQCHIIu6wqu0nip30GQL9d8FxrFoG
	9rGzgSOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1DG-00BZYP-04;
	Tue, 12 Dec 2023 11:46:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD1DA-00BZWL-2q;
	Tue, 12 Dec 2023 11:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702381561;
	bh=mk0Ql/32iCQN6Zu9d7ds86iUmRmNQGYWE06oEVTqv3g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JbBffc3kCZpXpDx69DvcidNpBgGjp1a1lFqlq6HAp3c7P37YrciwWlP5aHJK8zgLB
	 N1FYICfIIgfk7wwkm1rMercEQJy1hv6hOaa9F6SDoTd0aTN5gse7ij6LLWctE0i55u
	 m4VezcqJUsqiW6mG82TLsyDc8DCYyVNUGdsIt6fcOwt+Mr9bp6GiO+KGBhCZrbDsyK
	 Q3vgTBYIJfzQZvVLxR0rksOvdynEJARx3AVmrZtzXlLpPvjFqI4yUcEJXES8bZbRwx
	 5QVD48y1pW7sRPKDVZFbezXVo2FCmSaG/Nuz+UvaOIqJZz6JK46abNbbJCOzY0C3jm
	 3kJBWkiYE0q/A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 122FF378145C;
	Tue, 12 Dec 2023 11:46:01 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/3] MediaTek ARM64 defconfig updates for v6.8
Date: Tue, 12 Dec 2023 12:44:29 +0100
Message-ID: <20231212114515.121695-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
References: <20231212114515.121695-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_034605_121305_567F1B3A 
X-CRM114-Status: UNSURE (   6.47  )
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

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ tags/mtk-defconfig-for-v6.8

for you to fetch changes up to ebb78614ce2ff73be14ed7339b832e24e381d3fc:

  arm64: defconfig: Enable configs for MT8195-Cherry-Tomato Chromebook (2023-12-12 11:52:15 +0100)

----------------------------------------------------------------
MediaTek ARM64 defconfig updates for v6.8

Those defconfig changes enable booting the MT8173 Chromebooks with the
enablement of the DA9211 regulator driver and adds modules for sound,
AudioDSP, DisplayPort and LVTS Thermal for MT8192/MT8195, and module
for the ChromeOS Keyboard LED backlight which is present on various
Google Chromebooks.

----------------------------------------------------------------
Nícolas F. R. A. Prado (1):
      arm64: defconfig: Enable configs for MT8195-Cherry-Tomato Chromebook

Vignesh Raman (1):
      arm64: defconfig: Enable DA9211 regulator

 arch/arm64/configs/defconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)


