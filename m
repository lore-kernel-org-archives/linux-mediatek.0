Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA97F606A697
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 18:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gyXTZJDZ;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G3xjO6Qt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=; b=gyXTZJDZUbiDbJaEpQnICddIOK
	n8Ly0hccSJqdl3I7/UWcLcQyESpufidf511obVxtxUpsfvWWovZfSfufsTcSVHA9miYuPbza8jvWW
	E+BrwFXHSb4uaQQjRby/Up3PpY3D7g7VQmiQha1W7DMA86kJdQUBSOhXegQR91hf+4VugNpDbCNsL
	QSiLn6WXhI2B1IPZ7zPjfTVqvdTiIZEzclpgryBzvY152e67AybY1tnEk9IDRmmnJHO6EwTx2jGy/
	FMpBA9ZjUoSZIGsDNN5Xiu8KV4C9KMxF7BIIK6J0Hc2H+NO5YTrAeppnZMBEUB8lOD7Y5a3IUY1Rt
	3AwIlfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHOA-0000000AwqQ-1ceZ;
	Wed, 25 Nov 2026 18:06:38 +0000
Received: from mail-ej1-x646.google.com ([2a00:1450:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHO1-0000000Awnt-4C4h
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 18:06:32 +0000
Received: by mail-ej1-x646.google.com with SMTP id a640c23a62f3a-c5101fd59e3so520279566b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 10:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795629987; x=1796234787; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=;
        b=G3xjO6QtsCEliF4zlBvgWchgyltmKLU5F0qef7g+Lb4U9PA00XWps7pV9SBTk3PPko
         FC+u3wBXWkckd7C1ff/NShIco2aD7eKfxy9V4CvVBpQcm2EPf4TEZuOVLg66kDOdpHr0
         lQKmCbXnS/UMmdYSgNEof0wjSoG0SPRIJjpbzt1Nj/KOPI0DYMKyvGqK3g7ND/s1i+SS
         NWBkHd7aWRFd34jhIkqLBCmvMmTL+F7B5ZlvLyaN3wK0FU0H/0ycP9RjqmnJrjntNPWH
         iS5N1IlqRj2anCI5NcVWyeVAMWIA9blfnKnRqFqYMS9a1lptMemoVyC8cTNIE08lh2Gp
         k5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795629987; x=1796234787;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kB0v6EVehb/RoxPUQoMs0TMRRrXGkjijuKU6iXWhWvg=;
        b=08dlju4rnGb2+e/1iRjGe3x7wTzAxAXOLE4gzRLQzbkrvWf/JX+yHuQOqvuKLv4hEC
         bfamQxcyrewNgoDKaUaElWJmSIOeml2B6HsPpOcnFuZJigkEgkzlNhVbPFaKPBwsJLeZ
         zbH07VZp8rg+LU7UiGxyA2aMLKz74ml2PdradI/FZAO6E8lE+TfPtmpxqaEeIRZDCm6q
         U/UZjktcbhf7Vzqe7TsDD4cbIyJdY8WpewWgysgwQuLxVb7Zw5ghYDWFKBqVkdm+gPi2
         yIwbjkR8vhzXuVdkaZtCA9cukh7R0HtL9JoQ+rs/8uobFL/xiWk4RsvzkvOg0m9JTvMD
         YGLA==
X-Forwarded-Encrypted: i=1; AL+hErG30F5Jhmn5FvXo7X1noNFHgZrfi8KamH9sQ+4OvEozr9iobZh47Hv05arPRqVDrEWl2cYXa2Mw54pL5VLmYw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/xfzYp3jsuxE3rzelU42Q2+esin1f5jP4VcLY8zzrKnKAKO/3x
	rQHUSc3t86mTqgVGrFZjT0MvTyWAFJNMLbuJa0odJojsD3To0S5n14cEOxVZsmvZlbZJ37f/AA=
	=
X-Received: from ejc14-n2.prod.google.com ([2002:a05:6938:a00e:20b0:c50:6127:2777])
 (user=zyta job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:2da8:b0:c51:9abe:f3b4
 with SMTP id a640c23a62f3a-c519abef596mr491882666b.6.1795629986942; Wed, 25
 Nov 2026 10:06:26 -0800 (PST)
Date: Wed, 25 Nov 2026 18:06:20 +0000
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125180620.578175-1-zyta@google.com>
Subject: [PATCH] irqchip/mediatek: Add OF and HAS_IOMEM dependencies for MTK_IRQ
From: Zyta Szpak <zyta@google.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	oe-kbuild-all@lists.linux.dev, Zyta Szpak <zyta@google.com>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_100630_102485_D58DD67C 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -9.5 (---------)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Enabling COMPILE_TEST for CONFIG_MTK_IRQ allows building irq-mtk-cirq.c
without CONFIG_OF enabled, which causes of_match_node() to expand to
NULL and triggers a W=1 compiler warning:

  drivers/irqchip/irq-mtk-cirq.c:292:34: warning: unused variable 'mtk_cirq_of_match' [-Wunused-const-variable]

Both irq-mtk-sysirq and irq-mtk-cirq are Device Tree-only MMIO drivers
using IRQCHIP_DECLARE() and of_iomap(), so building them without OF or
HAS_IOMEM serves no purpose and can fail on !HAS_IOMEM configurations.

Add explicit dependencies on OF and HAS_IOMEM to CONFIG_MTK_IRQ.

Fixes: 702ae15488ce ("irqchip/mediatek: Add Kconfig option for MediaTek SYSIRQ and CIRQ")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117144350.wOuBa9ZW-lkp@intel.com/
Signed-off-by: Zyta Szpak <zyta@google.com>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 90daedb7554a..9e6658289ae0 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -795,6 +795,7 @@ config MST_IRQ
 
 config MTK_IRQ
 	bool "MediaTek Interrupt Controller"
+	depends on OF && HAS_IOMEM
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	default ARCH_MEDIATEK
 	select IRQ_DOMAIN

base-commit: aab02e49f0b54a0837e58c67651c4abdad1a3208
-- 
2.56.1.839.g22a8290db9-goog


