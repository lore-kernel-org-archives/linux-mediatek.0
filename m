Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998F6C55178
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:10:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B87F20735
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 11:10:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IyonHJd4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3iOL2+P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B87F20735
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaJ9uaEQ+tnQQTCYbybptDSU6cVFtkGo/uUdF/Dwsso=; b=IyonHJd4WOD0aqcOhxCu9LhO5O
	1Cc8isjUlE+le8QRS2GWXFNd9BOnSStEj6rn8k22LIJ89+FbZOyTcIU2nXMgQVxj7sCb/6mhhtzlf
	NuNIF+1hIPO2fux5vEhPwSeDQPIp+LcoNlVL2rmmlxYJe6KplQ0oAz4FXU5hHI+npE1CUdCfcfVTX
	kK87KXBYV5d6AZieUV5vwaHQjxo5F5vT6hrhsV6Bu4/O2ishw13BthI56AsivbWQOh8l113l5pvhw
	HsQWF5XK6lxTxcND/9skAzRUDkAUTsymdU0PbVURxvDZCIMOfl2/CV1XZrVilpJ5zrF5LJV/FmBc/
	ir7pFOTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kayyJ-0001eU-4o; Fri, 06 Nov 2020 10:27:55 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kayws-0000bm-ET; Fri, 06 Nov 2020 10:26:27 +0000
Received: by mail-pf1-x444.google.com with SMTP id z3so895806pfb.10;
 Fri, 06 Nov 2020 02:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5gqHPPPCIFok2RSu8jyV1TQKDB5fyzeiP+3iOcRs34A=;
 b=b3iOL2+P+eQTriuEfBioqvDrsiSo9BhwDRznYWp31cFV8f9tiWfAvonLgGSRHrunIY
 cp3Y99y39i/tBfY6nOYhJfhULqaL3cs8rEnaIB9VMWQG0+pfUnWA49j4eVgPWHGocURc
 YRudyfBLiYIBJvxJ6PnI862aShv3JSj5jbQxREdS9zMlgTr/y1mRNsDuy2CitXhRdDMX
 iJnRwJpJhbA6drwpKNQA1hIe0yPluAMDhvS/WqCIszYap+ZsXsGx0YYHzMb9ne00xWcs
 IYdbgnxDZKgQW9LCEufpuTgQ/Rs0TqY4JVkkIc3/ts4WwJon9GCXIdzOuReYaNxV59pY
 PrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5gqHPPPCIFok2RSu8jyV1TQKDB5fyzeiP+3iOcRs34A=;
 b=sUGnzaWGXv2OaLn/mz61PNxxEMglYdZfpBTwXvyWHGtsjtbSHd+sjSi94SlX7DQeWz
 Z6D9zhNjjybHBl6iDgi+AFvCOsLgbwrXdbG1pXzMP5KQiHNDc651D9s6zEPBwj86gPFb
 4T4glbNyB1jw32Nrf5IEvW0T3f5r0tM66giIrRWVyB1ex/mi65TlVruLEa2k45ePBhG6
 PNhs8oPYhbhNRi5Sg24N/ujhKxl9h3jb/mCpH+m4MSOPGKzdABfd37+hgQfoVbA+cDER
 D+XIHgwCjst+aT77tuaumfWqL+W6eLvSEmcCCB44LyYCfHdJJ0s7R4dAZsPVPCnCzk3D
 AK0A==
X-Gm-Message-State: AOAM531VFgVzCVd/eu2DfFdVzdJSyxCAXlCKXKHeC5Nd9HKd67H24Tja
 YamHzJscv5ozALpsZei3olgqmARgxZE=
X-Google-Smtp-Source: ABdhPJzgkDd3+la268oMRdW8hfGdLHrD2+RUBL2xH+FGuoyR8aURjd2Fi9K3FJ5ZZ0O+DN9lryYESw==
X-Received: by 2002:a62:17c8:0:b029:18b:5a97:a8d1 with SMTP id
 191-20020a6217c80000b029018b5a97a8d1mr1255723pfx.15.1604658384607; 
 Fri, 06 Nov 2020 02:26:24 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id g3sm1260633pgl.55.2020.11.06.02.26.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 06 Nov 2020 02:26:24 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v6 11/11] mfd: mt6360: Remove MT6360 regulator of_compatible
 attribute
Date: Fri,  6 Nov 2020 17:53:52 +0800
Message-Id: <1604656432-10215-12-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1604656432-10215-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_052626_760273_5528348F 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Gene Chen <gene_chen@richtek.com>

Remove MT6360 regulator of_compatible attribute because
MFD device should just instantiate the platform device.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 4bcfa7f..539ab43 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -340,7 +340,7 @@ static const struct mfd_cell mt6360_devs[] = {
 	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
 		    NULL, 0, 0, "mediatek,mt6360-led"),
 	OF_MFD_CELL("mt6360-regulator", mt6360_regulator_resources,
-		    NULL, 0, 0, "mediatek,mt6360-regulator"),
+		    NULL, 0, 0, NULL),
 	OF_MFD_CELL("mt6360-tcpc", NULL,
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
