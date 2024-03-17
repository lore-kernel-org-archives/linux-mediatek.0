Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF3DC54E60
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Mar 2024 22:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IZmm9s9W7l5cdXxYDm6zTzBblgqnwNDluCe4+r/QOr4=; b=LzH5KLq3iQhO6M+NKuyFW41Kw2
	SIAjJ/pBVI8j1pHMsoe4jAX8U8mqpL48E73bFwNxSAY0RIASXn1i1rFDlsaur6NXRIoE3PNDVBL1n
	mjB9+r7tr0DwYjI3sYdGjzyKC74SYBYsz7k32o7NOWS8ovaOio9snzdYQw7j63hTEZQf8JZk981+i
	EAIE8XkTW0+rQWLyHOxaRDPxrnwGfViITPXffAllZf7XoKhcGpZ8z4xME9HSjr80k2YfWOO81PImj
	9erI6qCFnRy1FR9DgZGUJSme67FkMEFiZJP1RS0jX3E4ysFL6cPMwHHzIEGLiVrmb2WJPNjDRwLrp
	HMqZCciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjG-00000006bgU-3IBZ;
	Sun, 17 Mar 2024 22:11:42 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlyjC-00000006bfR-1AFi;
	Sun, 17 Mar 2024 22:11:40 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-512e4f4e463so4088069e87.1;
        Sun, 17 Mar 2024 15:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710713493; x=1711318293; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZmm9s9W7l5cdXxYDm6zTzBblgqnwNDluCe4+r/QOr4=;
        b=dR2GvpWWT4p0TIsx7zdkzQrcedaRQP+QnkJY8Eu0p1V2mmEzhb/SWY2Mt8XnkSgVHI
         mYkBcYhfJo0eHMrfgudtl/VVewVrYIiCDcu+8th+7xIzuG/ufS9v7D9ENi+qg5GSkuU2
         rbXi7XW1k0515OMEy8DL+C/v9mfGrm5oXj/CaeHLj62IAqF30AqtTj41cZUed8PKGoLW
         eCWmGrOno2/rV8E5KrawKnnBHwJf/V0bDd3J5wQKKrsJMJB13vhwonSFkkqjD5aJ0Vos
         /hE70jacTVU2rBh6tCHkAjC/O1aR961vI455dVvzyUVy0TEiZJ2HdxQvtPbWyeT3hobw
         LfPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710713493; x=1711318293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZmm9s9W7l5cdXxYDm6zTzBblgqnwNDluCe4+r/QOr4=;
        b=Lt5hKNSH3IPbTH7Oe4jluOTrk9pqI9QtF6hUrAgJpJe9zywpqHZnMRltVtet/TUhMZ
         XgmF3u4lnaHak+cIbIlIJ1FY5t3tpI+yz3zY7jF8vcifgzRt2gxhPsMwqr1gSI6pG0kI
         /3Diuho+BRotzadcfgsLFB6VGk/GFkww0frm2WwDdnBdAKdfjhghf3Hme9LzoXln8F2N
         ZHsWOB7rh6DVAH0AoDbVgpVYz0NEAR6iIdhdnbmKj4YB7LYzEJ/CG87UppAIF106BV1T
         9wT+iihccshl5stOBT/B7Lzf0BOI9NEEru03yHZNRHZzardVDH1jqJIcb6+q+mCgmdz7
         bBEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtn6HSov9VPXXazXUie+vp68PYHUX41a9e85RMSpN4hKHRLyi89hcemCcR6FfN9Y98SOCkCD77Bm/pqC4jlzmaKygbNgyDsW7HyGRud7w2YmAffVfw66/+r23fU7dlSPylxvq0QSoeqqUUn0R34o7d+2++e0klUf0=
X-Gm-Message-State: AOJu0YxS3qN/t0IhP1b3oQgd95F4Hbnt3nhk6nh94qvY43lzhEetwVEY
	rtA019AaaXnAyw7C8cSPKuYMrFTS80unPZQemUPtEY+ehsXmqZoosRtEdWlJ
X-Google-Smtp-Source: AGHT+IGSb4vn1VG/LKLn9iIV31b0qpmYMFxtDzfKEmp2doNXYedxkw8XdC5P9x/zshzJVd8cN9Lulg==
X-Received: by 2002:a19:e050:0:b0:513:ed0f:36c9 with SMTP id g16-20020a19e050000000b00513ed0f36c9mr194791lfj.45.1710713493135;
        Sun, 17 Mar 2024 15:11:33 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id y16-20020a197510000000b00513d8e5a088sm973049lfe.140.2024.03.17.15.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 15:11:32 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	"David S . Miller" <davem@davemloft.net>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 0/4] arm64: dts: mediatek: mt7622: fix some validation errors
Date: Sun, 17 Mar 2024 23:10:46 +0100
Message-Id: <20240317221050.18595-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240317_151138_346108_D7C7E0B2 
X-CRM114-Status: UNSURE (   6.67  )
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

From: Rafał Miłecki <rafal@milecki.pl>

One more step in cleaning up DTS for "make dtbs_check".

V2: Add "Fixes" tags

Rafał Miłecki (4):
  arm64: dts: mediatek: mt7622: fix clock controllers
  arm64: dts: mediatek: mt7622: fix IR nodename
  arm64: dts: mediatek: mt7622: fix ethernet controller "compatible"
  arm64: dts: mediatek: mt7622: drop "reset-names" from thermal block

 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 34 ++++++++++--------------
 1 file changed, 14 insertions(+), 20 deletions(-)

-- 
2.35.3


