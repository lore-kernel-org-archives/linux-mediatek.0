Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F99C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 16:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T/A2od+/7NpDp4P5tBbhkG26Bl+AbtZYXPy1lIxm1uI=; b=UbYmZCAsfm49b9
	fTxOXBtCaez+w3TfubP2zWnUTYSV2pp30mdhsvMR0sPUiHV/0yGE6XHqjk0WRKnYY7ywc+QV3AEKb
	dZ9PheSMWpaSbtifr9RRvFw5xLADWR6KeNCygt3UANpaNES6fQQ1xZjyl7Prgn0fRRMTDQr4Qv/Tc
	zAbzhClIJY7bnOLgKCGW/16P5Png3O4SFaIm8GeEr5qJX1xaHcZeL+YS0WCAcG8b5go1wal6Yjzot
	WMeNdV5tBKXex8RQY7APDQF7fEzJ7A8nSJnO4sMzO9fwgaE9g0GLwTVlxEXX1bcMzXZKPEJMgzrUT
	/OG2Vn+Mvlf07AuoQJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYWEk-005ks9-Jr; Sun, 27 Mar 2022 16:59:30 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYWEY-005krF-9R
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 16:59:20 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso7182516wmz.4
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 09:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l3UyXLPhfuWhTj2RPYL4FasSdvEckI9twBVwXQIlqIA=;
 b=KDeuq11AKukzvYsj++BJG33YHL7Mer/+9ATFpj/efErMMrEfzHe8nrDx/dbWKUv/KA
 +FJfTRWYdV32bxMxXCJ/USQkvIDSoVPS3ivQVRbUa4a0sjocq4aaCH4gbaJmlUnxmQea
 noeL7SeF4EtNesEAfDRTzvffbihG3ujPt3bAoczI1gniY+W5FY9opripRtF9z7KuEv+K
 VzrS3tfRSIJbwUk4uiu9It1z+/0HkwgmIavFalMpGsPbWMepnvY8xONk5WKNtegu3q6p
 dECQBGyiSUEywhFVavuw9fdQq3/dbGz5Okvawno3LUtrDqKDIf0r9K60F6hhNfsOAOGX
 CVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l3UyXLPhfuWhTj2RPYL4FasSdvEckI9twBVwXQIlqIA=;
 b=GgANg9O2d6rzOzSpJ2/AqwVIkyRbPQ7Z07jVzX/ghi/uAmT4KN7SWQKNc2fI3vjd71
 CabQhD+LC0fEOjNebiBBiS/toEI29JhI+X7Q32cxYmvZmqrZ8jPsrFmIhWRzRdM6S/p0
 8anxisFk0hdPP1sh4ept5y2Wc0nR4OTGiQu2rM/0pv3GUvSZbuQ2AxRKT0NcKbk5MRuK
 CI3fyXupJEGPDqKI4kEZdAZ5d6aUpJQVairLCt/7vS6h70AtF+2hEdIPv2BO3BxaQs6/
 hpyebiOVF9R2VJI0j9MGFpJuERbBPQPK+TDcfn0niQqYii7667HwimIxzSjGAbR0ZyRP
 Ud8w==
X-Gm-Message-State: AOAM531CFksbHqTDu7BWEJt3MAna9lJCmQ1v/WosgcECIKYiIGjLJBHC
 ikmFmjUBBMh+c2UzV/5ba9zOhg==
X-Google-Smtp-Source: ABdhPJy6n5q9yBGyX9r7VhBqPUrEoQwv8FgKCvcnII7pPqBaX1v3Z9Y8oIPzwqP/c6t0x9Ss5N3XRw==
X-Received: by 2002:a05:600c:ca:b0:38c:b426:3124 with SMTP id
 u10-20020a05600c00ca00b0038cb4263124mr30231617wmm.59.1648400356750; 
 Sun, 27 Mar 2022 09:59:16 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 2-20020a1c1902000000b00380d3873d6asm9979423wmz.43.2022.03.27.09.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 09:59:16 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 0/4] Add support for MediaTek MT8195 demo board
Date: Sun, 27 Mar 2022 18:58:33 +0200
Message-Id: <20220327165837.3048639-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_095918_381410_D173218C 
X-CRM114-Status: GOOD (  10.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch serie adds basic support for the MediaTek MT8195
demo board. For now the support is pretty basic and allow
just to boot, use USB, and the SD card.

When more IO support will be added for MT8195, new changes
will be pushed to the device-tree of the MT8195 demo board
to support these IOs as well.

This serie depends on the following patches:
[0] https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220216113131.13145-4-tinghan.shen@mediatek.com/

Fabien Parent (4):
  dt-bindings: arm64: dts: mediatek: Add mt8195-demo board
  arm64: dts: mediatek: Add device-tree for MT8195 Demo board
  arm64: defconfig: enable MT6359 regulator driver
  arm64: defconfig: enable some mt6360 PMIC drivers

 .../devicetree/bindings/arm/mediatek.yaml     |   4 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 539 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   4 +
 4 files changed, 548 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
