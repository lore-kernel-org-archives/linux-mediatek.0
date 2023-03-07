Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10AEC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 12:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GzFpHewBbWomyUEZaNFYjKbbfeAnvvHjKQLmFN5JziA=; b=lImR2E1Z1IGDvbcMk3PFV+kirw
	XFnBsvRmRxAhRfajveHxz17rZeUu+CmGS9COrUaTMvFir18VV4rURgICnPGGvFMEcuW9qwFQVQAqg
	ii2fJWko/anyvUiMogDYK8kFy2YEypTwohetO04QK5HV/Uo4aqexLJ0RBYImQf5cgnh9hTJ0ASx/C
	wtz/w9B+mR4o5lFkCnli5a+0WD5yqcpS9eF0bGe4UvKjW/LuXxCTDg+HlyOjAvE+6CYq4H5IvOz5x
	YZ6GI5Fzcf4B1fSGbpWp2k3+XTZ3/clD+67/k6lo5j72cbOHfNos65hKBj9t3YFGUL2vFcxiAZKSg
	v2nAgsrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWde-0008WV-PV; Tue, 07 Mar 2023 12:41:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZWd8-0008H3-2J
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 12:41:25 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t15so11961268wrz.7
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 04:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678192875;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=GzFpHewBbWomyUEZaNFYjKbbfeAnvvHjKQLmFN5JziA=;
        b=pWFdX7+c5EOEOwB2Sus+3hAhRmLvU+gopv2ej+x3B89Rr5abFSju2fpdvdfF1olE/H
         saEbdPxxjh2MN8qTSMqGIQ31qe2pns/O+l1w+0R2vaEOFikuZu95X8hjc2p6RIQNmPfG
         tR+y4rmArhNxEqCQ8G5HUXCmTNEcQlnENDIIMLB6Y7CRiH6yJKhZzdikTaQCE1ubEV06
         q0TI2zzSwCuxHHPo83aNIXT4snctKLaPQMZqKMbrTnDLfAFWpJ3AIyuKymmZ72gac8Jx
         KBlN8mj6SKdWGCXaDLTfU1iu+5ZGamjKWPXHUpQel60qCT+DHcGb59QfRr+Lrr2ONE5p
         tPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678192875;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzFpHewBbWomyUEZaNFYjKbbfeAnvvHjKQLmFN5JziA=;
        b=t3URPKz7mxq0a7oJ12reV4EuFJrpMAlovLcdi7jaoCPNgNrYBYsXub6iWiU1OIYrVz
         srEdCQKTlauoxikfjCuML/cPW8LEdhAMdFrojbD+QwVx8Hd+emVMgduiZyI5LoQl2Tqk
         +oxhzWegzc0LYCbz0vwmCGQzDVPvrZSCY30Rs5UTYfa1Y99Tl8m4+a5YZWroQevruy2F
         Hn2ui/lspXEoTFvO08j0lUUHHP5dzjX3SfnJGBErqTtKGDZyTnA8bcV6BqJukeup5mHf
         lZg2FPV/4J/5dlOk29LiaMm7mg38U1vRWqzywPxLLV53hjVuz0X4uX9kTKmrOXs7gqFl
         c0Uw==
X-Gm-Message-State: AO0yUKVh7FkFpHsU/Rbj5ytYB0BUDWaGoB2Gs/YDE4KKf8pcqXfzo60q
	Uwc9NHTY6venynsz7a4aUJQxGQ==
X-Google-Smtp-Source: AK7set+yUbubaUWq+tSIIrRxwkXYsBygdFKRFVCS2GRN5jvwg7NHL688RW9y5lE7d9soVel3pj1V/g==
X-Received: by 2002:a05:6000:149:b0:2cb:3deb:c014 with SMTP id r9-20020a056000014900b002cb3debc014mr8783527wrx.28.1678192875604;
        Tue, 07 Mar 2023 04:41:15 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id w9-20020a05600018c900b002c5a1bd5280sm12434670wrq.95.2023.03.07.04.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 04:41:15 -0800 (PST)
