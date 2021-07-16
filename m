Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2CBC636CA
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:44:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA204613AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA204613AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rCr+BJP8Lp0p3tDEDKUWifV2reRooN0O6VPxAJbNzbY=; b=qeg2VTcz2CfF+A
	VUPhThk1c+S7VGS/VdPGZ9VOO5jbStfG6vrHhAcT9eIC/BXNXMWu7/9OKxGAf5a+X0wWtN7NfEXHn
	y9x/uV5QCvCrYPQMieSoCn7WXbY6JyMbSRMtanlDlIR9Ypr2YtU2z4Y/kzs2Pvvtyv20o7ethKdP4
	RoxxB4ml++L7pQSW39paaj69z8awMYDuj0G7gAqXnBWkDD+x/vFysmWZdTmgkJbY5uX0FftGQu0Pw
	usVwmwARhC5u/QpKSFIaX9l/OhdNrrmXF95c8HC5q5MzgGvhtrmEL+E/TIAKDQpNFbh2DnJl+Wz0K
	2Gx3rq34/VNbD/UmSBYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4KOG-003xxt-IS; Fri, 16 Jul 2021 09:44:16 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4KO2-003xuD-T6; Fri, 16 Jul 2021 09:44:04 +0000
Received: by mail-pg1-x52d.google.com with SMTP id y4so9391447pgl.10;
 Fri, 16 Jul 2021 02:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JvgfaT/DggPEKMaWgg32QzuL/QbwcRZYhk8sluuZ2mo=;
 b=K3KdbfkpYxIdwB781I44+IUmmsqNcV3fU1s2rJ160S1NYok7k72cpseSBEEKx5Yqol
 eu9nHe6DVIl++2Xqersz4Ie1kfP4ZTQI08EDg/ewvtq6RqoNefcyvx4oz1sZLby5XyUy
 qGzqW/D4oznrwsszjX5fgmRC6QJ9YGC2rX52PxVPFDRxldHjngf2p+/v1aiyBIOb5uOv
 G0EGgK0fsa3EQSFl4mOjkm9Jd6WUdk8AbYB5W8cACdMQbmjw3F57xzqxZgrdLRwAF2Yt
 MywTkdpDk8F2ULAS3ZrnCzBQlmnSB53fAml03+Z/e7ExItva3SLrf9pCtPm5lpWVzXQr
 KdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JvgfaT/DggPEKMaWgg32QzuL/QbwcRZYhk8sluuZ2mo=;
 b=KF1Sb9lgeapiq6DLugBEpDn6PRXrcszWmGp+qtYz6Qcv5/xgZkAp4+rXiAAt6QiYfw
 3q60LDZmtGJnsrf28ZOriMIHU/h17mVCLHbltejs14585zDonFx5tHD91f57eZ0Y9PUT
 YzwNZ78+Mjbplp5reYF+tuw24ayc9RAMx+2pk+AMbnucoVfUTYmI2Typw0rHXpOnYxcr
 9kjycpTHAv8lubNuoikF62jmT6uutw65zi71hc+KKIwXbohPIybL1XqI2M/hD2+Qx8sn
 TjfsQcy+Q8MCp4CylQ9m6QfhH1y2NlJzWdxtUGOo1sfb/FVgHNe8rS9UDpzPb03GYGaZ
 yWIw==
X-Gm-Message-State: AOAM533FcgCxzE605GFPAaoYyDv2GzAo3bxEYNFgdhy4ykO0NUuq1A9w
 6S9bkIiJgL+5544jsbs10Bw=
X-Google-Smtp-Source: ABdhPJyaJKdQkdnNlsimJBb3PMzrB99ouiFnKdeevfDuWUIiqsAoCO5jlU+w/O/KDgbYuxL2DZmflg==
X-Received: by 2002:a63:1252:: with SMTP id 18mr9310623pgs.126.1626428642116; 
 Fri, 16 Jul 2021 02:44:02 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id m21sm9508800pfo.159.2021.07.16.02.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 02:44:01 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: [PATCH v6 0/3] power: supply: mt6360_charger: add MT6360 charger
 support
Date: Fri, 16 Jul 2021 17:43:50 +0800
Message-Id: <20210716094353.140536-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_024402_966607_2F2A88C4 
X-CRM114-Status: UNSURE (   7.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This patch series add MT6360 Charger support contains driver and binding
document

Gene Chen (3)
 lib: add linear range get selector within
 dt-bindings: power: Add bindings document for Charger support on MT6360 PMIC
 power: supply: mt6360_charger: add MT6360 charger support

 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml |   48 
 drivers/power/supply/Kconfig                                       |   11 
 drivers/power/supply/Makefile                                      |    1 
 drivers/power/supply/mt6360_charger.c                              |  867 ++++++++++
 include/linux/linear_range.h                                       |    2 
 lib/linear_ranges.c                                                |   31 
 6 files changed, 960 insertions(+)

changelogs between v1 & v2
 - Add binding property with unit and custom name prefix
 - Remove extcon device, redundant brackets and interrupts
 - Fix power supply prop "charger type"

changelogs between v2 & v3
 - Add register selector to value mapping

changelogs between v3 & v4
 - move pdata vinovp to mt6360_chg_info
 - remove unuse sysfs attribute
 - refactor debug log and warning
 - add power supply prop input voltage limit

changelogs between v4 & v5
 - add linear range selector mapping
 - use linear range to map charger setting

changelogs between v5 & v6
 - use REGULATOR_LINEAR_RANGE
 - use devm_work_autocancel



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
