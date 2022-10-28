Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A090ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zOOeNwz1lHcYrYVw7YxVzbU02ivQx+BTv/5n41W3bX0=; b=X0Ah8+IfMmN8Ep4Z5lz2YIGqpb
	zNoTUc78/31VeBdKFOSNm3Jp9giV3T/xw8HqxZFlaIOXoKUF76i/xEIZR/apvCylNcic7TntBVlH0
	Br0TsCkgGOjyn4skwdEet40qWkWaWCbkJNuDh9HmmO3he9xQuP2OMkZUXXcXOAK9DZ8l4639+1012
	Te3HR612xTlFKDr2JVOjpSTJEzbtO1atVgIxrHFCQQBGeZxthQkwgcV54nNECpYLMcxxQLaMgkK0m
	NPLYFEi+zMtDHeLWQjmUIA5uigiguDPn5qUviEJpMvzT5OoLxPMGYwZXUMe3LPuUMnMWiFd46VSWu
	nDbrd/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRtu-000n3f-Ci; Fri, 28 Oct 2022 16:08:06 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooRtY-000mtw-PT
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 16:07:46 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 192so5146391pfx.5
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 09:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOOeNwz1lHcYrYVw7YxVzbU02ivQx+BTv/5n41W3bX0=;
        b=TBwhRcOe7hVlwmqY6HUfGe6XCFoCRE1+KHVYm8ubTunpaq8IuWSDdHZb0mv7AKJ0pb
         6vqGCQEcYnmEH7blpAnG8YrWz/NCb05cw2LMNk4fISFhMogzeBzvbhplkPQ2zmmjWTYE
         DNuW5ykjw2/p1Z6y7Xp3DoQhat2+FvBfTxygO1qOR+N26sYyumfE9AsHNgN3/4BudxYx
         0DH+n2Uf9SF/Fgwh7/gu0zLI1Fj9hAv/bNvQfKQSGy8TK4Q/TDKr0bR8jxGrSja8hc3X
         knx5Se357JcvpcBS4oKAz/Zf7pdwvbG0P5HYMh+ZEgBQcq6ByJ1WblRdXzR4gSxjwMlk
         Jwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOOeNwz1lHcYrYVw7YxVzbU02ivQx+BTv/5n41W3bX0=;
        b=icSdhKyB3qpl5gKarSuzTu9h/frkUOlCTvpytrsTno1r0/78dNJE6Q3+BtkKd3tAmg
         qM8BG45SMEJJ8qhfwvrMSUP+ivAxwvP+0iYXDgY3UYJg6Hg9H3VZjk3ZNwB1t+wD79cO
         psyww6DZ8Qs/FljIsZCEUKOMPo+2z6LHlje3DqPiptkA52xBoy4B8IPODH3/zWERncBC
         KA7KAnG5ecZVXrz2Cb4cfL0HemOingF9Hj6DTvf2ag+eDyEcnQUYFal/7Xm0v0/sY2vD
         42+cKeI4f3WJd2b7E4ByQqWJv8ovJXYPaIuWeO2U6xJ+WomOhWwVOHDpII9DrOTwTCo9
         53vA==
X-Gm-Message-State: ACrzQf0DT7QY0cYXSBOoYij8stC7Thgsvh6L8J62yLxIp30bSiMaR6Ng
	8CWni60IcpCsDHeGmfSt0I9Jpw==
X-Google-Smtp-Source: AMsMyM4RcOrg2Q1kN+KY0hi/d1VbeCr4RdhBFV8N97v5IKoJxGQz8UMgUwHdhkR8Xx3H/wL+OZoRwg==
X-Received: by 2002:a05:6a00:847:b0:56c:b03f:8a1a with SMTP id q7-20020a056a00084700b0056cb03f8a1amr140694pfk.47.1666973261937;
        Fri, 28 Oct 2022 09:07:41 -0700 (PDT)
Received: from localhost.localdomain (118-167-210-30.dynamic-ip.hinet.net. [118.167.210.30])
        by smtp.gmail.com with ESMTPSA id b70-20020a621b49000000b0056abfa74eddsm3112071pfb.147.2022.10.28.09.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:07:41 -0700 (PDT)
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
Subject: [PATCH v1 0/2] Modify documentation and machine driver for mt8186_rt1019_rt5682s sound card
Date: Sat, 29 Oct 2022 00:07:31 +0800
Message-Id: <20221028160733.1390230-1-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_090744_868591_517B82DD 
X-CRM114-Status: UNSURE (   8.20  )
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

 .../sound/mt8186-mt6366-rt1019-rt5682s.yaml   |   6 +
 .../mt8186/mt8186-mt6366-rt1019-rt5682s.c     | 104 +++++++++++++++++-
 2 files changed, 109 insertions(+), 1 deletion(-)

-- 
2.25.1


