Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8193CC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 15:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZDT6eBh45WPUqYiEUEshrnFAS6ax7db3lregcCkxLmE=; b=nJRnZpC6K9dpRN
	59cLz0E4zYNcN3NYGjR8LWtbVeai+S1WXArwaBPZNj39J1B5JophjXl7RMdWmus9nhbVCnuLv6ZYG
	ofWqflp/qQag8InfQ7/3vIV5N1MZhpXgoC3iJfI0O+qzhChG/jdEm4SgfWDsPL03ZR0bak3vFEZ5f
	uWYrkKcPkjFvV6l0xQ4todJWcdJkZfCfNKgx6czgioVE7mAfB+J6nSHZwvsCYp7yNbMURTP7A27Uw
	vl6Ap/C0FmyX9bspZRq956mz7SSDn3zEgvo3xoPOwiuVCG+9WOieTQdPkUBmAzpYaNEpoikHHwoC9
	KEPN67ehfSNoI76rX0JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2uwc-0000000H44U-2uz0;
	Fri, 03 May 2024 15:35:30 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2uwV-0000000H40s-2I98
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 15:35:28 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2e28d8fb942so2762671fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 08:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714750520; x=1715355320; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDT6eBh45WPUqYiEUEshrnFAS6ax7db3lregcCkxLmE=;
        b=dOhLopeaqTY6AiD0OkVtdVz6inEvQcahjcmYYIl/KegKZsXikjm1AMe2PyeYNzgcHc
         YdCXe31UB8TCfyWe2gJy7JLTHDuLTYlnuuLYFoIeQFFB23NagIaMmEIyJaG3/ozyhWfz
         TkcsSENiD7FTvqd/Ipi2JLq7gYfnv+b8RfYjhp6i6qRUnc5d5rEpQ2jNLADbz9TAEU0B
         BeGnx2o/pgs4meG15eg8KXfEccTJKg2Yk1lgajn/X4FViBrJ3us7NT0dQw6FnjzpT/z9
         SGKP2rEsJV62p5yc7sN3VJO8/iT1AuN/0e4/aKKMNlKpuFcBKaMBJgRvRTPt8fn+NfGx
         T+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714750520; x=1715355320;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZDT6eBh45WPUqYiEUEshrnFAS6ax7db3lregcCkxLmE=;
        b=C7YjnoUMD3pr5JT1ylJcAnazkFYfCk4AYSbDeQH+qVSPgNunPR6VIXolpERk2v6i2H
         k2ohQSBbgEBJNIIP6JYG8sSCgg4BcxWTP+b3sjHpMMi2KMGqjmPKsZE8t3jHRvak+Hka
         4+Vyg8z2rxOp9pLvgq7TnyDFoHCnOgDIbC+EQObMxDKb44KqTW8wosX+O4YRh0b1vscx
         wQf9Ao9Zk4442gzRUTLr9fp0Yf2t46kLs8MuxWjrPRswgrTrsg5ujUy2MYTG3oORwR/S
         o17oKKtL9ckXs6MuFbQUXbhnAEC9feJf98rA8/l1eyAbdnSfGA/OZ05MEbD1GZx07U4v
         pyLg==
X-Forwarded-Encrypted: i=1; AJvYcCWAqcAVB6GiMTHnJljhULnPsYoD9hQ0J4SF7S+uDNmTdXDlme772+6Uvrxusk+KXjFnYa4GnOUTZnwNNI6t/9dFCSL2ihzcTMs7j1lFzxBg/Ryz
X-Gm-Message-State: AOJu0YxoHYjlYreKJO5ES/grvymHf5dx/ssHftNbxnEP1TG4+b9mYJyy
	NfA5JXkuycIsO2RIkQZms5Nip0l7jue6pnQYOcpQyYie5Ykz3rHab91Uuhru7yY=
X-Google-Smtp-Source: AGHT+IHTeRsDotTIHoakGXC3ItV2s1TSV2nlECEKwfrUNFgWZTNmBCibPYhn4BYzpljcRfbpd1k/TA==
X-Received: by 2002:a2e:9857:0:b0:2e1:a3dc:ed8 with SMTP id e23-20020a2e9857000000b002e1a3dc0ed8mr1986168ljj.4.1714750519836;
        Fri, 03 May 2024 08:35:19 -0700 (PDT)
Received: from [127.0.1.1] ([79.87.205.120])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b00418e4cc9de7sm9702373wms.7.2024.05.03.08.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 08:35:19 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH 0/2] Mediatek lvts_thermal driver: Fix wrong lvts_ctrl
 index
Date: Fri, 03 May 2024 17:35:12 +0200
Message-Id: <20240503-mtk-thermal-lvts-ctrl-idx-fix-v1-0-f605c50ca117@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADAENWYC/zWNwQrCMBBEf6Xs2YXYVgL+injYxq1ZTKNsQgmU/
 rtbweNjZt5sUFiFC1y7DZRXKfLOBudTByFSfjLKwxh614/u4gZc6gtrZF0oYVprwVA1WanhLA0
 DefZMoyc3gzkmKoyTUg7xsGRuFf+qI/8o2+z3f7vv+xe6yl5PjwAAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714750518; l=760;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=VYUWeYsJkSHYakTbzLM5OeloNJRthNdDP2NTbXPBmNc=;
 b=tRkEk+4utiPJcOGZfx3on+2L5z0ljh5s9tXOgL1W2n0C2CWzwEo9YSOcRrpNVoV9afJUE2wjd
 eXNSa/Qq4MCDz8WtXuEMqHA+HEQ/aIDxXpw/evDWphfC0HOVR7HCR5S
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_083523_805521_F8B3E2C5 
X-CRM114-Status: UNSURE (   6.74  )
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

PATCH 1/2 is a minor change: it just removes 2 unused members from
'struct lvts_ctrl_data'.

PATCH 2/2 is a major bug fix: it fixes a situation where a wrong
array index is used as 'struct lvts_ctrl_data' type item.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Julien Panis (2):
      thermal/drivers/mediatek/lvts_thermal: Remove unused members from struct lvts_ctrl_data
      thermal/drivers/mediatek/lvts_thermal: Fix wrong lvts_ctrl index

 drivers/thermal/mediatek/lvts_thermal.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)
---
base-commit: 9221b2819b8a4196eecf5476d66201be60fbcf29
change-id: 20240503-mtk-thermal-lvts-ctrl-idx-fix-ca7e7ea47a0f

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


