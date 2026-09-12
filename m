Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB22C88E53
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 18:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BjdcnniX+ccVQA7cSgS2ONHbmJ0xMV8RyAyGUcD/M60=; b=ikHWG1nByU2NYI
	6ESUcdk6QcM1Q8v2DRRxBvjX7at1Zjzssnjllnt4VbWVS5gjXFf4OqJ1/5RwT1sgU3hmK8ZoeITKd
	n0iULMBqs1j7AVolUMT/edCiHFjfg/R1qUvcbAd1AayjRudsQ83W9XZTRxDGe90FGccU4KY7b82d/
	uTQca3z9pB9981ClBGd3/Rd0lazsR6nckK5900hFc9Dokpv3m8yXd3/LUr273a7ecRbaFhOKozZhl
	v/zO2uNkZTAkmmE7JackEtTkos+jRFhcDPv+ryVU/tpB1+g2ugbbk7xzMS+vt73rPekF4wW/QpLYa
	sDdse+iLLGmU3Lq+VvLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5SN2-000000013bU-0R7H;
	Sat, 12 Sep 2026 18:22:36 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5SMy-000000013aL-1agK
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 18:22:34 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-7f66624aa21so399936a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 11:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789237351; x=1789842151; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BjdcnniX+ccVQA7cSgS2ONHbmJ0xMV8RyAyGUcD/M60=;
        b=USKPdsT5kv/LCFTFVswVb73/9y01WVyfwsOaLvhKG2Mu46QVziiXNZvpEipNp9KoWf
         PBCLJ2quH4hA/NiyNNsprmQOWtNEoC5Eg0YZ9i7vTZtlgGRijxmH/6jTpowVzDEMeNbD
         hKwefOD6+rh/NMVhkZa/BGsfS1cWyG7MDf3g5YA27vBfvvUboH3PjlbxLqPiM+S/IQ6t
         iS7UawnXi2Pw1w3p9FexOuykY2gSlf+RskjpaG3gjOsH33FPLYwsVMualRJgmPlyz1ml
         5V9tRTXiF9esMAJIuRIABKExDMKiDLlRRWFEqK+DMr4O7PFMvGuAhiu3OU+s8nqdfsQZ
         BF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789237351; x=1789842151;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BjdcnniX+ccVQA7cSgS2ONHbmJ0xMV8RyAyGUcD/M60=;
        b=mvH7xkxf1N1v6J5Y3obaZ1rmpKANzjbllG6bIpYRavEIkMdvfIoG/aNfGjyUwNaVu0
         pxJ4Q0prBtduoGyBBORaRohxT0ClAJs7FGB5hdYWGfKjvhBfsN+OiytZrLSdBzLwmWLy
         4XFaX6VkYpuQ8QyDKPBQMzj6PcERBHBeXtnH0Q93vTWdnY5WalL6v0Zm8qzpTcon9X0x
         Y1jbhi2SEjrrF2+rP/NQtg8goBAznCX0Ue9E4wPwfdeyDOmZ1kUAuLJ56KaI/ANr3bD5
         uX81hIgsbKMPG5n92Ffs0xkKiGQXQNhyOOvqbcouYlFBeUnP8Q8+ZM97mWRCLIoetBzF
         u9UQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgFXXjJvDtTjOyGNTiNd+0WIv9P5b7hHaizEqF9Afhdooy0xCXQvHD80c5ZOhJkOs1qhmPaVQLv9izFnoigQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lR3CZqj9dNu9U+MIUSYoUE/olTJ0J7giz7dbfJmbu/Flp0f2og
	4u8ijeI80MRvELMa+rjuTrpJOGoEQtzjHj9Z+vwyWpYNKLiC07ryl7MD
X-Gm-Gg: AYBFou3Ihp77j9fNqW9/YuqkxqYXiyZhXBUgi2UoNhClV9XUQvlUNGbZ4KEnfZnJo7A
	mywNoTtnCLDRgEYCNfWauo3tuGoeenN542Q0OZxfBRccPjUn5gUYDIpfkOibCGKurX5ygbqKg9X
	sR4JOsNpP/rMJaMTuZT5fhlO8sqV6pQyU7iy0NulMESlpurN2Evc2Wf9M54Odj45sP+22ny5E+m
	oo5pY5Dv1ujy09fr11kjVj2mIYgPuWG6xgJ12ZQWqGFbnMNZdbbo2+cOlyhn2KpJ8wWG/u8/tvv
	HVV6Csz21v82THtZSnYmb0T873SHdHWGb9HHvtLlaDGigGIEdA3BS6hS6/QQj1MS73jw4b+tBUm
	HzsUfnOFSBlpk275ibAyrsfsArOxx5hDlDHvAbqfZg4VhlRnNlwxLiW7qH4+fdYV+kDQjVNISD9
	5WhQyN3Qu+Wmwgsjh+izrd+elgXuAuyl3ZhgtseU72WFFws+69EQt6ZjWhB74WbNAZNq8=
