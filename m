Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23230C38A02
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 08:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rDkvQjMnPy2Fy0mBItWeOo1V6hYUJ0mhKJvHwDCVi2w=; b=HpSbsn5GLYXQX0AuHKHZW/gKeW
	2a5r72Y1+lz1djkq6eMlhK2s7CronNSN4xAx/93WqLdCCXX3S3LvdeLuPJXaRlm+80kcIYI7kypJ+
	rZNkiR0E85Z0DiuQmSVyoqkBV7aecdTRLmQ5JvKaH+4VSLmoqEqGR/yPFU4gIvRYXT6rTZhxENphh
	UlSOtB2jJooitf6CAB7uVOoasb8vgEcG8jf8ml+OAXyvE7mPmxS1+n/4Um8CYy0wAy6AznM49WqNT
	HzWYyX0Am8qMV7XcmoQ8gT/OqRE3KRddrcX537u9w4kgdM12hzMAp7CtDu7xUdfoA/R6ZffpFRyBe
	qBk1vhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op45F-00ES0B-SC; Sun, 30 Oct 2022 08:54:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1op454-00ERnc-Rd
	for linux-mediatek@lists.infradead.org; Sun, 30 Oct 2022 08:54:12 +0000
Received: by mail-pl1-x62f.google.com with SMTP id l2so8340062pld.13
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Oct 2022 01:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rDkvQjMnPy2Fy0mBItWeOo1V6hYUJ0mhKJvHwDCVi2w=;
        b=bbXRih8TjXzbqHh25uHOxJWFLQw+e1DlCLIq7nhMGQtwji80VAHDq+N4U3++UXV2V3
         Gtv/VtUzMHdL1OkWJNAu+KJGnQpPD+DN8VV/Sl7ulgdHwvTeko0Dg3vy6HVhMHSa6tZ5
         UAy9hUSx6ob+N6sVx+UO9Du0G68SC2Nb6oumIyxC2v1mmD3pg3i/IC8KgCqNrmtewVQK
         TOPm5NQ4hegcpcMOJc9+++rjfnYFlzgowdkhPpjZJfX9fggNcHy7U/kqs8kFOmvffqEL
         Qj7lV+QsXIBwqztGBmQ4uEAJutXxdXn6nZv+VtvVvd3Yq0qHpKioH+X+s3/FYgZH8c+c
         mcKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rDkvQjMnPy2Fy0mBItWeOo1V6hYUJ0mhKJvHwDCVi2w=;
        b=qf5+sOHe/1XFoIwIcvZi3s3RQJrTid2c3GS4FNwSTU+IleT4MaKsJPI46XQht/6I68
         DTCIIYBl8HiRRaCEUkylX900Ez9vBC43NbmOFbtAGhl2D4lxnU8phXyn3CprNAVRDrv/
         ybDvKzgSmwykuG7A85WxfgbSqZg+r1lwOMo2rYov/+1qZDBIKPU98S/xdV+L3k+LFT9L
         NPOuuIk0AjQsAKGa0u+rJuxlPMAl8ho0uOWTiI4wBhDreAX97oiBaIGvS8pdFXGMVMvM
         jM5iyV1KrCPrRFAx+pKdL0UHm4wA1DDxH9trGtZWQEnpax1JGk/70/c2O+69246vLwUs
         +GCQ==
X-Gm-Message-State: ACrzQf3LucE9Ds7e0eMbREsi6wFKXiBH/4Y9AELeYkFgdsWxZVWoU5qF
	+IKIOR28h3IpNCW+80RZOYiutg==
X-Google-Smtp-Source: AMsMyM5f9T1Rh9DrdO2JxLDorJoTNDYAWA/e2ujdB/uQxvpcNDMnY2R2vO3fkNs5lc6OSJVNq7YJ5Q==
X-Received: by 2002:a17:903:110f:b0:178:ae31:ab2 with SMTP id n15-20020a170903110f00b00178ae310ab2mr8322365plh.89.1667120046351;
        Sun, 30 Oct 2022 01:54:06 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net. [118.167.185.125])
        by smtp.gmail.com with ESMTPSA id n9-20020a63f809000000b0041ae78c3493sm2054627pgh.52.2022.10.30.01.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 01:54:06 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Modify documentation and machine driver for mt8186_rt1019_rt5682s sound card
Date: Sun, 30 Oct 2022 16:53:56 +0800
Message-Id: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_015410_899464_C0D03AEF 
X-CRM114-Status: UNSURE (   8.95  )
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

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  13 ++-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 2 files changed, 113 insertions(+), 2 deletions(-)

-- 
2.25.1


