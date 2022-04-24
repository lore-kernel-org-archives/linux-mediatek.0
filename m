Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67654C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Apr 2022 08:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jEk3xk0j0sGvX6tyuPqYOKTChrrpq0/Nnz8YhN27L3o=; b=htY5rz58ks9UYs
	0GCFnaJzDb3DK47dN+w3+iULW8AQ8RSXpBz6o5Z6/C55XMNJ/DHBmhC3OeNzf+C9p6b4HkIU7lkCB
	Rq71/lDADv0AaR7lFa2eNKolXDBtRTSgk/izUmo6GnrO9BmZDb6Wm3QN+dBtMNFGjL5fkbMtBYTKI
	+Y7Ia3BPXO37h2Szoc0JvfJMRxHnVGL1eGd2UeTiptCwR6qj1rAUEe7wdXwqr4hfT79mDGz2MP/BG
	ZLG8/Schw8uG3zgttb1mqjngxBSZwRr1p35XoTp8b96EoLqfKQrEVBvXekTjdUJIs6i+nowrENrHW
	g+KTpAhssRNj6XAPwSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niXwj-006A1A-U5; Sun, 24 Apr 2022 08:50:21 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niXwi-006A06-1K; Sun, 24 Apr 2022 08:50:21 +0000
Received: by mail-ed1-x533.google.com with SMTP id be20so6827132edb.12;
 Sun, 24 Apr 2022 01:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pSeVxZ7kFGybIVIVrBXvwtctttqQblAdAr2j0viXYNA=;
 b=aukjRI/5KCMQTzkPd19KIyPbTyUf0ZA/YZ1GLvemCzic3DvYYjMVirH5qMtR7rgyta
 vCVzb+ANU3LrzBCTusfG7ydBMZLWBP0f9MyP+0tQwyY1EfCDcY+ipSMaie6NP5XiGlRe
 AUSKBx3vVW0g99i7TQNCNg5hoDZqEUluAjLnrjDrg2Gue/HSL39DB9iOBBjhHODZIpr2
 RLPrpzzxEuXZHkDBk03eFAYGhdUs+0c8geLCrBsnQrE89C3pc2HNhhMF1AWTFLFKYD2b
 2J9g/FEVML8LWPkgmUq0RljlySLR0Hv0esSVVPkbvOzMwsOYN/2+s0PRqdBb2Kc9GHVl
 oaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pSeVxZ7kFGybIVIVrBXvwtctttqQblAdAr2j0viXYNA=;
 b=HjFtbWFKO+k5pJAOnnSSmoFTeW/yYC44N/tLmwHWSI0NsFPFzpKHXNBlF+lDR2w5ld
 MxSFUVkQ64BgBJZjiMhf9Ma3U+gU/78O6NLzcfG08GwKh8BcHjwiLfcDvZzIaqpiBNPr
 TLQe8Jp05GBRBmlm7aMACKTKHMewg1a5aQDWDrE6DPkBIAO0GghbzpzL0rx2nmE1Jnzn
 Pzho0pII13PPy19Q0k+l5tPup1SPWQ15VOa6YN69MHFD+AdPIJHNr2pnGrKgzX5PE3Lx
 Xd0Ev48QkfijxRV/g6R5Zk9371DwMFYugHmpS1v6BYcwuFhvdnGSNd/nXrSUY9/gnhsM
 OuIg==
X-Gm-Message-State: AOAM530KdVp+Z5iFSvXnuoGAnvR00b0i6x1y7Z73iMTA7KbT1U+/5T8j
 7hurlMP+P0BAgaj9+5lNnI4=
X-Google-Smtp-Source: ABdhPJykDiz0AzVaoaUs4aHkau3AAtDAZ/ewV87Q1XEIBzcMj6OlpB+UYSoFWakcVx5TXsbYw/LJFw==
X-Received: by 2002:a05:6402:e85:b0:41d:121b:f436 with SMTP id
 h5-20020a0564020e8500b0041d121bf436mr13518567eda.121.1650790214813; 
 Sun, 24 Apr 2022 01:50:14 -0700 (PDT)
Received: from localhost.localdomain ([138.199.7.245])
 by smtp.gmail.com with ESMTPSA id
 gy10-20020a170906f24a00b006e894144707sm2435971ejb.53.2022.04.24.01.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 01:50:14 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: [PATCH v2 0/3] dt-bindings: arm: mediatek: Convert some docs to DT
 schema
Date: Sun, 24 Apr 2022 12:46:44 +0400
Message-Id: <20220424084647.76577-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_015020_196947_3C8742B3 
X-CRM114-Status: UNSURE (   9.55  )
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

Changes since v1:
- Move mediatek,topckgen.yaml and mediatek,apmixedsys.yaml to ../bindings/clock/
- Remove items from first enums in topckgen and apmixedsys schemas
- Mention headers with clock and reset values in all schema descriptions
- Add clock framework maintainers to topckgen and apmixedsys schemas
- Rename node name in infracfg example to clock-controller

Yassine Oudjana (3):
  dt-bindings: arm: mediatek: topckgen: Convert to DT schema
  dt-bindings: arm: mediatek: apmixedsys: Convert to DT schema
  dt-bindings: arm: mediatek: infracfg: Convert to DT schema

 .../arm/mediatek/mediatek,apmixedsys.txt      | 35 --------
 .../arm/mediatek/mediatek,infracfg.txt        | 42 ----------
 .../arm/mediatek/mediatek,infracfg.yaml       | 81 +++++++++++++++++++
 .../arm/mediatek/mediatek,topckgen.txt        | 35 --------
 .../bindings/clock/mediatek,apmixedsys.yaml   | 61 ++++++++++++++
 .../bindings/clock/mediatek,topckgen.yaml     | 61 ++++++++++++++
 6 files changed, 203 insertions(+), 112 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.yaml
 delete mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml

-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
