Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8C0C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 03:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0lteZeF2epTnbZm+HcmaDvSRPElrMNDJdx5CvK4zSGg=; b=yuszd9+d78eSDEep7QPQGCWV7C
	v1cLCQUFaqnBTALyju5g2bsMnx6L+Dh5krvAxG8ER+kH052S5PU5eKBoXNo4F7pfjSuOP7t5aViak
	MlG7SzdrCC1ArPxpIwJLJZ9qQuYoDxLAXoRruNbzf2QKWyveL0hDGtvgvPNdHaglMJYy84p9XqVFu
	Kr0KlsczXerxIuz+L3meydPO6LzeNKnA9zDvKLa+8Lvo53xFZaUFU2qh3z8TyqfjbefnI/UEZISTq
	I/5qg/Dw2324vSMl+pIFfMo0Z70rRK0PKRHm+Lax9tj8kkCI0Byi4aKQzVdwfJKvzweEUkx41GX4U
	bdPaAuww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0CYO-000P9T-1x;
	Tue, 07 Nov 2023 03:15:00 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0CYK-000P6y-0x
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 03:14:58 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5bd099e3d3cso3287888a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Nov 2023 19:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1699326894; x=1699931694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0lteZeF2epTnbZm+HcmaDvSRPElrMNDJdx5CvK4zSGg=;
        b=EfoF02b+IrifTYLCF6sgtwbv91fKcFAo9ZhsG4c9CrR4UQQ07uMMhiQ/hfyDTnUrCa
         9NBnEQqKxUBvOk63PoIrHphGesqmeDEtC0QwmwacnkRPvedbFlDOnpks3r2koTSjoEZo
         PwVLw5Z1K4ROKLsuy6pTYzLPwJ/IjJhcRlsDWEO8lGs7Op2/Ea34m6S3xuft2yzOPXl6
         PKMYcVuDiwtHhfx9LkaRMHQ0eOZXV03JdpHcH4zpqWjiYj/8kHHgsa2K4n5BxL3zB5Zp
         Wm2FkjDboWuqtqtDTc2iY0UbM44kqzU3Ip2H86Q0Dl4OULuNUsc6AeabeZs6pRLJK1XP
         VIsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699326894; x=1699931694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lteZeF2epTnbZm+HcmaDvSRPElrMNDJdx5CvK4zSGg=;
        b=IzPzEG1gHJEiQlgHS2XNXDpPyYq2X+JMgfKAO4gfQMCI1Q2PJKHjw0aIL0e29luqMT
         NJhwwc1BBo9zw9GpdpXE2uagwdscDuf/qweG+H8hthGUqoqVvLLp573FWv6jLLz2ZIoF
         eDbFWjACpnagXBc4EVBYSXwi0+9/g8lfK3NNrFhe3B3tzlBOHgx9dUZoV2+FoQUo57mH
         WuJn18lRgfgzjwzhramIJxYKNvdHpKnOCC47WnzW94TA+iZhgv5aB6CAZZf+2Fkhsr2r
         SJ8uO0Vgo/gWjUNi3ts5d6dGXXDk6NZ3iNXRi5Q33UibYdpXDwGeCuzTp0mJStTv3YPT
         DP/A==
X-Gm-Message-State: AOJu0Yy7WPxrimXsGJu7hKSJH5PZgRNyNFIcNYIa3J9O4NciA4SwP8vd
	4FLKjrDs9BkgG5nEX7TIcBIVHw==
X-Google-Smtp-Source: AGHT+IEj4FxcXjLgXAxmzaTiUub5j+hBoaFqQJDUtXczTQbVwUSlrqukLf+OTjMw+XTBY28WY/FZ5Q==
X-Received: by 2002:a05:6a20:160b:b0:159:c24f:5fa4 with SMTP id l11-20020a056a20160b00b00159c24f5fa4mr30547054pzj.1.1699326893820;
        Mon, 06 Nov 2023 19:14:53 -0800 (PST)
Received: from localhost.localdomain ([101.78.151.194])
        by smtp.gmail.com with ESMTPSA id jk4-20020a170903330400b001c9bc811d4dsm6552282plb.295.2023.11.06.19.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 19:14:53 -0800 (PST)
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	perex@perex.cz,
	allen-kh.cheng@mediatek.com,
	kuninori.morimoto.gx@renesas.com
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Subject: [v1 0/3] add es8326 dt-bindings and es8326 support
Date: Tue,  7 Nov 2023 11:14:39 +0800
Message-Id: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_191456_647476_3A81C801 
X-CRM114-Status: UNSURE (   9.10  )
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
At the same time, it's necessary to add support for the driver 
to connect to the i2s dual-channel amp.

Rui Zhou (3):
  ASoC: dt-bindings: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: add es8326 support
  ASoC: mediatek: mt8188-mt6359: add two amps support

 .../sound/mediatek,mt8188-mt6359.yaml         |   1 +
 sound/soc/mediatek/Kconfig                    |   1 +
 sound/soc/mediatek/mt8188/mt8188-mt6359.c     | 102 +++++++++++++++++-
 3 files changed, 102 insertions(+), 2 deletions(-)

-- 
2.25.1


