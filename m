Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9F6CAC594
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Sep 2025 00:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cosKX5Xl7idwLQvWuO8wp7/WEaUIA3E5mnZgoJsColg=; b=2zyuXF6r9raJO34b+vKhrhamFJ
	ZD5ZQjN5yLmspGVgTf/INUMCkKy1MMNmbEFSqzRjp0t4o70NSmzoGqn1SZG4NueR9m9OUYGgRNQ0Z
	09EUDfEZdKItrUHuRizVcwOqTWIni7uKfT2gomvxaxP6JRihyJmN5kfRdhzDUtBly3RFVn11f/NHh
	qepCT1DQVKj/sp7eHIPqUurRibq05A78it9cmoTbR1+Lfscbn5Em0x7l9/VHnAAHIT7VPFK/WhBO7
	JVrY/GaKW9A4AC/JFjQW/GfkmSeF01sevDPPXCvNF6D96fMbtl7MrWjnBz4HqrJE2LWFG5R1PVuh0
	ETxnPBqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE1i-0000000CHmA-2mmf;
	Sat, 13 Sep 2025 00:22:02 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxE1g-0000000CHkN-0UGH
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Sep 2025 00:22:01 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-244582738b5so21130015ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Sep 2025 17:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757722919; x=1758327719; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=cosKX5Xl7idwLQvWuO8wp7/WEaUIA3E5mnZgoJsColg=;
        b=dj0JMGtdSYadext31wa/OeuHXOWskOj0mwU8AZQBvCzPvgKvVNdEujBiMBFuXoZhpp
         GVuHjJZVGRLrTnXe95zVIleNuSBA3qNA+T4qxmPySfJp1jolLttRJnvf/MmBuu0ZTPx1
         E1unzDpVyrB06jVsAc6avAp1yez1rQ4zjrUEh3uAusJ62jy/K+MSmbE5lx/XvpZ36bYy
         tN7ynugzQZZn6AOi4c4PVoaZ89N271nk2n83bGB2KbLbvptHUGY6xClGcRV95DWnRgov
         6UgEjrjqM4YHwnEalvIGQUL9pXu7P4mgYANs8XBlSXf2ZMWnIqS5uZmp3EnVFpecWJIY
         6/dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757722919; x=1758327719;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cosKX5Xl7idwLQvWuO8wp7/WEaUIA3E5mnZgoJsColg=;
        b=FzuxUcHSjN5zWB9Sjk8HccJZMoYsXLjJmdJ74cPsMGKNxND9XUl3VwRPVAiT4eNJ0+
         8do89AnvvFkhoD84FFjMNl6rGZVB28aNQY02DcFh4FFGp1YgHv9SaYwBnrttbuioPpt2
         uIbWsDUEbl1UfmJjbMFQWTa19NhmVq+DSE/rzUqh1HiMJI6T9qtzwX8h63MEIjO983iJ
         YHs06DXVvmUJCwwFQa6sNpvuyVwvTdJMuHchVHIxreancioRI9r4E9Hc5/b6yGShjoWE
         x2iN0LY0kh4tHMJot2ap2y5NNwiiXREbnM5OMNwrbzoi+qJQcrn3hQaZBN2AoskZtKt/
         SsKw==
X-Forwarded-Encrypted: i=1; AJvYcCVHtCxOU3WRBw+JmUrpq4DppufPVB42ZI/HMEhko+6Q2obAuWHS2n4wb1d4QVlWuyO0B2dwWM4dGxOPE98ruA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYF5xTRDhrGkfuYdIDeGpqGkuL2fpfWX+OMh0IKMniCgmN9qg/
	3guPrMgjnIo9OCrXCDTJ9G6T/lux/uHiGJ/20kfkhuiIPPc84YVOAs02