X-Received: by 2002:a05:6820:214:b0:6bd:cb3f:5896 with SMTP id 006d021491bc7-6c24d39681emr1997214eaf.30.1789237351016;
        Sat, 12 Sep 2026 11:22:31 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df64d89b9sm5413898fac.1.2026.09.12.11.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 11:22:29 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Subject: [PATCH 0/2] drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0
Date: Sat, 12 Sep 2026 13:22:21 -0500
Message-Id: <20260912-add-boe-tv101wum-nm0-v1-0-3057a08e8b80@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O2W7CMBBFfyXycwd5nEBEhKr+B+LBy5C6xWOwH
 VMJ8e81y+ORzl1uIlPylMXU3USi6rOP3AA/OmG/Nc8E3jUWSqqN3KIC7RyYSFAqSrwuAThIcFq
 iHYZxcGYjWvSc6Oj/nrX7w4vzYn7IlkfX20h0WdpeeWnC6ExgYwi+TF0dVz0kqx5qoJz188jU7
 d4/EC5NBY5VF/oFLmuUCuGsmU4ZqgIJ2K+px63U49F8Be355NnzvIpp/hSH+/0fxNISU/sAAAA
 =
X-Change-ID: 20260912-add-boe-tv101wum-nm0-da01c4474db6
To: Nickolay Goppen <setotau@mainlining.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789237347; l=1702;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=kKPzi/HLXfog7rBMUGiYLepe2mjam6b/jz1qv/PYobU=;
 b=zhgopAjqYGTLQfAWgqPnNFDJTigscCfew+z0rKaCkpyo6MuRFZd+vY+oPw5xjQIg8OP5kWijt
 UfJm8fc9c7UDq7WRF3gqj6GifalJJCWcfTHEurQeM7krhqd4d0rbQSa
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_112232_958316_7D297D71 
X-CRM114-Status: UNSURE (   9.48  )
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

This series depends on the following series:
[PATCH v2 0/3] Novatek NT51021 DSI panel IC driver
https://lore.kernel.org/all/20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org/

The BOE TV101WUM-NM0 is a 10.1" panel present in the Amazon Fire HD 10
(2017) tablet. It differs from the BOE panels in the dependent series in
key ways:

- The pin count is 51 instead of 46
- The vendor asks for SYNC_EVENT_VDO_MODE with cont_clock=1 instead of
burst mode.
- Different timings and flags expected.

The init sequence, flags and timings are mostly adapted straight from
Amazon's vendor kernel.

Tested on the Amazon Fire HD 10 (2017) driven by mediatek-drm: 1200x1920
at 62.5 Hz across a cold boot, display off and on cycles and a
suspend/resume, with the MIPI TX PLL reading back at the intended rate
every time.

Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
Ryan Brue (2):
      dt-bindings: display: panel: add the BOE TV101WUM-NM0
      drm/panel: novatek-nt51021: add the BOE TV101WUM-NM0

 .../bindings/display/panel/novatek,nt51021.yaml    |  1 +
 drivers/gpu/drm/panel/panel-novatek-nt51021.c      | 66 +++++++++++++++++++++-
 2 files changed, 65 insertions(+), 2 deletions(-)
---
base-commit: 5e036ce12de91c6fd674dad33b169c6150be2a7a
change-id: 20260912-add-boe-tv101wum-nm0-da01c4474db6
prerequisite-message-id: <20260911-qcom-novatek-nt51021-panels-v2-0-135e3190a7fb@mainlining.org>
prerequisite-patch-id: d8b58f07dc5c9e1fcf7c51a14b48eddca2e09090
prerequisite-patch-id: 79dfdac7b7fa79f7d05a5f3849909c9a7f956398
prerequisite-patch-id: 79c01de4e67563772dde152cd4c4d0c568b14d17

Best regards,
--  
Ryan Brue <ryanbrue.dev@gmail.com>


