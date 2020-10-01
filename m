Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A66BC4727F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:54:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4466520738
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 08:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pB/rWAa/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjOi/8Jx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4466520738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4DuYdfNRhxo8tBX3VU+qju+DXRsMdcd9Y0WtyrYBKGs=; b=pB/rWAa/l9GLBxjZrlKKfOgLCK
	H2y9cZV+jqamNxkPgaUWB6US644Pi5hQbN//f8k3Led1c2nkienBrwKt+NQeKa5Mz3f8r067gWJzq
	ywmL92CiJHnwjoasuIZhNBxQyAL5m/rwZC8K9yMVi7HsvHZoJApHj97X3ddCrEWV8M4fN1elE3TsA
	flokVePQmQT/L3Ge2rhUUgP+JxQ5VCkZsx+rCvEzfnp6WyucoUe8/1hN/xtCogx1KWF0M0RmND3dF
	7OgeNHX792ZcongzKSJDjWt+uSyh1Oi1q7y6xd8K+iP/oV9sKFpW0fv7+8t/ICnefUrvg5tnwR5Hz
	wfsQ1XWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNXsf-00021Q-Uo; Wed, 30 Sep 2020 08:54:33 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNXsa-0001xm-Gq; Wed, 30 Sep 2020 08:54:29 +0000
Received: by mail-pf1-x441.google.com with SMTP id d6so704657pfn.9;
 Wed, 30 Sep 2020 01:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=J6RVC1dwGGEOXZfj110V4hRsQlR6vCt8ihvodpQ2OqQ=;
 b=LjOi/8Jxe2hrdsoqFaxgmps0JYdDEHl11LyUCXUhFoy1FJqMhayq4ijKiJdm7O8/fL
 XbtvTRNfD4qI/yhcTSNk1eCgTGzXJ8lpUmskcilKcs7PhmeX9fMX5neAkvRR1inTbYiw
 JRcMlF9ehNqCOV+pNbQ7YWpR/XRajE1By7hbSjgGiC1XSWmpLc1A1txoTBwCbMRqQlaQ
 QZLjySTY2fATayWwDlsZAU8Z2JxrtjWt1OHr+eSWw3GUPvIRf7DSoUFasc1oyWhbESN3
 dEzwjTlVU5zA+mV53Y5uXCMuLlJGKELd0ACuVcBlkwVTikm1F2w4RHKJlBsibEvfBTdB
 FmDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=J6RVC1dwGGEOXZfj110V4hRsQlR6vCt8ihvodpQ2OqQ=;
 b=qLKJruU6RSq7BlR4DrLteaCmO2NDccBWPTYeu7X2bZxB9lJjCk6RCzODutLLDyoqOO
 zwwQ5O7LuwYXVQJ6OGUKJdGWdOzhj6sXikbr3dU4XI0AsquZ9+/AP9Bw9Q+cLXkZv/ml
 iAL9StE7yVVPwzVqqjapgOgqjkzIUJicMmvhMKJKhnReyAgf0q5+5IxfYtVlTJrzIXQh
 7y6Xi2hS/abrPs97BNH2hQnB7TjxSIuCkgObPZB5By9dxPcPo5n6pD+hERjqwjKwWbjn
 uYqyJgvZncLbAlDxaLeiObKmYt+WckFR8hrgVtosvF6GRqgEgtjpFVVKIkfHks+J7UdL
 As+Q==
X-Gm-Message-State: AOAM530EtcGR/4D+6HWlAgDZtb8vO7T8aFAWpDldsGY7WwiUu4LXXxNj
 A+88NbICwJ5rUhZsL3EUYLU=
X-Google-Smtp-Source: ABdhPJywPJ0fxYhSKELQfCfkMoplqEFJGypucBaCyF3NpkcrinmY//1AX3kzKe5EOsggfSNURmbGtA==
X-Received: by 2002:a62:52d3:0:b029:142:2501:35ee with SMTP id
 g202-20020a6252d30000b0290142250135eemr1698574pfb.78.1601456062506; 
 Wed, 30 Sep 2020 01:54:22 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56b:d17:8c76:3dc4:5429:d7e4])
 by smtp.gmail.com with ESMTPSA id
 x13sm1513938pff.152.2020.09.30.01.54.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Sep 2020 01:54:22 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jic23@kernel.org,
	robh+dt@kernel.org,
	matthias.bgg@gmail.com
Subject: [PATCH v6 0/3] iio: adc: mt6360: Add ADC driver for MT6360
Date: Thu,  1 Oct 2020 16:54:05 +0800
Message-Id: <1601542448-7433-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_045428_568501_BA4A9A4B 
X-CRM114-Status: GOOD (  10.14  )
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
 drivers/iio/adc/mt6360-adc.c                                       |  362 ++++++++++
 5 files changed, 486 insertions(+)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
