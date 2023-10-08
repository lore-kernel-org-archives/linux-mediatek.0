Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC58E95A86
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Oct 2023 01:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dn+LeH/wVxtkvKkasM+uoFktIvDnLaQJ5n5AGroHogY=; b=SGbujksBX/2O7o4OtiJj9ViGJN
	kCxy+vkV1EgfRdwxJPHI0mPtolM4Hp4H1C2Nwhp0dwp8S+Ep4vk/8tSrrgkT2r0zvvt6EEC5MoXMY
	5Uu4b5JbwwLG6ZoCQ11P1o3FenE+A3M1+GZPK30bDVY7ZLA4ivWI0ny5IS6xgA1GkisG5FQyxsneC
	K5idlynW0w+vEh7C/gnxwHb7cNyGbZf3UPYrRc5pPSV0YYYFfMwyQq4ixj4ZyE0k1MoR/yhvIysdc
	NZsoED2VGhAaMhxDS5SxV3M48sJaDe/w3rSkqFQVp0I7pEldhbdaJaOuizJBXyyXp1UwbO9vkLuwu
	b4lwI0mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpIsY-0089lW-0W;
	Sun, 08 Oct 2023 01:46:46 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpIsU-0089kc-22
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Oct 2023 01:46:44 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3af6cd01323so2338601b6e.3
        for <linux-mediatek@lists.infradead.org>; Sat, 07 Oct 2023 18:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1696729599; x=1697334399; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dn+LeH/wVxtkvKkasM+uoFktIvDnLaQJ5n5AGroHogY=;
        b=OekkPvu2/OqxwMLn6WG3mcmvKDYJrgc68YikSBBo47XQbL8kwS/VMh2reKwEXwJ5be
         p7lq5U38fnCTFwHa6j9D4Zi8JiyWADr3S5fNYWGycSvO3fN2TAaqF5/BifQVDtARepLT
         XDkcdjdwxrk1knNwfwmUKQwKZhHKmMzQg+u9MaRUE3CGmuVg+ngiq8xKUUY7iwLaeYeh
         8cGVt0IVinEeY7kuX93muZbV3jXaXWPr8SQR9GPC7Q4/LqvZEGMuXAjtDo+rkxC37zi3
         jmLKLbdtaPjBRb07l8+QUDpH6lGEB3ykmY7+E6UXrVn5Q7VnXnFk7q0okF94MvqZwFmd
         uU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696729599; x=1697334399;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dn+LeH/wVxtkvKkasM+uoFktIvDnLaQJ5n5AGroHogY=;
        b=J743MIPrL/l6M1G2AXnMA4TcMqANIIOaoP0uAT8Gy4QT/UrhOjDunVjRXQtLrtFNmP
         1VBVszsi4YNT7Uv+bjpZELBfwUaItr+wEF80UO/bqTFjlU67pNY0wnweCSRi9L6EL9ZP
         DMJ+aynidghlFpEJ6EvzdaMhhalnsLfJBaCoEPwZ0MdCud6eFN4GOz1j09dS7rKZ/Xof
         uEThAVMTYMcfWvmqqsAcUZ2Flru98xbcleRxQ0Mou/DBO7q/uBHfNwGWTZ+3gSBvG9SS
         oQUqaL+pt6mra9KjIgkkPiRqwIcb0KZIFFt6v+o0+xJntHrPqjyS1zut+FzOzCCpN5AH
         RQqw==
X-Gm-Message-State: AOJu0YzOkU7w9YhvK4SqKmDCgWMqG0HBvqf/mMRpbsyRV5auCLmH23jK
	KgopzMSzveG42zhTUinRCJtXCg==
X-Google-Smtp-Source: AGHT+IE6yFex+CBBnGk+rQNeKa/UkrEvSdChHNpjRS3shM7fIg4wakRnaXyA0jVOySczm3ooSu1FnA==
X-Received: by 2002:a05:6808:3081:b0:3af:71cf:2b52 with SMTP id bl1-20020a056808308100b003af71cf2b52mr17002866oib.27.1696729598914;
        Sat, 07 Oct 2023 18:46:38 -0700 (PDT)
Received: from ubuntu.huaqin.com ([101.78.151.205])
        by smtp.gmail.com with ESMTPSA id v1-20020a63bf01000000b00563826c66eesm4888846pgf.61.2023.10.07.18.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 18:46:38 -0700 (PDT)
From: xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	robh+dt@kernel.org,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	tiwai@suse.com,
	trevor.wu@mediatek.com,
	maso.huang@mediatek.com
Cc: alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	xiazhengqiao <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [v4 0/2] ASoC: mediatek: mt8188-mt6359: add rt5682s support
Date: Sun,  8 Oct 2023 09:46:27 +0800
Message-Id: <20231008014629.4971-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231007_184642_995053_C091CFBF 
X-CRM114-Status: UNSURE (   6.72  )
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

To use RT5682S as the codec and MAX98390 as the amp, add a new
sound card named mt8188_rt5682s.

Changes in v4:
- add more reviewers
- Link to v3: https://patchwork.kernel.org/project/alsa-devel/patch/20230927033608.16920-2-xiazhengqiao@huaqin.corp-partner.google.com/ 
              https://patchwork.kernel.org/project/alsa-devel/patch/20230927033608.16920-3-xiazhengqiao@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 2/2: modify mt8186_rt5682s_i2s_hw_params to mt8188_rt5682s_i2s_hw_params
- Link to v2: https://lore.kernel.org/all/20230926040901.20338-3-xiazhengqiao@huaqin.corp-partner.google.com/ 
              https://lore.kernel.org/all/20230926040901.20338-2-xiazhengqiao@huaqin.corp-partner.google.com/
   
Changes in v2:
- PATCH 1/2: Modify mt8188_rt5682 to mt8188_rt5682s
- PATCH 2/2: Modify all string "rt5682" to "rt5682s" and merge code 
             in mt8188_fixup_controls
- Link to v1: https://lore.kernel.org/all/20230925083847.1496-3-xiazhengqiao@huaqin.corp-partner.google.com/
              https://lore.kernel.org/all/20230925083847.1496-2-xiazhengqiao@huaqin.corp-partner.google.com/

xiazhengqiao (2):
  ASoC: dt-bindings: mediatek,mt8188-mt6359: add RT5682S support
  ASoC: mediatek: mt8188-mt6359: add rt5682s support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 141 +++++++++++++++++-
 3 files changed, 141 insertions(+), 2 deletions(-)

-- 
2.17.1


