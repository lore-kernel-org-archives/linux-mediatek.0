Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8EF8C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 11:54:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8069221548
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 11:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pm5i6nGZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YI97RlPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8069221548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=BULbu2H4HfYLi18bt/gGhkPb1pl6uV2WMaRf9MxQMKw=; b=pm5
	i6nGZxKJZpjET8C4r0ZMrzVAKNyBjbnGgiJKcrkeTlX56hQP+BNIY9DcRAUczRSYq3KlzB3U1gEuy
	b4Qhjdxto8cI6Ek9kxBXjQ3ZdPBP8O/Cmba1IOnBpGeN/xkJQAm5LCyDyiVZbTLthXi74/5jEf7DS
	elZjBeSTUjmtd8JdhkxRKsGzYISgJ0AvJ6fg1xhD35TaK0onKr/z+h25z3xGBwoky31zxjzpxp56K
	XaQe8hPiiAV67fz1LUwElK9tloWtAWvYVw3AX0Q2n55lT5QaHAHdXQcu46xGSoExgQNSITsjSThzP
	c9ethbdjtayI5LckTTkCRnWaFtZxO3Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmFbQ-0007S6-1t; Fri, 19 Jun 2020 11:54:36 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmFbC-0007Gm-R2; Fri, 19 Jun 2020 11:54:24 +0000
Received: by mail-pl1-x642.google.com with SMTP id k1so3847323pls.2;
 Fri, 19 Jun 2020 04:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zMo8MqpGrcojR1hu7gkCRGNTOG7j0ijRPmvlVewWUos=;
 b=YI97RlPMLGyRbSuJRbi+umDjfTca99+ghiQrmrlW0mKwUOsobIygCn551WZCkAsalv
 v1lkPth7EzHXSBb0Z2KmTkH91OxB+dGGX4pRSUrTkpBAFLDz66JD4Gt9njc6/1NkRlF9
 ccaX18Qf8k5ARWqVLucrT+8Asd/7gRrtvHCJGsu5Oeo2zF7NDCwHqgwz4iKPf3YOzxQZ
 NmNfEz95J7vlG1sbT+Y4uV7iUm+8KmMbTGSvj7dLJhx2hd3CI5NxGHOEamnTolvY03CC
 l+MXzFpco3S8vYKItM5dj4oH+9Y6La67ry66D/vHwQzUfhQ8bETL7tA4onToHMsH5EWk
 AIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zMo8MqpGrcojR1hu7gkCRGNTOG7j0ijRPmvlVewWUos=;
 b=D0u8QFj0ThHkHyN3uuQ4RtnPl/bFBuwOTpZV+maRwUzcS7fBlSIWaguytkTkHgYvxI
 uPqhjtw6rl6q+BPZQD9HfucfUVIg/KVWdyreEG9tBdjSfBD0oDNeAWsBKPnF5TGm5vB5
 I7TzsMNqNxf6HaZG9wLC6MUx3rFOFof6RAWfmYQQdbiviia24E+NxfGFXi+V/DFiauan
 k2Ssqv89JHqo1pnK83QUUGHGuMUFM0lqyqw3RGeGYsw7UKOtBMq+Y0wxBB+jM2pn9ecb
 sao7EAcC09WqdqeMxnjVBmdCqn5gczG9igUSKun8L9SqEHFQq2S+LTuxM+sKauZIusjw
 yjRQ==
X-Gm-Message-State: AOAM530ZKRk70gh9WOLs1sFzOkzvQCuvaikzqp5r4QCIcIxlgUBDIHtC
 wdvRMTZoDo0fyEmLFhRHUUo=
X-Google-Smtp-Source: ABdhPJxVCcy/FmlsDxTpc0oGXo8VISLG/G70q11V1vZLt9e6ze3um1Q+NKeMPmkO2NaRFcgW2erl4Q==
X-Received: by 2002:a17:90a:b903:: with SMTP id p3mr3348490pjr.4.1592567661891; 
 Fri, 19 Jun 2020 04:54:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46c:79b7:a5d3:5b37:1d99:175a])
 by smtp.gmail.com with ESMTPSA id n64sm5026712pga.38.2020.06.19.04.54.15
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 19 Jun 2020 04:54:20 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org, jic23@kernel.org, jacek.anaszewski@gmail.com,
 pavel@ucw.cz, matthias.bgg@gmail.com
Subject: [PATCH v2 0/4] dt-bindings: mfd: Add bindings for the Mediatek MT6360
Date: Fri, 19 Jun 2020 19:53:47 +0800
Message-Id: <1592567631-20363-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200619_045422_892487_EDD22B7B 
X-CRM114-Status: UNSURE (   8.46  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, lars@metafoo.de, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, dmurphy@ti.com,
 pmeerw@pmeerw.net, knaack.h@gmx.de, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This patch series add mt6360 sub-device adc/regulator and
fix mfd architecture and add dt-binding document

changelogs between v1 & v2
- adjust binding document schema include mfd/adc/regulator
- adc: use IIO_CHAN_INFO_PROCESSED only
- adc: use devm_iio_triggered_buffer_setup
- adc: use use s64 to record timestamp
- regulator: merge regmap to mfd driver for r/w with crc

Gene Chen (4)
  dt-bindings: mfd: Add bindings for the Mediatek MT6360
  mfd: mt6360: implement i2c R/W with CRC
  iio: adc: mt6360: Add ADC driver for MT6360
  regulator: mt6360: Add support for MT6360 regulator

 Documentation/devicetree/bindings/mfd/mt6360.txt |  122 +++++
 drivers/iio/adc/Kconfig                          |   11 
 drivers/iio/adc/Makefile                         |    1 
 drivers/iio/adc/mt6360-adc.c                     |  388 ++++++++++++++++
 drivers/mfd/Kconfig                              |    1 
 drivers/mfd/mt6360-core.c                        |  541 +++++++++++++++--------
 drivers/regulator/Kconfig                        |    9 
 drivers/regulator/Makefile                       |    1 
 drivers/regulator/mt6360-regulator.c             |  485 ++++++++++++++++++++
 include/dt-bindings/mfd/mt6360.h                 |   15 
 include/linux/mfd/mt6360.h                       |  240 ----------
 11 files changed, 1389 insertions(+), 425 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/mt6360.txt
 create mode 100644 include/dt-bindings/mfd/mt6360.h
 delete mode 100644 include/linux/mfd/mt6360.h
 create mode 100644 drivers/iio/adc/mt6360-adc.c
 create mode 100644 drivers/regulator/mt6360-regulator.c

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
