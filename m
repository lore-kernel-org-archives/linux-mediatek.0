Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1255C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 16:42:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6203960ED5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 16:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6203960ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mut1CokKUVqstgmeLGwUdDgdgoAlFdqk1J2nbBiwgUM=; b=qndt1eV2t+NvAN
	mXH4cutvPXVfG6UW1B7cYCUM48rHH7qXxnwOtfCGBkA5ewDYjoQ8WqIJjSeNIqG9XZg5MZx63EicA
	Xotiv7Ycw1k+UPLD6hTjtbmcmdJGqAwgT6C+4+M56rcyrvZdeurdCvzNqm7Q2I/96RGZfrbIOHyiF
	eFkNQz4+u9v+b24QsIfp0oQAhbaG99aukHM+VBFN5PftdrbE/3LR//F+RNigSgeYYvaoousyVNgTH
	MPcEJ4fcdCtCCOkv4chOOboAABZAuz2ZtzH2fVQO1aQbVwGnReDmmT976E4kWRnvRxPVEzaEnRdnl
	xOR2p9cfkY+XvaqeD/4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFfgP-00HRRO-3J; Mon, 16 Aug 2021 16:41:53 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFfgK-00HROL-Sh
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 16:41:51 +0000
Received: by mail-wr1-x42d.google.com with SMTP id k29so24513452wrd.7
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 09:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VaH1mb4YJaNfLIoBKAGqOfF1CidyUq6GE8UUo9yf+IA=;
 b=0FL71FFEFYgZAt/2TDNCQRJcLZD2MkQLLdGdsGCqZYWqpra+iVRmwzXSODwQZtO7gt
 QU9YZW3WRnh50AlUz/MsVFLpME9SsElyFHsUnbwad24NUpGtq74VMBZ1Kopr161ovvQk
 A+yVSlk26gYm/FmroNM/RifBzC6zfHcaqzlotstlTYmgMBjE85WzFkOhkpfJpB0TyfDF
 vnNeX9EVBOPkURpdcjsTZNDlsyMWPhtVf35FqOJCUZd7nki3E+uMHMtuhUIqqn46g+e5
 aT7sw8vOMx1QLx3vhhdbE3Z8VBKk4SVr+zpvaqjAFRFmsGKEq3OuP8BFoY/yfj40jTXg
 KM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VaH1mb4YJaNfLIoBKAGqOfF1CidyUq6GE8UUo9yf+IA=;
 b=LSaXpZOxRpYfp9a1Ey9YyihOSoFl2oO3wxG7/hlNLwcUfHe0mhGR6r1+vZZsFk9Wd+
 9R2N5XVEW7krvFaYdXigmKZV8xBkYOE1fl7WzAMnEkQsQrjhCYO22/Y2+EG0+1W3SIyo
 mbkL9BpfGudbvmufzBlKfWq20/NcUirur4LOIaZXpltlfVEkkCdVCpwrRoVvLUKgCnM5
 OQzgkAJsxRwD7cMN6sPYh3oxj9uHyFXsHm1JLhcTIohlub/yzlt83kkfJDvum7p6IPeB
 D7yeB1COHjjtYoCQNGnX5N3F48ujlDLTeWWouWL3V+aMCeqa3btF+ZaDRykfW3ORbuVr
 uvMA==
X-Gm-Message-State: AOAM531GAZhcMaL55ib9l3jICHrQX7CIlnMuIGAbmMnmu0+AGodmbZtl
 GN2XaUhkauVrsw5EQM/ZZg2ytw==
X-Google-Smtp-Source: ABdhPJxQMWnKzZ0ECLs1a7IEhF2g+rE7+74yku7t8LzXIre6H3dSFys3LS0NMgoW5aqYBTJQ3z4dqg==
X-Received: by 2002:a05:6000:184a:: with SMTP id
 c10mr19924577wri.26.1629132106459; 
 Mon, 16 Aug 2021 09:41:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a81:3690:b885:8dcf:f8c6:7841])
 by smtp.gmail.com with ESMTPSA id m10sm15211730wro.63.2021.08.16.09.41.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 09:41:45 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: rui.zhang@intel.com, daniel.lezcano@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: ben.tseng@mediatek.com, michael.kao@mediatek.com, ethan.chang@mediatek.com,
 fparent@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 0/3] Add support of thermal for mt8195
Date: Mon, 16 Aug 2021 18:43:04 +0200
Message-Id: <20210816164307.557315-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_094149_004051_355BA685 
X-CRM114-Status: UNSURE (   7.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds thermal support for mt8195.
Depends on https://patchwork.kernel.org/project/linux-mediatek/list/?series=502403

The changes required to support the mt8195 look very similar to those for
the mt6873 but the differences make code factorisation difficult.

Alexandre Bailon (1):
  dt-bindings: thermal: Add binding document for mt8195 thermal
    controller

Michael Kao (1):
  thermal: mediatek: Add thermal zone settings for mt8195

Tinghan Shen (1):
  arm64: dts: mt8195: Add thermal zone and thermal policy

 .../thermal/mediatek-thermal-lvts.yaml        |   6 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 164 ++++++++++++++
 drivers/thermal/mediatek/soc_temp_lvts.c      | 209 ++++++++++++++++--
 3 files changed, 361 insertions(+), 18 deletions(-)

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
