Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD4CC636D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 06:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IMU0WzlJkgoGbKPFmkcXrdPY8PaQeZ4fjfOamOl8qjc=; b=mX6XPT83ljc76H61zdO03/mCo/
	3/9l99bTNp22rXC0joR0j9VW+PwtJcpPNY2tU63qI1JojkdtrXwHI7R7hmWNMQTV1JL+E+rl73YO5
	UzYWok4s05oLV5kJqunG2Vb7bjK0B9j+9PtkU1RiRLGYH5ny+VWAoEfnjTsGcxYGIYc41BI4ihkuC
	Rcrx5Yai5Haxl8rSYsuPaOilZPAZTKTwF+g0JMl8pZ3JKTRPkyBS6tHXMk41dum1pffG0qwYICBjZ
	RG1eq8hp4DdlxcY13PXBtZl4g9K6SVmnFe7Tl3sI/hy3w9ZdAVnzNxlhVkVXsZmEiTkyVD6vr1Dnt
	lBD8x1uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6yu-00AViN-B1; Wed, 01 Feb 2023 06:52:32 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN6yr-00AVhJ-Te; Wed, 01 Feb 2023 06:52:31 +0000
Received: by mail-ej1-x62f.google.com with SMTP id gr7so23857512ejb.5;
        Tue, 31 Jan 2023 22:52:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IMU0WzlJkgoGbKPFmkcXrdPY8PaQeZ4fjfOamOl8qjc=;
        b=a2YsEAmx/kUClgAZDcv2fVH8oN+RKJimOLk1eglv7EyoSakA3WJQparUKoKi4OaZX7
         Qv3YJaJdcnuYLCSEF/tc0tERnaxKQo4ywe8UDRX0okFJ42+PkmK3fQtrWNKGJLUb8WnX
         D/ZJ3wfngZm0jeJUDmquRxPvqTZPKeHlgp511CJS7TsZt9db8IqdfHFsVdqTSZZw+dJF
         Y8EeVS4PYV4F5rb4AFh7bS1l3lNOD2Rzmy54kZZX+MjArXb9qUW2tNcF7asKIKySQRgo
         yUJgHDpF6CQ9FeCNSUvbbcKlDdPcbmfa5t65k80DDefOSax5MSAC04zEuHfp5ttq9CmQ
         nt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IMU0WzlJkgoGbKPFmkcXrdPY8PaQeZ4fjfOamOl8qjc=;
        b=bdQil6SumO1ospwg1KqGzNAZuvYF3F9pPmHCE8bUUxYhyLH/fBSa6cDGPVKP1SxHMo
         MW2Jxojp2NWowf6PAlk7eB2w5NGZIra1V1f19h3Zqt+QoFj9IPy3gMr73elkVX6WK7Md
         CFYe7jBxqrRpZLuKKHRvbVW+HXfRP5ySFPeTzRKmo4/gQ9Uoa8NDMT3YTtIB0XAzNGg6
         P7rRS80D/APRXABL5EbSnV54NQ+RsLKUd3QmUujWDyOyURTiwwEY8DvYoTryea3eAu+g
         Fbxc02zSSueTiV+bhF2p9s9a3/RL3+CEGew9EeHQlAkfxJ6inP7ZCQNT2LC6OIYOSUNr
         DsDw==
X-Gm-Message-State: AO0yUKVtLij/3IMqHbLon8Nr4/7QU6R3FdWLI4tip+Aq6l6mZBeruTDx
	wdXLUmXCGgCkudGRiBerKuo=
X-Google-Smtp-Source: AK7set8jh7awTsTD0Mny29s1rpwDIwGC9gf44rtfGI0Nkha6ybhzwArAt8Ck7RlIIEly0DB/mNRoSg==
X-Received: by 2002:a17:907:6d15:b0:878:7cf2:3617 with SMTP id sa21-20020a1709076d1500b008787cf23617mr1683067ejc.3.1675234344639;
        Tue, 31 Jan 2023 22:52:24 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906218100b008720c458bd4sm9509608eju.3.2023.01.31.22.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 22:52:24 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 0/4] nvmem: add and use generic MMIO NVMEM
Date: Wed,  1 Feb 2023 07:47:13 +0100
Message-Id: <20230201064717.18410-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_225229_972051_AC05B522 
X-CRM114-Status: GOOD (  11.42  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MMIO accessible NVMEM devices should be simple enough to allow using a
single binding & driver for them.

I already replaced two existing drivers. With NVMEM layouts introduced I
can also replace Broadcom's NVRAM driver but that work depends on my
pending U-Boot patchset (it provides required helpers).

Rafał Miłecki (4):
  dt-bindings: nvmem: mmio: new binding for MMIO accessible NVMEM
    devices
  nvmem: add generic driver for devices with MMIO access
  nvmem: mtk-efuse: replace driver with a generic MMIO one
  nvmem: uniphier-efuse: replace driver with a generic MMIO one

 .../devicetree/bindings/nvmem/mmio.yaml       | 46 +++++++++
 drivers/nvmem/Kconfig                         | 24 +++--
 drivers/nvmem/Makefile                        |  6 +-
 drivers/nvmem/mmio.c                          | 84 ++++++++++++++++
 drivers/nvmem/mtk-efuse.c                     | 97 -------------------
 drivers/nvmem/uniphier-efuse.c                | 78 ---------------
 6 files changed, 148 insertions(+), 187 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mmio.yaml
 create mode 100644 drivers/nvmem/mmio.c
 delete mode 100644 drivers/nvmem/mtk-efuse.c
 delete mode 100644 drivers/nvmem/uniphier-efuse.c

-- 
2.34.1


