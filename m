Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CD5C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 06:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XtvNQiaw+2/IaxnmzdGoLxqPTPX+iJkSvUz6nFXt6OU=; b=lFoZzxuYd5kvQo
	85rMxMmU7yvAiHBK3FFr1ooPIASFuZnb1rkOSFAm7HSnbh6VEX8YDn3+p1tQspCC+HwPfp11VUEuJ
	rcHRmkiKibizI36Ayj5AAbLT1CMNxyrL+IC4BNQwTbhyKQZxtTm2SnB3Tqag7n+wyOm4t878YZ9dR
	GSulet5XclioBkzwPuQSn9+520re+nCyH28Mhzss+qJPfHT6AoYnkUrw6+gcrW1lAr1kU9GNpv0Ca
	jKE9QqvdfkiBJdJOMhCHmPfsM5Irli2mC0zePXK+1T4yCMgZgaxgg6mEMN3VubT9/7Q06aSKqjazC
	opTntpVCh8evM77SSFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCGV-000000025O5-2Iel;
	Thu, 21 Mar 2024 06:51:03 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCGS-000000025NP-4Azd
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 06:51:02 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6962a97752eso5120276d6.2
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Mar 2024 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711003859; x=1711608659; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XtvNQiaw+2/IaxnmzdGoLxqPTPX+iJkSvUz6nFXt6OU=;
        b=SJ8/wnZyWQEnutM1ekLMwNEMDqgIRr+O/9DqBsZ+92/eLt25Woq6d+mECTqRnWEmfU
         qtWjoVx21jyaDUj+rtPC+DUNniImmh+07hUhrURyT7Qp0FBChXgPvuQeUpQF8a4pHXU5
         hGdCUAXzUYsuIto6eykMB0YhN1DIuuL4D7RSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711003859; x=1711608659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XtvNQiaw+2/IaxnmzdGoLxqPTPX+iJkSvUz6nFXt6OU=;
        b=B2XbJjsHZFIdlDOQW70dofyGbZux2rLGK6Fkh7l42n+CxkL5ORYJTwTtUaqVytS31L
         0ddTj+GWjfyxv5KpW24CmT6ZB5gS0EJN65h78xcSJt5KC981XbkhDphXqh+cEjPK+xtu
         4o8Nq3nyLIZkXHJQofIEXKhJxmlI4iHgaF7KWJkVNFeGzxjTskak3SKAsqdJhsXrd6vE
         7PpIjgmgYo/mn+xJ6RoQeVA0pcp6UpCl6EJ7vNkl2pYufjj7k5O5K5A+EwrUV613CUYC
         SMhgU8bqcT/Gsb8TRpt8HEGI0RDP6P7OVoWKbP5861OkWcXXOQrgEyCBC59IDAAmuUv5
         I1Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXwu+9+i33pOGfTCFodlUDHNkn4yNwLRWUAhEe5UZyBYLKTTjHItPCI3Ix0Q8zGwRrUBLUlAxR3Df5M6VdvBbSGQigEBV1ga3yub4GkPVeiIBmf
X-Gm-Message-State: AOJu0YySGBgKHuj74IG+UvdLwFkWsxRKKo7Jlx3Uv2UT6wuIGLF7QZSA
	0w5rwJJ3gqXwIBPnai7kC+qZR1vIh6YaiaVNEEwelzG6ApJ7ZH9DPOzjnkM5ZuimAuO7FrKQJqk
	=
X-Google-Smtp-Source: AGHT+IHWd5hWPmT05m/dMO6abQe1VIjaPIiKOk2TwZu/GsKoXdSkfitV4XwZzfzNFOrPnEs3/o8wrg==
X-Received: by 2002:a05:6a20:4907:b0:1a3:4469:5967 with SMTP id ft7-20020a056a20490700b001a344695967mr7091773pzb.57.1711003407287;
        Wed, 20 Mar 2024 23:43:27 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:c1ff:a4cf:ac35:8df6])
        by smtp.gmail.com with ESMTPSA id lb3-20020a056a004f0300b006e664031f10sm12874938pfb.51.2024.03.20.23.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 23:43:26 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/2] Fixes NULL pointer access in spi-mt65xx.c
Date: Thu, 21 Mar 2024 14:41:00 +0800
Message-ID: <20240321064313.1385316-1-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_235101_143181_B69DC6C9 
X-CRM114-Status: GOOD (  10.08  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Kurtz <djkurtz@chromium.org>, linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series contains two patches for spi-mt65xx.c, both focusing on its
interrupt handler mtk_spi_interrupt().

The first patch is to fix a NULL pointer access in the interrupt
handler, which is first found on a MT8186 Chromebook device when the
system tries to establish host communication with its embedded
controller.

The second one is a decorative clean-up when I'm working on the first
patch, which simply renames a variable to better follow the rest of the
code.
I put this after the first fix because I think that will make
maintainers and users slightly easier to only backport the fix if
needed.

Looking forward to any feedback, thank you.

Regards,
Fei


Fei Shao (2):
  spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
  spi: spi-mt65xx: Rename a variable in interrupt handler

 drivers/spi/spi-mt65xx.c | 47 ++++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 24 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog


