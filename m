Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA13C38A02
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 09:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f58UwhQpDHzczA+5QKtK6sm9tfcwbG82pZn1CGvlejc=; b=iSIThBvow9kfLddv9hdELo4yax
	jvtFtJkqL8G2ohRt/ti/4CpWPS/NOPnH63iV5oc9EXaE18RmuZQ/FKn6K6QMZIDyZ2QV5XlZRqDee
	h38LYg46bgT03AS9tR1k+txaGmowzzmqgflSkQLe6nYhVhsyOPBAT+JiPw9btEsqzZeKXuCCaD8zI
	MFLi/3msDXns+otxR3gA1AAkRO23XwmMS0zdXn1AWo5ZFNkxkkeMrwkwBIBq/Q8YrXnUusoWNxQpx
	RCx643Fcmb2CprzSRreN7ht68PYJ8Ov5TjckFYTm2aRq05UY0cPsYInLo7uJU3e/DOlV8lgzSXprS
	tSFwgb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRBZ-00AAYs-2e; Mon, 31 Oct 2022 09:34:25 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRBU-00AATq-42
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 09:34:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id h9so15150046wrt.0
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 02:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f58UwhQpDHzczA+5QKtK6sm9tfcwbG82pZn1CGvlejc=;
        b=cLu03t97Aow5oHYipvaLKKPRdGvr6iO8PWNY+ymOA3JvW1h4iAwXc8QZkkfFCQmsKL
         XuoRS7hclJeAHZ3VlJdTltoGAzs2V+qSYxiYXynkp+A19G4LmnlfuxjtdSviPCjFInsN
         10dSgO622XoQYsMcIC9HS93qAv/Za+HZRYafRBO+n/STEaY8Edtj9rysHLgTcbblwQdE
         mpY1X3MkcWX2aXwycGPXmiD4PUNDSYMNwuJQPPMZ0LUhfRpk5OWGbHL4esNeu7MoidFv
         iQo6Ofw0G0QOw4P13KLLpk3mfI7cuKM0+oRfK8jR8GrW29C/ASRCN82j6CnXN5B7/ub/
         4liA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f58UwhQpDHzczA+5QKtK6sm9tfcwbG82pZn1CGvlejc=;
        b=kc+D2Mq8pVP6mvGZri/Am38Mc48VUasx9hUnNXXkqTzQfrS+PP43gKhGaY2BNqIUo+
         /7nLQuL89W591u8bOSM2Bzgkr5a30w+9CdjY4NzPiTCMjVQT8IGsXQxhBHWOxg6Q8qPQ
         sJBxj9wcHUPF0TNnpg2Y9aYQHTt6qPsgAM5/vZN10uju7vkz3aGe+WP6WWOR9c6JHiTe
         USZhz49LBQtNedmkoNpscsvLdObCS0ZYkiI0eN7Q1PSJoW+wz64XYS/mMy4TodSSKtCr
         cwJNZgORu5dnKFSTjkWBxJbvZppkPNXqU4cuVDxLBDKlNm91jAYcXZzK/PG4U+nXYQcS
         xp3w==
X-Gm-Message-State: ACrzQf3m61xUjOsrZj8um3pGBzOuw6gtBGEjCRLJh2YYOyQayVOt7+kG
	P4pe/mndWjwRL3NOYvnDPkGaLg==
X-Google-Smtp-Source: AMsMyM6pZk8bSEyO/Ya/5Vj7m9SXW6/Sj/biRPXj25tFFdwpGWc9kYXw5i5PoaJZpW2B7Hqo5LBO/g==
X-Received: by 2002:a5d:5610:0:b0:236:50d5:e6ec with SMTP id l16-20020a5d5610000000b0023650d5e6ecmr7391051wrv.13.1667208856455;
        Mon, 31 Oct 2022 02:34:16 -0700 (PDT)
Received: from fadwachiby.lan ([2001:861:3104:1980:6db3:63f:b30d:9361])
        by smtp.gmail.com with ESMTPSA id t16-20020adff610000000b0023538fb27c1sm6547566wrp.85.2022.10.31.02.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 02:34:15 -0700 (PDT)
From: fchiby@baylibre.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	"Zhiyong . Tao" <zhiyong.tao@mediatek.com>
Cc: Fadwa CHIBY <fchiby@baylibre.com>,
	Fabien Parent <fparent@baylibre.com>,
	Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/3] mediatek: pwrap: Add mt8365 pwrap support
Date: Mon, 31 Oct 2022 10:33:55 +0100
Message-Id: <20221031093401.22916-1-fchiby@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_023420_412661_ADAC4F32 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Fadwa CHIBY <fchiby@baylibre.com>

Hello,

MT8365 requires an extra 2 clocks to be enabled to behave correctly.
This series contains patches adding the support of mt8365 pwrap.

changes in v3:
- Modify "sys" and "tmr" descriptions to be more generic.
Changes in v2 :
- Rebase on top of linux-next/master
- Link to v1 "https://lore.kernel.org/linux-arm-kernel/20220530135522.762560-1-fparent@baylibre.com/"

Regards,
Fadwa CHIBY

Fabien Parent (3):
  dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
  soc: mediatek: pwrap: add support for sys & tmr clocks
  soc: mediatek: pwrap: add mt8365 SoC support

 .../bindings/soc/mediatek/pwrap.txt           |   3 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 114 +++++++++++++++++-
 2 files changed, 113 insertions(+), 4 deletions(-)

-- 
2.25.1


