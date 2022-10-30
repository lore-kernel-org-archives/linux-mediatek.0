Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC71DECAAA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 17:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gLXxaEi/fgQzftVcfZ/5ZZW/Hv9wZqoHOKy0rIFeuG8=; b=04hK79S65crg7vut2WSrAX6Ina
	QXPCW6e/TqPMTNifVelRBVqlVRMtgDysZSaLklOWHuAxblN8LFvOpuHqLnOyIgootApHpNy7iffWF
	YttwuKUlQFedTO5gR3JSeB1j7MpvnX9YmaozcPB+S90NbEzGczvFTcE+L6bxeN9OSR9qEGIEaUcyw
	SVTpy3KZvRyg5V+c+6+K0+oCmD883muZAFGUn9h6mjRnlxuNwvUnVlzDZUa+fEAan5fz/H/Rvw4jz
	CuHo0nG/Y6nEVbujk3NfMrQursDZpybwA2GP0a3oDRhUgjsHXJUKa9xAfLEW9DyuiJPhaUrxfOAp+
	gMKJ2LXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opC55-00180C-Rh; Sun, 30 Oct 2022 17:26:43 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opC4m-0017mJ-BL
	for linux-mediatek@lists.infradead.org; Sun, 30 Oct 2022 17:26:26 +0000
Received: by mail-pl1-x62b.google.com with SMTP id c2so8908008plz.11
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Oct 2022 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gLXxaEi/fgQzftVcfZ/5ZZW/Hv9wZqoHOKy0rIFeuG8=;
        b=bcK5f8GSJ5au6s7UOKhNfCDgpZhwaC4LcSCnk+IiN0XipjzOVWFQHfnmNcJZVO0Ar5
         YdWDkuBbVY9SYg7w8/m/pVwcHjpcGjLO4IkQ2V10e6rcMvJ1rm74AKG5tkv4OF3lHK6I
         RSOBTelhZdmuUSEsnQSbmx0PAaaEBYZEi1xSQPuSm0Sbbq6EHv/flF8jK7igMQB8NuGV
         lxLZRsXFTBAffbC0d9CwKQbdHbX+ZbtXxH0JKVaxxVf5qKsvVe84vazlXbrZRG9A203V
         uwkownSc2icUzj4KwF8azkioe0pb8die0hGVgPk/OeUF8sM7dzzftXrAylTAri4cgkkw
         +mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLXxaEi/fgQzftVcfZ/5ZZW/Hv9wZqoHOKy0rIFeuG8=;
        b=EHGsRVc8A4w6QsZAaRMENIE/4CvnweOCWzIoqnAKiBKA4w+FHI5txtoCR/0hpEQuwU
         vEG9Csl27A+4sQglS/ktPVQnYMeRM96mfU/TOuqy0IFQSPqCp3OV5M0d+LfegPzEiRsV
         FFXVQmYOztYEvw24pU3FqTTjeYZ+hHD+9SQiB1ZE/k7cYOjTES1EiBgI4dcHAFc43mo0
         tIm9mzTUWSwPYEskr62AjeLzXQKmjSAD8DguUfSeec2gjRrv5lQW4vxGsj0rvVjkwdLx
         2n2gNwu3eBgu1NevbPASiEZLLGynF8CiCgfQnGDlnx8FeZsT5WBO/MjhU8W+1i6ibCwV
         Qc2g==
X-Gm-Message-State: ACrzQf3GW7fGLjp7pMwxfuZ/K6ezDMcS52PyBO8h8xP0XZex1Cvb+IRr
	O6SkcMM9BKV+B0pLc9di7qPv5g==
X-Google-Smtp-Source: AMsMyM57weFMujeT2e1myPTiJTj/yCu1MkIsK+ndDUMX4i6e/QPc5/xyzt5HOPqMh/2WCIiV3wZ0kg==
X-Received: by 2002:a17:903:2346:b0:186:ba56:f520 with SMTP id c6-20020a170903234600b00186ba56f520mr9937566plh.138.1667150781108;
        Sun, 30 Oct 2022 10:26:21 -0700 (PDT)
Received: from localhost.localdomain (118-167-185-125.dynamic-ip.hinet.net. [118.167.185.125])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902a3ce00b00186c6d2e7e3sm2933881plb.26.2022.10.30.10.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 10:26:20 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Modify documentation and machine driver for mt8186_rt1019_rt5682s sound card
Date: Mon, 31 Oct 2022 01:26:07 +0800
Message-Id: <20221030172609.1635096-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_102625_394999_A6C4251E 
X-CRM114-Status: UNSURE (   9.17  )
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

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |  13 ++-
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 102 +++++++++++++++++-
 2 files changed, 113 insertions(+), 2 deletions(-)

-- 
2.25.1


