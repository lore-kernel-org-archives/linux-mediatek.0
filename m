Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F715C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 08:08:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8AF822247
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 08:08:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IPa9FsoG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j/qOX1CR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8AF822247
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ULBMmQ2rMUTDiNwggYpuEhAsHue6RKGdTVPNa1jnkSs=; b=IPa9FsoGTxHJbuISjIqfwJ1pod
	tIPmKpLebU/M1nn416I6Yxr9R7WME7PKu/IzBzMk9Iuz+efio/Z5Ke8t0xhHi0gVeins0ZRj+wxsL
	fnIR+9F/51xfbDieetYeOUNLENHMDPqHHEtREuQGs+PY8p4sIC7bAaxKHYeEg/L5Sn36mS4Tke2vP
	Ml4vkxwIYr2qUjy/op00XF6/3dsPdWaSXQtJoKdAGzWJ7PKR/xaoCclGAsYOM9al6VpLbOH4To9XF
	Mofiblb0mLTiWB7SWB3XEP336vjdKHxoGLxekGA3UO0l+5aaliHzg98eujNUixGhEjdRYpzQ1gbpX
	sU4gfSkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUmhE-0005EJ-EV; Tue, 20 Oct 2020 08:08:40 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUmh9-0005D6-Hp; Tue, 20 Oct 2020 08:08:37 +0000
Received: by mail-pj1-x1044.google.com with SMTP id p21so523363pju.0;
 Tue, 20 Oct 2020 01:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rzBULe/uYcMd2biNuOUoirZAkyxIgwm/ep0g4irabeM=;
 b=j/qOX1CRjCJljSPZcb4bbGCVW1mLmUhTrHVtbJJD/ootbD5oyfz7Fz7cYl+sKaEV/J
 zwn5rw4FwvyqtCGrgfHPwUlBHVCPFzmYriPiwLP0alcRJr225m7heK1Q7oDdkb6mEFZD
 P8nSv2V9SBMxwbJZhYT+7//xInnXXSyxnQLfkGaYxSluWV/DVxxZkt+YL/iI3d1NWdvD
 //IZ++RIcxlotD776gTmQHqiwv7/2lObpeTlwOAUtRPgUUAAfmq+KZzQslEIGojJ8MDZ
 A/LtdXToA44/J6eNbLs7PDuWWs8RUbrcz/zhT2Ko/e7v5pjn+HTyFOPjvTNB1Kc7QYM+
 V0Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rzBULe/uYcMd2biNuOUoirZAkyxIgwm/ep0g4irabeM=;
 b=KhhxYmNFFjXi08DLFGcDZL2uNH8xSr9oZSflMO0lLxfyQYt+XTFp6+DZIVrrtt1cth
 jcRtuWC4QLRaLNV9PBvJh3uOMCRXZFBYdq+t5r+xngKSsPEJNAMsgll5FZzxLrBMeNVZ
 LyJqB9xRk1hj/rFQCeAQVj6ySr61Ob1r8dMKF/tMukIC/w7aBIiBYPwnJ44muck7lQQE
 iNnNJoA+Y/FBt3st1+bApCtH2tqg+Sx0TJkSbOXD8JpEfFN2Vn6Tx15r7pvGqva5pTrg
 sYTMWjI6IjicKMH+EOdC2DuRlAMqmezDo7+3yUVXTlJMfDzMezYJnbuHJSGkLscwNZ87
 PuxA==
X-Gm-Message-State: AOAM533y0uWG/IpdZfIbgEhgivZUpTtF0QdikdBVRc5ZV9F0dwTH9GqS
 Thl7zJ89YxbrHQWg7DgjEg4=
X-Google-Smtp-Source: ABdhPJxp3MGSbm/SruzI53jPOkaZngQ8AJL0GjxKIqfl83yNMouMYtjKJnWWKQDl5lHM1Ow2n1VjfQ==
X-Received: by 2002:a17:90a:2c0c:: with SMTP id
 m12mr995977pjd.44.1603181313257; 
 Tue, 20 Oct 2020 01:08:33 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:477:195c:4b74:c749:e0fe:9e69])
 by smtp.gmail.com with ESMTPSA id 17sm1347270pfi.55.2020.10.20.01.08.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 20 Oct 2020 01:08:32 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v7 0/3] iio: adc: mt6360: Add ADC driver for MT6360
Date: Tue, 20 Oct 2020 16:07:44 +0800
Message-Id: <1603181267-15610-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_040836_013397_6865CBDA 
X-CRM114-Status: GOOD (  10.15  )
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

In-Reply-To: 

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
 drivers/iio/adc/mt6360-adc.c                                       |  372 ++++++++++
 5 files changed, 496 insertions(+)

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

changelogs between v5 & v6
 - Memset aligned adc data
 - Remove strong casting void pointer

changelogs between v6 & v7
 - Avoid adc polling infinite loop


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
