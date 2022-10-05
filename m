Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60810C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 14:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1cMed2LuNRuueybzlo85Zm/Ah2wjLjdvNL+1Ufh61Fc=; b=4mqse3ZBbfMWWcrn2IkSCM3l9W
	LnFXWMDl56MaFJr34mHuItKoFLwe3q2L0h7GS7mnkbg4L9xGy2JEPCROj5eax9g5BiekGmY/QapGm
	Wo3z+um4ilnF+XUPJHWZf8rkbOqGYrUJzIGzc8+QdDoe3mMYTHcK0WxD7xM3EBFursqM0jC4HXRdu
	+tE7AmPlpmo9mGXj2YlUgP86by4lQEYZ+s0iM/ZvaWSvH5ryvzq3WD9BWhNQcgsxlxFQl+MU9Za13
	SKqgKK1aqLyOin03+wRDIA+zBJpryhpiIPYUISfi3/ic9wYHwXlrzDKD/zLDW2Puy8lkhTX4dxT/E
	YZwg+ZWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5qT-00Eht1-0g; Wed, 05 Oct 2022 14:58:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og5qB-00Ehjj-8o
	for linux-mediatek@lists.infradead.org; Wed, 05 Oct 2022 14:57:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id e10-20020a05600c4e4a00b003b4eff4ab2cso1170500wmq.4
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Oct 2022 07:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date;
        bh=1cMed2LuNRuueybzlo85Zm/Ah2wjLjdvNL+1Ufh61Fc=;
        b=vev15dJdQrfLceyaRC7EDjYuZkIRjbV1LTYXQlycQENBTNEpkc6Z1Tw4P0IYaiC267
         WY6yQAPyHifxKGlRrGAM8Nm68V2NUb4mrN2jUmKErMtvx34TgzVLuMeemfVmu7WQrran
         fI0AyUu0JBAMBhZ8XJF+7rDJlvnD5sHYDiwhyokbj+deW8uv1PuMUg0RGMkEdyn42WCj
         MfoDzkmcv6xd8CzAFD07HJ8UqefaBO9rxGEddoYZcvEMcJ57bEiumPyJyhwYw/mw20VY
         VsVNJ2R1tuemYMQRxdZ9Fxiho29ouVMklSENyMxZG255v1oTgLlW8mb7405YFCPftXqQ
         WMtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=1cMed2LuNRuueybzlo85Zm/Ah2wjLjdvNL+1Ufh61Fc=;
        b=P2jjcs0HLELpGmDjxwd+Htg/cAGT/S+ORB91cQMkKMj/SgMdMgCat+tf8tXqOx1Yy/
         xL/hH5/ocEjiHgwMq/v/+sgK9Ztnp/WBKQu78pmrbSfYswP0DQ4297PvE7vRvUxC/kXj
         NoEZasy9lPDGNLFHE7ZcnNEzlxMhcY7oBh0btTeRDeVXlWcoVGtRCc/d49+NDCCbJuhj
         srbBilLL7YAiGEFo9CsPzXNNvxNLxoNtrOhKqoXTEXXrLQILOZjcmWHbs06A5obExAFA
         +83vrfPyw1FVu6c6vH+qa25W2/ZnOCbrVbyi9Xdb1DC/+/wprD84aKEFIIG1zcP/rUOR
         lwTw==
X-Gm-Message-State: ACrzQf03cWq36+cR/+xdLGqvlBUVNi6G7GH1pEsOYBTbT1V5aTH7ju48
	dR/ksfT5QiR28FufGIh6g0KJvw==
X-Google-Smtp-Source: AMsMyM44C554QyEpt58NyqIFPm1+e7tcMo96UGJCZ0SGjBFZTpqvpezjlL0812cltP/g1RLw4Lz/4A==
X-Received: by 2002:a05:600c:4e0f:b0:3b4:88bb:19cb with SMTP id b15-20020a05600c4e0f00b003b488bb19cbmr3567243wmq.195.1664981860089;
        Wed, 05 Oct 2022 07:57:40 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id k38-20020a05600c1ca600b003a3170a7af9sm2313758wms.4.2022.10.05.07.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 07:57:39 -0700 (PDT)
