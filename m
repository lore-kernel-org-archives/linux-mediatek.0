Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D73C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 12:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UXT3Y1yoFlCE2K2xjHRUWHa3VktsBApAqXlg9E0Hee8=; b=a2LSW3vzTZZMyn
	zDGq9c9Apu3x29Shc/SJb76ldN6jG+gNsSSsqws2JcSTt+8+8+hVrN2dQ4Ig3zpHDX9FQhOiSiTfg
	VL68oNWwCrFTRuIWSwyqI1gVbPaSD/bU/OiCBHJJR3agatXQT6Tngb1Wbxtd6UnHlWLs8E/gcHTtb
	B0g5LuAltZt0/i7TfD34QWVClaSoQbZN/nAErYIWBs/8HHL8KaedlRMTdqOf+tRZWKVO9oU35oCM3
	qbVzcTfAMW8pTUNPA9LipWoGd/b3ct8+r3wbzg9TI90okPUCCG0lHUqRlJ5CUVnYFkM2EYvfpCnjd
	tZu7jtFvTrD1wVCeYnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1KW-00ArAZ-6i; Tue, 31 May 2022 12:50:36 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw1KF-00Ar22-23
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 12:50:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id u3so18542446wrg.3
        for <linux-mediatek@lists.infradead.org>; Tue, 31 May 2022 05:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FiTOMXRe8vlWXX5ZGsKF0+eeCO/G5tTB6udDNKVnmPE=;
        b=8HsQJ3L6WZOvU0vtNb6X+iHBpXo23csxxrHnx76RQ1EDV5hD5CI4x2qohY7g+hqvhi
         wF2gAEHS000Q8Nt1LuUWiJnnoJvhYQ/GPE3OcPJlVBA2ozlDxnfKAmHklddW57tolyqa
         8MFONTHvlce0Yhta6o4RTz83Ki7QNW2gdLynMeIkDJQ8TF0ehzH4ufsbaF5yyP5i0I5P
         Fzgzm1pW3hLMdoJil54JYJX2+DA7yZznBtUd/pe2EHPpmKYWAycoFexXWOBDlz5fcUj8
         2IOMe+U6uoIkhnYBTI26nGJRT2JiaXeznaGjdInvslTQ6ygkXUn57zPIXaxHKFZgym06
         jliQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FiTOMXRe8vlWXX5ZGsKF0+eeCO/G5tTB6udDNKVnmPE=;
        b=WuVX3UKys0nVn6ECYH6P1O790I5CC7xobC62lYgjpg0NX3KF7mgFNBftBlBYBx1YkC
         FcBrXf5YCeW9zN+40RD+O2/bGt2Vqrto0WL5YvOQsT7eOD16jUbR9cs5MHdCmqxyKNZO
         OU28+8jJmet+pOmv6QN2io/XyEJiY3tcSgXiDDCi2psWYRPTadcO0jx31qMsaCNBkekz
         9nOaB11fVTlMfVavVaUf+HC1m86E6eotRcf8bghp59AsvljIwDyVj3dtwVm2eohDkx37
         OFkaAmOfJo3NFjxewYILV5lTNVkLLtLFsYnXNB941HwF9GloJ3/LmH9vhUi/Iwc1vJgc
         lBUA==
X-Gm-Message-State: AOAM530/a5teG6wo8KNObbvfMDfxPoYl9cizOK3vFLoAxMHvPi0a9UA1
	UOUd3QtoFCrWC+OUQy5W38SV0g==
X-Google-Smtp-Source: ABdhPJxX8HAWETf8YvOaGIyu8Ut750dVEenbQ2PDmalb23+KKtpTaED/IIOeHir/jTHgw9FivJ/EoA==
X-Received: by 2002:a05:6000:18a8:b0:20e:654f:a004 with SMTP id b8-20020a05600018a800b0020e654fa004mr48890004wri.672.1654001415254;
        Tue, 31 May 2022 05:50:15 -0700 (PDT)
Received: from helium.lan ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id i13-20020adfaacd000000b0020fc40d006bsm11475019wrc.17.2022.05.31.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 05:50:14 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/7] Add MediaTek MT6357 PMIC support
Date: Tue, 31 May 2022 14:49:52 +0200
Message-Id: <20220531124959.202787-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_055019_335459_C4D6D14C 
X-CRM114-Status: GOOD (  10.95  )
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

This patch series adds MFD, PMIC keys, and regulator support for MT6357.
MT6357 is a MediaTek PMIC very similar to MT6358 and MT6359.

The first 6 patches of this series have no dependencies. The last patch
depends on another patch series that add PMIC keys support for MT6359:
https://lore.kernel.org/all/20220415153629.1817202-1-fparent@baylibre.com/

Fabien Parent (7):
  dt-bindings: mfd: mt6397: add binding for MT6357
  dt-bindings: input: mtk-pmic-keys: add binding for MT6357 PMIC
  dt-bindings: regulator: Add binding schema for mt6357 regulators
  mfd: mt6397-core: add MT6357 PMIC support
  mfd: mt6358-irq: add MT6357 PMIC support
  regulator: add mt6357 regulator
  Input: mtk-pmic-keys: add MT6357 support

 .../bindings/input/mtk-pmic-keys.txt          |    1 +
 .../devicetree/bindings/mfd/mt6397.txt        |    1 +
 .../regulator/mediatek,mt6357-regulator.yaml  |  282 +++
 drivers/input/keyboard/mtk-pmic-keys.c        |   15 +
 drivers/mfd/mt6358-irq.c                      |   24 +
 drivers/mfd/mt6397-core.c                     |   44 +
 drivers/regulator/Kconfig                     |    9 +
 drivers/regulator/Makefile                    |    1 +
 drivers/regulator/mt6357-regulator.c          |  485 +++++
 include/linux/mfd/mt6357/core.h               |  119 ++
 include/linux/mfd/mt6357/registers.h          | 1574 +++++++++++++++++
 include/linux/mfd/mt6397/core.h               |    1 +
 include/linux/regulator/mt6357-regulator.h    |   51 +
 13 files changed, 2607 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6357-regulator.yaml
 create mode 100644 drivers/regulator/mt6357-regulator.c
 create mode 100644 include/linux/mfd/mt6357/core.h
 create mode 100644 include/linux/mfd/mt6357/registers.h
 create mode 100644 include/linux/regulator/mt6357-regulator.h

-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
