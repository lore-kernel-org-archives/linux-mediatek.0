Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF69C678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 12:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hn3uP3hG8mSuCgFEmDW7AQETpkM5xpSS4nxH3Vo41Mg=; b=4rCc031aPdxD9C/pZrcEIJYI+s
	OXegws6ceyIxzmW2SkBhKPAtzj8X3g42GSfeLe9NEsU1fRZqiE1Oi8zY4FLseNjxwuu325k1PIKg5
	O747nAjjcIOk2dmpsqHrncO+aT+cJOdLKLjIaxhHer7yXRX/gvtM2p+a3BA0Kzs/lujr9FZJMwyg4
	38XPyq7yQQxvPrsZgf7KFvUmPZZaVH6fct/3Vzr7taY2nYx7S3DUSeZDhZ8ahBtCW9BNV+wauzaZ8
	dxa0wsU3miooomBbsghf4PZEsE8pafOj6x8TLCGc6OirgUIknnHqexCXHQeXNUNokKGgFnH3sLoDD
	rqloLJfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiEy-002Bra-LN; Thu, 02 Mar 2023 12:40:56 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiEn-002BoE-WC; Thu, 02 Mar 2023 12:40:47 +0000
Received: by mail-ed1-x531.google.com with SMTP id x3so4038577edb.10;
        Thu, 02 Mar 2023 04:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677760843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hn3uP3hG8mSuCgFEmDW7AQETpkM5xpSS4nxH3Vo41Mg=;
        b=F6yLifQw2+wSRFA91PWf6xiJWYz1XeiVirHLY3leajb9mvZxs8eyezgWF5WJa/LxJ3
         h1ExhzjjUVkUVBG+BSgjA0Q3dje326x6XI7LzWNt0z/zmN264oz0Enp8yfetTEYNvJqm
         sw1MReyZok/9+Sb0Q1judaERrI4HJFOf28jiQjsZa3theTfBBx8rANX73M+VDKje8NAC
         iTy5kp+DEbTpVTm1iMgIRvbl+q5bvkNkwOlchPhJpXL7FYKCJZWdvwCZm2bxktHskeVO
         THz9hYNt3zZyw/hKC81/QsU2tEg8kxwV+MY9mIGkjiYA8AjvorUStd6L5v7d4EWxW0AI
         yeEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677760843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hn3uP3hG8mSuCgFEmDW7AQETpkM5xpSS4nxH3Vo41Mg=;
        b=ixLEYplgfqYUwo0aBbxs/9K0RQ/T2ubwIjbk8Nvf9QAtvLl37no5axKM3yMQvUblKH
         nFYEGR9UD68KMmvKCpR4Ar+lfzMz9+5Bm8rQHnDDSAkZppw8vDeGYrNOjQiXPeU9u02+
         /RsTl6Dl7ZxsP+1nh6t5Hs9WCwzQVnf3oMBP3gY0kClqjPMCdxY5h9d9tmHp0EKhTeMN
         HEftbjY/gadKJjctOarBjrt08sesSN1LzE//GbzU9j8NF8v5AUeQMYwl4vCXfx1gSyVe
         p896EG9EXviXNJiaH3P/cRlLUWBB8SAScl0OHER9I2Ff+wvu9WEOUjRbY1606EjSe/uq
         0fSA==
X-Gm-Message-State: AO0yUKW5uQvtU0hQC/tP7NBfoOJj4B03RY/rCI4eM6E1E71ysR6wZzmv
	BBmjgi8LIRE/wOemIa6R980=
X-Google-Smtp-Source: AK7set/eg1rJI3CgQygd7/y7nq7/G8E9a0Z+NUEzgN8bRJRpOn2n1NscB60sb28X6jp+i7qfk2Q3zA==
X-Received: by 2002:aa7:da4f:0:b0:4af:62af:460a with SMTP id w15-20020aa7da4f000000b004af62af460amr11488535eds.8.1677760842735;
        Thu, 02 Mar 2023 04:40:42 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id c22-20020a50f616000000b004c07b11deb8sm599036edn.64.2023.03.02.04.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 04:40:42 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] MediaTek MT6735 TOPRGU/WDT support
Date: Thu,  2 Mar 2023 15:40:13 +0300
Message-Id: <20230302124015.75546-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_044046_076364_8B2E1D14 
X-CRM114-Status: GOOD (  11.03  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision)
can be found here[1].

This series adds support for the top reset generation unit (TOPRGU) found on
the MediaTek MT6735 SoC. TOPRGU generates several reset signals and provides
watchdog timer functionality.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Yassine Oudjana (2):
  dt-bindings: reset: Add binding for MediaTek MT6735 TOPRGU/WDT
  watchdog: mtk_wdt: Add support for MT6735 WDT

 .../bindings/watchdog/mediatek,mtk-wdt.yaml     |  1 +
 drivers/watchdog/mtk_wdt.c                      | 12 ++++++++++++
 include/dt-bindings/reset/mediatek,mt6735-wdt.h | 17 +++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-wdt.h

-- 
2.39.2


