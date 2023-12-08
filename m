Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE55C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Dec 2023 07:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hy9XPK0hoWEXu2LHc+erqW9CFiJDjlD7IR72sN7ssWg=; b=zzQOSST1nMla+4dWIW31zmaxMQ
	PCKM2LDwm1H0tTAf5dob7vNr0VVbnPUvtL693vocVESwHcbWXJ1415pfJvByguhGUxQglxJfOrUm8
	nT6J4qnIkwhc3NagA+MYbzcsUIkW/QMiHORi+pOt2Otiqb4Yb4yoACzswngbnARD6XLfqkcNw4zio
	AVfxuB4ASoAUbYaeDmOzQ9OCxbzuKvmDVcY3jL+MlebO8oOBtY51Man+DPhgz7qfDseBMuNKPQYb5
	RgNnt5XHTkMh2F9QTKgR0TDGvFKrJdGa0kEuGJV3Gd7OZ9Tp6xh7NGX1JTSu0bvyEGeZfAPOWqrXq
	mZroSymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUzc-00Evef-1F;
	Fri, 08 Dec 2023 07:09:48 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBUzY-00Eve1-1P
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Dec 2023 07:09:46 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6cb55001124so1166536b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Dec 2023 23:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1702019381; x=1702624181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy9XPK0hoWEXu2LHc+erqW9CFiJDjlD7IR72sN7ssWg=;
        b=yy3eKM5a7NvBHvi3YPCy2zfv4swROxu1nJoJ5le45F8dO/neU1z+Xv4wzkiQXLwy4T
         U0Ay3jfajAw57KpYa1LkQmlx5erEHrVoxLy9ZY9MFS8xVi3H0V3AfjyHcQDTBsYgjV7X
         NS4aZImk3GI28Ob+Qb6e8O+PVUxs5CUqBJy6wHjollQLZeiT6CNpOCdBkGk1AJ3hIs1x
         J3P500tpDchJBo3HD48MpLvZStPY7ItBR9LOFBAgSD+6A9QG1RV0Bx12z4B23t9s4ecs
         NYVKsLKbY0h2IJ2Ojjkw5MXbJYgcZweNKTdS1H/DACXaxXDP1zSeGcbUMmNM4SesYZ9U
         iCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702019381; x=1702624181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hy9XPK0hoWEXu2LHc+erqW9CFiJDjlD7IR72sN7ssWg=;
        b=p8JO7vGIl0juywrxcSvtObFol1Zrnsg97gvaBzgNc1zit+ZuVxGkkJMaAkTx+uaqYw
         Lgsm6jdfidBv0a/LPnR17uHJjz2Pg5T+iKUhpNZTL/Ywqk5JejjGDIxNxh93uQP5mIjP
         xD7th3K3JVVvsUjGYn4OEsKCmmhxt5WO23iSsajH59ZwHcewhLYdOavZcLI5wBX9soSA
         ldBQtZCnunWmTgo9AD4OEP+tM/jOG4woz4NDB5CythNqKABKGAbn/1evBdENBiCWodT2
         fiz0oxJZ8G6V2j/I/GQREkcMP92th8IAYGArrErlT4uHp3d+/zD8/luNzhBYd4zqErbM
         ct+g==
X-Gm-Message-State: AOJu0YyK/ugczQGMoeOlcUTlqsyaVaevTDWa7o2saTf2uF4TLNpxpGAW
	kjRRhDLqEe1Mw+N3Id+4+1t0Sw==
X-Google-Smtp-Source: AGHT+IEQdHv4tsS6c9Jx8vk7k7glqLth7o5DU6+RW8b9RLIHJhPN+R2gVZ76Oywxsh8fytmb0EPBWw==
X-Received: by 2002:a05:6a20:729f:b0:18c:5178:9649 with SMTP id o31-20020a056a20729f00b0018c51789649mr581469pzk.14.1702019381479;
        Thu, 07 Dec 2023 23:09:41 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a056a000cd100b006ce4b40e7desm918061pfv.90.2023.12.07.23.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 23:09:41 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	trevor.wu@mediatek.com,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v8 0/4] add es8326 dt-bindings, commonize headset codec API, es8326 support and Enable dual amp for rt5682s
Date: Fri,  8 Dec 2023 15:09:29 +0800
Message-Id: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_230944_714824_D57510B7 
X-CRM114-Status: UNSURE (   6.27  )
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

Add dt-bindings for es8326 and codec es8326 support. 
Remove duplicate code, commonize headset codec init/exit API.
At the same time, Enable dual amp max98390 for rt5682s.

Changes in v8:
- PATCH 3/4: Change the #define ES8326_CODEC_DAI macro definition and filter the es8326 widget
- Link to v7: https://lore.kernel.org/all/20231116093512.4180240-1-zhourui@huaqin.corp-partner.google.com/

Changes in v7:
- PATCH 3/4: Completion "}"
- Link to v6: https://lore.kernel.org/all/20231116073106.3757618-1-zhourui@huaqin.corp-partner.google.com/

Changes in v6:
- PATCH 2/4: add a patch, commonize headset codec init/exit API
- PATCH 3/4: Remove generalized code
- Link to v5: https://lore.kernel.org/all/20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com/

Changes in v5:
- PATCH 2/3: Change the names of some apis
- Link to v4: https://lore.kernel.org/all/20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 2/3: Change the names of some apis
- PATCH 3/3: Change commit description
- Link to v3: https://lore.kernel.org/all/20231108063804.592982-1-zhourui@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 3/3: Change theme description
- Link to v2: https://lore.kernel.org/all/20231108012617.3973539-1-zhourui@huaqin.corp-partner.google.com/

Changes in v2:
- PATCH 1/3: Change ES8326 location in bindings
- PATCH 3/3: Change theme description
- Link to v1: https://lore.kernel.org/all/20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com/

Rui Zhou (4):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: commonize headset codec init/exit api
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 120 ++++++++----------
 3 files changed, 58 insertions(+), 64 deletions(-)

-- 
2.25.1


