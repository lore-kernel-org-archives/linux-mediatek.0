Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9394CC46467
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KyDTae+yIRm9B46y4fh6l6TTAmMj8UP4bhexXvaxQvg=; b=21FrEyVB9gZzfC4L/Fe9F/PL2V
	gPclUZGvre9EbkppXRkXlNMdxbMYlLV3Ll47jJzwv0FOTgsv0C6Db1fZEpjK+O8GKPo/5upHp9gJi
	S7xrE7YOntsoxsKtCVxCzLQYjPmArw/VUXYDHX8UPkqrNRt0fjRme/a0VQBe+9jkU9aDam3VP00vb
	ztKkD85auWdSEQUQuSu/ZWiRUTCWxtmSO2RIPoztm4Lk23/o/fH2ldsG8UtvKmeg03KUlNQgmOAm1
	TVh5QFsoSOP1JclEEDuiZ4T+4ErT8kktB6p+Z86OExqUWBbrqO1Xf2ITTfj1ZJf+//jS4ycvPnc/j
	pnMjgqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXmw-005zEc-Q9; Thu, 19 Jan 2023 16:29:19 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXmd-005z3T-Ff
	for linux-mediatek@lists.infradead.org; Thu, 19 Jan 2023 16:29:02 +0000
Received: by mail-wr1-x434.google.com with SMTP id bk16so2380381wrb.11
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Jan 2023 08:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=KyDTae+yIRm9B46y4fh6l6TTAmMj8UP4bhexXvaxQvg=;
        b=jQmM25167/Sn9MWbEEi7q8VYIVZHNgon8DyMdOgJCTr9GR1WuYLMkyIHkOf+KPaf6Q
         qUkEZ82pmtBBSKocFxUDWgHD0OLIUMPR1EBi2Pp2x6U/tWE78MhwQZ1aOjpJllx4k56D
         tzP70DHL16qp514tucSo9s9AKLuq4ILNJ+rd/Db75VCaEdppiC6BAW1rhdVXDlnNhRcx
         ikHz6B7jXfJ2J0qBCXWaUO6gE7SLOisgUfgM5dlPop+8KrIuII43CKJ2hodbxjViJD75
         VP3NOJq9R3x8U6WftOTdcYAQb7v3ufd3XyeFsCjpCS7tztVGs5XmspmRSVxb9lVHXtNg
         wSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyDTae+yIRm9B46y4fh6l6TTAmMj8UP4bhexXvaxQvg=;
        b=AcD7iajt6bbz8EQYteCGLKveD281rI22pR2lENJfKzHcECkOOKlBSTIG1vegJ21AH1
         /mpcOu6rEs189ejQxPp6mfgizDll8uU4mIAGzaaoQUjz182VH1l4ySXfQPZcTx9xN+NF
         FB/qNKJLbpphRQVL5kXgaoIyawVsDUBpytga0XIBjHS7+2kO2cHQX+p4N8NsW3ylNVS2
         rBAm7xjc9vpb0eg4rQm4Gb9kPKIKa+M0yIX0omSjAj82FwTKuYWXkl3bW6OaSe9qFqPd
         aEt3h5CuLogxJI/fqAdn9kjv8m73Wam7LbFDRkD/KLdKpNBv13O9x1kGPl4BtbfLDXs1
         WA/w==
X-Gm-Message-State: AFqh2kqevjBmxhlqovYdFGVjQVBHEK6FIEz8pS8L7cWEmCRIO/AOvVtu
	/fxa4fJKpGDe7ky0wQWeOw6FsA==
X-Google-Smtp-Source: AMrXdXv+CmLOrA89B0ZuZyKvu9Y6N46QigmiVMi0IyY1PCKErMDy0IN7Aid9IuYATD/a9LBe7hsUOQ==
X-Received: by 2002:a05:6000:689:b0:2bd:ffad:1bce with SMTP id bo9-20020a056000068900b002bdffad1bcemr11263798wrb.59.1674145736528;
        Thu, 19 Jan 2023 08:28:56 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f7-20020a5d6647000000b002bbeb700c38sm29008771wrw.91.2023.01.19.08.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 08:28:55 -0800 (PST)
