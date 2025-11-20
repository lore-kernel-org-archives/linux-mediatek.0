Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C673CFA457
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Nov 2025 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o99Q6btqe94dFwhCkqr9jpNEkkVzeqWoyeDeppPljwM=; b=4234mwTSOXsMmXv7L6S+AKcoag
	gqs9mOWlbj31z8eciu8+VTHIBlN52JT3oaeXaVbbftOy1fb6LuqFmN65Xdh2XPxTMLu9afIBmBJ91
	M4jqIv+tpDz3BZC8pGqjgxjSnNCELX+xxZCTlIUMkG/XtlXYviVRuujb5ZKXuvQpyY9UhU8Ohv6+F
	SjhgvkEViyQZ03oJSYl55R9egv3d8xUV+wcOvLU+Vn+oQgqO3AdrAL4LGYhJyMlonoUuN5TrDfoHz
	Roaq4YfMYmdyWBsCkKvdxbgMMMl9NV+87by7Er8oZaLd2ZFK/AmcxUDNf/015e6/yEODD7TCwSAew
	IofeQGsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6F-00000007ZDQ-2r9H;
	Thu, 20 Nov 2025 23:30:03 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vME6C-00000007ZBu-29gO
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Nov 2025 23:30:02 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso14010335e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 15:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763681398; x=1764286198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=o99Q6btqe94dFwhCkqr9jpNEkkVzeqWoyeDeppPljwM=;
        b=VbD5Mo+V9yRa4/UiWXbQ2am9ZBEdKTWWsUH7HYX5F9Id93NCorHWeNKW/vvKjPVKWD
         CpT40iJK6F2i8uFNLNOACAgZwVj046GuhvhRVzo7VoyCtGS3LsB2cxk1jmF4GTaYha5K
         QB9FGAp7gXnPu/evnV+fI4AeTSqRx/4cAiKHUcmbDZ6UcUZVbLIz2IpQY187tphCSfQn
         bGNI89SYlVipp8+XlOgnZf+hRY4Jk7y1XjiHbTYco3aGcBu33ddEvNy1dD055otBz/Bh
         qiC1vOQfQHiV8nmT5V+oNmY2oRWZwnlccwgu/N2jo1Y5sgqNWwYXh34JsIK22rRDq8Mk
         09HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763681398; x=1764286198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o99Q6btqe94dFwhCkqr9jpNEkkVzeqWoyeDeppPljwM=;
        b=Ah9oJR6xH32Y2IetP0+OiZo3tGEIo3n6ZtwBi6laQcZzgTllAvBibrkL9odUbBtjbS
         NUldU99eZ6sRerZ+Vw63E2AOaWkaIUFIz2FdDeNS8IMO4a3KDbPQUuAUwrHvvalnyMZe
         AgZ/28rf+0MWwY25Z9dEmFl/22n5btZ02ttKQJxn1dXUWPVckHp+fesQTMIUu5G+DRrc
         pZtcynIyrXzhzQMpq0/NkuHcEi3ibRg62D1Em/yO+uji4A+kf/mtxw21prSD/wYThdse
         R16ahLjCUnL3jzwbOvDLahgM+vjepiEQvCWG8OdBGakF7tQNSX57jF2gM3SuI/B+Xjr1
         h3bg==
X-Forwarded-Encrypted: i=1; AJvYcCWYTcZjbWtto74HaGrIFO1t6Ka+jwiSMQkIfcxby8xJCuBhhYNfQJv1ThLNsafYFJrJLuw/c9ItG8UpFDYiFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YypLTDww1JdGjgzG2Q1VPccjKNdEix/+I3/oehx6kgHE/4Xvr/6
	CIe5G4uudXqyvSoHLySxqm4ZkO7BBNQ6Fo//4TeyQGiYL0hlNJZjsbTY
X-Gm-Gg: ASbGncsg2OH4h9TnyLZeuJgMWn3q6Yij0HfT6mAUW5p7Nh/ODlAyxyUP/Vls3TZPeb2
	47H5oH1rughY8ZyRQh5wAnjg/Um73Xbpd9p1/Z7UbM8Bx3Zj13Tz5bDl31DYJ627rStVxd3YF1z
	uCwPHWjh5b8oTQiP8UBt+J+CHy4Y8Smf/Uvr2+DSsfhaspBouVaK1uzjC61d/IKtXQLEO2eS5vQ
	dQaN2usx0BkDz+dS5jCN7UfJYkeB/QWIBBNuwSKD3KSKu6HWfXVxqN4dpDdAvQ/UppMnpIwMN04
	VjfGlYWTjqNm2qJQ+UmdAJo1G+wqW+Qk0RIq9SXiNVI/aRb6cTl9K/VFdK+28w8JrAY+A4PGllU
	EnP2k0FVHzGnFT+6tqte4en6CzN1NKDb8qir6G30n31QcdFODGiMcyg3SDfQEOHfPo3whA77JZs
	YeKqpE/P5WZnOP2KfM/5+Prxz+mrxkbp3aTEQXO7YV
X-Google-Smtp-Source: AGHT+IENcKDSU9p5/g82mvjpGvvEKuudRdiDvyXXEFjAWRPw+rHnGQTHf31HMHlBDVIX2Yzva/jh6w==
X-Received: by 2002:a05:600c:45ce:b0:477:79cf:89d4 with SMTP id 5b1f17b1804b1-477c01ff270mr3630625e9.31.1763681398280;
        Thu, 20 Nov 2025 15:29:58 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9022sm7776315f8f.36.2025.11.20.15.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 15:29:57 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Ray Liu <ray.liu@airoha.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] ASoC: Add support for Airoha AN7581
Date: Fri, 21 Nov 2025 00:29:09 +0100
Message-ID: <20251120232913.32532-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_153000_563956_4C7C1F60 
X-CRM114-Status: GOOD (  12.66  )
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

Christian Marangi (3):
  ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
  ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  67 +++
 MAINTAINERS                                   |  10 +-
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  39 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 456 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 371 ++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        |  61 +++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 170 +++++++
 11 files changed, 1244 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-afe.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
 create mode 100644 sound/soc/mediatek/an7581/Makefile
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-common.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-afe-pcm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-dai-etdm.c
 create mode 100644 sound/soc/mediatek/an7581/an7581-reg.h
 create mode 100644 sound/soc/mediatek/an7581/an7581-wm8960.c

-- 
2.51.0


