Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE6DCFA3740
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SIKG/oo700nGZV4lbYvo18YgIVmpoqqm9J9pS6SKop0=; b=szNx00sbxnNcrwpB3it9R8p753
	CISU8g/h4LaOnvJoOItv70er3Ek2QU6mVo+KQi/z3eLSEknaVPBIX6h/JTJxJ9KG1DMpBT7Px4JGV
	KSEnSizw1kBQ8UftzQDDtoQwkdw3E1OwEDEwSATnNVT9Exgtb6r1H78bA7n4lYGeXhzWMejQWx1xI
	aYKev0UMbFP0KuTphtM8k+bsHks1GHI0A7FTCogaWxcUW1rXTpeTkoVxRJ/dZppV7HflQaH+lhJty
	OZ9yFJTRXoMcQejbenyEDUEW51D5FeueJCTeUZpHhFdl/krOR3mAoopzwFZa60tl2kOmaN4lGQyOU
	HNGuXahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opToz-00BdZI-Rq; Mon, 31 Oct 2022 12:23:17 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opToG-00Bd97-U1
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 12:22:35 +0000
Received: by mail-pj1-x1030.google.com with SMTP id q1-20020a17090a750100b002139ec1e999so5761376pjk.1
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SIKG/oo700nGZV4lbYvo18YgIVmpoqqm9J9pS6SKop0=;
        b=pSFqsqmB6iD2hTJHlxCmZ5NN1/0+mRNsNZqEYWat8iEJ87MWgA1PL7adKCzGNIOn0/
         gkV18E/0rOa4kFsHSC+/iRck53OqhKc1b59DIRt7/9wOlm/GTnsR2muo8FmRLD+CHWMq
         1/4uin+d0XC8IrToPzg2XjJX0NcRkWSLE0U3fpi70lXp2+7k19kVM7EJd1FaXhtSn3xR
         oUsPNJywZ842FStSZQoLgUxFVxfPHSz5WbWEjT6lospF5Lu+o/wjom+OMM+77gH8AUOy
         TBkE7xvdaMHvAm+4fW32ewQ96AoKIRDui1COF6g+u/LFlcJnaRpEcuRFcuUcrgAyuZhY
         bHYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SIKG/oo700nGZV4lbYvo18YgIVmpoqqm9J9pS6SKop0=;
        b=WDbeljc3sD93f6f7qmjRTzE4ad9xFFHmgpsflXbPSwMXjZGhDBZSpohmKhSM0LmEdR
         daphmp7j8hFnC5+2HEYfuUDhovGSQ+Cd1Ed2XBH4wrw0DObkss+7ggs+uyoj9GYD6qKi
         wJEMR/RPf/NKf3QeXVtfe5OpBtpGeTCqvribwe9T1SCloNFyJ+DosR7Lvr12svUW3aW0
         mjCKbugYIDa4pzUQaoatUdHD8QNvd+n5a8UfdPi/0Ijm+Cr7t3CD7e4X0HBD++S5zcdx
         zpBL/2f60Z8yGAc14BsgvINQV9fz8nnPhL6t5VgsOJCRPZQSZyxudg14wWJtNz8XTh2J
         NL+g==
X-Gm-Message-State: ACrzQf3/0firZRW1APq9K317Th/jueeM2T74O/8WiyjZTCIYETPEwbCl
	utyuuTXUiPN0cWCnG+18e4p8cg==
X-Google-Smtp-Source: AMsMyM6PT3C30U5ROrwUvLdWSI5V9ryZ2Nt8uqeYCtw+vZNgm+XT+lZF2IX9+s6Dpcss8q3cpVBc0g==
X-Received: by 2002:a17:90b:305:b0:213:8a6:8bb4 with SMTP id ay5-20020a17090b030500b0021308a68bb4mr32360323pjb.33.1667218951966;
        Mon, 31 Oct 2022 05:22:31 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net. [118.167.185.125])
        by smtp.gmail.com with ESMTPSA id y123-20020a623281000000b0056bf24f0837sm4445483pfy.166.2022.10.31.05.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 05:22:31 -0700 (PDT)
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
Subject: [PATCH v5 0/2] Modify documentation and machine driver for mt8186_rt1019_rt5682s sound card
Date: Mon, 31 Oct 2022 20:22:22 +0800
Message-Id: <20221031122224.1846221-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_052233_347611_9B9AB7C2 
X-CRM114-Status: UNSURE (   9.63  )
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


