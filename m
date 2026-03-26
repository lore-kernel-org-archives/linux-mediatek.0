Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3BA106F2F3
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 08:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oI7ncm47EFLHRAd6LbtDz8JRD0+IusIPO58qA+zSWN8=; b=gex88M43+y0YBGPPFFqd6KxhCn
	e3wfpZfIJOh5U62ij8X73FPi3Ek1yi2oYJjq9FrMhmig4ab+bgS/DYzyq1GV8RcWyshS/l7Iv/0vE
	rJBlSYhn03aGp0CRA6nYGSshCBp9+c3MPr86Yo+EZv1pPseXJ+kRJXfUHmqjpdfcceog7ExiYexXB
	hxxTEmjJdMeRhBDpE0BcaVU41OC2ueMYBNFEm7x+LumkXzTG/FtcrA4+SoLYpVdQjEXoSr/ACb0+j
	9Z/Qf6C+M15ZxMQBZSO7KnZekkPUpOKGSJKwrJ6C4JqnPNxQegrxC0lK1oA7wzh8EITGfSXoE1eEZ
	wfNdWjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5foC-00000004zWN-44WU;
	Thu, 26 Mar 2026 08:11:16 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5fo9-00000004zUS-14vQ
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Mar 2026 08:11:15 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35b905e9dc0so440322a91.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Mar 2026 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774512672; x=1775117472; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oI7ncm47EFLHRAd6LbtDz8JRD0+IusIPO58qA+zSWN8=;
        b=C2IcFzdAxnI9vVc4Gku9xBZbLgdWAM9vItxY5FqZz6C3LgKEyU7F066vkTTYjLdDXb
         j/0ClXZtOK5ickvzpL0n0b0DBGTlRHT2miUvkkl9otA4JB4uveF9tULgwhY90JQEj2w0
         BNmnlXRT7D1w6/ktMq62UyujK1//JlNS2k4kQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512672; x=1775117472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oI7ncm47EFLHRAd6LbtDz8JRD0+IusIPO58qA+zSWN8=;
        b=WrWPe7OiMjM17MrlviyzJjz1MnUYVcRb0A3MTJmMv45Vx4jD/wM9QUEtegCD/n/lMo
         CeGQNyQ0Dzl0o60zY+Ve/J6FfOd4wd5DQ5kLobj3LW6+9eiXs1R80k+HNido/nRMI7Sw
         5SyMnzp2ejcglBWoJS6fW8IThmU+U7/bKDyS02caPdA6+Tqa5neXTq22xD71B8B5nGY0
         agJjTFS6mZUf18+/7ecU+JIqMMzP3Y0H3BdZlbOdrnM3eFA2vBbDRZzicFbTE65yeRaK
         YxCpSJzJkZ8SyACnyDrTW7+a4G2HXyHXH1izyX53aVOyPC8Rk9zcIeCUTmsCdgxvUUxF
         QhpA==
X-Forwarded-Encrypted: i=1; AJvYcCWjGmPA7q9xmOjEAeqAwlqOCOycYjfTG8Zx+BG61imuOPEuGAesiSClusxgXXKJSioQohWljwo1YkKuo4JDIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwtW7kvokqI68wQL2zr4T7alDi7CneSm/+ZBT3XImTJoEbNBLE+
	BmU073Dfg0hLUQRlzWjCiP6MrDD8uo7/DJSH845WWFdonnL0syoMrcVfTK4hHKP9SA==
X-Gm-Gg: ATEYQzzm0pmrJVOtZlkUNOdIBb5URjbCsv8rryFmDWPqNoEO3B6DQdExjFwHSWGatmw
	0lLiBNU8uCo1VqGMoqPS96jKmAJ1uCxAmSNwTGUQTFj25Rl+0i2ODeOBkF/xiTUFcjar1WucYq7
	9R9kLikgIN8Fi9Un2pGHhF9Zok/1sCUJFhjOXE4c19Mn9p/j9uyo7Q+36cmmy5/0YxzzrzeStF/
	yD8ZYhzsItnEsygwGwATPIhJfaLYy7esd8ujrtL6rOVGmc1GZINTPSuBTtp/mJs6L64RnELWgot
	e7Lggf3NSA4w9xPJqY/XrRa3u1nl+MIgTjw2mhHVVHaJz/wIAYLsCWiBaYjg1bVYqBusLwP+8H1
	A5qW772cFJy46AnBGv21dTWDX16OieiKr3tpNFbtpITDA/1wPlmBxH2RVm+jwoYpskmPEjh8/iA
	UYL5mjguCQP1D9M7hqSsnk5Aw8ANcq9g5jhraIz8oWx65Iy1xEUSwEMiuoVSt10wKFgJnKuULpZ
	T3TsAnFWrOX2Z744BY=
X-Received: by 2002:a17:90b:37c8:b0:359:fe72:3559 with SMTP id 98e67ed59e1d1-35c0ddad8e2mr6144191a91.21.1774512672187;
        Thu, 26 Mar 2026 01:11:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm823452a91.16.2026.03.26.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:11 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] regulator: mt6315: add regulator supplies
Date: Thu, 26 Mar 2026 16:10:47 +0800
Message-ID: <20260326081050.1115201-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_011113_331437_1F754D03 
X-CRM114-Status: GOOD (  12.66  )
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

This is v2 of the "Add MT6315 regulator supplies" series.

Changes since v1:
- Link to v1: https://lore.kernel.org/all/20260324053030.4077453-1-wenst@chromium.org/
- Move supplies to top level node, at the same level as the compatible

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  regulator: dt-bindings: mt6315: Add regulator supplies
  regulator: mt6315: Add regulator supplies

 .../bindings/regulator/mt6315-regulator.yaml         | 12 ++++++++++++
 drivers/regulator/mt6315-regulator.c                 | 11 ++++++-----
 2 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.53.0.1018.g2bb0e51243-goog


