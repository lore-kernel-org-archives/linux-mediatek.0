Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0865AC43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 17:36:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8964A208E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 17:36:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bo/DTb81";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtY7n44Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8964A208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QEds5ULBT54qgcX+iGYkkf6+TiX/US1exJsQ9Fr/KEY=; b=bo/DTb81cvTqoa9p26mWCmu4Jm
	iJUCBWzlcvhMuMrHlMj+Nb66oMsEzuE2blDNcd8WOt+CZyA5o0dAqQfo0e0BlTN5Lq+KbE76Md2FW
	2SJM2oKXR2biDSYQ/XV2Zeke/DAQ5UAdke0ev8XoclCKLl0jic3CxWGzlzCir52dSdQGL7yuQul25
	KWrdDqCF8q0gBPnPSfL2w5Fer4B0sEUESMqNNkRpmEn1CjxcdDZt9WNn0maQxVOhMl1kZGqWrTwlM
	IHwFhpDGgyiNV5BGya0MMpmPo6JeXrEaiWQiQcG307KgP4hMUcorzfz/ttg+YJUr//lcLWCo7JRVX
	Ef+zT96A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIEsX-0003i9-2v; Tue, 15 Sep 2020 17:36:29 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIEsN-0003fN-Vo; Tue, 15 Sep 2020 17:36:20 +0000
Received: by mail-pl1-x642.google.com with SMTP id x18so1715512pll.6;
 Tue, 15 Sep 2020 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=VDlB/vF3yD1AI0j4KncO/S1Qql2ZvV+dkP24BievIWM=;
 b=ZtY7n44QRcDMYA5b75t7nFBpPYDlz3xxgeZDAPc/e1/fbeQtk4DWVTdQM5JWSg/lOg
 AydIOgF5q43uhDoqqrxBBuVB5Bdry9p9lzc9d5L+mKOsIj9RusKPdoOMO+5EbNKdXt38
 DaDTg4+2C6vbP+Xm6Wx5nr+hFcrvvX2jkazjSEkrNFrvAPFrLC99thNmCKhNozJI9hV0
 xoujK0B0ms9tVj4WbJNmI/NXVuWNRqauB20fMRcxVNFlPz5SeOcBfLVx+9MD3GAx3KjF
 EHm57JLTMl//yIbsxq5aGbVk4LOZwqZ1j8XTH6nHOuF7sBFObQ4kh95Ss/mGtjw+N96I
 9qag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VDlB/vF3yD1AI0j4KncO/S1Qql2ZvV+dkP24BievIWM=;
 b=dkew+X1D9bmWh/jqW1H6FCVgHj0CaTwJiE10j59w96Tp2nKmEg1cuflkC9JIqgJ/TI
 AXMAWaPUdaATM4QIiWBn67GOKfKWQ7oyNfmY1R5ioujBnt7peJjf09JR6NUv+x4eaNGg
 SxiRLn/1s7fEpoNv4bXclG177J1YEvDfaVvJMapTgz+jZbjKp14mCCFIBkvGMWkxrxFd
 mVDZ+tr2nd4HJCLXEpY3H4GYD7mo8O8BWDvPXPMApEt6kgjnDPDnBHcLUONbtMNjnrQ9
 hhksOCZ3oxuHQmbhG1zmSIc+/Wy5IkMtmXH/b5psRu9deigJMxZ7Ckai0oKOGNq12HZq
 U/5A==
X-Gm-Message-State: AOAM5302n7jwPveDgwtowLk4Y9EepwaPaMOsIyQTCmw4CttJ4/CbZXeQ
 C/V3O9jff7QcZQJV4bh7iYM=
X-Google-Smtp-Source: ABdhPJyhEfvuycm6RqzCR6YKDoBZIiBXYbshieo0bnzp14v86+oY6Tdh6bDVNfQIkJpJLPb0b/+kdw==
X-Received: by 2002:a17:90b:1487:: with SMTP id
 js7mr385729pjb.187.1600191376006; 
 Tue, 15 Sep 2020 10:36:16 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id x3sm14025926pfq.49.2020.09.15.10.36.12
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 15 Sep 2020 10:36:15 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v4 0/3] iio: adc: mt6360: Add ADC driver for MT6360
Date: Wed, 16 Sep 2020 01:36:06 +0800
Message-Id: <1600191369-28040-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_133620_045152_01569678 
X-CRM114-Status: UNSURE (   9.79  )
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
Cc: gene_chen@richtek.com, lars@metafoo.de, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, pmeerw@pmeerw.net, knaack.h@gmx.de,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
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

 Documentation/ABI/testing/sysfs-bus-iio-adc-mt6360             |   83 ++
 Documentation/devicetree/bindings/iio/adc/mediatek,mt6360.yaml |   32 
 drivers/iio/adc/Kconfig                                        |   11 
 drivers/iio/adc/Makefile                                       |    1 
 drivers/iio/adc/mt6360-adc.c                                   |  357 ++++++++++
 5 files changed, 484 insertions(+)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
