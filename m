Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEE3C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 15:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0NMT354TdG7a+Mjd6nR8XY28RmDaq3SVnAflnava9+4=; b=kdTaY8Rvy34Cu7Pbtxu0w0j6Fc
	enXsxksNiPDGgB3ZYEhtlZUcJRWZ4FoxYd5Et+Us97vMuEkvRHiF4aTI4gpTT5DuhObUwJz3el7M5
	axxGeCKNkLx7kdT22ay8lz+4TizjGkeahkXBkRC/iMdBhF6QouaPCFV8pFegQIdloZnwT7LsS4TEa
	AiwoYaazHa83+fehXxLsNb6PRrR+mkUAMmQrzEQ4jXDIO5y4i9H8qDiUagtQiU9bqJJ6/pg2GmAc5
	jeUh0LR3KD3Il1EBUM5fUU6dxBnBD9YpncrPpXV08WhvCcVtwlRvpLOEysWHbffhgfFiTjms5iqBG
	0ukkgEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZVN-001IUD-79; Tue, 07 Mar 2023 15:45:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZVJ-001IQJ-53
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 15:45:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id h11so12580800wrm.5
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 07:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678203927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0NMT354TdG7a+Mjd6nR8XY28RmDaq3SVnAflnava9+4=;
        b=hMkvX07ZWoEiUrNshSUONwBDA8mCpjSl9GndL4JQtN8MUn8/BnoS2vISYH7f/VMaBf
         3hveIte2Is2YGBevN1S5N46ox8c4WHSl4yZCnT4eydXX6lN4ozH2k/5Z9P1C1p2yY6Y6
         UXvo62ShrMcy7kC0Wpd3efQsBiXiMT5Vi24vQ+bIxtTENvmbWZt7b5w+PIFu40sgcf+w
         4tcZHu3Ncvf7+aFNMnKhCIWk16fLycz2FCVwP8noBTWbzETc0mefmwm+lz58SGhoQNbg
         z80QcsPVIuLS3/Au9xz8pUr/yUVnBkLaJx1LSJmLuXzSvsLrN4xxUONwQYZZyY6efQkk
         fErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NMT354TdG7a+Mjd6nR8XY28RmDaq3SVnAflnava9+4=;
        b=W6gVrjfzgP5ep3zoeWNhB+oqftylfGYSgRBvg3GVHAB9V9hGUDuYdgXRgPE3niwK4M
         28s65EWUOl/7sYPm5n6Jns8fsxVu2q9kTfFBQPjQQ9M0QxtL16A4fbsCkMq9R/1qdmro
         9kj8rDwhv5dDbFGQ4YmV0noXqXVxAFRugTO9p35ZxpDKIKmiYHCVLVLDBpES1K0VHTrP
         iwYjPBmGY294ViCfg0M02aFuiPevcDc2X22TOeMZeO8yHdOKMhK4QjJ7bYtOsNLiVKv6
         lfOM85Bx5tA6uva4BxndRWz4levN9kj+kMk5yk1dyHdkWaYjRkDdLhD2lSveYEpDU1wX
         fXfw==
X-Gm-Message-State: AO0yUKWzD0lC7d7RDKiQMfsI1OKxM1hlgZPDxeLAcCNNoKvWsfTxa8tm
	4bgdo0L8PjW+1QAHWzZTf6YNCA==
X-Google-Smtp-Source: AK7set9EHu+HV/Mv7v6/4EnH+ZLw8tMFVfGqynaBEs9+XXablQK4YXk5bcSSsrLRLVgmSo2ZJFT/wQ==
X-Received: by 2002:a5d:4bca:0:b0:2c5:4ca8:a5a1 with SMTP id l10-20020a5d4bca000000b002c54ca8a5a1mr9236688wrt.23.1678203927555;
        Tue, 07 Mar 2023 07:45:27 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b002c704271b05sm12697905wrt.66.2023.03.07.07.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:45:27 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH 0/4] Add LVTS's AP thermal domain support for mt8195
Date: Tue,  7 Mar 2023 16:45:20 +0100
Message-Id: <20230307154524.118541-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_074529_227968_866B489A 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add AP thermal domain support to LVTS Driver for MediaTek MT8195 SoC.

This series is a continuation of the original series "Add LVTS Thermal Architecture" v14 :
    https://patchwork.kernel.org/project/linux-pm/cover/20230209105628.50294-1-bchihi@baylibre.com/

Based on top of thermal/linux-next :
    base-commit: 6828e402d06f7c574430b61c05db784cd847b19f

Depends on these patches as they are not yet applyied to thermal/linux-next branch :
    [v14,3/6] arm64: dts: mt8195: Add efuse node to mt8195 (already included in linux master branch)
    https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50294-4-bchihi@baylibre.com/
    [v14,5/6] arm64: dts: mediatek: mt8195: Add thermal zones and thermal nodes
    https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50294-6-bchihi@baylibre.com/
    [v14,6/6] arm64: dts: mediatek: mt8195: Add temperature mitigation threshold
    https://patchwork.kernel.org/project/linux-pm/patch/20230209105628.50294-7-bchihi@baylibre.com/

Balsam CHIHI (4):
  dt-bindings: thermal: mediatek: Add AP domain to LVTS thermal
    controllers for mt8195
  thermal/drivers/mediatek/lvts_thermal: Add AP domain for mt8195
  arm64: dts: mediatek: mt8195: Add AP domain thermal zones
  arm64: dts: mediatek: mt8195: Add AP domain temperature thresholds

 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 180 ++++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c       |  94 +++++++--
 .../thermal/mediatek,lvts-thermal.h           |  10 +
 3 files changed, 264 insertions(+), 20 deletions(-)


base-commit: 6828e402d06f7c574430b61c05db784cd847b19f
prerequisite-patch-id: 73be949bd16979769e5b94905b244dcee4a8f687
prerequisite-patch-id: 9076e9b3bd3cc411b7b80344211364db5f0cca17
prerequisite-patch-id: e220d6ae26786f524c249588433f02e5f5f906ad
prerequisite-patch-id: 58e295ae36ad4784f3eb3830412f35dad31bb8b6
prerequisite-patch-id: d23d83a946e5b876ef01a717fd51b07df1fa08dd
prerequisite-patch-id: d67f2455eef1c4a9ecc460dbf3c2e3ad47d213ec
-- 
2.34.1


