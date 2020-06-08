Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80D1CC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 09:39:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51B07206D5
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 09:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uMUV7lze";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UXKeks0p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51B07206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=C5NmqINEiKMznFVacfDypfnWoBL9xqtmMpeBbfXA0Vs=; b=uMU
	V7lze70aiT4mWa8+wAtPz93omv1DqHY5duxFpwM8uuU0lCPAp9VBV8P9JPg2/aBN4WdMj2azJ+ZS4
	anomFnjHW/Sf7L/EW2tHNJb/xcTIde3OkQ/iPbF1EcH8dRVkRvvNhEJcfwpC+/6vAEVpXMy5I/bNj
	l82aOkRcNz0fcjzUQNcJUYb1NwXlm5cNdfrBTv9xEX8UzJDSjsrAwwoo2M0rAm/34g4uTApnAlMS6
	nQGMWSxv1CQwEdSTC5eV4ftgzD8Ati3wGETAueusWrV8polKOkBlkRePZWV0rLRr+0Ck87Rf0iP+f
	mI36GXUVR/r+jHFKi7aGZd61iJmN8Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiEFF-0008PJ-9X; Mon, 08 Jun 2020 09:39:05 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiEF4-0008EO-JW; Mon, 08 Jun 2020 09:38:55 +0000
Received: by mail-pf1-x441.google.com with SMTP id h185so8306636pfg.2;
 Mon, 08 Jun 2020 02:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8nFZFr9b1fII+6D0rKTzWsSJAU76ASsrlWrZljZL5Jk=;
 b=UXKeks0pXHxRBTysC/Dt0BNmLfmM0klkVdz12QpU0BFeAKumvbD71rgnaTd4tuoz7l
 Mrwz9oSPeQvdDqY2l2O4dnubnH/EJpYUaE9ZXglhOwOzcOIL+/gQvq2ZzjKntDGy8TLp
 Zir9ueSk4XHrtIHm5ALzLQJMYVuMRg4Ofo2tSo1NGrOVMugSB+1PdI+zZ5wvbCj0KrYT
 WS2KTs+JOusH1Q9nHP2Tpf/mjJ6Tn0pykUpuiqcQeosoK9HKVFvk/7XvMlKcm5ODPujo
 6e+KbK+RGT6gfHgYvtA2aHtMBpt239ZmMQvp1ue7ugYh0sRyyJ4dzc4sNxKaLivakaFu
 Bn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8nFZFr9b1fII+6D0rKTzWsSJAU76ASsrlWrZljZL5Jk=;
 b=IMt+hutbjta361AzUF0i8MOqQHDYhtm4gRrQO93uuF+J+gPVsbldhRPFqb+NzaXdpW
 Ne7UfJA7pu5D+Ivwe5OeS3aygzsqOpMd3nmSRWWo6IaSwNQzJk2LG1rbS73flYJ07QHH
 6a/SeSMazEz+K6KTsWhr/6uWqA15aDlc3/9dsO1bC9jjxOqTdKJW23M8eylREYRYAarz
 1q9w5MnC2zj5bFrSAdpTuEA11rfpVpWKil//Gefnb+5JJUlw9R0+HOOBPL1HCZ9ZV0j9
 DGcJKSSAnNH38LjymMViYzTOFJiuZIIHNVZmvo3DmXfHq+Mm2L4cRmpn/UMUH5jVqFg5
 na7A==
X-Gm-Message-State: AOAM532j89SIMJ5xe+5kwl7aAySok+1dSFWY1OpVevcl1B8EuYnX8fRr
 7QXggvGDY5QlZReguOIvCD0=
X-Google-Smtp-Source: ABdhPJwbUtaqyDj7BTPatpRYTufbUH1GbiGng6XdEOmxI8JEukNzBV+RjIAaS5544ZUrmOPqjBijzQ==
X-Received: by 2002:a63:b904:: with SMTP id z4mr20109401pge.25.1591609133685; 
 Mon, 08 Jun 2020 02:38:53 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:4dc:9812:acc3:6aae:21fa:62f8])
 by smtp.gmail.com with ESMTPSA id 3sm6608971pfe.85.2020.06.08.02.38.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Jun 2020 02:38:53 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH] mfd: mt6360: Fix register driver NULL pointer by add driver
 name
Date: Mon,  8 Jun 2020 17:38:45 +0800
Message-Id: <1591609125-3761-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_023854_640967_E3353CB1 
X-CRM114-Status: GOOD (  10.34  )
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
Cc: gene_chen@richtek.com, linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

accidentally remove driver name when
replace probe by probe_new in add mt6360 mfd driver patch v4

[  121.243012] EAX: c2a8bc64 EBX: 00000000 ECX: 00000000 EDX: 00000000
[  121.243012] ESI: c2a8bc79 EDI: 00000000 EBP: e54bdea8 ESP: e54bdea0
[  121.243012] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00010286
[  121.243012] CR0: 80050033 CR2: 00000000 CR3: 02ec3000 CR4: 000006b0
[  121.243012] Call Trace:
[  121.243012]  kset_find_obj+0x3d/0xc0
[  121.243012]  driver_find+0x16/0x40
[  121.243012]  driver_register+0x49/0x100
[  121.243012]  ? i2c_for_each_dev+0x39/0x50
[  121.243012]  ? __process_new_adapter+0x20/0x20
[  121.243012]  ? cht_wc_driver_init+0x11/0x11
[  121.243012]  i2c_register_driver+0x30/0x80
[  121.243012]  ? intel_lpss_pci_driver_init+0x16/0x16
[  121.243012]  mt6360_pmu_driver_init+0xf/0x11
[  121.243012]  do_one_initcall+0x33/0x1a0
[  121.243012]  ? parse_args+0x1eb/0x3d0
[  121.243012]  ? __might_sleep+0x31/0x90
[  121.243012]  ? kernel_init_freeable+0x10a/0x17f
[  121.243012]  kernel_init_freeable+0x12c/0x17f
[  121.243012]  ? rest_init+0x110/0x110
[  121.243012]  kernel_init+0xb/0x100
[  121.243012]  ? schedule_tail_wrapper+0x9/0xc
[  121.243012]  ret_from_fork+0x19/0x24
[  121.243012] Modules linked in:
[  121.243012] CR2: 0000000000000000
[  121.243012] random: get_random_bytes called from init_oops_id+0x3a/0x40 with crng_init=0
[  121.243012] ---[ end trace 38a803400f1a2bee ]---
[  121.243012] EIP: strcmp+0x11/0x30

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index db8cdf5..e9cacc2 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -412,6 +412,7 @@ MODULE_DEVICE_TABLE(of, mt6360_pmu_of_id);
 
 static struct i2c_driver mt6360_pmu_driver = {
 	.driver = {
+		.name = "mt6360_pmu",
 		.pm = &mt6360_pmu_pm_ops,
 		.of_match_table = of_match_ptr(mt6360_pmu_of_id),
 	},
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
