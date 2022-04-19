Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25720C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KILDh4+2CSDLFAKef+LCDEWw2+b+bPAztWmzBQnssSg=; b=DuTOJvG6js9xK2
	/b+WLRfWGRGozt0fxlhVXpgD1Zo3aeV6wwl45bbcUi77f6kCsvPgH8kvYwG/KfBkwas7X45ZijekF
	w6j/9kICKGnorctmEB5tdgMh4UpyFtyTvhXlZdV53zwpGDFLoZxnTP5t8nNykKTmnS6PUq0K83dXB
	9vUyWPicA15IuHWfca7XlNC9msxFIMziF4qcK8gAx82cfabYnIt3JEEgm4fdwme1BSLMJbBP1Rmyu
	HXSeJM1y3Lz+cqDKOul3SmfWyAEalsbCvrtYXD998KsKaSQj99N5Y3RXGIPWDykRs9J4pu0VM5uY7
	qPuS0AhBtGhetltnR9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsKy-005XRQ-EC; Tue, 19 Apr 2022 18:12:28 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsKv-005XMW-JW; Tue, 19 Apr 2022 18:12:26 +0000
Received: by mail-ed1-x536.google.com with SMTP id v15so22289026edb.12;
 Tue, 19 Apr 2022 11:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cy8TdUV8x3iwzNlE2xZ7cx5RS0sHcFrbbwckLVw+J9Q=;
 b=Hz0RP0xrJqEH7bYt7u6u/Kbq4MM3XxIJAahRbexVTlW/TNeAPFKMAEoowQ6mtL60Sm
 mH88jfbb69ULYKULr4eVODbzYBxoKva1nnBL428n1zoJenqgBca2iuezxRPcyB7gS1Wj
 rUjwwCUiKZ1cUtkCVuwbmHldhx6z3z7IDmMryeyNVVmVLq8lTIFcRcDv/5zAfccfxojK
 UeP1mFmWR6GhP3fT7zp1q9tnjQfvRTqzYVJMN1JUPLU7TrLRyGm2RDpJjAbvcwA29Fun
 /AKxmC3cudsURoZYiT+KzIlBW1PEpNH8g6MPlKJwAq9l9HhBy0pyIds6T/9N0GOsW7Ag
 wk6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cy8TdUV8x3iwzNlE2xZ7cx5RS0sHcFrbbwckLVw+J9Q=;
 b=IP7cxA/RYEfAzlom5VDYdGK0BB40c8Rhr12UsKZOio+fHtZZqRofDrwyg7J+uK05tA
 0fWw2JfuQYg2hZMQ61cPILoRpLIVWQw8eZqrri9ryT/mWrge5NQmO96ANfp+c0raU6Rk
 oQZBBpEfidwuHHisIXiNXKcxXZjFTVJukZCdRaeJURjqxlcBfp8anz65BxWdv+fcRmRn
 RM3SwOnxY/ZlSC50xzq5k2FgaxNtmh7DbUI0s7txzKlsBu2q/D2hOpbuYjJOvpoay36Z
 MkYZxfGq3pcAIRXRhBQvuYxBFKFI+mW3mLNKIfHOfsD2iNUUnJaT/19GRkD/e+wyoG5S
 aSQA==
X-Gm-Message-State: AOAM533+qo0HTCH65zCX0FMwiDljKOzzcloEtlMFRnVoQd34Yms6Szza
 P5tkOP50O2PaLkslOfdgeJ4=
X-Google-Smtp-Source: ABdhPJzLpBirEv7DlSCYKQ+4N5y6Aw9ZMFDpfBRmkgmJYrEZ7quf1Kt6VRVcCBpuJ+wOWapmcAdFFQ==
X-Received: by 2002:a05:6402:5207:b0:423:fcbe:ceff with SMTP id
 s7-20020a056402520700b00423fcbeceffmr5516393edd.387.1650391939833; 
 Tue, 19 Apr 2022 11:12:19 -0700 (PDT)
Received: from localhost.localdomain ([212.102.35.230])
 by smtp.gmail.com with ESMTPSA id
 b20-20020a1709063f9400b006e12836e07fsm5930614ejj.154.2022.04.19.11.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:12:19 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ryder Lee <ryder.lee@kernel.org>,
 Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] dt-bindings: arm: mediatek: Convert some docs to DT schema
Date: Tue, 19 Apr 2022 22:09:36 +0400
Message-Id: <20220419180938.19397-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111225_671230_6F6BEE0F 
X-CRM114-Status: UNSURE (   9.68  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

This series includes DT schema conversions for topckgen, apmixedsys
and infracfg bindings.

Yassine Oudjana (3):
  dt-bindings: arm: mediatek: topckgen: Convert to DT schema
  dt-bindings: arm: mediatek: apmixedsys: Convert to DT schema
  dt-bindings: arm: mediatek: infracfg: Convert to DT schema

 .../arm/mediatek/mediatek,apmixedsys.txt      | 35 --------
 .../arm/mediatek/mediatek,apmixedsys.yaml     | 60 ++++++++++++++
 .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
 .../arm/mediatek/mediatek,infracfg.yaml       | 79 +++++++++++++++++++
 .../arm/mediatek/mediatek,topckgen.txt        | 35 --------
 .../arm/mediatek/mediatek,topckgen.yaml       | 60 ++++++++++++++
 6 files changed, 199 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.yaml

-- 
2.35.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
