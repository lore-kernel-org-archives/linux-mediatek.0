Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B939CC54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dRY0pVFx5hvWyvGusyC9aLcoBfDJnjCMV4j0O5N7/aM=; b=bbHTtGGkpi7yWN
	K7V7AtnZM39WjXPJXrVQ7mtYU4PuuBxjofDpUrLUJuzGqyt8MX+UvLpvKZ6AvCHyA7ihW6hhLadgj
	I4eFISmV8jTrIN7VnRZ4nNdSsmx7QJ2WRBP3TqaDkWZPtObFkVw/ppDb1pANN8HD/I1VQgFXWFoBS
	R/yMVXXi7YWz2sXHGZKoGe8v36JDIoZV7bcm5Z0hbkpkDHVrtu0lbwpPgBW5DlBRMs8yZK8ZI1RRu
	kqMw4oQTRUhr1IuCuP9zV5msDL9LhnvDZwHlhGcY1zig1C8gAS2Wd3c3Ry07M9GwaOvWEaYjdMJYx
	dl6nYVMZDGFrCC1GRNdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCYj-000000028Ga-16xS;
	Thu, 21 Mar 2024 07:09:53 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnCYg-000000028EZ-16fY
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Mar 2024 07:09:51 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e036b76725so4728735ad.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Mar 2024 00:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711004988; x=1711609788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dRY0pVFx5hvWyvGusyC9aLcoBfDJnjCMV4j0O5N7/aM=;
        b=LKl1NVa+Nq1w5PjL8x8lWWJurYyFiTcrorlpBAKSCKxhYMX5Zk+bMjUdpZbhZpdDRk
         D7ZnuN8fiJ/7IVZOYz44f2Hs+KhZ3WicYaVgQCijy4/+FeAE1QrZalXXyZqiv+71CsMM
         sgSZ24KouYVXr9n4VlYzVdu0pB6PIl4250XpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711004988; x=1711609788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dRY0pVFx5hvWyvGusyC9aLcoBfDJnjCMV4j0O5N7/aM=;
        b=qq6nEeF0U/OqcYIJbyVAUJ5lnxiGy+g1zELIEqge4WC5ZhLH2Rcpuygfhur6jC9+BU
         LKkg7Lh7z1EvkQz6UJrq1yYhuSOaX+kG0lvY9UglHwkCy+WhrcESKlmXiFrvXLVyvmPQ
         ydzQkvMF9cZO+v/nylIAb/MXqmGaRP/WXyLlVOhcbX812btuZh3awy7KejJJHOr2qnUz
         KUsGazlBG9GuHMybtVcNttDeCMZZnHm7kkJnhhY/lYGNG7N738LDdvlRDRubEy7g1BHj
         BszSS/dZXvGfEH+JJDpHXQSjyWNZAhFVrRM+IbUiP0qbfBV3ZYeBkDVi7HuUx1gWAgGD
         onaw==
X-Forwarded-Encrypted: i=1; AJvYcCXcKU7KjSIlVkXMdRGGU+/vif587SbITpvsKV+3+Hyud8azupyCI0Su69/IFpx+NksUvvlwPt06g+BpFXmivfbmQKrrekiFzb4s+wpeMTgrFFWP
X-Gm-Message-State: AOJu0YyNMBU0k30kBCFsU1/JO+thHJIsJiCMtikA8gc2H3xnqfDhLLn/
	HDk+rZbSNCbZQDyXwY9i8KPYW9+VUlJ/vvSe3hp9SjlhBgzBoeXL0+XQmuHk3A==
X-Google-Smtp-Source: AGHT+IH57yxJiEyp3oRKr8txV8M/DfsK8WHQOpuCYRXilXXDGc8rC+frhVE/5DbrWBUAwhTudJ3yqg==
X-Received: by 2002:a17:903:13c7:b0:1e0:11a4:30e0 with SMTP id kd7-20020a17090313c700b001e011a430e0mr5267687plb.19.1711004988238;
        Thu, 21 Mar 2024 00:09:48 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:c1ff:a4cf:ac35:8df6])
        by smtp.gmail.com with ESMTPSA id o1-20020a170902d4c100b001dbcfb4766csm8705582plg.226.2024.03.21.00.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 00:09:47 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] Fixes NULL pointer access in spi-mt65xx.c
Date: Thu, 21 Mar 2024 15:08:56 +0800
Message-ID: <20240321070942.1587146-1-fshao@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_000950_316340_7DE512DC 
X-CRM114-Status: GOOD (  11.62  )
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

Changes in v2:
- Restore a missing curly brace being dropped during rebase
- Fix a typo in commit message (trans, not xfer)

Fei Shao (2):
  spi: spi-mt65xx: Fix NULL pointer access in interrupt handler
  spi: spi-mt65xx: Rename a variable in interrupt handler

 drivers/spi/spi-mt65xx.c | 48 ++++++++++++++++++++--------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog


