Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A990CC43460
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 12:18:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50E3E6112D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 12:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50E3E6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQeYpBsee2Z2Z6mpTm71u0hiOiLpOzoYVIUR+y5AVUQ=; b=mZAE0LTMb1agObxa1q80ZMBTYY
	dvxCH3UH56VJ0v9c5ag6dWRs/PNPAOm9cfsYMshjFnkv7ECUhG6m0G9kC3icw3eS3x9vnTyXbRqY0
	VrKIGTLp2zO7UQozfG8lw0sMA13k92uBDRqf3e/ShwY4ureBAhS+5M10ebTS90O2xefPZpfd82PSA
	j2knsuYpdE+05jX2TWuUjX41pNJFAQcx64OmLZt/NVQ6Z6NRfXTcwYVpRmkaISE9tDDlGy2dVUmc1
	a4AX8t7QILKcRkvfjcoicZg5jQBJbWzoCxeF+RAPHAokgxWYdQccMnZp9YR1LYVZ5WIAncuGzbyFz
	YXkHEuSA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRwHF-009ZET-Jq; Thu, 01 Apr 2021 12:18:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRwGt-009ZAY-UH; Thu, 01 Apr 2021 12:18:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0169F6113E;
 Thu,  1 Apr 2021 12:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617279476;
 bh=wRad7N84rWD9dSoio69a4lZ1e70YET8Y/U4ELbCnnho=;
 h=From:To:Cc:Subject:Date:From;
 b=Q1xGCX8CjWBXtQC1pgo9/9vi4nDHYsR9ze0Q3GiyebU0GCkZVF2x7Dm68maSFFiUb
 aYhFb4Mtsxe3dwyRk1InCmoNe+43BkSOmz3+yXmoJlqQon680CoD7Fu0OV/kMatoKB
 POCl1bXAfQ85z4s39lkLH+3JCvV54zR+CeAxccTEvavGiJh0qGmRlyOcVNt9cvXxRq
 kYRsUf12VYN3g12XZxM/SAQ9Jf1Po6QForEFkcVk/jW0b2lIFgc1wXKAcg30pF7BC8
 U8xRKFjOp2o3cBdsuc5vEOD8ftGdy/B8MUbxDoRdCuirrnPb1300SCFtXBNU1EX6Km
 N9eYgXDgwnnkA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lRwGn-001c2K-FQ; Thu, 01 Apr 2021 14:17:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?q?Przemys=C5=82aw=20Gaj?= <pgaj@cadence.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andy Whitcroft <apw@canonical.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Joe Perches <joe@perches.com>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Vitor Soares <vitor.soares@synopsys.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-i3c@lists.infradead.org,
 linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
 patches@opensource.cirrus.com
Subject: [PATCH 00/32] Fix broken documentation file references
Date: Thu,  1 Apr 2021 14:17:20 +0200
Message-Id: <cover.1617279355.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_131800_307312_A3AD869C 
X-CRM114-Status: UNSURE (   9.23  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Each patch on this series can be applied independently. They fix broken
file references.

Most of them are due to DT binding renames, but there are also other
unrelated changes.

This series is based on next-20210401.

Mauro Carvalho Chehab (32):
  MAINTAINERS: update adi,ad5758.yaml reference
  MAINTAINERS: update ste,mcde.yaml reference
  MAINTAINERS: update brcm,bcm-v3d.yaml reference
  MAINTAINERS: update fsl,dpaa2-console.yaml reference
  MAINTAINERS: update st,hts221.yaml reference
  MAINTAINERS: update dpot-dac.yaml reference
  MAINTAINERS: update envelope-detector.yaml reference
  MAINTAINERS: update current-sense-amplifier.yaml reference
  MAINTAINERS: update current-sense-shunt.yaml reference
  MAINTAINERS: update voltage-divider.yaml reference
  MAINTAINERS: update invensense,mpu3050.yaml reference
  MAINTAINERS: update lego,ev3-battery.yaml reference
  MAINTAINERS: update marvell,armada-3700-utmi-phy.yaml reference
  MAINTAINERS: update mtk-sd.yaml reference
  MAINTAINERS: update atmel,sama5d2-adc.yaml reference
  MAINTAINERS: update pni,rm3100.yaml reference
  MAINTAINERS: update renesas,rcar-gyroadc.yaml reference
  MAINTAINERS: update st,lsm6dsx.yaml reference
  MAINTAINERS: update st,vl53l0x.yaml reference
  MAINTAINERS: update snps,dw-axi-dmac.yaml reference
  MAINTAINERS: update ti,dac7612.yaml reference
  MAINTAINERS: update nxp,imx8-jpeg.yaml reference
  MAINTAINERS: update ovti,ov2680.yaml reference
  MAINTAINERS: update imi,rdacm2x-gmsl.yaml reference
  dt-bindings:iio:dac: update microchip,mcp4725.yaml reference
  dt-bindings: iommu: mediatek: update mediatek,iommu.yaml references
  dt-bindings: i3c: update i3c.yaml references
  dt-bindings: power: update battery.yaml reference
  docs: dt: update writing-schema.rst references
  Documentation: net: dsa: update configuration.rst reference
  Documentation: update sysfs-platform_profile.rst reference
  pinctrl: update pin-control.rst references

 .../display/mediatek/mediatek,disp.txt        |  2 +-
 .../bindings/i3c/cdns,i3c-master.txt          |  6 +--
 .../bindings/i3c/snps,dw-i3c-master.txt       |  6 +--
 .../bindings/media/mediatek-jpeg-decoder.txt  |  2 +-
 .../bindings/media/mediatek-jpeg-encoder.txt  |  2 +-
 .../bindings/media/mediatek-mdp.txt           |  2 +-
 .../bindings/media/mediatek-vcodec.txt        |  2 +-
 .../bindings/submitting-patches.rst           |  2 +-
 Documentation/filesystems/cifs/cifsd.rst      |  2 +-
 Documentation/power/power_supply_class.rst    |  2 +-
 MAINTAINERS                                   | 48 +++++++++----------
 include/linux/device.h                        |  2 +-
 include/linux/iio/dac/mcp4725.h               |  2 +-
 include/linux/mfd/madera/pdata.h              |  2 +-
 include/linux/pinctrl/pinconf-generic.h       |  2 +-
 include/linux/platform_profile.h              |  2 +-
 scripts/checkpatch.pl                         |  2 +-
 17 files changed, 44 insertions(+), 44 deletions(-)

-- 
2.30.2



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
