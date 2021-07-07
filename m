Return-Path: <SRS0=DDi+=L7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8F1C07E95
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:37:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 547A161C88
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jul 2021 07:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 547A161C88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YqqbQwalCdQlIB+CqsOpLm6pmCdZXBqpcA1r1pTWobs=; b=khADwHJECqrMFK
	7CYjXZwaFlsCjDMHWXlivhzWYYAfO4YbXUDMMFyeDakDkRpLm1iqPjtSP6cIpD0wX8Yh7zcyCB3NP
	9lGYmi/CDwkTmpQJzgWjfqBHNMM0Fyspq+h+4P3hurBEr5No/ip/jklkoRWP0R+IMhrMVCumI4mWO
	va3a/W9BmbVivBC8az39uCT6kgV2HcfQas5bPnYQYZnQhCeF3JdUqRGfSrYYWj1MgIUCwz4kslUWz
	+Co6J2tn290dktxBfE+hyMgQ9IC0Sh0Q2sXJx2SHPQfz9ToQy9oxuNDmVKkBlvpTyqtRFAQXp9Pv0
	k0DEWXatNvxjizpdPaQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m127e-00DrzU-UY; Wed, 07 Jul 2021 07:37:31 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m125h-00Dqr2-QK
 for linux-mediatek@lists.infradead.org; Wed, 07 Jul 2021 07:35:31 +0000
Received: by mail-pl1-x62d.google.com with SMTP id u19so588639plc.3
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Jul 2021 00:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U++AYiLCIQ3aO8lSHeGEBojQNtUlJm2+BuKWMbH7HeU=;
 b=mLLVdV+iflZuP7WhIpckLL6oGmDZDvWd9gZiGFfxc6dmnH932qRdGpGvMQQUyL8YNx
 azgpER+zmlOBmCnR2HSYI74skD9Sdl2V0AP6WqO3b7N3EhPHBtjPpTM1zdrLfUISOG2v
 A6cV7jCKIJS17zl1PJqX4Xoyd3CGCOqZuqleo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U++AYiLCIQ3aO8lSHeGEBojQNtUlJm2+BuKWMbH7HeU=;
 b=TWb7B1aq9X1+OyNwIgEJjs9L1gefu50uugJXjklwR3z1xEPGh8yh6a4H1O/BkFBiAR
 YcNHEM/sk/Bq2wUL2oogaRmrlw//P4N9GDQdNE5o/f8Z+VCDjaS/1a+39/usDiTUoitM
 JOBom9dPlyScrz5HBv2ux8yiKqbEDOD1aCSSXciNPhLZjLcT9FfazAciUZsq+XSbg7yM
 5IkHNg9Il0O/r69Qf4S9Wet3OWULgxXW/IVZB0+0/juj4WMf6ZBj8vTktcKfMHejdofl
 eJYiW5O8BIsDkoucgeFqY44NvhZeB6FqDAwZGET49FXxsVogYki2iSMt1bUR3TxLIayy
 8MfA==
X-Gm-Message-State: AOAM531BWiq2/IDccmMSQVeA5hdgzvSD7U8xS1xqLXbmXR7oC86FtQpo
 7phklptxhTGqXMwG16u6Kxtp/w==
X-Google-Smtp-Source: ABdhPJyTxWMJZj7LL37hggFpu2OU5nP94sCxDsc4uf4pGXQ5BF+hjJgrZT9Q0di1Iz+GO8i0RnzpGg==
X-Received: by 2002:a17:90a:fd93:: with SMTP id
 cx19mr4663038pjb.65.1625643328866; 
 Wed, 07 Jul 2021 00:35:28 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:ccb9:d95f:4dac:dbc4])
 by smtp.gmail.com with UTF8SMTPSA id 202sm18932514pfu.113.2021.07.07.00.35.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 00:35:28 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: houlong.wei@mediatek.com, enric.balletbo@collabora.com, wenst@chromium.org,
 yong.wu@mediatek.com, chunkuang.hu@kernel.org,
 Eizan Miyamoto <eizan@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v4 8/8] dts: mtk-mdp: remove mediatek,
 vpu property from primary MDP device
Date: Wed,  7 Jul 2021 17:34:10 +1000
Message-Id: <20210707173108.v4.8.Ib681f06d5189351b7fda0e3dcd6b15f3863a0071@changeid>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210707073410.999625-1-eizan@chromium.org>
References: <20210707073410.999625-1-eizan@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210707_003529_938577_3BA495CF 
X-CRM114-Status: GOOD (  10.81  )
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

It is no longer used by the mediatek MDP driver.

Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 3efcefd99720..2e468e24fdb6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -1056,7 +1056,6 @@ mdp_rdma0: rdma@14001000 {
 				 <&mmsys CLK_MM_MUTEX_32K>;
 			power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
 			iommus = <&iommu M4U_PORT_MDP_RDMA0>;
-			mediatek,vpu = <&vpu>;
 		};
 
 		mdp_rdma1: rdma@14002000 {
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
