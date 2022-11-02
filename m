Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8C4C43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 13:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Y7JeNjduJ11iTjItlrELM3uT2g5gNbw14nHXxfp2BQo=; b=HgPHbGhiKjqZUWcNh/HVS3Taob
	9IAUCvtEid9ie7Ab5zbsgOnwx5p80WRr+hW6kp9pByKsRfKfCTWJWOIFgDvjS38gpVSBeK/0JECKn
	2Z/FJMMxaEWiC8rWLJNahkUIC8rlvdmGUY4CLy7umiqxqWz88aRsHFJPMJ9CDB9yFGk0Idfr82j2k
	/uMJRtfKAxeokKW9OqYLebkKUeUmxICWX8Da8FLXg3rHdQUeEKPlL6w5Op/u0WBqOKXyXe7PUqk/N
	yVtZjXHmz5J7U3d4DOd4V7ku6U4ti4Oa1j/eq3mN4IfLAQPkA2QDI8O00MvBDAukL2MkJkTQF7Eq7
	dZAkyu0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqDLY-00B7xX-1S; Wed, 02 Nov 2022 12:59:56 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqDLN-00B7sZ-AJ
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 12:59:46 +0000
Received: by mail-pg1-x52b.google.com with SMTP id v3so1225329pgh.4
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7JeNjduJ11iTjItlrELM3uT2g5gNbw14nHXxfp2BQo=;
        b=KPv16VgSY+zS/r0qBRp9hB7SGa38CEdYWE8qXB+FuB+/CGBU/BGQakBKmqCwFgRkTx
         3d3eGwXk7jed+3ksnRqcUhjjLqTSdLQSwduXMA/1y45BGUR2vHTtJj4Xe8BbKkz51UK9
         ntKVKdYdde655Jj8YsfI38h/1qxED8fTfgRMzxU9J6+dgD9Ev+j46DDfhUgPPzbB/WMJ
         WWx0nDilpyH6UQghabPcUKFVkyn0EmS/kybPV8rLJSoHWFrgabZTaP1GmN3pXG+mxH34
         bwbViDK28GpqXvpo1e08gjfg6nkMVh5eBK6LjaW4IwMH6GWJvwXPS2/hNM3tisMOmngI
         Oyfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y7JeNjduJ11iTjItlrELM3uT2g5gNbw14nHXxfp2BQo=;
        b=5jkcQR/j2J66WYI6AnylAl0p+dFB7dw6cdt+TaBgZRas3W/58NWTXZ4sAB/VFm2UQf
         8vJX767+8FLqj/zYLekG7J1eakamcISwrZILvwnjls2TAFyhIyFZsuFVb++UB+AuM/sx
         7zL9Z7UlLOkhAiZv8cAqpqLHXQsBNzw3Ch5MfqHRLGcV4PPdnHLhEI7G73A54xe697tv
         Ic5IH+170jToVxkQYEdIbAtDhzJwdB4ET0ornLU1fW30xpNjOh8yosup725Rc/5Momfo
         6YSFui/NBQb3wXPoVm9c2TuV2vev1CZg84Ikzh0D4yHBktoGCAMNguvf4OdaDgAQHTG8
         fjQA==
X-Gm-Message-State: ACrzQf23lzexxqewV1kLajzmzPUMoXy9FYOsQG7c5Hsxe/Mp2tLHYmx9
	JeVeBzicCND6EJvgvoiODQYTig==
X-Google-Smtp-Source: AMsMyM45Yjmw8JpdtXQkZ9vOIRK40sRXZtsKoP2XWwt+qHD2TbV0WaKrxJVHL1PtY7KzniIjkj5zsA==
X-Received: by 2002:a63:93:0:b0:470:9d3:7d48 with SMTP id 141-20020a630093000000b0047009d37d48mr2183665pga.425.1667393983888;
        Wed, 02 Nov 2022 05:59:43 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-180.dynamic-ip.hinet.net. [118.167.210.180])
        by smtp.gmail.com with ESMTPSA id k14-20020a170902d58e00b0017f59ebafe7sm8259345plh.212.2022.11.02.05.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 05:59:43 -0700 (PDT)
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	"chunxu . li" <chunxu.li@mediatek.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v6 0/2] Modify documentation and machine driver for mt8186_rt1019_rt5682s sound card
Date: Wed,  2 Nov 2022 20:59:34 +0800
Message-Id: <20221102125936.2176748-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_055945_574399_48BB85D9 
X-CRM114-Status: GOOD (  10.68  )
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

v6:
- dmic codec driver: 
  - Modify "FrontMic" to "Front Mic" and "RearMic" to "Rear Mic"
    to consisit with commit 3cfbf07c6d27 mentioned in description.

v5:
- Documentation: 
  - Add #include <dt-bindings/gpio/gpio.h> in order to use
    GPIO_ACTIVE_HIGH.
  - Remove the change-id in message.

v4:
- Documentation: 
  - Fix the FATAL ERROR: Unable to parse input tree.

v3:
- Documentation: 
  - Add an explain example in description.
  - Add the pinctrl-name and pinctrl id in its example.

v2:
- dmic codec driver: 
  - Remove the unnecessary use of_property_read_bool()

v1:
- Documentation: Add dmic-gpios optional prop for two DMICs case.
- dmic codec driver: 
  - "dmic-gpios" property is used for amixer control to switch
     the dmic signal source between the Front and Rear Dmic.

Thanks for the review!

Ajye Huang (2):
  ASoC: mediatek: dt-bindings: modify machine bindings for two MICs case
  ASoC: mediatek: mt8186-rt5682: Modify machine driver for two DMICs
    case

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  14 ++-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 2 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.25.1


