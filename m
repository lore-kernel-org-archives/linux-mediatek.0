Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07BDFC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jan 2022 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m9Bot3QfF0DZktPCx5YLDgpgc1L2k1s7EiMFJ9SJlOs=; b=1A7MespwMhJJXe
	7nUmxL++vjE9lo6miohXIe0DgT39BxQjjRWWXHo/vjIMQ2aRMlrun/gt9rIsZQaVqAVwILDiM4IHK
	jA3VOO20Yeg+bB4gclHgEbKDXu07XniK5UUhmOk1TgnG56Txz6TevYAxOGNM0tFMmx/vUO5xwPW0D
	+wpAjP4DC3xTAhUnIkdnv5KehjDLg2FH63l5EtJc171W3n/rtX2Y3JJ8eqEzDn13UVwIVjboli4i1
	/BjHxMN0K+YeQXxXFVl8agLPKMlM0Y91hDVq3UarBGEdy01zLc5Iyj5xzEQXrdf0R2IXHp6zOqiWc
	LcIKLWSQSQntA8h4s2/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuVq-00FHjb-UY; Fri, 21 Jan 2022 14:03:35 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuVl-00FHew-W0
 for linux-mediatek@lists.infradead.org; Fri, 21 Jan 2022 14:03:32 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so22565413wms.3
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Jan 2022 06:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4l1jtRGL+pYHVAZJF8KgIUHpCfnZhhgBRKh+OiDvorY=;
 b=fhwTlzKWGaMzqfsup3wVctsfoZXTOQaOFb5R5Juixld0ttqy1JeVP0UBAnOO4SFypl
 Df1prkauSmcDUosFSq4FqwsGSKYVOkw/bqBDtx72ou6iRRmwyUXBMV/RtyPni7/T2Db8
 wsjOpwr9rNKpmvWP9ckaqB/Sf/UZl+6/jpWbyHCWRAm91Ee79b8icLN1nQTbu4Lb/aht
 jBZCoO75QW8Jm5JEjSctOPETtHCTvm8cM5kB4K2d/gItxQd+q1lB4g+qprWSUABunWlE
 /kJbwx6fRw7U+uCgbcEu959QoZL6efdJOqgrjmamXjX8Ycdi+of9m5uF9YbOdqAzLMcC
 ZRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4l1jtRGL+pYHVAZJF8KgIUHpCfnZhhgBRKh+OiDvorY=;
 b=8CI6H0gRDOVwG2fPKFQGlgHRv/YfafnEGnB0bOuoqelgRqHOC43PbCi/ggNICAGcHd
 lERvpyKQAtz82bHn/hLAJ2rknysMiT/F31Zru+DiAYo1ltJVhlrQOdHbVNqDufCRvbHM
 kq1KLfP7f7efEyw27Shxd5EKdnzf6RjAORhUjR32AgPBzwaRG9KOOsEwCUoyQ4zK/1oR
 xuFxZJ5rqZlXb+trQjuiAmJI88S9/DmDAw3tgEAyP0U7cyeWRRk3iodZyoVkeAQlsG6l
 mZFzvThFouHG84ka1iWgISXt/TAy2fRZxoUeaPaKbuMw6aR4T2nFBqA921lShFryZ25f
 L4UQ==
X-Gm-Message-State: AOAM530Lquk+f3B6A6C0oEjV0Dqzmw38WA9N/eNH5LkmA+WWZlz2+kum
 Zzz+24fJOWyfqFQJV1GNMFSinmJyjErlBw==
X-Google-Smtp-Source: ABdhPJwSn5xqcnOw4GAEgDzNJvgvtqvE75JH7mto0ajETAzgXi5MCr9UUfks/or68aOUSSE9IMIGYQ==
X-Received: by 2002:adf:fbc5:: with SMTP id d5mr3913609wrs.83.1642773807588;
 Fri, 21 Jan 2022 06:03:27 -0800 (PST)
Received: from groot.home (lfbn-tou-1-205-205.w86-201.abo.wanadoo.fr.
 [86.201.52.205])
 by smtp.gmail.com with ESMTPSA id p29sm9225129wms.5.2022.01.21.06.03.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 06:03:27 -0800 (PST)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH v4 0/4] input: MT6358 PMIC button support
Date: Fri, 21 Jan 2022 15:03:19 +0100
Message-Id: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_060330_115282_AB139F93 
X-CRM114-Status: GOOD (  10.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

Changes since v3 [1]:
* checkpatch.pl --strict fixes

Changes since v2 [2]:
* added 4th patch with device tree enable
* cover letter title prefixed with 'input'

This has been tested with evtest on mt8183-pumpkin on input/next

[1] https://lore.kernel.org/r/20210702134310.3451560-1-mkorpershoek@baylibre.com
[2] https://lore.kernel.org/r/id:20210512152648.39961-1-mkorpershoek@baylibre.com

Mattijs Korpershoek (4):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358
  arm64: dts: mt6358: add mt6358-keys node

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 12 ++++
 drivers/input/keyboard/mtk-pmic-keys.c        | 55 +++++++++++++++++--
 3 files changed, 67 insertions(+), 5 deletions(-)


base-commit: 87a0b2fafc09766d8c55461a18345a1cfb10a7fe
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
