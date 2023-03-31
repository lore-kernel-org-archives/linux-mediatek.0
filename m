Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CBDC77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 17:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9gku3WqCXL8jtCOkhxTxIv+f+mV0YZMt8NBkxJPbbls=; b=nStIL2WldGAeX3
	SpNIZbexpBvzRusw3lSOSDFRYTZ530mNpEwrmvJcdeLIvYf224VvR/B3Wd+bxSTaATC8T+q4ofHnt
	dhmZbBpxtaLVo9zGQHE0OOH1h1MkFTzJsdWMkuE9lrp5eWZ7HWIrgumKDFfrqRqEydLMfmQrmPOuP
	RZo+1eeRG1JF2fjUdeJGrBRpf0jQLDiPlQDEIZTZSNetZJSrr2PbulWbGxS1GWMT/NTv730pp7tic
	EZIJpOYjA5KUWZmJcp/mQBL8J1hNPa0FjZCMq33ZiANSE+jNTL8bNIXbu0NmdQKPHiQ18VRxV2Xmh
	wFZEBzqjf3iKvgIqLH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piIig-008JdG-2l;
	Fri, 31 Mar 2023 17:39:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piIid-008Jaj-1D
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 17:39:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id r29so23177396wra.13
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 10:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680284354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9gku3WqCXL8jtCOkhxTxIv+f+mV0YZMt8NBkxJPbbls=;
        b=3QTbfLbY/h37CSPq/kZacyHAAHcHzWjomoaAGiBSO9/7zmmsp9uzEnhWuVLynxSCzo
         FrXzSxKXtVbic3O4gIbtKLzhBINFPJwDKqzQ6MrgwwTkaNvmk8Xf6zqcHm6nuwKs3Ctu
         N6+s4QNCR/G2REsINFejqtnwxLbvvPo6xm4C9K3a03UIOtPzNa1Roj9YN8rJmatVyrpo
         CpWs7OQhS9oQHzugb4Q9yi2PX5T+WYxFtMWzjVAUNmX/JPOSiG+gVorPjcj7bN9uD6HY
         5W7J7Kqtamyq16vuPh5xBGbEDlenlLt4+aDzMx0adrpRweOSPU7DnDKC+3HgNQxvEsP1
         oV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680284354;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9gku3WqCXL8jtCOkhxTxIv+f+mV0YZMt8NBkxJPbbls=;
        b=ZCgJ2tkCub4dJ1C3Hi4bjvWbA8X1S0btJhmHwpw9+Gnxkf9EkRZwbmA4t05p8LhF18
         lMPSmbVRdX4udhSfKyxhHsGL8BoRb3arefwmMftmiC7KspMkH/iifI61ftiEqie0sQYv
         xME8k6AKdQFSweCQDEFQPRMkOV2sbET+GO2+qbbEnaFISzgXQGB2WXP7lKYeZI+A4/ex
         EMO+50mrpMxxt0BtC/u28vUmd9qabIlzwHbBr9QOTOtJi8HzxLliQG3Z5KB6C8C/L7Q8
         usVswFU99jT9sOMdUcnrb014efAcIRj39nkQKIPbG3oUo5Y7b/5RL60Dr8PRGWa3y9oo
         6LYg==
X-Gm-Message-State: AAQBX9c5Altp5AwXMMXjAILph8qiP3pr1+nWbnMAulxTaPbriPfBlpT5
	aaTnXCX2JqJ5jmdn5LlnjqyU3A==
X-Google-Smtp-Source: AKy350Yew0GXPvS8KCRlzsw4CGrZLmLXYTX50Vz2INKAr0R16PRplJOTqMjtA/u6fHFCax0UfX2dZg==
X-Received: by 2002:a5d:6b4b:0:b0:2dc:2431:67d0 with SMTP id x11-20020a5d6b4b000000b002dc243167d0mr21570490wrw.19.1680284354663;
        Fri, 31 Mar 2023 10:39:14 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id o5-20020adfcf05000000b002c592535839sm2733550wrj.17.2023.03.31.10.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 10:39:14 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v2 0/2] Cleanup Mediatek pinctrl device tree binding