X-Gm-Gg: ASbGncs0TLuMAS8mIkhSIzlzTryDz6tn80DfWgqNi+6Kunx/ywVnfkyGmXTkQuXofnz
	fyS/66uCDU/vlUfzmrlWu9ycBRtYmC5r693Dph7NZM2D6eALaGnLgjl0dRGiWBh1fQtTFGRLbRV
	ODInGRTDOtMg7QNDTK6iL53A70JThB4wLN3nJRknsnfSqvTD3SgxZxGn83zXTjqxGQbWSevbXrK
	kdT8LkWq55qEPM5mPXaczCNX5gKRZuh7od7uny6FFEqAufjqEIoYwEo2WStnmGGOcm8Sj+Dn1ji
	Cv9sy+Gm7fLLn6eeRCQq16pMzs5gpabExWIQhiEVEv5bpfpGGD7wmqMMLhgLdGX+Pr3e93Fg1t0
	5sT0rnjV/4L/g6zkUIgv3APMMGQUhi4FbLkYjXrIg087fwZe42iDVjVjT0rhJsb5bJR1z7r7Pxx
	OxEpcOKLMh8Q==
X-Google-Smtp-Source: AGHT+IFohPP4U81t22Ynet3qFVaqgBlL6dIfvElA14+ZZZffQX0/DiVAU8HTvR3Y0I/KjtcyFh/Pdg==
X-Received: by 2002:a17:902:f54f:b0:249:308:353 with SMTP id d9443c01a7336-25d26d4ca85mr45666985ad.41.1757722919083;
        Fri, 12 Sep 2025 17:21:59 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com. [34.125.3.185])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-32e0c2863e6sm406490a91.28.2025.09.12.17.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 17:21:58 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/2] drm/panthor: initial mt8196 support
Date: Fri, 12 Sep 2025 17:21:53 -0700
Message-ID: <20250913002155.1163908-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_172200_155847_178A1E4E 
X-CRM114-Status: GOOD (  13.20  )
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

MediaTek MT8196 has Mali-G925-Immortalis, for which panthor gained
support recently. But the soc also requires custom ASN hash to be
enabled. This series introduces panthor_soc_data for per-soc data and
uses it to enable custom ASN hash on MT8196.

The clk/regulator provider on MT8196 is GPUEB, whose driver[1] needs to
be cleaned up and upstreamed separately.

This initial support also lacks support for some hw configs. On some
configs, panthor is expected to query a mask from efuse to mask out
unavailable shader cores from ptdev->gpu_info.shader_present. This
requires extending panthor_soc_data with a callback to read the mask.

This is an RFC because the dependent drivers are not ready yet. But I
would like to gather opinions on having panthor_soc_data for
soc-specific data and having CONFIG_DRM_PANTHOR_SOC_MT8196 for
soc-specific code.

[1] https://gitlab.freedesktop.org/olv/kernel/-/commit/170d5fc90f817dc90bde54b32872c59cf5c77779

---
v2:

- drop RFC as this series works with the downstream GPUEB driver, and
  should work with Nicolas's GPUEB driver posted to
  https://lore.kernel.org/lkml/20250912-mt8196-gpufreq-v2-0-779a8a3729d9@collabora.com/
  with no change.
- remove CONFIG_DRM_PANTHOR_SOC_MT8196 and panthor_soc*.[ch], as this
  initial support is just about ASN hash.

Chia-I Wu (2):
  dt-bindings: gpu: mali-valhall-csf: add MediaTek MT8196 compatible
  drm/panthor: add custom ASN_HASH support for mt8196

 .../bindings/gpu/arm,mali-valhall-csf.yaml    |  1 +
 drivers/gpu/drm/panthor/panthor_device.c      |  2 ++
 drivers/gpu/drm/panthor/panthor_device.h      | 14 +++++++++++
 drivers/gpu/drm/panthor/panthor_drv.c         |  6 +++++
 drivers/gpu/drm/panthor/panthor_gpu.c         | 25 ++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_regs.h        |  4 +++
 6 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.51.0.384.g4c02a37b29-goog