Subject: [PATCH v4 0/2] Add MediaTek MT8365 I2C support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAOIwB2QC/4XNQQqDMBAF0KuUrJuSjDGxXfUepYskjjWgRhIVRLx7hy5Lqavhf/hvNpYxBczsdt
 pYwiXkEAcK6nxivrXDC3moKTMQAFIC8H6qCl3yAJ7neRxjmnjjhapqC1qiZTR0NiN3yQ6+pekwdx2V
 bchTTOvn0SLpPP6ai+SCK4vO+FJ5bdzd2bULLuHFx549SVzgWAFSUHlCpEJTyR9KcawUpNj66pwURt em+VL2fX8DtbpxSEgBAAA=
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 13:41:06 +0100
Message-Id: <20221122-mt8365-i2c-support-v4-0-885ad3301d5a@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 Alexandre Mergnat <amergnat@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2255; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ngJR3lDpq2gN4aGwVDBwin795hLgOGEZuPdchMq4YZ0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzDqxV1g5ocgwAedExTzYHgfPI4QlFkE4r5Faz6e
 TS5VfdCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAcw6gAKCRArRkmdfjHURZBXD/
 9ph7eGz7u8HMJ+qKPI1mu8b6Hg4hhgoUdPrn5VchtVJAOJxKJi9L5ODgDmvPMYuP8pzEUB4E+qAz7O
 vxZQK+YoM0vYdQNWwFlZP4LPzRuG0dXvvB5s3J4xSicSMiPHylBAFb0GnDq3/bu1vWcBRWj+MExsRT
 GKMIkVhAHM8AcWGtBy82Fh02qWXGx5IVr56fVDc5/ZszzwpJHVJstuE9hii1vGmPxkIeIpn4wyNoy5
 r0wG7zEioS+r9BbIIJQmED/ixkbzyIR0a3p245nYHxtAmxn6ojVp7WJI4oCIm3w7+o1jSuXSBPXgs/
 WjceUhk8vyNMpTu/6I4NMppqDfIhJvzlh6fH+kAt5nlbUv4ftt/fC+qRmuAKII1Fij8a4EvoWaQaxK
 QU7CAwYlIF8fVXoX6lTFcYJRDEi85hoQjpZiRWAM6xiN4H77EyXygAEHckMqv/DBOCWqr3vKE4IKeJ
 VhUwXoJJ0GGxlbmL54ef1W2EwlHM07S6/wlbfv0WwM1Y3Wy2m75aGRGRcFWTHxkrnIrWaL0oGGGlbe
 PS6SoYax/vjtX9yqV5U8x28J/5ZHqeAca9gBdQOoZFFLX+ZazmQnDR+i1Jsr4jh+hzAOQ5GWDa/r4h
 os3c4rQ0WIT3iZltM/6KsmQuaFliKt6+ADoICS5wBN5iSPkULW3KUSD85OKA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_044122_249554_A7C33F94 
X-CRM114-Status: GOOD (  13.11  )
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
This patch series adds I2C support for MT8365-EVK board.
The I2C-0 is enabled, it can be used through the board pin header,
as described directly on the PCB.

This series depends to another one which add support for
MT8365 SoC and EVK board. Link [1]

One patch has been cherry-picked from [2], so I've addressed the comment
and kept the trailer.

Regards,
Alex

[1]: https://lore.kernel.org/linux-mediatek/20230101220149.3035048-1-bero@baylibre.com/
[2]: https://lore.kernel.org/all/20220531135026.238475-2-fparent@baylibre.com/

To: Qii Wang <qii.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: Fabien Parent <fparent@baylibre.com>
Cc: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v4:
- Fix some properties order.
- Remove the useless properties.
- Link to v3: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com

Changes in v3:
- Rebased to v6.3-rc1.
- Move i2c3 node to be consistent with the SoC address order.
- Link to v2: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v2-0-e4c7c514e781@baylibre.com

Changes in v2:
- Drop the patch which do useless change in i2c-mt65xx.c driver.
- Change 2 lines compatible/reg in oneline.
- Link to v1: https://lore.kernel.org/r/20221122-mt8365-i2c-support-v1-0-4aeb7c54c67b@baylibre.com

---
Alexandre Mergnat (2):
      arm64: dts: mediatek: add i2c support for mt8365 SoC
      arm64: dts: mediatek: enable i2c0 for mt8365-evk board

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 17 ++++++++++
 arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 48 +++++++++++++++++++++++++++++
 2 files changed, 65 insertions(+)
---
base-commit: 5c6b974d24c21a6aa5d8b524067d7d9bc7fcc4f2
change-id: 20221122-mt8365-i2c-support-fc048da261ea

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

