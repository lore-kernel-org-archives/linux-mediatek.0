Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4130ACA0EE6
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 07:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NAqkPKV8FIclg2RIfEME8aNTCMBfxloXKZQVTM0jEG4=; b=Thce6nFHdYiIc1JEaOyJI+ba+v
	rbmD7aw5BAs2XSpf/xzRmSSGSk+I1/k+o56ir3KzmnR0hvlDA8auB2V/GVhhiBp0Ox1efibZErwp6
	15/oNaANsCG5bfYWTApOfXzCLGWrdH/+Gd2CvYVF+oIoV2kJpfMIfKBKmhmE95x6EPAnziF+gv7UH
	cA8xO7l2A4QF+kqWt3pEwa1/JcbY9T6FGIDkgvNqQqw3ILcXeLpCvz/ZIHEhgDkxztUcy0KJoT4en
	ZFgX5rFepzcQ1fjmW2NvOd8UgIxU9OokayxE2M/CZ1dEIX3vjGAQ3QVccUQBt5j/2b7hzlyC+YydT
	gk5S2m+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvhO-000000052Xm-3Qv2;
	Fri, 30 Aug 2024 07:05:35 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvgT-000000052F0-3Udc
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 07:04:39 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a83597ce5beso247179166b.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 00:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725001476; x=1725606276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NAqkPKV8FIclg2RIfEME8aNTCMBfxloXKZQVTM0jEG4=;
        b=RGEdPpKYUDN0rECUSMsbYvRPEbrrSvZWBQqtAcDTRELmBbCOVr3tpUfoMXJ2YsgOtN
         JiCZy19XR8oQmpQNSkbvz6eYcBBcYxzURbaegq6zysCfsTxcYoEmmTkb8ofBK8d8qIfV
         NL2jPmGTYELcuEkJ9X0Rc1haStInokpwybwr4B95diK9ZpIYPoFV4UV1vIGGgUnjQY1r
         McKX1YILymyYwZgkMVQYyzxKEKQzpIxbYnbsYH2K5iAGUnofO4iF3pMt2m/amDYEXpkc
         l0vbTGH/zgR9Jsa6eBsS7/HEN4SKqpCawHBAPaTsbEwHoEyRr8KCd132S9mf5oLG0zJq
         Q5Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725001476; x=1725606276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAqkPKV8FIclg2RIfEME8aNTCMBfxloXKZQVTM0jEG4=;
        b=SlKxhbqbrRENcjRrasnDJLerVSAhM8CIYtdcKc5VQRA2bfjxG9fHeyKJmNmVnx9XWj
         YR1CaZDOYg44PX/C61AldExuA8sElbBxCdJxAY2WOsMx7/BcFBIlA7Lmxp42drZ1gYrX
         6ou1gbTth06YGaSwDVGLih6yFb2wl/zAZBw/fLvZMpIe+XiZK5QJcKcxmeJbU1r4RhNd
         rKC9+JhQ4SZ2vD35WZZzrPLx7ALXcDpPHHkd7bIqvmkJdKegijf2VvO7c9a+FWeyy+G6
         bw2JDDAZfL99+Zbob78J5Z4cypYvlSZsbspIxtZIJTEsWEmuxEXacV2qi3JygwLpd0Ok
         OW2g==
X-Forwarded-Encrypted: i=1; AJvYcCVWUUeqangFKvhhRvmtTcglA3t9DJJJI1qNNmmrAS1+gIurfUo8+IuBiTHBq3RLvHOZduItHdNdpj7s4Ni3GA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyblShwc23eE9ga1a14yMinXx2qjGw/24MAiBWsBe9JD9fWqxe6
	EpjkFerV/ygtEENQbuAPV//qrJGIGPSe3Kb6ANG3vZV/s4InRA756q49USYibwE=
X-Google-Smtp-Source: AGHT+IFDgPRujvPs0pY58RBt0z0M4T/+m/fwfgJO35cZdR0pWvXLPvq+fQ5KKo/0SLFh8TiIvn9dYw==
X-Received: by 2002:a17:907:6d25:b0:a86:94cd:97f0 with SMTP id a640c23a62f3a-a89a26bfcb7mr138897066b.19.1725001475410;
        Fri, 30 Aug 2024 00:04:35 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892232c7sm178026866b.222.2024.08.30.00.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:04:34 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [RFC PATCH 0/4] Linaro restricted heap
Date: Fri, 30 Aug 2024 09:03:47 +0200
Message-Id: <20240830070351.2855919-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_000437_894399_ACC0031E 
X-CRM114-Status: GOOD (  14.99  )
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

This patch set is based on top of Yong Wu's restricted heap patch set [1].
It's also a continuation on Olivier's Add dma-buf secure-heap patch set [2].

The Linaro restricted heap uses genalloc in the kernel to manage the heap
carvout. This is a difference from the Mediatek restricted heap which
relies on the secure world to manage the carveout.

I've tried to adress the comments on [2], but [1] introduces changes so I'm
afraid I've had to skip some comments.

This can be tested on QEMU with the following steps:
repo init -u https://github.com/jenswi-linaro/manifest.git -m qemu_v8.xml \
        -b prototype/sdp-v1
repo sync -j8
cd build
make toolchains -j4
make all -j$(nproc)
make run-only
# login and at the prompt:
xtest --sdp-basic

https://optee.readthedocs.io/en/latest/building/prerequisites.html
list dependencies needed to build the above.

The tests are pretty basic, mostly checking that a Trusted Application in
the secure world can access and manipulate the memory.

Cheers,
Jens

[1] https://lore.kernel.org/dri-devel/20240515112308.10171-1-yong.wu@mediatek.com/
[2] https://lore.kernel.org/lkml/20220805135330.970-1-olivier.masse@nxp.com/

Changes since Olivier's post [2]:
* Based on Yong Wu's post [1] where much of dma-buf handling is done in
  the generic restricted heap
* Simplifications and cleanup
* New commit message for "dma-buf: heaps: add Linaro restricted dmabuf heap
  support"
* Replaced the word "secure" with "restricted" where applicable

Etienne Carriere (1):
  tee: new ioctl to a register tee_shm from a dmabuf file descriptor

Jens Wiklander (2):
  dma-buf: heaps: restricted_heap: add no_map attribute
  dma-buf: heaps: add Linaro restricted dmabuf heap support

Olivier Masse (1):
  dt-bindings: reserved-memory: add linaro,restricted-heap

 .../linaro,restricted-heap.yaml               |  56 ++++++
 drivers/dma-buf/heaps/Kconfig                 |  10 ++
 drivers/dma-buf/heaps/Makefile                |   1 +
 drivers/dma-buf/heaps/restricted_heap.c       |  17 +-
 drivers/dma-buf/heaps/restricted_heap.h       |   2 +
 .../dma-buf/heaps/restricted_heap_linaro.c    | 165 ++++++++++++++++++
 drivers/tee/tee_core.c                        |  38 ++++
 drivers/tee/tee_shm.c                         | 104 ++++++++++-
 include/linux/tee_drv.h                       |  11 ++
 include/uapi/linux/tee.h                      |  29 +++
 10 files changed, 426 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
 create mode 100644 drivers/dma-buf/heaps/restricted_heap_linaro.c

-- 
2.34.1