Date: Fri, 31 Mar 2023 19:38:58 +0200
Message-Id: <20230327-cleanup-pinctrl-binding-v2-0-f21fbcc3016e@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIaJ2QC/4WOwQ7CIBAFf8Vwdm0LiujJ/zAegC7tJhUI1Mam6
 b9LvRuP85I3mYVlTISZXXcLSzhRpuAL8P2O2V77DoHawozXXNSCn8EOqP0rQiRvxzSAId+S70D
 V8qiVU8ZJxcrb6Ixgkva23/6vWE3yICDZphpDJFs9RyXkqfrh2xQxoaP3N+7+KNxTHkOav61Ts
 63/s6YGajDyckLB8eg43oyeBzIJDzY82WNd1w8eBA+SBAEAAA==
To: Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Zhiyong Tao <zhiyong.tao@mediatek.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=abFoXlAdYBElssUUK3ytRFD/kuTvFa6mt+xUmikwoXo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkJxrBrmACDFTBwfeXO4FOXsae1zXEjlbNcQk2W1Ul
 J+/qpRGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZCcawQAKCRArRkmdfjHURReKD/
 4tIbrADlmxKAJLhNOlh2lQjWW410UBYdho2DqDP3rdpmw4dfli5sqfB2EQqt7dKtfxga1OL/wVdiIm
 a5DO1mJ8KPJcM14YKwFB5A1mfLppUjAlgXtl74KYZr//6wuQb+QxUrm01hNEu3EKof5lCEJIGJmeKy
 YF6dkoCZM9hViBilRM1S9hvocXb8Azw5hbbgwqebPmwxvVAo3G6hlFBbWyTFvnjA9wtVTDm9oliIQV
 K0futyUqZDzefYlrgGEfyrZaPYhUhEGTA0cprOeBlwkTXaXLNOxyzOePuMCzhMTfbkgIElwaQolgYl
 P6Vo3e5seGqkUG31TpEL93jA9zgS85CEgevEXLJrLFcpnVOWjrCYS+KukzmWYrv9uQbU2RZznMHCCz
 CWHBSzj2MjLZNom6WSwzV3nxOmQf+gKzDz2PECGIuGCUnrRbK7bl/Cy5m9SWGF7oyJwYKJdoDUUcJV
 OY+hFVX2LSWc7ebPHJBRsxb6nzUKbx7sNf/9n6UQRteX4bdhE4WCgw0WgPYMC0a0DgAYGD+JR35nhF
 /tR/W7LxS+42RejEwb6rfxo2WUHAD/QFENRt10g9oVnpVH4oZzTY1aM1AQGlxxVAtN+One6Uj3XNMj
 +bME9jPllXttQp/Gdd+EIp5QMFORiHaz7ktomF8vcClqJD/Xho2+LRYjQ6rg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_103919_416654_8DC1DE70 
X-CRM114-Status: UNSURE (   9.02  )
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

Deprecate properties which shall not exist, leaked upstream from downstream
kernels, there's no reason to use them. Here the deprecated properties and
the generic properties which will replace them:

- mediatek,drive-strength-adv => drive-strength-microamp
- mediatek,pull-up-adv        => bias-pull-up
- mediatek,pull-down-adv      => bias-pull-down

Thanks AngeloGioacchino Del Regno to reported it. [1]

[1]: https://lore.kernel.org/all/6e08d78f-ef4c-b228-f7d2-d63767ea87b8@collabora.com/

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v2:
- Change the bias-pull enum values to match with other Mediatek SoC.
  That allows to use MTK generic define and be compliant with the MTK
  common pinctrl driver.
- Link to v1: https://lore.kernel.org/r/20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com

---
Alexandre Mergnat (2):
      dt-bindings: pinctrl: mediatek: deprecate custom drive strength property
      dt-bindings: pinctrl: mediatek: deprecate custom bias pull properties for mt8365

 .../bindings/pinctrl/mediatek,mt8183-pinctrl.yaml  |  8 +++--
 .../bindings/pinctrl/mediatek,mt8365-pinctrl.yaml  | 38 +++++++++++++++++++---
 2 files changed, 39 insertions(+), 7 deletions(-)
---
base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
change-id: 20230327-cleanup-pinctrl-binding-8064a8f8bf68

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


