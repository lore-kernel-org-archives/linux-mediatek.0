Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2FBCD5BD5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2026 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CggQBmAuhU/vixgo6EEwOoNqb/en0xhwekKbF0wLXKM=; b=1r9y6ABNoIvTiWV1B9S+Qc8db9
	Be6VVqJ+0wdORDjgooQJR0HDzAIeWJ4dvcZBeJkHZqrT6F/0FNG3ReHvV7RsmFtfvbQbfiGdejN4Q
	2Rv+vCr/Ti7DDW4emo2UxqNe1OeUUxfil4/0aIOE6x7cuyuL1H+Q21siTZwEXYqlcP1U5OzEq00jP
	XOJGCYNIsnzbmaBYewD2M52HrM5uhdSiqRZEFxlCC2gqf79Nmjsl+rCn+zyyeFjGn7zgAuhSrx6B3
	sWtaHHxh83NiJGS53jcaTz4mKuVsdVJNZ77471akQ2DR3oewEkipybllC1x8GscYrhcjzXulTuW5I
	Sg5uY7Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShI5-00000006LUL-0e94;
	Thu, 28 May 2026 20:25:17 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wShI2-00000006LTH-1ifd
	for linux-mediatek@lists.infradead.org;
	Thu, 28 May 2026 20:25:15 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3697f25d26eso7111804a91.1
        for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2026 13:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779999913; x=1780604713; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CggQBmAuhU/vixgo6EEwOoNqb/en0xhwekKbF0wLXKM=;
        b=cO4aSrqFoZDdNJ7MwXQ4v7inUDc27AS/ZiMJ+C9VPquibcF3uMwounTG5k9pXCze38
         3I5mTzDsb9Y+FqCVyGgUu/vuX64CKEQIiMCgGc+Dh7VnsAVdbp5aJehbLktfkls4cK8L
         koDt1NgCQbAtt0Hjie/nURIBH6kEgFu9+DthfrifUv6gnDwKjxO18PxBs2Dyoigq/1Pz
         0eTWZcUdB2eu4MrJE6EM922pp6r/lx/ilccceLOVVPqBTew9Spjrq6nJKpSVTNbUqm5a
         MGUbnQiVH9qVPyEkUzU6rVA6pvYEiGq0ERNdS9i+9tGPqN/cdnngectz7oIEXSErd5OQ
         auzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779999913; x=1780604713;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CggQBmAuhU/vixgo6EEwOoNqb/en0xhwekKbF0wLXKM=;
        b=lcvsncUmMHV0PE4tE9OKKOPzaEHs4JPDT3l/Na0UxfY5LR6AoZDZcnVyWChR3V9lZp
         WVE6D92QeCMOSamK41mxHZz8gDIAR/uSXNshMS298qN7KnXIK6jaTTkOBHhh7jNn7UAV
         wsdDmWx9jlqx10s9dyFtCPS4dWOLSrWPuvKdqufb0TRa58mqCWJ0pBIChewOK6RHusfb
         L6+DTplfyOcOOKFSra/HVEfEcjWmNTNcg1xFm3IrbeLtyZJpnmEO1lgA2Im+3CujlGae
         3K4eKBYJSN1bc9EIzORhuJD6qnnmKg1n6dkHc44hSW5BJ26L0PaYwL2BXmri8PTrpqPa
         N4fA==
X-Forwarded-Encrypted: i=1; AFNElJ+AOIxjwD4L7nPUvRTTaF+5qkaREfCPJCY3lHLqe1PtQtiUC5OwXF1x+crBOnn/DwngfVkf2oKd/hVF51yTow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxg8h+Odl/L9kinpbPK6gqcO68/VHhdoWBBJA4aV5tYNpScazq8
	Tnbx9bcbnaXl3p0LCejXMtNEUch7YWAGNp1iNAKBe0nIpepQZPWqPh1Y
X-Gm-Gg: Acq92OGD3dTImRDLHguIJL+x6xTddX49xz07FNzdZk5wFVLB71PVJcEAh22VaYVeywE
	QfiRbGFTlYP9UqfRH6d4SgYBlJrxcAl7zIK+ds+Y4qQtXMnnM2DiXkANs9ohb2ko5m8cmSVwWVG
	Banij+A0S7YTdCVLcU6CoFsRXLUca9PYIJLhy3znBJT2O5OwEsmD/HKlpBlCWhHcBumfQdXOplG
	nXkJ+afgLMa9JTF7wDvCwyQacyZOhqsylPyUVnF+Sw7L1IcFmE+gH0D7mo+XNCCgmtCf88K+MWd
	xSEWGztpw3giN8Fj9V2E7JqxDIjeErWpsoulaGUpvxUNna94D9dqTTHuLaBw8CfibPyWe37MxhV
	I11o1sJ+GDsD1T/LeO8c9HTmh7GJA3poATU0OMRedKPRrBL+amiwi/8X/jnypgRmAmev2xPQtfe
	GenPj13/svzto2JMAkSBtdE+SnyBocLjfzlueE1rrQo+stiM/J19VzJe4MkqSGbDU4CUoZuaNlM
	E2oBn4+CfxvJyexh8W6+zH2o162WPc4YDyl2xay7XLSqp5NgOkr/iyg
X-Received: by 2002:a17:90b:224e:b0:369:7f25:cec0 with SMTP id 98e67ed59e1d1-36bbc6c18c7mr197960a91.0.1779999913014;
        Thu, 28 May 2026 13:25:13 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdcda52dsm4343a91.4.2026.05.28.13.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 13:25:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-pm@vger.kernel.org
Cc: Ulf Hansson <ulfh@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH] pmdomain: mediatek: mfg: move __packed after struct name to fix kernel-doc
Date: Thu, 28 May 2026 13:24:55 -0700
Message-ID: <20260528202455.136618-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_132514_439164_C46CE3E9 
X-CRM114-Status: GOOD (  10.15  )
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

The kernel-doc parser cannot parse 'struct __packed mtk_mfg_opp_entry {'.
Move __packed to the closing brace, which is the more common kernel style.

Assisted-by: Opencode:Big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
index 3ce6fb74dd53..53bdab66cf15 100644
--- a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
+++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
@@ -236,14 +236,14 @@ struct __packed mtk_mfg_ipi_sleep_msg {
  *
  * This struct is part of the ABI with the EB firmware. Do not change it.
  */
-struct __packed mtk_mfg_opp_entry {
+struct mtk_mfg_opp_entry {
 	__le32 freq_khz;
 	__le32 voltage_core;
 	__le32 voltage_sram;
 	__le32 posdiv;
 	__le32 voltage_margin;
 	__le32 power_mw;
-};
+} __packed;

 struct mtk_mfg_mbox {
 	struct mbox_client cl;
--
2.54.0


