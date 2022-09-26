Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C657C6FA86
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 10:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sduujl6DN3SaLa2Y/Z6Vcki+0Q9QqbCZHpdlm19R0rM=; b=4VUpP9iUsOkCS68r2SrnKjJC37
	Bvjc3CT+ZblGuvUu0JZiPm2/0ZoNsdVELs4MIx06wiklIin6T1hj1QtYHv//SfrXWi3ZSR5N/ygm2
	x99UdFSqXKSRuGJT8Y4vZus0wZauzbRtTQ8CYWRaYsYYBVZChB/u51WBPxxkJU0KbDqYLNBKDi1CC
	BIyTB+XWd0heH0BSGMztS+mDCBlBEwnNABnJF5NtZraFiFitZFZ08+fVa2Y84E9RD/IUiPzltC76G
	ZvG1CoRofryJhJt93qeg0jhyzbon1kMf/wDHO4v6Vt3bDFVAYpPubBQoGBUcNQsqQbhgw1mYqUgC5
	AA5jSsmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclhN-004J7e-3a; Mon, 26 Sep 2022 10:50:53 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclh5-004Iua-UA
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 10:50:37 +0000
Received: by mail-lf1-x130.google.com with SMTP id a3so10156424lfk.9
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 03:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=sduujl6DN3SaLa2Y/Z6Vcki+0Q9QqbCZHpdlm19R0rM=;
        b=HClTHAMIFLCVpN//cX5WfolUCp9f5W8XmUg56K+JFJnIwNX/lYJWCoQ5LILmvgomLh
         C4CjPZopxlEoI5Um32N8WfnhzJaFu673dK75xzxf9azpwx9iDHPeacw3NEm2wgSd4j0X
         eTYDF1Getx1o+K3IyfbEKGjnAwRM/Tm8RaE8DfnFDbcn/b7SzcyqB8OE0xHUXJcHFI6F
         rg8uUU6GetaJBaEOO7MAhmiSzkNpKxVFBaRfNLnPEH+VSsQIFKSmoIJshVz3nN5vEUpk
         60FHyAT4TrNTEbL3gTn3T0zvUNuVJYzpw4FsxDbZJbaGibyBvm1S/pt02rMwHYkmIc4/
         7pzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=sduujl6DN3SaLa2Y/Z6Vcki+0Q9QqbCZHpdlm19R0rM=;
        b=GjvL0N4VP/KdEdPD1NN5yS/SD6+iaw9FXz2V+u7lLNsJzuqk5aiBjwSm6phfG1CQs0
         +QPXt6FAR+oY5oHbhidaPk5CU8JT5heDI8XvkBuRvKPMlrgXc0acJvwFZtEt9o3No0h3
         Jh68OIGz/MvXR8L0hlMdAIYRcLU+BVT7gnsiGsHZ1nsJ0F2jmrFAzsi3IAQQJ8cFSHle
         GyMI7Qu50+TMwC20uTBrqzxVvAdmjb7S/hivDL2+A5UWpLA0jLss06v2cgL3VMltYFKa
         GV7Rc29WuavsoscWYwwgvuSfpeYZEwCONmYTm/lBk/F50H2Behxt7GnB6s4dmPQbpTDu
         y7bQ==
X-Gm-Message-State: ACrzQf2DIPAIex+hvBUzIEcc+e8u9o8IGVPhAupVpN8dAaaA8VNPmnck
	/K1SbTPhPQTdXCGL5/rhMjgFiw==
X-Google-Smtp-Source: AMsMyM4b3s9UOlbwdHOcusBcEnFj1C2J/V/PMZte/5G+lp2fXQHMBGTCPDUbre0H5aFETqL4hgiYgQ==
X-Received: by 2002:a19:651e:0:b0:497:aaa5:44c with SMTP id z30-20020a19651e000000b00497aaa5044cmr8211896lfb.280.1664189432064;
        Mon, 26 Sep 2022 03:50:32 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id o4-20020a198c04000000b0049f54a976efsm2492936lfd.29.2022.09.26.03.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:50:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] memory: Second round for v6.1
Date: Mon, 26 Sep 2022 12:50:23 +0200
Message-Id: <20220926105023.119781-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_035035_991318_8AFAD296 
X-CRM114-Status: UNSURE (   9.76  )
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

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 9f8fb8032febf594914999c33493c682eaf138cb:

  dt-bindings: memory: mediatek,smi: Update condition for mt8195 smi node (2022-08-16 12:21:14 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.1-2

for you to fetch changes up to 5514acb0dd030356e628cdd88b266efaa0a22315:

  dt-bindings: memory: snps,dw-umctl2-ddrc: Extend schema with IRQs/resets/clocks props (2022-09-21 20:34:58 +0200)

----------------------------------------------------------------
Memory controller drivers for v6.1, part 2

Improvements in Synopsys DesignWare Universal Multi-Protocol Memory
Controller Devicetree bindings.  The bindings are being split into
one related to Synopsys core and into quite different derivative Zynq
A05 DDR Memory Controller.  Extend the Synopsys bindings with additional
properties to match upcoming new device support (Baikal-T1 support).

----------------------------------------------------------------
Serge Semin (4):
      dt-bindings: memory: synopsys,ddrc-ecc: Detach Zynq DDRC controller support
      dt-bindings: memory: snps,dw-umctl2-ddrc: Use more descriptive device name
      dt-bindings: memory: snps,dw-umctl2-ddrc: Replace opencoded numbers with macros
      dt-bindings: memory: snps,dw-umctl2-ddrc: Extend schema with IRQs/resets/clocks props

 .../memory-controllers/snps,dw-umctl2-ddrc.yaml    | 118 +++++++++++++++++++++
 .../memory-controllers/synopsys,ddrc-ecc.yaml      |  76 -------------
 .../memory-controllers/xlnx,zynq-ddrc-a05.yaml     |  38 +++++++
 MAINTAINERS                                        |   2 +
 4 files changed, 158 insertions(+), 76 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/snps,dw-umctl2-ddrc.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/synopsys,ddrc-ecc.yaml
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/xlnx,zynq-ddrc-a05.yaml

