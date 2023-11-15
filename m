Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78060C07548
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Xe+jBSZDRViLjHU2Fh8GFGG/BtKIbiIE9JaPkuq5wv0=; b=H8jU+0tU07K/HzEA2OzsES10YD
	+6AsPU6JMV5ikAnllNgZUfS+D5ioXe9dPWv42Pcl/ZI48q6L8SHLxqox2DUVQqiYRjm1jOqXWDmIZ
	qIOt56uEb3vHe4v/wtr8oEI4eHrJqxpWotd37KrTDxKKlfmqPVP3/1L1ecv/8esvFvJG/YBEWZYZ9
	COqzY45OZ+Ip+flYwFZbPZ0wXqyDuBKd7PyeolGFvcoTb9b42tdtJFXQ3O/5jD5CcKx/6xmwRTk62
	lqWnay1yF/CLkTHD5L36Z10n/pxntsvOiN1K3bJQhzyo2HoNe0KjycrOd5vk/3EibQ4v47tDJOeOe
	Tatkte2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Btd-000IrC-14;
	Wed, 15 Nov 2023 09:09:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3Bta-000IqD-2T
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 09:09:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1cc1ee2d8dfso58607105ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 01:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1700039351; x=1700644151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xe+jBSZDRViLjHU2Fh8GFGG/BtKIbiIE9JaPkuq5wv0=;
        b=U4gQH45ysKWWkV7S7chpmb1EsWTQ13I8wUgNq9OSWzKd7n7n8aqIOsbXtaIuiAE9cl
         3YoIQlXo1heGsWUOlOy/kKlkiY0Bf6UW44oXSA8nF+O7zTI5NdRFOX8mZTEpASh8rMK9
         inK4ghrEgjwFj3wGqhwUuBueGqD3tuRg2ZvLfMP5ql+385ODmuI0gQMhTcpbgMdrXW4F
         4GsCz1yvxVfYI2Q92PICP7EU4jw8b0eMP9CbpiLJAfcXcTReLRPWtIKrs30S1ZZ29SBe
         gDeAa8yEn5pACYZPMrIugxM2/LwQM1kLgp8q9KlM3TMpw3khJK58wXbfULMqGMw8H2te
         eZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700039351; x=1700644151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xe+jBSZDRViLjHU2Fh8GFGG/BtKIbiIE9JaPkuq5wv0=;
        b=c1wEFdseOzByMpoiEUpdXLRvX2Oc7wm3/pU2nzngpaNu5mxtFA0ZJpi46LOmBo1uS2
         3UAqUsS2haPFYdSbkz0N0/i0bHyepDnEwcNPmvFk1qQ9Bn8gINhvwU5NA4q6iSq4YvL5
         2S+dvK5tmjjpL4xv2WUnNOtrAZAVopbRJQVxLqmHO94P35y2DFlRjufwaCJnb3XKi7ps
         eQd8GpKBTf923WSv7GB99Kdcsop2LkO5wkXIKB+4CK9rRy38E6qXCmskvjrRDiQgarP6
         9w2qHlgIieI8sJrvT0RM07LvKhQKXrZw2TAFuACh0Ty0UZuaByFkYUsYJbeOx6tbY45e
         ADoQ==
X-Gm-Message-State: AOJu0YwNQubr233szi2brqaBdSaJFanKObHwA7M79p7nHXt75pHX8zA3
	7ktbBi2HQ6jd9TW2W4ZjbJLVqg==
X-Google-Smtp-Source: AGHT+IG4HyCL8b8HqdWaXMmlJC3SOuaS68LVMSVy/94xsMK0IvacCBwGKqKh39TFrWPqsemabsvOKA==
X-Received: by 2002:a17:903:5cc:b0:1cc:5549:aab2 with SMTP id kf12-20020a17090305cc00b001cc5549aab2mr4574255plb.36.1700039351498;
        Wed, 15 Nov 2023 01:09:11 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id l18-20020a170903245200b001b9be3b94d3sm6977377pls.140.2023.11.15.01.09.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 01:09:10 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [PATCH v5 0/3] add es8326 dt-bindings, es8326 support and Enable dual amp for rt5682s
Date: Wed, 15 Nov 2023 17:09:00 +0800
Message-Id: <20231115090903.578438-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_010914_825294_5B0230C9 
X-CRM114-Status: UNSURE (   7.72  )
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
At the same time, Enable dual amp max98390 for rt5682s.

Changes in v5:
- PATCH 2/3: Change the names of some apis
- Link to v3: https://lore.kernel.org/all/20231115085329.541764-1-zhourui@huaqin.corp-partner.google.com/
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

Rui Zhou (3):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: Enable dual amp for mt8188-rt5682s

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 102 +++++++++++++++++-
 3 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.25.1


