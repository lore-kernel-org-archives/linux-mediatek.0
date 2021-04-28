Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA50C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DE6A60E08
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE6A60E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jR/Asm16lNFGlthGIwb4k2OXNADyLrSxkl4pWh26ZE4=; b=IH+WlsFI0z9TqyteXK1jEc5B6
	tVue8afh+jvvaogUEgJDuFY1hUZe0GfmAo39sv0TayjHrv25dX5b9/yvb5+Ea28Zs+Y/yN1lnfgM5
	R9doA7Czi5Szc/aLo+EdFkGGk30lJVseLRY2z128PfYvqvyelfLPE9Aj+z0FaDCePsxHpdn8Md4wo
	Pv60gsbNw+WARVTxZm7OZ0aWPz4RibUjOW9eVJimnMOyH1wj+DUZxIdcfkzKCCqMjUQ3pu/ye7S1N
	aGI7rtCYZGqNlAiaznzICUB1s36ao+IKFGAv8lFXiCXgOZIoswz3bgonjpuGD+Gki8Z1Fi1t8IyQc
	6tKfPbfvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnHr-003rZD-2V; Wed, 28 Apr 2021 16:43:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGj-003rH6-Da
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4iBEXnR1nc8SuK9x0RI0HjJCZgNJ4KQ0iJTuPJeZHB8=; b=eUDqxx5mDv/pxbYDXuRKy+KqdI
 XhdWD87Pdtqb7fRYUlyvGz8MuEr9OcW1U6XK4ZEhurfdgzFuv/03kuf7QYXAqUq9VA8UOeNj5/HHJ
 3xp6vVSd1eDf+MjK1+GM0LmkK3x+SpK0ZepB+xZ4R4DVPFkFb9ujxNiMhGzQB5lpGqNqPTXAaQkUI
 Bb3tVzMrCrnYamUIw8UTw5HcPojen1myisY8RPJudx0c8aAxeWQ5f3AGH3PtmWucUhANdSSjrLwBS
 TrY7+XlXpNZhDAXOOqcUTgr0Oxp8vahErljSWZagXXStAFKzKLebVpxMIzPN0cZRuGbuy9f9oWi7x
 mjlydMoQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGg-0001f7-Uk
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:42:32 +0000
Received: by mail-wr1-x429.google.com with SMTP id e5so35109304wrg.7
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4iBEXnR1nc8SuK9x0RI0HjJCZgNJ4KQ0iJTuPJeZHB8=;
 b=Rq3J38Zqc6gI2+zGNcT7zWRQ3/6wkLaHH1GGf4GEoRqnzFASs7CFrP1Wl6jtxARL9i
 3aj23YNgSI3EhVwxyms52vAUEQpyh4ze9anBmJ+Q5V3CahksOV0j6GN/AcTVzP2RqaYI
 wyi9JoFEQ/WNvw4tR2ifYYBpuQxd//Xs5iNbxGIhZZZcJPib+HdGBlmtbLOVkiPMt7Bo
 /JEv+93o3OsoP4IdJqHymAfa2Cb9ani1n1MKEPZKL2CwJrmlWcuGZpZz/p01H0MspOya
 ULpfKTHN06cenKhTc8jYQqtDRVZcQxCkEJ1zxYVrHfNk6WyV9iBi38nwEggGi3unmtjn
 mhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4iBEXnR1nc8SuK9x0RI0HjJCZgNJ4KQ0iJTuPJeZHB8=;
 b=oh/GlnksJySm/lmzT76RK2Ubd1xxSgfZYmlmvdRUz52t547eoo4LX0/3ysooN3JXyF
 3KtjF+z5Umiv2WlyRRgQVrrrTR8qPmO3ZExc3oQwbxOSFVRXZ/EsAlH2hTmte7J1pf1S
 xVU09C4eVIdVsArTa+xjeY6vd94Kh8zavlg3SxoL8fyJW0Hq2eIxuTjtY16xjO5qfCQm
 9z58p42EK38Lz3eFQhCcktOxcNV9y/yWidwz9NZeUa5s43zY0dESfUTbQmsHEjVE+Jzd
 yOLTGLm6nWeZVOgldjwD6NEBOMMpRDA1Ug9+rBVxoo/OrGA70dkx12M9ME65KecptCis
 aP3Q==
X-Gm-Message-State: AOAM533RPWuDFZYwJR/ynXzFKhjfJJw28fLY2tq5x+ilJBOVjd0PvmaO
 Wega0gYcM7dWLsD5qLRmrjNDqg==
X-Google-Smtp-Source: ABdhPJyWEwmUF9T2p2cho3eW1dDUOfY2IOjaly14N2nUuESPRrAaxGB0L8uVg8DlnkNWW8vpNPDdaQ==
X-Received: by 2002:a5d:6648:: with SMTP id f8mr16158946wrw.396.1619628149075; 
 Wed, 28 Apr 2021 09:42:29 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
 by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:42:28 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: fparent@baylibre.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] dt-bindings: input: mtk-pmic-keys: add MT6358 binding
 definition
Date: Wed, 28 Apr 2021 18:42:16 +0200
Message-Id: <20210428164219.1115537-5-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094230_995246_2F91BD0A 
X-CRM114-Status: GOOD (  12.20  )
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

Add the binding documentation of the mtk-pmic-keys for the MT6358 PMICs.

MT6358 is a little different since it used separate IRQs for the
release key (_r) event

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
index 535d92885372..9d00f2a8e13a 100644
--- a/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
+++ b/Documentation/devicetree/bindings/input/mtk-pmic-keys.txt
@@ -9,7 +9,10 @@ For MT6397/MT6323 MFD bindings see:
 Documentation/devicetree/bindings/mfd/mt6397.txt
 
 Required properties:
-- compatible: "mediatek,mt6397-keys" or "mediatek,mt6323-keys"
+- compatible: Should be one of:
+	- "mediatek,mt6397-keys"
+	- "mediatek,mt6323-keys"
+	- "mediatek,mt6358-keys"
 - linux,keycodes: See Documentation/devicetree/bindings/input/input.yaml
 
 Optional Properties:
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
