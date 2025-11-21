Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E250CFA473
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 05:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uJbxIqEiqm1f8qF16st2qXQheMIfNt3xVg34Igpt82U=; b=Yo+JHWvZclcl9aSC16EcxeAVd4
	8Dz7jL+d7frtRCeQXeWZVWzmBJxV+/oCIfw9KnfUo/nOgoN3PY7HEjY+w479cuziIPIEMBGHv8zLp
	TNFVxNucLY6BxDra8aef2myfZzyXPobyRSxI0DYDzcn/W3ToaI/atHQm/Xfr9UHs81QIdUGVllwl3
	9VnZlhlcRf2/LgT9dTX57tc05AAkMs4kEkB67BGKXFfRlpuA1SYW9khxSxySxz+9Sq6HFjUGznoYi
	4lKvT665PGuxRLrFluFze8o8DZOmxB4Z6TrsvOuwFhDsFpL12IF8bellphAQCPEUgjbv+e9sDhDhw
	RW5Azr4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJxx-00000007rQL-2Dg3;
	Fri, 21 Nov 2025 05:45:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMJxu-00000007rOw-2SRm
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 05:45:52 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso17570545e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Nov 2025 21:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763703949; x=1764308749; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJbxIqEiqm1f8qF16st2qXQheMIfNt3xVg34Igpt82U=;
        b=FCunR+Z/nUIo2bTs/Okpa0dzDI4b+rFKTth0g6trAl29JA+/IcSfdui9N5oC70O8ec
         hgIHhq/skLjbHVl91c6NJYrWoCY+MLrJOAoo9O91/dzpT/CQX1AD9nB/CHmrZJAHrtsq
         znZhKPUQp/ekKBRaXulDZmlsU2k+gSbcQayti5+XQuWmpLHLoiL0QosRthqb9ZqVZsqA
         qDhap6lKBa+ReoD0K277YDFnOSssYwdiP2aZ41RKkP1DXj773izV5Zi2pkNce2+mAUR2
         vsMQ0bgKlALXddCKlo20QK021GNfIBzn7UIDDEPbKNm6jcfizVViWh4PWxaHIepYPvKQ
         yuwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763703949; x=1764308749;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJbxIqEiqm1f8qF16st2qXQheMIfNt3xVg34Igpt82U=;
        b=pMeNmkSq+m5kvPQEqBWfyV+/5vJcYF2LcGl1iOlAGkvTgd6haIUNFzeeBqVUlJQHk2
         4bZXt/EEGDbq2j50X5V9THyM5wV6kbYl0LA3RY74vvJ8Sesjh7rMucaX6zFqhI4MBMTR
         HNsIVm2Y5dU8uo3k5ng5zW50a2GKEiEGLEL+pIbnqXmOHD/gcAX1KEyyPipLJWSNA0Kj
         YIHtyxhfY87Qgt6NbKW6fM5vaYvtz4+sPBMnIIqHWVl5kafonrrzOOZxsZjNFcgAofQU
         YMaeBOokF/cgr5zGrLi0F9t9bQsSLBtgiewL6JiZdEGpD9s7VV0wKzd3DSZehgaWPZzc
         Zi6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXW82OP5mKZj3O5iqhhYVLER2bUQx0wOBSMS/LLskJP1yqbYaYnWQGJL46OB/klqudzqJEB4TNKFJnZZ7Tfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTtT6s5JWepkStL7xzVqKHUrKhItdxFPwY6dj4V7cbPUAwCxdN
	Nk44z2F9aMNdp/GVgGmt1GT42aDp7geBu3a9kTmBB3hiEMk3/sWeBOf7
X-Gm-Gg: ASbGnctQblyws2dAen9CNgWtPlXsFFbkTccoXwkEso3Oa/ocJeANhMKg3x7xLksa4A4
	zeAiPT/2H7Qpo/KfyE7LuhORYFx+nxcuc2gSAjYfTTCIaIbrSAmsiS5+AKucMm3Q8WYeHkTjMrv
	1TZzpw9/9gVVNJ8rMIBeqzguILutnI0gXd7SVVposfWM1n+zSdCoFmaPuy+wdBmnxZj2HO8BRMQ
	b6Fzpb1RtLXNwxkLq2aO2s6y5ahtr43foMnhjAINlkA4rvA2ftr0Al1fV/zW/uPK7xgP0R62GCC
	bPESP98PJRwoJlVcyxYefuZCdRsqYs0rJvuK4TlT69vquX3VxrqsWFPgVd4hoUN6IW+oTpSFIsI
	ecV6hqYrg1hGSzzdzE0ct6SpSD3RI7vmKOhrG44w7dtVgiFYZVR393YMykyOWK9JgoK1+C+JKmZ
	t2QE5ZBtpN3K93BHSOgd/EN87ED9QIl82EiTpE5m7v
X-Google-Smtp-Source: AGHT+IHRFaiUyVpXiQGxAycMp6yKMdInYPmebcx1lHdJv0Jzj9BEBBTmyVen82ZvCHfumXjJ/rAv0A==
X-Received: by 2002:a05:6000:2004:b0:42b:5406:f289 with SMTP id ffacd0b85a97d-42cc1cd8f27mr741379f8f.3.1763703948284;
        Thu, 20 Nov 2025 21:45:48 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42cb7fb9190sm9239273f8f.33.2025.11.20.21.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 21:45:47 -0800 (PST)
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
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v2 0/3] ASoC: Add support for Airoha AN7581
Date: Fri, 21 Nov 2025 06:44:58 +0100
Message-ID: <20251121054537.25796-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_214550_664782_192855B4 
X-CRM114-Status: GOOD (  12.80  )
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

Changes v2:
- Fix wrong edit in MAINTAINERS file

Christian Marangi (3):
  ASoC: dt-bindings: Add Airoha AN7581 with WM8960 YAML
  ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
  ASoC: airoha: Add AFE and machine driver for Airoha AN7581

 .../bindings/sound/airoha,an7581-afe.yaml     |  41 ++
 .../bindings/sound/airoha,an7581-wm8960.yaml  |  67 +++
 MAINTAINERS                                   |   8 +
 sound/soc/mediatek/Kconfig                    |  20 +
 sound/soc/mediatek/Makefile                   |   1 +
 sound/soc/mediatek/an7581/Makefile            |   9 +
 sound/soc/mediatek/an7581/an7581-afe-common.h |  39 ++
 sound/soc/mediatek/an7581/an7581-afe-pcm.c    | 456 ++++++++++++++++++
 sound/soc/mediatek/an7581/an7581-dai-etdm.c   | 371 ++++++++++++++
 sound/soc/mediatek/an7581/an7581-reg.h        |  61 +++
 sound/soc/mediatek/an7581/an7581-wm8960.c     | 170 +++++++
 11 files changed, 1243 insertions(+)
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


