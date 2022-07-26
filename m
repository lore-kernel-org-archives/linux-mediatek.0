Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1629C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 12:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TYVpWfq2HZQFkJkUsjuT3+OH2/CsoiFy0t7aK/wwYcc=; b=VNEuiHSVYGqgdjR8+YZVvRXDYk
	Y4rz7lnPKG11fni85vjeGiZc6yk07S1X9HL58WW4Za+LkY4qec5XnDyTCsJ9Qrv8AaIYJIdjr6FjS
	uTbdWbhPEN/rheUNgQaKmxx4tWQ3XquC51tY5g+FH1VS8SuqXRnlnuH5ofHMCfzVtn9ACCOl3iLRF
	jDYzn6FwcQEnBv0FA8vSr/o1yMyqhC1ocQIY+H5xlwr7S9QUablcx2CxLrCWrnxEDcVlp/fvAy+2z
	ChWqgi43P88qCtQD1cCEbMME8cvQLn+LsJNSkYyQ6dFGwaV/TaFwhH9D6wOg7RdlpNf5ZRgaIDjuP
	aMBhrkhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK7C-00H8oA-0j; Tue, 26 Jul 2022 12:56:46 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGK6w-00H8ZI-6K
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 12:56:31 +0000
Received: by mail-wr1-x430.google.com with SMTP id g2so11971296wru.3
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Jul 2022 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=subject:mime-version:content-transfer-encoding:from:date:message-id
         :to:cc;
        bh=TYVpWfq2HZQFkJkUsjuT3+OH2/CsoiFy0t7aK/wwYcc=;
        b=UBvhtWzt3DHFwXizB1isgLkwtszKbw3B3ACzitCBV4Mf3bOz9w4Mt0Q7ryBZw930k7
         HHbsoUy2FTe728lwS+DodOf/jURVyUEfsjoYImKgMRaFfW0Xe4mFQrHPVfdcagC5+ISO
         J1IPoXQyrKOUcOX4FVyhwQE4EA72Q/+Zk7VshT0V5dSb8J+GlXNqzKQHPD6pj5RKOWp7
         91TJBpugRtB7SMYBWxueFAATYOhTOW0wriCzrdwfAgDGONGLvNuVe4pbCzOcODfNnKUu
         Oq38NnfDl+ilReWZ/qRCN7evoGRsRjnyMxJOH/nqP8WMsnT1d7a032FklXTlOXzi++hF
         4yrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:mime-version:content-transfer-encoding
         :from:date:message-id:to:cc;
        bh=TYVpWfq2HZQFkJkUsjuT3+OH2/CsoiFy0t7aK/wwYcc=;
        b=wMIWnslk4hFDrBxlwVeg7BC/wXnWRmtE5ZpMVm9w6VAgOCRoQdcmK/p233mtbn0Bw0
         2IB/YIBQHqldY5EZby2gL/cCqDAaWfYs2GzznAD0rWh9hFilvlttsDgzJqgr+kCjIQlN
         4erYu/bRDoQrr+UROQ2uXuUP8X/4tu2WkvD5jl19A10RrTL4kbwOX1ojMxrJmWdvpiS7
         447f77s3leIIBHTphKHbukGeGSoyqxcXtOgUm0S0d2etqxwB5nk2y+GbSSVELKZpsFjk
         fN37vc1hGjU92WMvo3KJHkN6SxEsP0o2mjBFTtBllef+pkhHQqvK9wFmk4GqgFrXuGEe
         mebQ==
X-Gm-Message-State: AJIora8w1rnwqQZbKs5roilKnRoJ143xziBG1DkSZcDYldO4jScTD1R5
	wXKgoNixWeWVw0qsv1M5gbWQTg==
X-Google-Smtp-Source: AGRyM1uXUsdiGuXurwvyCalFFjQJEVSbWfw/z+1nQSYHOyzlEzhlO2ccY6Uo0YOkNIQxIIIVj+N90w==
X-Received: by 2002:a05:6000:1f9a:b0:21e:8de2:727a with SMTP id bw26-20020a0560001f9a00b0021e8de2727amr5437446wrb.576.1658840188043;
        Tue, 26 Jul 2022 05:56:28 -0700 (PDT)
Received: from [192.168.2.253] ([82.66.159.240])
        by smtp.gmail.com with ESMTPSA id k1-20020adff5c1000000b0020fff0ea0a3sm14171549wrp.116.2022.07.26.05.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:56:27 -0700 (PDT)
Subject: [PATCH v2 0/7] Input: mt6779-keypad - double keys support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Date: Tue, 26 Jul 2022 14:56:05 +0200
Message-Id: <20220720-mt8183-keypad-v2-0-6d42c357cb76@baylibre.com>
X-b4-tracking: H4sIAHvk32IC/3XOwQ6CMBAE0F8hPVvTLqUUT/6H8bBbttKoYFpCQgj/bvHuaTKHl5lNZE6Rs7hUm0
 i8xBynsRQ4VcIPOD5Yxr50AQpAtaDke3ba1fLJ6wd7CQqxbbWyIShRDGFmSQlHPxzKWodBk22Mc3VL
 xiBQYNv0npAtQaOwp2Drgw4xz1Naf08WXeL2b3TRUkkOXfDQFR7MlXB9RUp89tNb3Pd9/wIohsyH2A AAAA==
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org, Fabien Parent <parent.f@gmail.com>
X-Mailer: b4 0.10.0-dev-78725
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_055630_240048_8811309A 
X-CRM114-Status: GOOD (  11.16  )
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

The MediaTek keypad controller has multiple operating modes:
* single key detection (currently implemented)
* double key detection

With double key detection, each (row,column) is a group that can detect
two keys in the key matrix.
This minimizes the overall pin counts for cost reduction.
However, pressing multiple keys in the same group will not be
detected properly.

On some boards, like mt8183-pumpkin, double key detection is used.

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

---
Changes in v2:
- bindings: add matrix-keymap justification in commit message (Krzysztof)
- bindings: switch from double-keys(boolean) to keys-per-group(uint32) (Krzysztof)
- driver: add a function pointer for row/column calculation (Angelo)
- Link to v1: https://lore.kernel.org/r/20220720-mt8183-keypad-v1-0-ef9fc29dbff4@baylibre.com

---
Fabien Parent (2):
      arm64: dts: mediatek: mt8183: add keyboard node
      arm64: dts: mediatek: mt8183-pumpkin: add keypad support

Mattijs Korpershoek (5):
      MAINTAINERS: input: add mattijs for mt6779-keypad
      dt-bindings: mediatek,mt6779-keypad: use unevaluatedProperties
      dt-bindings: mediatek,mt6779-keypad: add mediatek,keys-per-group
      Input: mt6779-keypad - prepare double keys support with calc_row_col
      Input: mt6779-keypad - support double keys matrix

 .../bindings/input/mediatek,mt6779-keypad.yaml     |  8 ++++-
 MAINTAINERS                                        |  6 ++++
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    | 21 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |  9 +++++
 drivers/input/keyboard/mt6779-keypad.c             | 41 ++++++++++++++++++++--
 5 files changed, 82 insertions(+), 3 deletions(-)
---
base-commit: 668af1b6548837b44a2bfe65dcbae6b250adbf63
change-id: 20220720-mt8183-keypad-20aa77106ff0

Best regards,
-- 
Mattijs Korpershoek <mkorpershoek@baylibre.com>