Subject: [PATCH v2 0/5] Add MediaTek MT6357 PMIC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAFCbPWMC/w3LMQ6AIAwAwK+YzjbBEtT4G8CqJAqEqgvx7zLecBWES2CBpatQ+A0SUmygvgN/2L
 gzhrUZSBENShm87lGbCeXJOZUbjdFqdjOx1hu05KwwumKjP1qLz3l+3w8OZoBtZQAAAA==
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Oct 2022 16:57:20 +0200
Message-Id: <20221005-mt6357-support-v2-0-f17ba2d2d0a9@baylibre.com>
To: Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2136; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=tA0SxppU+jLvYckDfJF2SKYUWGuzQ981wHE1My5XCX4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjPZtiEJXk5uMZSeIvSzpAFKou6BAaGk9uX++RG+R2
 E/MauyWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCYz2bYgAKCRArRkmdfjHURYkmEA
 CsVE63ekHqx3iQdZSRf6ctCkpEA8P3dhM8h9M8bVeq1rpdLYy6FBkRilsmZM74dSn07LxnW60cu5R3
 d6bIO6FqiITaMGn4dxGiDTR8XoXsBxeFHsG5Gi6bkD6rL9Wue2qThuYE+9S6rosHvr1EbVJr9jnW+8
 tNNZ/QAqFRb6f9wPYPnd3IDCriDm0OLSWyEQ3ifuA1GAOUmFoOcfd4HPeg5ilIcNX1R7Jv2yumJIzW
 4y+ad/cOEZ02KD15b2TjS+43qBO0GlVP0sbQEQP0DR+sGGmxmePy4alohnHGgIrZ2GFq1AajjqhXzb
 Q5l3X26aCUFja0AyHPExKhgBzIAxYd53tZ91Xmn0Q6f4+9CtcKsguZegImefnX/lIGPem31dhQSLc1
 +MlVQgPr9qccJy5gbo7jGbVuZG+ToatHsjzNjUZafpqfiPqUwAUkdHS3rEMQyvAMX46654sPd+vJ0M
 lPNEYGUvICxI3IXnrDyg6kWLRPPUHPqZ3wXcuM8ozcaFxypqTypXHdQ+1Oc3dbNCtyA0tq2ODtuyyA
 rzWs5LiObHYom9j81mmVKQ45o/WKoiBLGjyYvxnJDNajQC1oE8fz2M3KIe2BuIITEuQPKKxTH1doHt
 lsVSrY3YRuAnvz4QAN0WtgM78KJHcNal0eLZDPnzMG6GRGn/zQNAiCMuErWw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_075743_553661_6D148923 
X-CRM114-Status: GOOD (  12.14  )
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
This patch series adds MFD, PMIC keys, and regulator support for MT6357.
MT6357 is a MediaTek PMIC very similar to MT6358.

Regards,
Alex

Changes in v2:
- Rebase
- Fix typo
- Remove dependencies with https://lore.kernel.org/all/20220415153629.1817202-1-fparent@baylibre.com/
  which is no longer relevant.

Previous versions:
v1 - https://lore.kernel.org/all/20220531124959.202787-1-fparent@baylibre.com/

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Chen Zhong <chen.zhong@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

---
Fabien Parent (5):
      dt-bindings: mfd: mt6397: add binding for MT6357
      dt-bindings: input: mtk-pmic-keys: add binding for MT6357 PMIC
      dt-bindings: regulator: Add binding schema for mt6357 regulators
      regulator: add mt6357 regulator
      Input: mtk-pmic-keys: add MT6357 support

 .../bindings/input/mediatek,pmic-keys.yaml         |   1 +
 Documentation/devicetree/bindings/mfd/mt6397.txt   |   1 +
 .../regulator/mediatek,mt6357-regulator.yaml       | 284 ++++++++++++
 drivers/input/keyboard/mtk-pmic-keys.c             |  17 +
 drivers/regulator/Kconfig                          |   9 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/mt6357-regulator.c               | 485 +++++++++++++++++++++
 include/linux/regulator/mt6357-regulator.h         |  51 +++
 8 files changed, 849 insertions(+)
---
base-commit: 7c69ce28cba3d6ad011f86a5d18dc8c04a921b29
change-id: 20221005-mt6357-support-55308b82e33f

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

