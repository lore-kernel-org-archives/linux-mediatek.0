Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EF7C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 15:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IAJ82mW9jC0IXftVu8qW9GYnB79QTVTOwepEtw8YmC0=; b=vHd357NUnZZ5xL
	Pza0r31vNvJTmgXTxwYOdTwm7Vr8sH42NUhAoqF85HGor11LgWHecpOk04YtLs7bxhJ+rirASehLL
	vE+Naq5xvIHgcmwl4eYN6CCKAedVPLK9SawjIMmSAr8mIbQSbQh7bR3b6gqRqs5yugqNxmq4qnJcA
	V0uKHimcTG1kLk3AZvdOGnjyTuPQAhQxf0KUReDicizFgumRb9rJ3qXLtr0vvlnhl86ohdrvHD4D1
	mm569/0oWjXOUXVTt7KVUbkRXdDH5s6klTTJH/+H9zk1oej1xol9L/eo/Q18PsNEpydAcnK2a8reZ
	J0bDrKMOb3TJsvKaa4xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njMgE-00F4z2-VV; Tue, 26 Apr 2022 15:00:43 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdA-00ElsN-Gk
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:30 +0000
Received: by mail-wm1-x336.google.com with SMTP id y21so11261029wmi.2
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HLJnz9MokKkB+U5oQzpDA9G/KHSO8v4jgfZFYkQ81pM=;
 b=puzYB7lEhhrKLWmXSnF+wAqJuTYyKb9kgmhuFP7bzPkxXiLtDR0ZcdHClTAOr3KqtI
 aS/uIVRKlLYA1eD30qVYa5k5Vv3SYFPu3aUDs9meykBy+qNTUp/WpX4ZD5YG8/JodX9E
 lrPDKOQrRS/ia+J7XqMJMYkJ4VUuRpWKYhF5zklouogG0Cm06GYZ+LpB+bFJnFeVmG/H
 RKpdRVrO0WDjQT5u6DRlF63Ho3zWjHx/X2zPnQPdT90INIabsZqrD6ytcfgwr09QA/ZS
 Czh3KTkqFPcpfG4idJ9LXahALcebBTsY0vFBC0mjCER2RGES+wvgH/+cEP90UGDONBOS
 k4/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HLJnz9MokKkB+U5oQzpDA9G/KHSO8v4jgfZFYkQ81pM=;
 b=zpJj3FSYpK7yr/dGpI3Ct4Vi6hfm+DWtPNQA7HXp1CothuNXelZiFBnOpZccMXnL2X
 D/T3VYtB77xsBeIKv/I9NN1GnY707mB01/Uf0O5CaLJp4nG/ZLI6TvFED8rE2MWpeuqe
 oIAW7VsEzFt1LjxkDyzUzpX3G3sqZel3BxBnVcivst0ygzX3l5IyJKUzy8MBh5T5tn46
 mRj8hdZ1Y1u1/X8ytLKAVt992SO8WbSiZzlOFlFOlDBlYc5iJoQPUJn8LkK1Pmjh7MCt
 urxM9VrixN1h0dIAQhNa0HoXj2uquEMUzCk7xuFaxFmXdQZw8CRd3KJNyagVzFiIBIXS
 YKVw==
X-Gm-Message-State: AOAM530a9PUYv5psubh6Ny7Iso0cZ+MT6uyyyeW5nQbQIdGVORN4B8El
 Pj/Vanx9LJQ3cO4oA85UFtoKRg==
X-Google-Smtp-Source: ABdhPJx5WaScokUfQfZ6wBpQBnFbYiDUItwrUt7kmSWN9s7oUNqrW99/BpoHXPPyuxL0ub5y3Y/Y5w==
X-Received: by 2002:a05:600c:5c8:b0:393:eba0:8ac7 with SMTP id
 p8-20020a05600c05c800b00393eba08ac7mr9901074wmd.108.1650981206986; 
 Tue, 26 Apr 2022 06:53:26 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:26 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/8] Input: mtk-pmic-keys: Add support for MT6359 PMIC
Date: Tue, 26 Apr 2022 15:53:05 +0200
Message-Id: <20220426135313.245466-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065328_599970_7C333E7D 
X-CRM114-Status: GOOD (  10.85  )
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

This patch serie adds support for the MT6359 PMIC keyboard driver.

This patch series is based on the MediaTek Maintainer for-next branch: [0]

[0] https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=for-next

Fabien Parent (8):
  dt-bindings: input: mtk-pmic-keys: add MT6359 binding definition
  mfd: add missing defines necessary for mtk-pmic-keys support
  mfd: mt6397-core: add resources for PMIC keys for MT6359
  Input: mtk-pmic-keys: rename platform data struct
  Input: mtk-pmic-keys: add field to store if PMIC has key release IRQs
  Input: keyboard: mtk-pmic-keys: add support for MT6359
  arm64: dts: mediatek: mt6359: add node for PMIC keys support
  arm64: dts: mediatek: mt8195-demo: define PMIC keys available

 .../bindings/input/mtk-pmic-keys.txt          |  1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      |  4 ++
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 11 +++++
 drivers/input/keyboard/mtk-pmic-keys.c        | 41 +++++++++++++------
 drivers/mfd/mt6397-core.c                     | 13 ++++++
 include/linux/mfd/mt6359/registers.h          |  2 +
 6 files changed, 60 insertions(+), 12 deletions(-)

-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
