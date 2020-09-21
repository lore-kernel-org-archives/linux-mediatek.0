Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADD6C43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:24:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CF120EDD
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:24:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qtgObYM5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j26O2IIK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CF120EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hEBMMKSgkc6r28bVsXVN4o8NeP1/VQDXmLLcSaupRd4=; b=qtgObYM5DEpwj7rEagGnR7/JyF
	uDpToWKHS3U768M2kYO4jlAeC+eah+ASDrw992LQGks6zHuWJAIIbBoOe8sKNFDqwTEZFAaGc/2wM
	IiA3dU8lbxSB94Df+clNNdL/n6NLaiaPw62aTrv7VSUiu0qTg2rXdmvMH/uHvinb4ee3AqFOFi9zb
	ho1/sMlfnoWOzzglXelPyoZdVjQ+CkX2OI13KdSC/dca4exjQLSOlD6VSeyry+dQRQA4ZgZrtIJjJ
	5osXDWrN43PHf38rIqjQ635+1RsZBiFoOeBmUZs+mbBAiT70/n8CXAiYsL7RrKW6Pz+cvKC89XsR9
	cakngejQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKJvd-00034J-OX; Mon, 21 Sep 2020 11:24:17 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJva-00032m-Fz; Mon, 21 Sep 2020 11:24:15 +0000
Received: by mail-pj1-x1043.google.com with SMTP id q4so7295356pjh.5;
 Mon, 21 Sep 2020 04:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ZVBGHtDSzOLc1GxJvapSkIMrWP9AXcJF0oZj5LUMkTw=;
 b=j26O2IIKh2BQvZrr7JeDqqW8xJNZZP64H++7Q+AU/9sKx1ipzRSJbPy8Mj/U+t/VQk
 OhPNVI1BdcFyi99BiKQlh6+nbM0PycvmsE33PCcQFGlsW1EGMJGx0MJs5uD0gfccDrpb
 LKHa4GUGNX4brKuRbaTd63LYeIpAcARZzOV4jGN7aLWPE6YnXoGgFeDfnzU8/++rxtHB
 rr8Hj4rTRmtk2TzdPTKsnMoJTC6xQs0b7vrIozNAQ72DHRqDiqWADADCBXiPUfFZxNR8
 z7pMtRqhGtr7iLXCFmmEIp6o+egxxYqBd+wjmjCDP9SnvqSNQMixJdybQEl7uD+nhePn
 jiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ZVBGHtDSzOLc1GxJvapSkIMrWP9AXcJF0oZj5LUMkTw=;
 b=Hmnnq76dldW5CsAoz5n6OFgI2cZf/K8rMqpJZ2Gv4MJrqT8aKzkgZ5Xso8cBvoIis1
 Vk7HhthS8NTUY6cvXLaSTFmLT9zXkz8sjeX1mOx0eB9PztKZdTt+NUknVJVubGXHV97G
 9C451vcvI7el6b7fkGks0jjuK81gBKCzdJldbSpIlmHe+8MJF1A/F0x77FIhNus/mPWy
 ldsINmyaEwGf0333Yrjyc9HYXshsNi+GLY+OdOV9aI1U3kLnqThEYBogWLYWxcGYUvlR
 Iu8/+cZfAjQGOe1n5JEttVLjvYa/dOU/5zsl1HeJM/zT5v8H3J5kBHgrPda6ogZuqldu
 nCoQ==
X-Gm-Message-State: AOAM5329GuRkuL/GiImSLNfyTFDsDKgYlquBr0rzqj3YBUjxyBXBzXjZ
 7E5Yypo2bF70CJucNbczvvk=
X-Google-Smtp-Source: ABdhPJyprBCyokbpB5WY+Tc9aH8GsiEmMDXANnpp7QmG52UDs1reFxCPa6DrbcDrUukU3Y9ZiAFMTw==
X-Received: by 2002:a17:90a:eb06:: with SMTP id
 j6mr24377399pjz.46.1600687451102; 
 Mon, 21 Sep 2020 04:24:11 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:8024:8a0d:5d5f:6f8a:a2bd])
 by smtp.gmail.com with ESMTPSA id x7sm9978663pjv.16.2020.09.21.04.24.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 21 Sep 2020 04:24:10 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v5 0/3] iio: adc: mt6360: Add ADC driver for MT6360
Date: Mon, 21 Sep 2020 19:23:59 +0800
Message-Id: <1600687442-23658-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_072414_538608_9660BEF8 
X-CRM114-Status: UNSURE (   9.71  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, lars@metafoo.de,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 benjamin.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 pmeerw@pmeerw.net, knaack.h@gmx.de, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 ADC support contains driver, testing document
and binding document

Gene Chen (2)
  dt-bindings: iio: adc: add bindings doc for MT6360 ADC
  Documentation: ABI: testing: mt6360: Add ADC sysfs guideline
  iio: adc: mt6360: Add ADC driver for MT6360

 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360                 |   78 ++
 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360-adc.yaml |   34 
 drivers/iio/adc/Kconfig                                            |   11 
 drivers/iio/adc/Makefile                                           |    1 
 drivers/iio/adc/mt6360-adc.c                                       |  363 ++++++++++
 5 files changed, 487 insertions(+)

changelogs between v1 & v2
 - adc: use IIO_CHAN_INFO_PROCESSED only
 - adc: use devm_iio_triggered_buffer_setup
 - adc: use use s64 to record timestamp

changelogs between v2 & v3
 - Rearrange include file order by alphabet
 - Set line length constraint below 100
 - Add Document for testing adc sysfs node guideline
 - Set compiler 64 bit aligned when handle iio timestamp

changelogs between v3 & v4
 - Fix sysfs guideline description
 - Replace iio channel processed by raw/scale/offset
 - Add comment of read adc flow for special HW design

changelogs between v4 & v5
 - Rename dt-bindings aligned to file name
 - Aligned sysfs node name with driver and add VBUSDIVX description
 - Add ADC channel sysfs node "*_labels"


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
