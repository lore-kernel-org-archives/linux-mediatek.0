Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E69C77B7D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 20:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NdrXa/PlVV43Pf78fHCONHu55eewXuTj8I+Jt1XajL4=; b=oNa/r3lAdV8ATHm2EN6G6HEaXH
	9YUe0swSGSSoDVOzuZRabS6JXYxK9Wtrw0u2sfi7p9QkWfnDFo1xnwvDXGtY/Ob1ByGXy/7ieGoF5
	af/n0ZHfWi6FC2gGSONXP0AcqAgxgn/HslEswmLwO0KQx9eT3/Vwami6eKNUxEqJOlCaIJGYdRFtg
	qMvqkdGTCzgiOzoi/O/kVda9J/tGL3upZWmagsNSkHUavF7HX8+x3Qsqq12ZIioId2dW8AKfPJa+d
	AkgBJFYvHegAUQTVgYRqPvZMOtW0gx7H/e0g7bzkwSrs51MPZWijBsClfI2AT+cnR/KYMOOnOE/jw
	/PWXXUgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyec8-003Oxn-2s;
	Mon, 15 May 2023 20:16:12 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyec6-003Ow2-1Z
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 20:16:11 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-643557840e4so14302439b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 13:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684181766; x=1686773766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NdrXa/PlVV43Pf78fHCONHu55eewXuTj8I+Jt1XajL4=;
        b=X9UotK3nIcZR9mIfhjg25eDJxkcGD+acT07JpZEckYeI+bTkV3P9Fdkgw1EWtT9jV2
         IO63n2RSI1nMLnyHJQxSGIgS94GjNw01y7bdsmNmNkxPMWdQErTCS8eIgAf8JamBLgbq
         JYpiV390X5/1BgjzuPvK5AbSMp/lQLYT8msx0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684181766; x=1686773766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdrXa/PlVV43Pf78fHCONHu55eewXuTj8I+Jt1XajL4=;
        b=l8AmVkv/gY8pFQyze31UwnD01I5oVZJM8OSQIswTWj//weF9k2VItoXJKUb/pyGI4P
         G5wMBQ0cBzIkrUzw1U0nL5lECUz9Sdpblfxf3ox7lNuRXB03L8B7tfw3KEeLdr1K5zKd
         QIFZL4TKSvpwhHnZDyUgZymKzlMJyp8QiNvaibonODMN5l3TsPUNbKSgoHKMv9wkmgu6
         69uEGlyQJkTXFSnxQ7f7zBljQ9yX72myv3G24YdfxpOPs/lZ2FzzBp/MpyT70utBK+DD
         2iyIcZn0JHbFL+KsdDN1ZSEasaTGL4CxVbDS5TsWsG41rvjdhlH35Ic5BZIZaexnsgXm
         33JA==
X-Gm-Message-State: AC+VfDysVpwRaMxCx/G/QsoWUcoozZAA4Xwa4w4xR/ypSCdQqiLv0WGW
	ueGVafh1IIJzZpZUpWrtoFNdaw==
X-Google-Smtp-Source: ACHHUZ7WrmkGpx7fG2HxU/uySV9x6q9FF5ouvQW5vcNqFi/UOINhM724hDTKdx7iOkCYhq6cqFKofA==
X-Received: by 2002:a05:6a20:7295:b0:f2:ae03:4020 with SMTP id o21-20020a056a20729500b000f2ae034020mr41711998pzk.54.1684181766038;
        Mon, 15 May 2023 13:16:06 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9f33:9d98:277a:d4cd])
        by smtp.gmail.com with ESMTPSA id a19-20020a62bd13000000b0063f0c9eadc7sm7981411pff.200.2023.05.15.13.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 13:16:05 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wenst@chromium.org,
	yidilin@chromium.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] irqchip/gic-v3: Disable pseudo NMIs on Mediatek Chromebooks w/ bad FW
Date: Mon, 15 May 2023 13:13:49 -0700
Message-ID: <20230515131353.v2.cover@dianders>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_131610_525507_3B27FC33 
X-CRM114-Status: GOOD (  12.81  )
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

As talked about in the bindings patch included in this series
("dt-bindings: interrupt-controller: arm,gic-v3: Add quirk for
Mediatek SoCs w/ broken FW"), many Mediatek-based Chromebooks shipped
with firmware that doesn't properly save/restore some GICR
registers. This causes the system to crash if "pseudo NMIs" are turned
on.

This series makes sure that we never allow turning on "pseudo NMIs" if
we are running with the problematic firmware.

The patches in this series can land in any order and can go through
entirely different trees. None of the patches are harmful on their
own, but to get things fixed we need all of them.

v2 fixes the quirk name and also moves the quirk out of the SoC.dtsi
file and into the Chromebook file. This, unfortunately, means that
mt8186-based Chromebooks are no longer handled since they don't appear
to be upstream yet. :(

Changes in v2:
- "when CPUs are powered" => "when the GIC redistributors are..."
- Changed "Fixes" tag.
- Moved from mt8183.dtsi to mt8183-kukui.dtsi
- Moved from mt8192.dtsi to mt8192-asurada.dtsi
- Moved from mt8195.dtsi to mt8195-cherry.dtsi
- mediatek,gicr-save-quirk => mediatek,broken-save-restore-fw

Douglas Anderson (5):
  dt-bindings: interrupt-controller: arm,gic-v3: Add quirk for Mediatek
    SoCs w/ broken FW
  irqchip/gic-v3: Disable pseudo NMIs on Mediatek devices w/ firmware
    issues
  arm64: dts: mediatek: mt8183: Add mediatek,broken-save-restore-fw to
    kukui
  arm64: dts: mediatek: mt8192: Add mediatek,broken-save-restore-fw to
    asurada
  arm64: dts: mediatek: mt8195: Add mediatek,broken-save-restore-fw to
    cherry

 .../interrupt-controller/arm,gic-v3.yaml      |  6 ++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  4 ++++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     |  4 ++++
 .../boot/dts/mediatek/mt8195-cherry.dtsi      |  4 ++++
 drivers/irqchip/irq-gic-common.c              |  8 ++++++--
 drivers/irqchip/irq-gic-common.h              |  1 +
 drivers/irqchip/irq-gic-v3.c                  | 20 +++++++++++++++++++
 7 files changed, 45 insertions(+), 2 deletions(-)

-- 
2.40.1.606.ga4b1b128d6-goog


