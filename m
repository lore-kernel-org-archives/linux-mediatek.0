Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2994EC5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 20:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UwiprwcAyxMLPiS+Zlnnnd/A5JsVvfq/t6i9xPF3mio=; b=rSvjQlX+1RrWudpru6wXcGTWlD
	yLMLWaclp4GK+fWrwRzmuvNSGKCP3x+4vFon/c/TXrvsArqgEtO54+RQutSfw+UFKmscQFl9MREVd
	8x7/fgRgFsmHiwfoZnI6UaX50aWd/e1KjKDRWlsZu2HP/KJ2038cKgAJl6919ax+39FPo8D0mgV4E
	kaX8w84Qak/CqUrsEvHUSolUrkXhdMDyjlL3UrFqGHm9MiKrpF8I0dZ7kh8e1JlP1CVDOx+FlBM0M
	5YzM54yyPDJl1LNkgKNJbRTA/Pv+DGr97b/4XKQb7XR8cdddjpNZpPHZG5WVvSBeesFeN9m9LhxUu
	TRXIhQCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt3-00000008hHn-2F18;
	Fri, 07 Aug 2026 20:09:49 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsQt0-00000008hGX-30tL
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 20:09:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-496b7622a83so32121785e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 13:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786133384; x=1786738184; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UwiprwcAyxMLPiS+Zlnnnd/A5JsVvfq/t6i9xPF3mio=;
        b=QQSL2GSBAv8P1zXXz+kI8WySV1V4mIRjcaqPdkjjZBw4BJeb4WtdwymLkJ9CpBSvzN
         X5U6pdH1hBu1sNcwDZJ/H/OCDGOX2HfAJFTvUP0xZYBh1ZBvTpbN44gXqo5P0at0xk+F
         /KERnNS1s5U5vWs+kIC3uaDctjb9ULtccMneCrDLNEIByMQmzvIhD6N34ZyZbBk9IT6k
         y/547I+gRDGHTl0EUBxoecJifonA2hePP0gakdHzeJcze6A/xZyGhaC8H9Ysgdad/v41
         Y2REb4IeaeUryZPYMs550evTcsYRrWonV4goZhWqb2zPsZs3LITTC8DAW/Ieu0d1GGFh
         EcEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786133384; x=1786738184;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UwiprwcAyxMLPiS+Zlnnnd/A5JsVvfq/t6i9xPF3mio=;
        b=I08u2gMnZQtYdyGumkUl73taBhed/E+fmx2vEbpx9pInmVk/Tcg/CsaJzfrcFa/KMF
         y43VO7zN+wDMviAvY+n/nx8/vePD4nA6DunI8+hzwYs52dQyx2YOJR119dlv72yE3f47
         t1PRZuwMbHNrvDw4rG7g9Vcx/DcE/sIibzGzCut3tjIgpEc9KVnWqZqRJPn96PX/4xFk
         An43onavNd+sN3cAe3jz4piMpj7Pt9a+Fv69GhAH/ksfD+yFXOgZYXDqeU92RG/thcCL
         ymeUZOKgEfxR3HmD714jGLtETCbGc2/UburWcZ007/CuUczIqrtKWQmlc0itXoVRlSwW
         LiVg==
X-Forwarded-Encrypted: i=1; AHgh+RoSjPtiTNoudDKvXk9SBa93xYI5jBybyFHHEVfHI8tfOhrqgegAwYW82SqS0OiiJzBNQXe48wdwp5+OVnV4/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWdOADRi0hQv+Wo4K3IAHzbCf9C4QT1Z3drB0snTPBuwtUDeKa
	JRNHJ/IBqwtdu5sHyJUPmgnOjrO3fpPD4W5kG3BSIfQ5XWWtx/Lu3PFL
X-Gm-Gg: AR+sD121NF7dujAWI9xT77HWGggiJ6icnnu6+Hhok1SznSNb09EdKv3qKzCYMD3SmaF
	U/F3q+FXMCzJahNwCWQCHSkmzfs1HBe+i4G51sPtDnfJoZ21Dx0n+xAV544a9lrm7G9Bw+hXOvo
	plrmr63jVWpLq7M2xU4OaPcmvuD7URyXnVusB58k/2cmg6vxvsT4jb4iOWqVdW2AZv/qPaPpJx9
	RsMKSSoCdX2a8hcFWteyI5g4WjYCIYUBHJFG5MtaV/B8MBUiLY/L0RM9XXacr+FJCU13AmuwybH
	BycG8Ns2ssSX8xhYN2U1wZDawRx8D+hG4wEMoYkaJX1A4AHRDBkuSoNhn1rVTHR/GvzuilP0BPl
	3N+0HfDGUtp6nUV311O6IasfJoJq0de78JPDHpgLc/Lat4gyEN9Hz4xT3hGKngXXcflfaZEfDVc
	eUM2Gr99KubhICjzxR4lAuomng+tmmFtcklwfsl0j7nkMbUyBQwRDMRRpF9UN1b7OzJcCHJJp0m
	eDdjDGwRFMDLfp/TGy9wDr4iCrnMB3SHMggnBVmoOlaovaLvgX4NQ==
X-Received: by 2002:a05:600c:b95:b0:495:5858:8101 with SMTP id 5b1f17b1804b1-4996199186fmr27697705e9.15.1786133384176;
        Fri, 07 Aug 2026 13:09:44 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995919df87sm124815635e9.6.2026.08.07.13.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 13:09:43 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Darren Ye <darren.ye@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Rosen Penev <rosenp@gmail.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v5 0/4] ASoC: Add support for Airoha AN7581
Date: Fri,  7 Aug 2026 22:09:30 +0200
Message-ID: <20260807200936.201827-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_130946_774568_9B01E9A1 
X-CRM114-Status: GOOD (  15.60  )
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

Add all the patch and documentation to support Airoha AN7581
sound driver.

The card follows similar implementation with Mediatek with
the codec present on i2c but with a simplified implementation
register wise and additional frequency supported.

Changes v5:
- Address comments from bot
- Better handle concurrent irq status bit
- Protect enable etdm
- Add Review tag for documentation patch
- Address formal comments from Cezary
Changes v4:
- Improve Documentation YAML
- Move IRQ regmap to mtk_base_afe_irq
- Use mutex for user tracking in ETDM
- Register IRQ after memif allocation
- Address suggestion from bot
Changes v3:
- Major fix to the ETDM code
- Add duplex support
- Improve Kconfig setup
- Rework and improve YAML schema
Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (4):
  ASoC: dt-bindings: Add Airoha AN7581 AFE Sound card
  ASoC: dt-bindings: Add Airoha AN7581 AFE with WM8960 Codec schema
  ASoC: mediatek: common: permit to provide dedicated regmap for irq
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  71 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  27 +-
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  49 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 517 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 433 +++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        | 114 ++++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 161 ++++++
 sound/soc/mediatek/common/mtk-afe-fe-dai.c    |  14 +-
 sound/soc/mediatek/common/mtk-base-afe.h      |   2 +
 13 files changed, 1441 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.53.0


