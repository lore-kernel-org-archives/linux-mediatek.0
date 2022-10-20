Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 393F4C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aNOCO5Wzuq4FvlmMhHTUbdlTAohmkL46icpaXsf0/1Y=; b=nOAwS5yyB9+eUwZI8FykSkY/r1
	rVZstAeGJ1kYr6K5LFMwyeEHOIKpjszzdLu9SDDzX22Lm5H/I/tcwzqUdWbMb+qUWAgA39kEooErG
	Vwr8wrQlr+lkrfk7AdM8dSXUfwWKQUgTZDPAQu9/PnPB1nH/XVWN9PaEcnM+cZ2kicvCqsBeRZZFH
	fJv6S0aVOaIMEF4JTxyQXHJpydB7B7FsqTPI9rCoGwByqOcRhFi+txVWRbTuwJSo3JrG/pV5mHvJJ
	oD3z42y6Nin0VeufMbx6Kp/UI8eQE2R1/ZYExNwPPZsetJmBxkz5RtIuwYCo7bTJHFztEAUnLtrl5
	laBcf+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWUn-00G84t-IQ; Thu, 20 Oct 2022 14:26:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVHI-00FGV1-89
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 13:08:08 +0000
Received: by mail-wr1-x434.google.com with SMTP id v1so5071566wrt.11
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 06:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aNOCO5Wzuq4FvlmMhHTUbdlTAohmkL46icpaXsf0/1Y=;
        b=xz3RuACawiv28InMGXQPOnsDtPTsJajZ0co1tB4EqlAXmOjn74Of+tTCASMWW5T1vq
         g0K6EWs4M0gRQSj7ajehfvBsOB+V5ytuNGnObh++TrchvAkfbVeFIJlZNYIre2HZhTQt
         lUciWYqgJzm+cS+QpEzqS9UWNM4lNYVMdBpXbmOOoEZfDpD52VExK2bOl9KDinXzH2op
         uByKpsLRksD226P2QQLsInJCtNiyobkHcoDPKtROZNPWLuz7iMIyA/F9f+y0U/6BKeN0
         Rod6OPc+h3qETyrFsRXPrMMMDd7gNpyVvyir5bCWxNfmiEqVOmxXm/TwNzN6sHSir431
         5Fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aNOCO5Wzuq4FvlmMhHTUbdlTAohmkL46icpaXsf0/1Y=;
        b=rnY6AEz5KtFk+CK1zku2AP9ywl1K/Q+uRra/AMazl5Z2z8E+1389lBAwRw830f4y5h
         SiyqfQruGpOl3cNun+snypQxNXPMMweRX1wpyXQ98ZZz6RC3Tauq9YCAYQeXdAg9srOw
         J60Pb15j+XIZ465u5KBmG43JQprbSYiwc43bLNvIxppAOBu/YOvJmWWMSmpt/BbFRgfc
         iM60octB4p/zUuMSBkF0iiO1UGNiJ9VrbM3sQd/UTyenm8Pnr4tmu+alJZIsWY+RQ+dE
         AYFK3B5E7sXhIs2L/V8eSKF8uAgohIb10DLlwnNQxUxzzBvRN82ypeoEyDf7gKVwb+At
         c47w==
X-Gm-Message-State: ACrzQf3KrBrJupzeV8XSQA2sDXHsP6OpFUUvX3VxitUJhlEntAQVcC15
	Pa2jFcVm375ipaaE9AsWhN2tMA==
X-Google-Smtp-Source: AMsMyM6q4GCeHgKPIprFFHv956iClBofRUw8CV7juZGTrSWFBsXMfcTeTjT1bqPf0FaB0/TIDAyNMg==
X-Received: by 2002:a5d:64eb:0:b0:22e:48df:f1bb with SMTP id g11-20020a5d64eb000000b0022e48dff1bbmr8385160wri.262.1666271262400;
        Thu, 20 Oct 2022 06:07:42 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a82:90b0:2979:1615:9a68:f204])
        by smtp.gmail.com with ESMTPSA id p26-20020a1c741a000000b003c6b70a4d69sm2676080wmc.42.2022.10.20.06.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:07:41 -0700 (PDT)
From: fchiby@baylibre.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	"Zhiyong.Tao" <zhiyong.tao@mediatek.com>
Cc: Fadwa CHIBY <fchiby@baylibre.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] mediatek: pwrap: Add mt8365 pwrap support
Date: Thu, 20 Oct 2022 15:07:16 +0200
Message-Id: <20221020130721.24866-1-fchiby@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_060804_615329_D321EBA2 
X-CRM114-Status: UNSURE (   8.50  )
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

From: Fadwa CHIBY <fchiby@baylibre.com>

Hello,

This series contains patches related to the support of mt8365 pwrap.

Regards,
Fadwa CHIBY

Fabien Parent (3):
  dt-bindings: soc: mediatek: pwrap: add MT8365 SoC bindings
  soc: mediatek: pwrap: add support for sys & tmr clocks
  soc: mediatek: pwrap: add mt8365 SoC support

 .../bindings/soc/mediatek/pwrap.txt           |   3 +
 drivers/soc/mediatek/mtk-pmic-wrap.c          | 114 +++++++++++++++++-
 2 files changed, 113 insertions(+), 4 deletions(-)

-- 
2.25.1


