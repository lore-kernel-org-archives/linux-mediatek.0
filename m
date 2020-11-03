Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F4D8C388F7
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:42:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05B2D22384
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 10:42:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lJtDx43M";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZURDZYxa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05B2D22384
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Amn/plyW7aYp6NI0HKArQXAUsbvPtuZJJ5HPFy7Zqc=; b=lJtDx43MTiSuj08G/xNsELEEt+
	6zWZv02rH5ZA9WLgBE43V2wNHGvKg70OIyVkMv147w0O7lxU/fJtHvKpgzhBmDua8ON9wVTSn4RNQ
	LwE9pPhKtiH+IK4FksaHy8qX5vgCukJtDwRHUSUMVe1ut7rsE/CYEOEgslnqW+MnIzI5inTP70uWV
	t0TVYvsOD6AEtiv5jxyOt2z4cAzkLXHmI4LcfiQeowfrvuqFXhscefwf7MYUg++VPrb78iw6vTHQx
	qIyM97WVT7pC+26urWtGEM9E+kERNVeSWiuHMEv9F63IAgsqna6oVoq/YXqkt7RaEdi/6bSM6nyPb
	acLtS3Pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZtlI-0006Pl-PC; Tue, 03 Nov 2020 10:42:00 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZtl5-0006K5-OQ; Tue, 03 Nov 2020 10:41:49 +0000
Received: by mail-pf1-x42f.google.com with SMTP id 133so13825429pfx.11;
 Tue, 03 Nov 2020 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=YNLb4i+gXcastlq1jUldc6IN2Il0nxtDvvRsKq+pC4g=;
 b=ZURDZYxaPRFuO/+TNnsVT8GVNiJf8TjmZYdhyR1a4swJiVM6QPUuPVcFRStJ9MZuX/
 pBklaDat2D2RA1jlg5sK8YNJbDfyMY3R+6jiHfxSvlP/BkhouYjBVN5OU2KBZypOCluF
 4iBC2VHIbwzs6Ft9xIPyzwXOb9Va8GMW4euEzjWasBApmHzKBIdnTE4bQbFMe00yCZw8
 MrEt0hoOuvRsqIk5/qG7syetMfC0zNPpzrivNsCcuyn7bvuPrWpWNzNklkgg16xTiqTk
 JKnfVn8SvZFvYvAT1UAZxzgJpTZFr+nbu9HqcSTnpLKmIq9CU2eo93jb+tBUdpD/kx1Z
 n8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YNLb4i+gXcastlq1jUldc6IN2Il0nxtDvvRsKq+pC4g=;
 b=YCWxTHQhCi/t0IyvWXWLdqrt1rOiHwFxaGF+DF5qtaBcwtxllfdgWZdyi6EihAf1So
 9TKJRpp9H+Emxlf+HeBMOKIsE3frM03SOO3x78YRMLHOyZ1PUAvFy8KOcosW/zysTjBr
 hFWuY9lpsgMDdBJPH7YQGCOKGrdfjvuzyZDExeFLXnFWIS18kXKehe9+1VRNTZWbRwVS
 UTMaCQLNYEpr7IjsBoaHzWBXYbyRG1z2JFKn/WpdlwIfPPZnVIBp/yGAleY3ZdZBj21y
 XqgR2BmfFYrvHIyw26eQ4aapcGf/dLx7JYph/wt/TnhS7nJ+5odwenqMmrZiuu7y7Dzw
 Dblg==
X-Gm-Message-State: AOAM533i8iPNrOexzoAtDEASTwmkX2F3/S/VB/hJz7kVPvXrch0ji0kz
 VTlpt3arj+1QAP8oelNGYLk=
X-Google-Smtp-Source: ABdhPJzZ3nqKgtxz8KXjJX2tus8vdo7/M6zz86MOLrnlkiSXnv22tTvO9BV7QM3dBawj2W93445Zyw==
X-Received: by 2002:a17:90a:7c0c:: with SMTP id
 v12mr3120612pjf.71.1604400099731; 
 Tue, 03 Nov 2020 02:41:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:57a:6823:8ab3:4b5d:4c53:f39b])
 by smtp.gmail.com with ESMTPSA id 26sm5235537pgm.92.2020.11.03.02.41.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Nov 2020 02:41:39 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v2 0/2] power: supply: mt6360_charger: add MT6360 charger
 support
Date: Tue,  3 Nov 2020 18:41:29 +0800
Message-Id: <1604400091-14618-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_054147_997670_3B294EC2 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, Wilma.Wu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 Charger support contains driver and binding
document

Gene Chen (2)
 dt-bindings: power: Add bindings document for Charger support on MT6360 PMIC
 power: supply: mt6360_charger: add MT6360 charger support

 Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml |   48 
 drivers/power/supply/Kconfig                                       |   10 
 drivers/power/supply/Makefile                                      |    1 
 drivers/power/supply/mt6360_charger.c                              | 1022 ++++++++++
 4 files changed, 1081 insertions(+)

changelogs between v1 & v2
 - Add binding property with unit and custom name prefix
 - Remove extcon device, redundant brackets and interrupts
 - Fix power supply prop "charger type"


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
