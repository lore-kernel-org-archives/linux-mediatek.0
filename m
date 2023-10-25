Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB762C25B6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lZjOElzQDGxoQ4pwGGKbt8PuAPhhW08ELsRr1XnGZiA=; b=gdJxd4kckBVgX7ybD7gPIfjY6i
	I0u/AQkxzqEvxmPxj5ZpBDUdxcUuvGmooKPw9o1c6jW9oRxRf7gc+fzgFyLktYHmQuneHmaCp2RtV
	1CF0kWcd86R+OJBv3g9rURvW3jBGytPS4A8iqnMtx1XBOu0kXJjJUxv3mrUqJLpZFyMEyS5g4/pWV
	WBSk2MHGiNON6dR97vrsdEKq0MZQdv4bH5TWMp0GvinJn9Hz8ueLvXYAfTQG3LgT9jki+FFB00JxN
	BRYZg4ee1sq0T3BvlLIhP6iCRgIyVUXIbFlC+ESMNHGeOcO2s4JvY/ZeorilGlkN5Kx9q1ECmO97a
	s1wdmJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqe-00DCmk-2a;
	Wed, 25 Oct 2023 21:55:32 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvlqc-00DCjR-2D
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Oct 2023 21:55:31 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-584042a01eeso160362eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Oct 2023 14:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698270924; x=1698875724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lZjOElzQDGxoQ4pwGGKbt8PuAPhhW08ELsRr1XnGZiA=;
        b=YTznO/wBAk2vZFY8vwRJW4DJarHNV7JbxCUNs006DkxUfV7BQq9vlf4W+SWnoA2Fjw
         vVwKlmkBonDzxODjAng2Y+7Xkj+yODqOcl3YLXOtsvMeIUjne3oR4UNCDMDpm2kBIlNy
         NqNvd2EBitkmaqKbWF0hV8IlUQjl0rSen16Tk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698270924; x=1698875724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZjOElzQDGxoQ4pwGGKbt8PuAPhhW08ELsRr1XnGZiA=;
        b=YntvBPLxchHSk3Vxfzipq/o9FFrHVI+g8XnN7qWFD0kR4shqwTl39fKnvJkei3qQ0q
         FmdnGgfUFIvIZ7tQpbDKYetYhj2LzgKSfV0xObJUyFoyfaM39MT7+Ki61nucNdpzB5qH
         RFw5FlkKO89RMYk2tbwxvYPTfD0Ow+uoSZqn47AgFRrIAkYfQ1NimzTp/8qt0DebDT9O
         FT57aZwdgDXNApKO3DMZJ3EXnizNeLVbUasBiyT2foFm6yW+OmyOLQHM+PP4By8FcbtE
         DZu9AB9Xi3bDJS9YE7z0kG6y5GM4AcUI/4OBUpWfI3tGxUB7lO82RjXssEO6K1hA76Yl
         0W9g==
X-Gm-Message-State: AOJu0Yzvlev7+/oFtVQkxGmOXIofgQqIhEdK7yS/JG4rpw4Xz3N/b69O
	c2824JqC+SaRbT9e4oeWQZRvdg==
X-Google-Smtp-Source: AGHT+IFjCZtfJhyqWwcYtvspHvC+k8qpM+nKb58t3dyqN+Hs53HrNgamjCAmgpib31dWdFQmj/AGFA==
X-Received: by 2002:a05:6358:3517:b0:168:ba46:d9dd with SMTP id m23-20020a056358351700b00168ba46d9ddmr16197803rwd.17.1698270924231;
        Wed, 25 Oct 2023 14:55:24 -0700 (PDT)
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:f0fe:5c3b:1d70:d0bb])
        by smtp.gmail.com with ESMTPSA id w14-20020a63160e000000b005b8ebef9fa0sm2994943pgl.83.2023.10.25.14.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 14:55:23 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 0/7] Add a few mt8183 follower boards.
Date: Wed, 25 Oct 2023 14:48:42 -0700
Message-ID: <20231025215517.1388735-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.42.0.758.gaed0368e0e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_145530_729810_1FC027E4 
X-CRM114-Status: UNSURE (   9.89  )
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

Add makomo, pico, and katsu which are mt8183 followers.

Hsin-Yi Wang (7):
  arm64: dts: mt8183: kukui: Fix underscores in node names
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
  arm64: dts: mt8183: Add kukui katsu board
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-makomo
  arm64: dts: mt8183: Add jacuzzi makomo board
  dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-jacuzzi-pico
  arm64: dts: mt8183: Add jacuzzi pico/pico6 board

 .../devicetree/bindings/arm/mediatek.yaml     |  21 ++++
 arch/arm64/boot/dts/mediatek/Makefile         |   6 +
 .../mt8183-kukui-jacuzzi-makomo-sku0.dts      |  24 ++++
 .../mt8183-kukui-jacuzzi-makomo-sku1.dts      |  24 ++++
 .../mediatek/mt8183-kukui-jacuzzi-pico.dts    |  36 ++++++
 .../mediatek/mt8183-kukui-jacuzzi-pico6.dts   | 110 ++++++++++++++++++
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   6 +-
 .../mediatek/mt8183-kukui-kakadu-sku22.dts    |  18 +++
 .../boot/dts/mediatek/mt8183-kukui-kakadu.dts |  18 +++
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  15 +--
 .../dts/mediatek/mt8183-kukui-katsu-sku32.dts |  36 ++++++
 .../dts/mediatek/mt8183-kukui-katsu-sku38.dts |  40 +++++++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  94 +++++++--------
 13 files changed, 384 insertions(+), 64 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-makomo-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts

-- 
2.42.0.758.gaed0368e0e-goog


