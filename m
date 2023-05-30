Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 309BFC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 19:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s4IP0REEtyhlwPhv3kFKNTWdtdlRtMxYQpQGr2LUnNY=; b=pE8vmUfzUWscWVAJUKVS8zZ4yf
	ylTXb5pXUrGx45jz+ulPXsG+MVJ2d53lah/ArZ7DZ58vosOH/N9UW2HUc3grnvY3MNwcoRN+jgd1b
	oVoNwDV2BgjefytBaWMp9tP8gZCHWshLIwRKRo9kONVwSTHHm96+D5sBAc1UEO3E0d2/OeIK/D6Jf
	g6gTGXotkmw71UEZii9ew6P39SYxLaf1NeAnOD50x2xrGaDdVSG5fDCcMuwm2rM0DFI7VbVElgZW8
	4OP1qIEuILgrbXoCTBBHAHXjf9cyPj+tgUkvYxVedDZNcbILlVBKb248zvAuBYjOf1DcxV6ZJogc0
	3VPqFbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45Nf-00F1VI-05;
	Tue, 30 May 2023 19:51:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45Nb-00F1P7-0f
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 19:51:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f60e730bf2so51023915e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 12:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685476295; x=1688068295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s4IP0REEtyhlwPhv3kFKNTWdtdlRtMxYQpQGr2LUnNY=;
        b=X+L30U6OtZYV6NJxpUsIT3EUrhXpO+Rbpc/CUuKMe+iH/8ojw0i3ru8JocPgpng/38
         a0kNWl5KuV4GRpMvk8GHofXjHk0lchRyG151rQ4piGvg5J+CExg9lPoaFDn7XvN8zjdJ
         P1mffWsVX505trVtESlZ7SF4MX+EIbn2yJoHjdzrRrdZZ+GUs6vsQCG6Jy6PLg1gdaZc
         DJ+qDA4ho3j0wzeEm9hw+0UJCILUGym0zbYTDYG+01BgHE02wLB1TRCr8MDvULDHLeta
         gp1+XIZJBDHf0V8Niy9lqAI9jTU7c+twzzZouPJcu8B8rh2HJVZtcnD08j6yAGVTYBz2
         EEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476295; x=1688068295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4IP0REEtyhlwPhv3kFKNTWdtdlRtMxYQpQGr2LUnNY=;
        b=LRLyFIIWaIIyUNEwUvTgZrscOyXIvo0Qe/b3UBZz/fKQV97w1COQ3nAekktqySqeFp
         FFU3M2hStkV+Q4rW9z3Gk6Vult5+DHa3Sls0OAp9Q4XweMnxU/qmCWiROJgmkYOTlXI/
         ydtXEiTtLzdbQv8rW3DFur0hWcuj6+rrLIQ18ttx4eKF9rUmudP1HKiz8I6/KSZ1Di8N
         AhJM/tjSPU20wGtcngjEdxazfh7nvUCu3VFtWEiZhDCclB8dg5uEyOb6kkF6aLUxKe1L
         3Q5EfTHZo7srqBSEA4WM+7OrQ/adnO9EM5UlQ2GJCWCTcRB9YfAqVQ4xhg4shtFsgJmS
         X3Qg==
X-Gm-Message-State: AC+VfDwgVrYMvXFzCzhXWUPk4Eu2Akh3WXF00JoQdZIg9RgXRncc8qke
	VMEmDapDP8KFikerpNqvlbg6mg==
X-Google-Smtp-Source: ACHHUZ7hkrQC/2/AK9nHX2Acv4D68laPB0ntxwZ4+W0bje9e7rPwXVFYOYCY9WVFwqS2LOYZBc376w==
X-Received: by 2002:a05:600c:2204:b0:3f6:c7b:d3c8 with SMTP id z4-20020a05600c220400b003f60c7bd3c8mr3423689wml.16.1685476295166;
        Tue, 30 May 2023 12:51:35 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n11-20020adfe34b000000b003078cd719ffsm4271545wrj.95.2023.05.30.12.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 12:51:34 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
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
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v4 0/5] Add LVTS support for mt8192
Date: Tue, 30 May 2023 21:51:27 +0200
Message-ID: <20230530195132.2286163-1-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_125139_242028_1A0D3EEB 
X-CRM114-Status: GOOD (  10.44  )
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

Add full LVTS support (MCU thermal domain + AP thermal domain) to MediaTek MT8192 SoC.
Also, add Suspend and Resume support to LVTS Driver (all SoCs),
and update the documentation that describes the Calibration Data Offsets.

Changelog:
    v4 :
        - Shrink the lvts_ap thermal sensor I/O range to 0xc00 to make
          room for SVS support, pointed out by
          AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

    v3 : 
        - Rebased :
            base-commit: 6a3d37b4d885129561e1cef361216f00472f7d2e
        - Fix issues in v2 pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>:
          Use filtered mode to make sure threshold interrupts are triggered,
          protocol documentation, cosmetics
        - I (bero@baylibre.com) will be taking care of this patchset
          from now on, since Balsam has left BayLibre. Thanks for
          getting it almost ready, Balsam!

    v2 :
        - Based on top of thermal/linux-next :
            base-commit: 7ac82227ee046f8234471de4c12a40b8c2d3ddcc
        - Squash "add thermal zones and thermal nodes" and
            "add temperature mitigation threshold" commits together to form
            "arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones" commit.
        - Add Suspend and Resume support to LVTS Driver.
        - Update Calibration Data documentation.
        - Fix calibration data offsets for mt8192
            (Thanks to "Chen-Yu Tsai" and "Nícolas F. R. A. Prado").
        https://lore.kernel.org/all/20230425133052.199767-1-bchihi@baylibre.com/
        Tested-by: Chen-Yu Tsai <wenst@chromium.org>

    v1 :
        - The initial series "Add LVTS support for mt8192" :
            "https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/".

Balsam CHIHI (5):
  dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
    for mt8192
  thermal/drivers/mediatek/lvts_thermal: Add suspend and resume
  thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
  arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones
  thermal/drivers/mediatek/lvts_thermal: Update calibration data
    documentation

 arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 454 ++++++++++++++++++
 drivers/thermal/mediatek/lvts_thermal.c       | 160 +++++-
 .../thermal/mediatek,lvts-thermal.h           |  19 +
 3 files changed, 631 insertions(+), 2 deletions(-)

base-commit: 8c33787278ca8db73ad7d23f932c8c39b9f6e543
-- 
2.41.0.rc2


