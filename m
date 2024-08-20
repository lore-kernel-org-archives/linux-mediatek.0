Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4668C5320E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Aug 2024 08:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2IqJ1+bkvBcuO0rX2Lm5C4OmqxXFYhn4ccngQPHsmSU=; b=j3SGR2UhXG4w+UzoHaPbPE3WHQ
	dsbiB/NxmyMLxkZU5y1/gvVrzNvEAB1DCwCFx/NOlojmFxNaTp90VWSGoMN+4QroNA1cqQsaTu745
	seNDzFHtSjfkgXzT1EEAEcy5o34BFAF+ZWWVS92MZDnt6ZOfJ5ejrdKKvlXFjlb60NI40etUJCO17
	e9f38YtDSUrsBKnzl+xbLwj37fkpvW993ckWTXj89DRraxo9AjFUzklEy7i6oGYVm1dT8CHdDgzka
	N1BzM8tZEQK57n+fy5vdwhv5tVDVQWx2G/3kEeaiUoTfmclluOr12Y4frhS9ypN4ILtz/nyHKBczI
	QfB7D7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJuO-00000004KDx-13xt;
	Tue, 20 Aug 2024 08:08:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJtV-00000004Js3-3m5o
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Aug 2024 08:07:12 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70d1c655141so3326755b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Aug 2024 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724141228; x=1724746028; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2IqJ1+bkvBcuO0rX2Lm5C4OmqxXFYhn4ccngQPHsmSU=;
        b=LXG9mKKtI+nSGkdH8RpFzYrDZt2nadsRR52wP4nnvqQNRgqFu4VAZp8R3ouGUbPZeL
         oZdoX+pErTziUCB3TlUKpDphYlAam+fVVPW3ZrVuoUBWB3r5PRuk1miZHk+bCF5XZHvD
         ntpk4lD/2pOCrdAuLp+hIcgVFfFqowgSjt8+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724141228; x=1724746028;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2IqJ1+bkvBcuO0rX2Lm5C4OmqxXFYhn4ccngQPHsmSU=;
        b=XUU3PaspO8a19VbInjumfAVm2WEun6058Hng2jNXiw8M8IkuRSjMhLFxKeu7BPZrZ7
         vttuv3hIWHDUw4wTLhBT2s/JvjiR0dszcFwfcU3wl5bDOn6Wwkes8+kFzphqyDKNDwVQ
         gjU+jQX05Y4Z4Gpd95Zqlf9jEwFasoTaEU0/IsDglMmXgh9whbVsamL5vOLvvSzweepK
         BjggPxTGstPMsswjmV/jSUQMKSFjxMkgkGBqOiQY74prJPvVWhgeDAtPLBZz0x/GrG4l
         NqD8T/grDZ5sxp/p8fA8c7yzTnFJVfjDkbdoQOB86MLngWKuws1Wil21yDaH+TEHhkKK
         MxnA==
X-Forwarded-Encrypted: i=1; AJvYcCVHkyOdwvJPQTQYmXCYUfaKL2o3AC0ZCA/JXfL0tER0AyvsuGbg/bjBVomjyykWNsdeI2RE+0BiBXwpYAUktGLNLoo0FNmPR7X6b7506fxtiDrP
X-Gm-Message-State: AOJu0YyCxtlsGsHlZBrzHbQ54skQz0ugH1Zk18T5xcFIdg5h9Eb+xI43
	UPhFOfscv9sLSmESmqPzugWc/CHuIk4HgwBsIXoGjxBXyN+lEa7HXYgSNFpuTQ==
X-Google-Smtp-Source: AGHT+IFsp879gvOCuiWqNYPlJhONwAUWVejcI/mL94YGseUTQfzsKn3hYBaN2GBrQLgP+qt+XwaKyQ==
X-Received: by 2002:a05:6a20:e68d:b0:1c3:ff89:1fc6 with SMTP id adf61e73a8af0-1c9050586f7mr13067519637.53.1724141228509;
        Tue, 20 Aug 2024 01:07:08 -0700 (PDT)
Received: from localhost (185.174.143.34.bc.googleusercontent.com. [34.143.174.185])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-201f0303435sm73051755ad.42.2024.08.20.01.07.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 01:07:08 -0700 (PDT)
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
Subject: [PATCH 0/3] Devicetree updates for MT8186
Date: Tue, 20 Aug 2024 08:06:56 +0000
Message-ID: <20240820080659.2136906-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_010709_987086_10608554 
X-CRM114-Status: UNSURE (   7.70  )
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

This series updates the DPI node to add power domain and
adds the Mediatek SVS node as well to MT8186.

Thanks,
Rohit.

Rohit Agarwal (3):
  dt-bindings: display: mediatek: dpi: Add power domains
  arm64: dts: mediatek: mt8186: Add power domain for DPI
  arm64: dts: mediatek: mt8186: Add svs node

 .../display/mediatek/mediatek,dpi.yaml        |  3 +++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi      | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)

-- 
2.46.0.295.g3b9ea8a38a-goog