Subject: [PATCH 0/2] Add MediaTek MT8365 SPI support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAMBvyWMC/w3LwQ5AMAwA0F+RnjXZMMHfdNPQhFlWXBb/bsd3eAWUs7DC0hTI/IrKFSts20DYKW
 6MslZDZ7reWDvheU/96FCToD4pXflGs86jD87RQAZq9KSMPlMMe63xOY7v+wFAMS4raQAAAA==
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 19 Jan 2023 17:28:48 +0100
Message-Id: <20230118-mt8365-spi-support-v1-0-842a21e50494@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1434; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=zgfYtWJl6Qnh+hLsShyx1UnAkEV+3eaUlo+MkmgoDbQ=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjyW/GdVwaejjtWKRvxKzRFY+EaDyo/lXcw1dm3b7c
 BghChKGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY8lvxgAKCRArRkmdfjHURVPHEA
 CvuZFIUu1KDwRFFmDhM1p3ChGZDGxZhGCrp3BOOs7Mmoku/x9997da+lBrVEZ+5Kwpi4sm/2UV9W4g
 47uNrjzbVfOPUJDqFfJDKk/FMEo2t2LauRdVmOG6zNHUj2/XKa0CU8wt8vVQE4XxH9nvX0ewx+k8IX
 DyjnKgV7dwjYD0T1JNMB+8iSDiSTtbEdFBvEc0jrMZSPAJRGk8TJX00ttRwWWs8VTQ3LFgCKJb85Ix
 blfxbAAwqg6cvy//4jErY0QNhrPEIoLrbGLbOaekvOhKeopaWyIGZFVhLifWtCSNykjnb8umEqvz35
 ekvplHL+BK7TYjX+H0bGy4uhoRkTGKGl0210Tid45WkfpqX3CMQaMGHMzqzhQG5xPUc1VvL0DccZCS
 /Gbc/uXRyJCLhU5oVWCyYUNNi0SOKttpVw+ZJVfiO/NYXFAmBEKtROZx8L4I4SFoeTEEE1qo9B/+Ln
 Nm/3pD4ZOPHlsrzNFfDkOTIEaAsgSa3o0NvP0YQbJzZ4P6BVLSxAkHyGvVacrw05mNWdcbMw5gX000
 oYRe5+d9rpLg+UjuAIhtQRVD07hq4lsUxYu5PGVuQZc/qEwC0MElkgEJEnJc2uGK4RpPicKq99DW64
 9JEM8NsHRlfWoYA+SWcz1KF8CmEpMUUSIvb4XgLYXLI/n3UET3fz8Arn1Vkw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_082859_584211_7E2F51E2 
X-CRM114-Status: GOOD (  12.27  )
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
This patch series adds SPI support for MT8365-EVK board.
The SPIDEV is enabled, it can be used through the board pin header,
as described directly on the PCB.

This series depends to another one which add support for
MT8365 SoC and EVK board. Link [1].

Test:
- Loopback MOSI and MISO pins
- Issue the following command:
spidev_test -D /dev/spidev0.0 -v
- RX line should be the same as TX line.

Regards,
Alex

[1]: https://lore.kernel.org/linux-mediatek/20230101220149.3035048-1-bero@baylibre.com/

To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-spi@vger.kernel.org
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>

---
Alexandre Mergnat (2):
      arm64: dts: mediatek: add spidev support for mt8365-evk board
      spi: spidev: add new mediatek support

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 24 ++++++++++++++++++++++++
 drivers/spi/spidev.c                        |  2 ++
 2 files changed, 26 insertions(+)
---
base-commit: 8b6cfcce3ce939db11166680a57253c39110f07e
change-id: 20230118-mt8365-spi-support-0d96bc55a4a0

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>

