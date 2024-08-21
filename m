Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF6BC52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 09:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5teIJEcm0AV/k2WnKwH/7mKliV2959WnLZFIN1xCsco=; b=QcwUx6TA8crY/ACAdkXmiRfbVI
	nvjrb2/81qUdSJyvheTJ9RNmahDmVgYCgpWk5ejx4SRFXKcMjkkWeq9FaHTmQUpU/opacfTF4UvqQ
	E541dpeWf+FERiuXGmSGsv+INJT/1O0qMtwa3Nx/NzTXDkbXbkwePkzbgP9kFNsC5icqD73M6YR4T
	jPRxqNCUi/ZbyxZMIPqKmJouuG/szHUGJwBlLIWSKduHCZO7852W3ncYvwFsswYlqNH5GjT/znw/e
	0iAtXRv1uf+whgBhRX3dtTr57yB4eq+PJhEk2BAksQUNhd2hjqd4/1f6DZGc6txI6e6Rui84HZJBV
	KHh42djQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghcV-00000008EdL-2MRT;
	Wed, 21 Aug 2024 09:27:11 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sghcT-00000008EcH-0RWE
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Aug 2024 09:27:10 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-202146e9538so43122855ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Aug 2024 02:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724232427; x=1724837227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5teIJEcm0AV/k2WnKwH/7mKliV2959WnLZFIN1xCsco=;
        b=jKxaxwoP1kdx4j36F83EC0xSnmUwUSwq7INJsioi/H0UqDTNdqpYvKWe6ksNBUZorq
         q5V1/2sy9j111RXPx7+aS9L6qZpCRhsE3vGaA/IlEApiqBz/pKpAEpIypBQ/x4zE4wJt
         80y3rZoe1Nq/a+l1yLpDpeod5uPinQAWqD+s4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724232427; x=1724837227;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5teIJEcm0AV/k2WnKwH/7mKliV2959WnLZFIN1xCsco=;
        b=q82knemKMIPXBVaDOM4LEVk0/NsNlAZAFqQs7inJK5H4ebInAgoe4DKfTDjnwQhtnL
         XVPcdCX3jxX2mT/x/OFgIEwyARS4QLjsho1JDz2WswfUGTwnqJNamgdvIL30T0rhiTx4
         vLYh7e958KlS/FlQqO56uM+Ru/K2LKliePHi81IrbF7QTQqhbIWbXPTZBSuTQ7VcKcOX
         jTXSRDBbpmpsfz8s/oU3KLFqETgS+CXAt0SXIpWoDfO+kM/QEmvXy0MdOZPDFUe7aNwe
         m08O8XPEwHi+3tVT7BA3Ug6Hb5lT337ylMnJAsVKNJAbRgJvY738WrO4vw7tyxJ+lRwM
         bKhA==
X-Forwarded-Encrypted: i=1; AJvYcCX7WOp0SLkZGUB/A32kcTnTXH15oRyjFn2lFXbe7yDQx3ChrQMAldhZd+VYM2DH9Zw6IqcYMASjHz3cBKcC9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3lWLG6H/7cqe6ICAZAnePdWH4lJYtJuhwh22ip/5supJI49Uv
	kfVq/286n8KVM1PQPfJPR132bn5/I9zOYfHBs8qKF7l8xYXLDuKxwPocHxPx2A==
X-Google-Smtp-Source: AGHT+IEbt5Bs5xAE6EXU+ozOpdvalfD5bwlOmLZH40RAQn14UF8l3N604XimOQzcaf0Y9RYTSflQ8g==
X-Received: by 2002:a17:902:da8a:b0:202:1a49:d0c3 with SMTP id d9443c01a7336-203681c866dmr12445415ad.62.1724232426742;
        Wed, 21 Aug 2024 02:27:06 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-20250470617sm37161595ad.268.2024.08.21.02.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 02:27:06 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v2 0/3] Devicetree updates for MT8186
Date: Wed, 21 Aug 2024 09:26:56 +0000
Message-ID: <20240821092659.1226250-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_022709_180614_84CB2039 
X-CRM114-Status: UNSURE (   8.04  )
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

Hi,

Changes in v2:
 - Update the binding to include power domain in only some
   specific variants.

This series updates the DPI node to add power domain and
adds the Mediatek SVS node as well to MT8186.

Thanks,
Rohit.

Rohit Agarwal (3):
  dt-bindings: display: mediatek: dpi: Add power domains
  arm64: dts: mediatek: mt8186: Add power domain for DPI
  arm64: dts: mediatek: mt8186: Add svs node

 .../display/mediatek/mediatek,dpi.yaml        | 19 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 21 +++++++++++++++++++
 2 files changed, 40 insertions(+)

-- 
2.46.0.295.g3b9ea8a38a-goog


