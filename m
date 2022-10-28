Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF89CECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 17:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dEA0uRMa8TxeJYRdNlWPFcX94wVGyCXF1Xf/+3rheBY=; b=SwfCk/ppm7tq9JvV6H3WMIQrHE
	kBAaM3kAhOL/qHM/kS6ZPSl5GTmZ3+iMm2VCUdydolUn9iWJuNHcu9ijP0REH5T5jilxYTkL1Gos6
	lozdXocYdEs706kl2E0FnmGOTEOApv/Pq1qWhycFikWaHVrGcvjwF5odXD1y+B2+BLnBQOzn1bOxE
	v6OZInBAt6njCArYJgKrn2qn4MM+TX0AZPceiB1XzfKTR4spx9LFrUImpg0Xjyt7aUo206NseIQoN
	h1yHjPXJBKnRaA5xe67mvEBtGWUIVxR7q5521fZQ7Dyj8jQ+CDt33CcjPIIOsBs9khi1RA0FiEJ98
	lOe0XsSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTKW-001PH6-N9; Fri, 28 Oct 2022 17:39:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooT3q-001FnE-1n
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 17:22:28 +0000
Received: by mail-pj1-x1032.google.com with SMTP id h14so5216146pjv.4
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEA0uRMa8TxeJYRdNlWPFcX94wVGyCXF1Xf/+3rheBY=;
        b=HHoLoNdPB0qkrK/smItvMUXw2MX16VkSG3Wb6Sq6wx1V5zCqD30UFGrBr6hXMJ2NtD
         LmeLb+qv3HvSjyGgy12ZddE/iB7mNJ7JACuFtGcqPrzY8mHwKGHuriAvzs62BV4v2wG/
         lPfKQGVJ1gcrxo5EH1kUey1p98r0h9hf44iALh02HzL9VrGySlyiw3AQ+jNgcgRhRChG
         cgt7Dv10M9fjuoNaWYZCw0b9JYPbif7hrOOO7Tp7m9aSLnZ7q/rBt+LOb2B+D0Sxwz3H
         DrtV+1G4JEpf+TtxaM5YmKKbcsbZ9g9PWX+5pkTs8zGbvhQtUxY0yDrsctYzapLpogQJ
         tWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEA0uRMa8TxeJYRdNlWPFcX94wVGyCXF1Xf/+3rheBY=;
        b=H+to5LJX0LZuAXkU5RGF96xyCa2I81LcWeLICI7/JBNWxKnlZwlIwYBdAktwy5jeqQ
         VGS3p6JeGuvUJCJ+zQCHfLfZ/LXtVnezE6hT5MZfln85NAzTkuCFmE0VDzqJjMkB6kWn
         55+GLafBQcSHWkJfVaGD/D1JyLVd8EbGSXaSmKDdijIynLJkbiJt+Qo2AN3skIn15DJv
         o7UuUCmyzwwCZLHg+oR3lJTN11ivtduhoAuEDT6Np/mrG78ZLh8YeG6+xZqMIeWzICnN
         zguvMYGAHhFIBltPbGsCg4VLMF7Oc9rzyht0gV5lD76Zd2zcui9R3C6QWlKJQvzEAJgi
         3utw==
X-Gm-Message-State: ACrzQf2iILh0R2c8HVO4vgTNGnC0OpPujtublpZbxGd+/05PYSIGejTs
	7Z6v/hB1RhnvLLW09Bm/CMDhLg==
X-Google-Smtp-Source: AMsMyM5gtzHQRDvYEJ+/LqCO9vp/O/hO+OoVwkhVr64TlqUb8zjaWEuqctF2XEOxHfx05VuyUlixGw==
X-Received: by 2002:a17:90b:3504:b0:213:5b03:639 with SMTP id ls4-20020a17090b350400b002135b030639mr15666082pjb.16.1666977742507;
        Fri, 28 Oct 2022 10:22:22 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net. [118.167.210.30])
        by smtp.gmail.com with ESMTPSA id rm10-20020a17090b3eca00b0021282014066sm4604945pjb.9.2022.10.28.10.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 10:22:22 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Modify documentation and machine driver for mt8186_rt1019_rt5682s sound card
Date: Sat, 29 Oct 2022 01:22:13 +0800
Message-Id: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_102226_113768_FB481288 
X-CRM114-Status: UNSURE (   8.72  )
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

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |   6 ++
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 2 files changed, 107 insertions(+), 1 deletion(-)

-- 
2.25.1


