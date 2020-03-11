Return-Path: <SRS0=ZThz=44=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832B2C0044D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:19:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6ADBA20578
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2020 19:19:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TjnoZMsE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ra5czn0c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6ADBA20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UYZ9Yc0sMiYOEKKFxMu/bSjQMsven6yJXMfn2/sZNkQ=; b=TjnoZMsESi4mdO
	E9pADL+gihyQx1KAkt3E5NCmNmuM+NmqppDPKI3adYb3yxxuIS7K6UCK6EJOO1KsUxD6hSAGZmbMr
	vo33nDVorcWfnM3AXX4k+29oOoHpNVrcBS+V7oRmP2NlZONaA6fnwAnHJsonHUhgrkMnaHKvq/eaV
	F9vs2FI6hQHb9s4eKoL1LyZTvQ0bp5/+7vsDNSeGfzC3srUPYi4+RwL7cC74A+hjOXp2rlpwhasLc
	qTEtI97ovCr1rpPmkq8eaUQBz3do0fqZrwIx1PqwGGSQMx1gNB+ZpFFAmvRZldLZcnQ/a/aowiJPc
	222I4OM4tP9xFF6KSOwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jC6t6-00065w-7R; Wed, 11 Mar 2020 19:19:28 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jC6su-0005uM-EJ; Wed, 11 Mar 2020 19:19:17 +0000
Received: by mail-pl1-x62d.google.com with SMTP id j20so1538468pll.6;
 Wed, 11 Mar 2020 12:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AgA8NXVVreTrbc68nE5t9RxNm/CfbmPdVBm+V/xZGZA=;
 b=Ra5czn0cz8MQvrnhNDEap6qccGc/050Ie9lY8KvZSJx8DwxM1ldR4EKQSh5WEqaxyS
 xYF9hUZqIDIQT3/lMwdgozbCBLLtUHRKYiEbi4jw4duvuwQOtElG9/7wO44JP0eczHRM
 Dxsp6Bk+7yOQH4ZtBE0QVZM9RTqDk8Mwsn7lKwTiMqig9txszVT9Cf8hOh6jehBZkYGr
 1/1bZjX/DLPSpaaBK7DGubvYsRwUorTmARB3R/VM7r9hyt9bspIR8HkN3kcvc/DTY7Hr
 RBopIs3D719sXwKTDQ7EnjBQ3Skg3Sg35c8707QLuftGu777U7MWzc+ZUFUKozNZmMHR
 EkyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AgA8NXVVreTrbc68nE5t9RxNm/CfbmPdVBm+V/xZGZA=;
 b=OdiB5OON6Y3g/y0wWoYWw+FVUG6WSy1d5Xg7WRmwpor6NNyxvHzLYHK1fhKO67woj3
 bT0cUPzT5JQOggXcr/PfLJDeo+R/r25T1YvnR9GfMknFoexycjgt9/O7T+E3W99WnTb/
 Rg1d9XKmqflzEWw0UQ7693Es3rm1W5ka/EhWvgw33JFIOHGoMSqRunuFInfbCcQ4mGD2
 0RV59dbGh2v1FE7Fpf6jloQk+9dm35ZLgcIpx3JABtf33X5VOt+NnMELE7Ypsl+ys8hk
 11y+/juXLIv3jLfZXY0EshuNYEMvRzJsW+opw8z+cOPNbBeC8sh0kF+jHN/5QHP8cyc9
 OjWw==
X-Gm-Message-State: ANhLgQ1fByujuiva0cKk9ZzuDikUUcKOTmgvZIZ8TdWu28YSaC1/dzWJ
 gjruJ/sNiEC6K08khuG+YuM=
X-Google-Smtp-Source: ADFU+vut6cvW5Ep/5MnHwgb71GM6QOKN+GXWUmMoSF0wCH4v2hNV7CL9paPgi4pfd+r34U5ISQ9Azw==
X-Received: by 2002:a17:902:b10c:: with SMTP id
 q12mr4569032plr.303.1583954354047; 
 Wed, 11 Mar 2020 12:19:14 -0700 (PDT)
Received: from localhost.localdomain ([103.46.201.94])
 by smtp.gmail.com with ESMTPSA id z17sm3792673pff.12.2020.03.11.12.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 12:19:13 -0700 (PDT)
From: Aman Sharma <amanharitsh123@gmail.com>
To: 
Subject: [PATCH 0/5] Handled return value of platform_get_irq correctly
Date: Thu, 12 Mar 2020 00:49:01 +0530
Message-Id: <cover.1583952275.git.amanharitsh123@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200311_121916_507880_CFB19FA2 
X-CRM114-Status: UNSURE (   7.50  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, amanharitsh123@gmail.com,
 linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Mans Rullgard <mans@mansr.com>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, linux-arm-kernel@lists.infradead.org,
 Andrew Murray <amurray@thegoodpenguin.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As mentioned by Bjorn Helgaas in a private mail, the return value of
platform_get_irq must be checked against the conditon of strictly
smaller than 0 and if check must return the value recieved from
platform_get_irq rather than any other macro like -ENODEV.

Aman Sharma (5):
  pci: handled return value of platform_get_irq correctly
  pci: added check for return value of platform_get_irq
  pci: handled return value of platform_get_irq correctly
  pci: handled return value of platform_get_irq correctly
  pci: added check for return value of platform_get_irq

 drivers/pci/controller/pci-aardvark.c  | 3 +++
 drivers/pci/controller/pci-v3-semi.c   | 4 ++--
 drivers/pci/controller/pcie-mediatek.c | 3 +++
 drivers/pci/controller/pcie-mobiveil.c | 4 ++--
 drivers/pci/controller/pcie-tango.c    | 4 ++--
 5 files changed, 12 insertions(+), 6 deletions(-)

-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
