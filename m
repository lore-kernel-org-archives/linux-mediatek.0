Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB185C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 07:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XZPr8dGI3aR8aZYgW2ma5FZPEeNI8Ujf4i3nXNHuIyE=; b=r6eioFPJYMjVQI+e0MYpGn45oJ
	Id97RvaeSk1zef9Q/a5JDix4DnptBoylFHjHMcWMxJPX1iC/LjdMzD2aoSQ/4XuTXmRwVSL3RYdpy
	GaoUa6hra4w6KeZdMZRidKUwHfSSVXmZu1mcItGKEnrvi8/ryQTLYRMwRilmmcj3oe2j9nJ+AfOI7
	O3LwIOmrNZO98/rNSFKfIXCotjAf8twat/tOrJeViN8dxOcUi6Pf6117ycWm+3n4DnFFLmTIL0Ktw
	OErFOOQQj7sJoSOHc9hzcCBmSViQz3bw2ubKORve0wEEHRuALzBn1QUJ+akph+ZRZ0yB7q9nWLHfb
	MbHfXnLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuQp-00CFfZ-Og; Tue, 28 Feb 2023 07:29:51 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWuQm-00CFe2-Vo; Tue, 28 Feb 2023 07:29:50 +0000
Received: by mail-lf1-x133.google.com with SMTP id g17so11923478lfv.4;
        Mon, 27 Feb 2023 23:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XZPr8dGI3aR8aZYgW2ma5FZPEeNI8Ujf4i3nXNHuIyE=;
        b=Ixn3pcRJCxQ8McSfxwt2FqTJuJ6urKnsHOjrPhIOe0i8BrUpBVNhb6ZhgUs5IRLGpE
         2V+ToK5VE1BMV1/CU4+Wgl4wnJrJDw8PvY3mo7zCodUX36RT50UfZ67PjZrXEfoc42Cz
         GL+QH6sxFsZByYfEk/ZbUGgA2dpwrQ9s8LpcwDVcYm0dFJ0CXOnul6SvMvMXTv9KgBFF
         T4ogJDNc4HS6oWvaQ81aEkon1RjbGpartM3Vq9lUp6H3TXvk/3Mfl4Ctb1kpSJGqhtXn
         D5TGrCmQIOd2c3UHCLbFuV5ROhEHdCwa6yIpp7ChltudNZQMw8iK2hG+r8iTkBklIgbH
         Kq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZPr8dGI3aR8aZYgW2ma5FZPEeNI8Ujf4i3nXNHuIyE=;
        b=YVdHLStV1QO3liuxOlYF3dbRLHVjdFvZ8k5xR2qmj+YIxg0qOk3qG1Xd2WaD2RAvDt
         DJzhZ5oJZXKU9bKiHr9G2anxJyLt61iZS7Hwi0joEH5qyfl81e6dqNzB9c9nnERqXxd6
         7Y3W5rNYJXOuasGvYDTPYfkw+/FCDJ3vsD/njhXAUDfq+UF7zqDft/iri+LHR0ma94TF
         xAodU+/BpsDtDhDSITgdyoYTSajL44hxjYaJrH0kyRm5htGfNRxQoUn5i1eNKRXbrluG
         km3tH3OzFNJ/a2+n/BGFqH36RIvKAeLKk2C/yB9giifoSPrXxw1MxKwefHPwHAsRP5CB
         kLcA==
X-Gm-Message-State: AO0yUKX/NRayKCM9Vt+BThbkUqDKTsCRXqVhnEv6OeNE2CGFifPLRBZV
	Z9jV/vo5+iZVZY24wgEVAGoiObZkYhk=
X-Google-Smtp-Source: AK7set+eCp+xMpfhsvaxmUkNUhQJJ+UAblG4lQOyi6vzR9O3QZCLcmGJ9HndFHKpTd2Ec2pJylvPog==
X-Received: by 2002:ac2:48a7:0:b0:4dc:4b70:a723 with SMTP id u7-20020ac248a7000000b004dc4b70a723mr383341lfg.30.1677569384662;
        Mon, 27 Feb 2023 23:29:44 -0800 (PST)
Received: from localhost.lan (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
        by smtp.gmail.com with ESMTPSA id l2-20020ac25542000000b004d85a7e8b17sm1229550lfk.269.2023.02.27.23.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 23:29:44 -0800 (PST)
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
Subject: [PATCH V4 0/2] nvmem: add and use generic MMIO NVMEM
Date: Tue, 28 Feb 2023 08:29:34 +0100
Message-Id: <20230228072936.1108-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_232949_038825_A5EADCC6 
X-CRM114-Status: GOOD (  11.46  )
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

In V3 I didn't decide to modify existing Mediatek & UniPhier drivers as
there are some concerns about adding writing support to them. If needed
that can be done later.

Once we get layouts support NVRAM driver will get migrated into one and
generic MMIO driver will take over its binding.

Rafał Miłecki (2):
  dt-bindings: nvmem: mmio: new binding for MMIO accessible NVMEM
    devices
  nvmem: add generic driver for devices with MMIO access

 .../devicetree/bindings/nvmem/mmio.yaml       |  50 ++++++
 drivers/nvmem/Kconfig                         |  10 ++
 drivers/nvmem/Makefile                        |   2 +
 drivers/nvmem/mmio.c                          | 148 ++++++++++++++++++
 4 files changed, 210 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/nvmem/mmio.yaml
 create mode 100644 drivers/nvmem/mmio.c

-- 
2.34.1


