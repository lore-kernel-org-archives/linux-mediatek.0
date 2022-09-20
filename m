Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF241ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 15:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uqh2dUbJoe0czrli6Kd224HI22Ux46FPe3M+hCU7TSM=; b=nxnE3laJEYnaM5cRzaYaHlHx7I
	osleXCI6LHXFjS6N5trxy2sScoDPEZ5bvuZ/lqoB82mE1hhByHWlfbjcRsRuS7ww4b2+HX5OslKI6
	F0xlzrj2JpjQLfpJT9EkEiGOJKcITqWGhyzpcsKNMZ3e9uM818sn/tleGN+M4aZ8p8ZoRcAU+zqt0
	8d/mZSU59p01itBIPsWfQY5vLg0z+HDFJgZJS4XvVJrSrkHhCUccniYUczvh1TZ7hTpOckd2M5OQP
	l7BLUn5CrM/9nF9JLpUnwI3uGNF5pOO7tPIuNo7Ucj+l/CpaxDzXboKAR1fgtvg7f6cSI9EM7dg6J
	jcjPdr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaenB-004gjP-2r; Tue, 20 Sep 2022 15:04:09 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaemv-004gZQ-4r
	for linux-mediatek@lists.infradead.org; Tue, 20 Sep 2022 15:03:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id g3so4701576wrq.13
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Sep 2022 08:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date;
        bh=uqh2dUbJoe0czrli6Kd224HI22Ux46FPe3M+hCU7TSM=;
        b=DXJVo1kZdhTaLHixoiyKqUBvm4HdflY4OsRIzLyHV4lW717MrOMbIq4EGZ0xOzT389
         PCprPBKzPHmgAy781JFqC5+s1HsvkFwvP8AHPzHE8FrmFG+Ep3w6tK09z5oiUIo04u6s
         QpsCkrrwcdC4jTvmM+zUCcjyhnKqYhkN0jou9sXbP9wGbz2hnWqxmHIEo9YhMhAKz83c
         ZVsGAXRsZIe7mCbWVuBOwfmRlwq3AOTkVD5135EGU1qIHWivegHi/VH3PP0xY2dC9BVt
         aoIrdkEZ7hG/o7ldH00g/HjNnrcafYhO0HGI06DixwaDSizyZqZSsmvJzm4k3uuI47gp
         oftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=uqh2dUbJoe0czrli6Kd224HI22Ux46FPe3M+hCU7TSM=;
        b=vrWNi16MNHWDZMQEmrwYl7oXozQvRMS7FZjQQNRu/qKKZlIMnXUTrlduKtyCTpJ5Cd
         bQ/vrpVmPVd822GgjJIpfkCZ7GBQPGu+o/TUwgcO40ndkRTZ6NLeVnG5HV3ZcZ+zRywD
         l6WkkBqNatmgi2Px/M/l8wwmO7hYYHDAqlLbsF6A2AL2nvpI26moOuRxj/IZethTAcGu
         nFJtIbJIGlyV0r+y/8L25oKm64LiWIeZW03lUvaO/SRhz75KmcDshUzo2ZaqX+yMAhP/
         vQpKsBKWeXYCrAS1mzobzbzp03AEy8t+SfCXtUzOm3Ww7L0UhLHEfIyrb507Btqk2NKA
         p22w==
X-Gm-Message-State: ACrzQf1ZjVvsexceIsJk5T+zc1jdAq+Q9JdxLhipXmPP50bZnwI7XRaO
	KcMKpyOueRHvENzreWHxem9Bgw==
X-Google-Smtp-Source: AMsMyM4N3YyCHurPDYZZtnr9E0TUg9Sv7/xmEAaHI2ynKZ4GFkBWucudF/uupLgrSQ0U9mOQa4DTtQ==
X-Received: by 2002:adf:d0d2:0:b0:22a:daf4:87e8 with SMTP id z18-20020adfd0d2000000b0022adaf487e8mr14283790wrh.167.1663686229972;
        Tue, 20 Sep 2022 08:03:49 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id u3-20020a5d4683000000b00225239d9265sm242056wrq.74.2022.09.20.08.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:03:49 -0700 (PDT)
Subject: [PATCH v5 0/4] thermal: mediatek: Add support for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAFPWKWMC/w3LQQqAIBAAwK/EnluwlQL7jdqWC2ah2UX6ex7nMA0KZ+EC69Ag8ytFrtQxjwP4YN
 PBKFs3kCJShhSKnhU+gfNpI9YbSfPG+6SNWxz05WxhdNkmH/pLNcbv+wFekBRVZgAAAA==
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Tue, 20 Sep 2022 17:03:47 +0200
Message-Id: <20220920-i350-thermal-up-v5-0-123bc852d199@baylibre.com>
To: Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-pm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Kao <michael.kao@mediatek.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, Rob Herring <robh@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1663686228; l=928;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=ZDTa/tO2w1q5PgHHJH+pnlRiuHKoLh+P+DGPwBVzPgQ=;
 b=P9O/bhuGn1v+GUuvjvPBQVRiw0A/n7SOtf6jGT64bGiMkH7KDObNF9pLdTQ8KkFK77EYyL5gAOHA
 Au3g1oCCBWraOD/6z1bud2qipvaOG0SPzh5+3xrzGknI5+HRm6JI
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_080353_450163_3F6C7009 
X-CRM114-Status: UNSURE (   8.22  )
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

This patchset adds thermal support for MT8365 SoC which contains three
thermal sensors.

Changes in V5:
- rebased on thermal/linux-next

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Amjad Ouled-Ameur (1):
      thermal: mediatek: add another get_temp ops for thermal sensors

Fabien Parent (2):
      dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
      thermal: mediatek: add support for MT8365 SoC

Markus Schneider-Pargmann (1):
      thermal: mediatek: control buffer enablement tweaks

 .../bindings/thermal/mediatek-thermal.txt          |   1 +
 drivers/thermal/mtk_thermal.c                      | 197 +++++++++++++++++----
 2 files changed, 166 insertions(+), 32 deletions(-)
---
base-commit: 64b269c002273cac4c41fb69572f3684dd1e3284
change-id: 20220920-i350-thermal-up-23edef139b6b

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

