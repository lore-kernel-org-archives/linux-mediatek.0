Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5669FC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:00:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2030D610C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 10:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2030D610C7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5XpgqIhLbNuyO1JvkCZo91AfQJUNMfxN7o0VUtyubqE=; b=KPURlhySIW5OLs
	uWpAv8N6YvgNuYE/86tdM4u0TbyCe7lXJKkC02DGlQKyJ2RQ7YunXOStKFcXyvlGS4989c+gduGfz
	r4Tvz2/0UZwUaDN/kWoL5vn1mGFvJoziN3uPg4vHtsZvrb+kYSjHb9FRzi1TMCHFd4G08qninLTKa
	vD/3YdhTsFK/wVLUUVMZtWcztUQt1A0UAdUs96d+W6LyKtcYF116FUH664GTpQN2VcWxk9kQ7JBz8
	4jh4D5YqqCTXGxN8mvWjmK/oOryP0gEapXNzkf2IeAmaWTuKCfm3dqSnmo1WCO7L8EhSm4ZQTjgwR
	yTJlZKRLqhadt38z4xQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFZPu-00GeGE-Vm; Mon, 16 Aug 2021 10:00:27 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFZPq-00GeCd-JS
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 10:00:25 +0000
Received: by mail-wr1-x432.google.com with SMTP id q6so11212592wrv.6
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 03:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXtfrlhTvK5I4Q1AcToRyUZbAQ+Zw4tC00SfbVVvbW0=;
 b=s3ToyYAoY23WCoCF6c7fFnVwgRmAsa5SAo30JW235Lg6QeLK2Z63c1kjPVsIGjCZiU
 gJ+keeK0niCAkyDDssO7o9zgEj+CeU9011sowPpALmwzMfjylFCiQvwubhDOX/noeweA
 OZitkIVb8Pr8U50KzUrfqAjcUCaeylgShbm+ySjWFsDKqyZatCtpYqrwm52rWm4yqaT7
 sS326TZlVB+RIJNXACPI1h1Vhkay8IvlwI9YXh7WfxcZN707rHnmoMu8UzcTc6XjL3PV
 6c+rk8HFqer/jR0gAv82tCNBoOxBU9G5WRqBCzkBcOxSjk2hQiJVOZsNjxBW2+9zUt3a
 dFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WXtfrlhTvK5I4Q1AcToRyUZbAQ+Zw4tC00SfbVVvbW0=;
 b=AZHpWnP6U2tSFQAdmzzokSeh4aCLkPNdJeOE3JEDiO/sV8Ly1DateBobItq7Mr8r3T
 T/vSZKTqyZ7235r1b/n2AW3UGk/3loKfaqZ2UXCudF/fMkQahVha0G6JSyA2PljIDIsp
 v1/hFLzZthpKwzT433rgSU46jpGltdCXvEVN00NdcqrvAo3RXavQ1/NpsXyY/o4v49O9
 5+Bdiyk5YyarA91mSQBvbzqzBnlR+CCUG1CatlWWkNMjH70jBQ2Iq9A4HQ5KayOojUwD
 G+V3UN5fldziA51IMykq1hvuIo7p/kmSahZHQP+aknwrXQLx0CfKXuuzDb2K2y3hOp08
 Q7bg==
X-Gm-Message-State: AOAM530HZ74XT64DUpDmJcPsxMqEmjaHMBP22jpqMJmi80fiPCZWN88o
 ZOTtCv6bVqJRUZOx4xF/SLqVDA==
X-Google-Smtp-Source: ABdhPJwDGgULKk6muzbBo58qOdzC2JgP8l7B8Uqpu2dQfFY7AAre2f5xvKhTZVqiO41kMGHvn1DEJg==
X-Received: by 2002:a5d:4688:: with SMTP id u8mr17685059wrq.148.1629108016922; 
 Mon, 16 Aug 2021 03:00:16 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:92b1:d3c2:1204:85e2])
 by smtp.gmail.com with ESMTPSA id u10sm1916645wrt.14.2021.08.16.03.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 03:00:16 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-input@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH RESEND v3 0/4] input: MT6358 PMIC button support
Date: Mon, 16 Aug 2021 12:00:09 +0200
Message-Id: <20210816100013.100412-1-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_030022_758272_47D78922 
X-CRM114-Status: GOOD (  10.80  )
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

The MediaTek MT6358 PMIC has support for two buttons: PWR and HOME.

The interrupt logic is a little different than other PMICs from the
same family:
for MT6323 and MT6397, we have one interrupt source per button
* for MT6358, we have two interrupts lines per button: the press and
* release interrupts are distinct sources.

Changes since original v2 at [1]:
* added 4th patch with device tree enable
* cover letter title prefixed with 'input'

This has been tested with evtest on mt8183-pumpkin on 5.14-rc6

Mattijs Korpershoek (4):
  Input: mtk-pmic-keys - use get_irq_byname() instead of index
  dt-bindings: input: mtk-pmic-keys: add MT6358 binding definition
  Input: mtk-pmic-keys - add support for MT6358
  arm64: dts: mt6358: add mt6358-keys node

 .../bindings/input/mtk-pmic-keys.txt          |  5 +-
 arch/arm64/boot/dts/mediatek/mt6358.dtsi      | 12 ++++
 drivers/input/keyboard/mtk-pmic-keys.c        | 56 +++++++++++++++++--
 3 files changed, 68 insertions(+), 5 deletions(-)

-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
