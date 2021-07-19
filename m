Return-Path: <SRS0=Po0r=ML=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B214C12002
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:43:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45042610A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jul 2021 03:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45042610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bu966/EyjjpDsOFdLti8MJCDp9Q1mDW2IthTfb6+8Ic=; b=ufYi0yk20tLdGZ
	QdH0/6ODlf6ivJjibq//AmobNgI+GLDx9MuQxlUkRQjPOlTV3HWLAhu5QR3mReHnA0L1uSBmacFRx
	u137L2vbsB0P4zoeNdKAu7inAxYj6QyL7bdE4UzEbQJ1q6tr77TgASqewPgoUEUR23wJQlqlWx9DI
	BBk0rSD1Vq1D1m3yZ2cYmVC5o8io/6zJzqW0i3nBYarfGJJ04oYQOiYxmHzICS/joHBbFYqMR5u6y
	emRFuxNIx3II9djGykyUNqeChKHEqBOtGgQN0twLvnn60u1TUpfA8wv4T0d0Pp0/O1AvAIsaea33J
	S5vGlMp9ZbwzcvCFNCwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5KBJ-008MBF-Pn; Mon, 19 Jul 2021 03:43:01 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5KB4-008M6T-UK; Mon, 19 Jul 2021 03:42:48 +0000
Received: by mail-pj1-x1035.google.com with SMTP id l11so10609776pji.5;
 Sun, 18 Jul 2021 20:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQVU1jW7tgwMUWUTvKR/4fnb70smUlYCRCV/O5UNBA4=;
 b=bypd+XTola0WoE+ijdpSmaLCA39u/8xbQz26TW0ZCatgyEPUTam2akTxt3aJqccl9T
 c6LWkWeA86oB5Tf9cwDe1s4HCEjvnNptrWPdfbTD8DxoeMtaIslzZNZs595QMHxR58IF
 +BtnZ1HZ5cvgfJGodihPWcr3uAdcBJqUkRqci/3XIjFwWGYlxDaFxDNZZ9Hversr8SlR
 cKgipU29jfSteHjWp9wXbnbaqUr668P72pIRlpNBTKp0r3LUTXSqx6U8dgp/ZQ5VSjnV
 eJUAq54CB3cmW13+dzFfz6pypl/RA6TWz2y+QpmnD4L05SHjKW7r91A+3nPMq3JhShMf
 J/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQVU1jW7tgwMUWUTvKR/4fnb70smUlYCRCV/O5UNBA4=;
 b=AU6XXEzz59+pf+h/kQEZQ5Xrdst61W5mUkIFYxkjb29tVmcBHybpquenGf3G10jkN6
 KdJbk83hyj6UbzicKU8jaI2YpyW9/NxL34BMVNGI00haayFcdKPhuw8Ggls6gein7G+S
 d1mgADLyxnR2dE+Rj18pkz3xgbpQDd2QyoEZ6tTISA5mRHd8xw0xfpJXcEm1xi3A5eHw
 zr/NiUi0RiRxDsQU5bjj7Iib0lR9mRgMQWm6Wl0hGsHDyaWG9dB8JvbL3G2gHsNg/IKT
 ybugbPQD96gL4hTYUbcy7FWYD+Rr6KEgwpre7ef/Mtu3rPj39kXKPdrK4Iviwzeu5xJS
 HKWQ==
X-Gm-Message-State: AOAM5339vRkyPbBBcHP1tao/PsBZCZUZYVa6yBH/qV1k2byHF4iEhf9C
 lRHJB/ZPJIxWOwuXQdNdDA4=
X-Google-Smtp-Source: ABdhPJwzpWGYTvuIEfVwqx+DEO9vz+n2VwvSdbzUV8Zlzg5jnQSyrViByrmFrkn0tB8UODko183a2w==
X-Received: by 2002:a17:90a:bd06:: with SMTP id
 y6mr22805443pjr.6.1626666165225; 
 Sun, 18 Jul 2021 20:42:45 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:58d:ffe9:427:42b0:88c7:1ff9])
 by smtp.gmail.com with ESMTPSA id
 c12sm17949448pfl.27.2021.07.18.20.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Jul 2021 20:42:44 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org, matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com,
 sebastian.reichel@collabora.com
Subject: [PATCH resend v6 0/3] power: supply: mt6360_charger: add MT6360
 charger support
Date: Mon, 19 Jul 2021 11:39:11 +0800
Message-Id: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210718_204247_031049_66F87EE4 
X-CRM114-Status: UNSURE (   8.26  )
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
 - fix Kconfig description



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
