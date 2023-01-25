Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C59BC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vaCPXkD9SZLVsUqcpjkMaFmczW7gT3DS5/0BLDeDcbQ=; b=TwuXh6uxtr1Kjy
	2HlMr1wf1EOmlbb6tTVoqKsqSlYu/3E9WknE9x7I3mxJXcNBMGlAqM3DcPg/Xft0PJ5M0lThmC5RT
	VC/Q3safK8CEtFJgJXytYK9+VS3JhAcMeH8SMPl9qVMSGbLKvv0YpAEubpaDA2QGK9CdCxW4L5yRf
	UqOghRgsmtYo3q/vf2g0ESzpfL3xZORELOBjDx+/7EywBj3bjDwNzEzHRrxDhXLB85R/2JI4P6xmX
	EmDI+oe7JObszruwru4bPWidHvNFLktQUdC2jL5TjwAdDOdbhMXsiSTKXPIJ+nJSHj2+rLAqOLSku
	6cGKHQDEag8KtNFXQprw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcRI-006jEJ-A3; Wed, 25 Jan 2023 09:51:32 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKcQq-006iz2-Jf
	for linux-mediatek@lists.infradead.org; Wed, 25 Jan 2023 09:51:09 +0000
Received: by mail-wr1-x42d.google.com with SMTP id n7so16433758wrx.5
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 01:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vaCPXkD9SZLVsUqcpjkMaFmczW7gT3DS5/0BLDeDcbQ=;
        b=Rw7ZKTIlxluTpzjoIaXA952ZSKYgO45W3mwE4xtZ2FfGN97Q0me77t81wHveCmmSXy
         fob1NruqdEF6M4PvdSIF+Rt9WTqjMYVqZ1q4h8kvtDopvY0OIUSezCIMNTHLHriz2y9Y
         C0ze5VIeMqOwGpNBH3FVctSVFOUxxG5AIr0lFAAoD3IFIznNtNfpqRhwgFktd1UfMFTh
         nxQpJ9G43+ZPw8cN/KC+vJYtiQU6cLW6t6hC3Iv+EuCWzbN1Z/ccKAbdH5ibdc9XD7mJ
         XPKlPFb/LzrDH1m5D4mRAcmBkVEtXxnxIHvgUJkUje4lTo2rA0AFrrcObtfowoRPx5dP
         yO5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaCPXkD9SZLVsUqcpjkMaFmczW7gT3DS5/0BLDeDcbQ=;
        b=OY5TQ76Wk5f+BF+rM838OZYdzh3XPY7t+IFLsWjdjkbu4HXTv2+oP3bnCu6LcJD/+r
         mSe7D7kBKOpj/bJXojvB+/LC7PeAKkUQMu4W4ib/TTovjkt2eNDrvhWvWuxVafkF9cFt
         C6/1SSY3NG+lOGR+jH7jQzwRE36m+/sL3iQSLPwQWdzebe0qV/zynCCrVfrl8ZFe2T3o
         N/06q/UdhHLYn88QCaockRGxReEnBWM086FWslmpX27j/X3vuVZzPb1FMV5jJ2IGR/mt
         zaiHUmUhR3+feLULNC8apLHMs79pQCPLGIjQQG934xKa7hKzo5fiqfKbcEFyDgK6IaNV
         yM0w==
X-Gm-Message-State: AFqh2kr+9wpZnpeN/D9IS+6z4rKf7gWTv4t7kVo2tRxnSDtlqbJW6WDH
	/w1auc0tO4vZxdfDDUdLiPwREQ==
X-Google-Smtp-Source: AMrXdXs4iX7MHDhQ8IpIinu+zVBZH31DduJs8o0yFDjgZqXVRfmzOBdosIhPx5NkKAMeRHZalGCImA==
X-Received: by 2002:a5d:68ce:0:b0:2be:4dc0:6684 with SMTP id p14-20020a5d68ce000000b002be4dc06684mr18346214wrw.7.1674640260896;
        Wed, 25 Jan 2023 01:51:00 -0800 (PST)
Received: from [127.0.1.1] (62.213.132.195.rev.sfr.net. [195.132.213.62])
        by smtp.googlemail.com with ESMTPSA id j26-20020a5d453a000000b002bdf3809f59sm3955072wra.38.2023.01.25.01.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:51:00 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH v8 0/5] thermal: mediatek: Add support for MT8365 SoC
Date: Wed, 25 Jan 2023 10:50:29 +0100
Message-Id: <20221018-up-i350-thermal-bringup-v8-0-23e8fbb08837@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGX70GMC/42NywrCMBREf6VkbSSm5KEr/0Nc5HHTBNpUkjZQS
 v/di0s3uhpmhjmzkwolQSW3bicFWqppzmj0qSMumjwATR494YzzC7tour5o6gWjS4QymZHakvKA
 ofG9lr5XTMhAcG1NBSxNdhH3eR1HDGOqy1y2z1uTKI/f4CYpo04rew1KCMHs3ZptTLbA2c0TeSK
 2qT9RClFgA9MhcPD+G3UcxxuNJQD1EQEAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Herring <robh@kernel.org>, Markus Schneider-Pargmann <msp@baylibre.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Michael Kao <michael.kao@mediatek.com>
X-Mailer: b4 0.11.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1674640259; l=1557;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=6g6r80ja2Rzpq9olLoUbWHBTm7xTpanipH7fHDJFqNU=;
 b=T+CLaw+DkWdzd1nbg+TlT6goz1/RMjgk9CSpiYrLyUOPxR6irKRnar3iyJQAhpi1Xuc2kSBCqW1Q
 JWuB6H0dDOndEuRobKtDdzYA5x9mtavP6YwfwCwZj2Gv6j1r9nf3
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_015105_067524_A3A8B9BC 
X-CRM114-Status: GOOD (  11.12  )
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

This patchset adds thermal support for MT8365 SoC.

MT8365 has 4 thermal sensors, one for CPUs and the rest for debug/dev
purposes. The CPU thermal zone uses passive cooling device with
CPU{0..3}.

Changes in v8:
- Drop support for thermal zones 1, 2 and 3 as they are used for debug only,
and would cause aggregation issues with current MTK thermal driver.
- Split up 4/4 patch into 2 patches for clarity.
- Link to v7: https://lore.kernel.org/r/20221018-up-i350-thermal-bringup-v7-0-ebf08ff2eddb@baylibre.com

Changes in v7:
- Fix devm_thermal_of_zone_register() error checks.
- Link to v6: https://lore.kernel.org/r/20221018-up-i350-thermal-bringup-
v6-0-c87b9f75550b@baylibre.com

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Amjad Ouled-Ameur (2):
      thermal: mediatek: add callback for raw to mcelsius conversion
      thermal: mediatek: try again if first temp read is bogus

Fabien Parent (2):
      dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
      thermal: mediatek: add support for MT8365 SoC

Markus Schneider-Pargmann (1):
      thermal: mediatek: control buffer enablement tweaks

 .../bindings/thermal/mediatek-thermal.txt          |   1 +
 drivers/thermal/mtk_thermal.c                      | 108 ++++++++++++++++++---
 2 files changed, 94 insertions(+), 15 deletions(-)
---
base-commit: a2c81dc59d41e92362ab7d41d0c15471ea50637d
change-id: 20221018-up-i350-thermal-bringup-ad386d37056f

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

