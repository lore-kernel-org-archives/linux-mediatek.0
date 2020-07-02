Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CC0C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:24:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 621FA2089D
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 06:24:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NCwJ2ooK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="mz6WZPSt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 621FA2089D
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PFXoGxgxtEE+HE0UG0w1DD8IrXggykVQxzVpwL4LglE=; b=NCwJ2ooKrkP0LwKgcVmS8WWRZ
	ljQr6QhgZuc2yJqsEb0fmAa2HGrKpMWNskLUz9bkKJzZpUj7PRNVPNQQW5AFG0gyLWOsYHBK5LRq+
	r1O7wW8XKEOZCEDxEqmMXvHo2U1Qbz6lTZWtIDfD6ZjjxziIK8qOK4BREuse/LfMX3Xa+Cw+Jhpy2
	CU5l3ADIApyPUHpb5sCa9Ue8tO25WOV2mk2PveKWaQW1RaRq8yQ+t1/0Q4Gyr9PUFD+qjt1IExzpm
	vHs8xhVHAc3cz3iJUbDiJNsl6ax6lOv1a/ntRjj7kzgtA12hTARXY0bkJF3PeL1m9Sk8B5tcfEeg9
	bSojKOJ7Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqsdk-0003Q3-T5; Thu, 02 Jul 2020 06:24:08 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqsdg-0003Mi-A8
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 06:24:05 +0000
Received: by mail-yb1-xb49.google.com with SMTP id p22so28649893ybg.21
 for <linux-mediatek@lists.infradead.org>; Wed, 01 Jul 2020 23:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=iZR7HnIiawJ7wzfiy0Ut0vXr2/SqR6IE5pS9JE3U7po=;
 b=mz6WZPStsuXLTdPf74q+rl3ncwIazZ/1XrQgZjRHiIn7CeFK4q/A6u4oPfPFkTNEPb
 0OSlqwLJc7Dckc9FQxELz7ifXB9BgaW9Az79IViIduvG9yZ1zQ3yPSeAHrc42NqruYr6
 Oi7ZWgYQQXiRTwNo7Vgz2xCtT7wxKB4rAgEZa17+KHit5M0YLuZHyYGA1YikZ9t/tfDB
 ruJtSB5blSCSpYWtoUo/X/RHUcgOltK3YdY1/Y9sLGTUcU0wXJ/VVmiTgXo0Lb8tCgsc
 AYLhjEKqRumQq7RVRZn0Qg/5udS5A3yJ5K4VaDPKoK0vBys78t39hetucFKI1pBRFSdX
 5HiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=iZR7HnIiawJ7wzfiy0Ut0vXr2/SqR6IE5pS9JE3U7po=;
 b=OmToLu06S5Rxq/ZhWcZSduJEGQMmgf1YSFAzubZej/Np4Q6KdMRqYsSEyIKLOGoQzt
 RyQPJntYyLZYr93Qkj1irkiyDZXfdtERxQCYDOpc/hAECL1EfG5lE0b+RCq8JWb7UIlq
 gjfQbl4EsycCzwSwdNMLvhD8jeN8dTZ6WMHvMBEkxNCmgfhlXvmfaUiubWKprolhBpyH
 BVdN/LJfgmjBCLNvKqQHKFbkeYE3tHCNbV7CUsqyKWRJv2sjWHhlYtzun9wGigq1eHEy
 +ipTo5WtjgcuDJFt4xopIQLQnc+wr4jkOq4mOU4GdQ86KTg6m2VMocMSmzBqB9GwrOv5
 XVsQ==
X-Gm-Message-State: AOAM532FjKcEL2gvwDuiDaZyKASc2btS5SEJUvU9A/pZWQERMOjK7T8y
 SyFBDnai6ZJOuVCKzCiWfA1R+GAusr2tFT2WRRR2LckVf6jqVGc3l/MOXLZ2+fX3iCqzqdm4/vH
 IEgrtHGzi7jUKFvKRgQifwP4jwB0I+0ZNCL0GgJqGFAMy3qrrkeUIyGdEhCCmEMjSbNUdSiV5PI
 8FIR51
X-Google-Smtp-Source: ABdhPJyjdnT5MaK/T6agjEBgLQNZJMX/mX1BLU3IAGS5LPHQXU6PipfcCyLI5smcJiTvvuUnWd4MWUfOx3Zi
X-Received: by 2002:a25:1941:: with SMTP id 62mr53184112ybz.16.1593671040774; 
 Wed, 01 Jul 2020 23:24:00 -0700 (PDT)
Date: Thu,  2 Jul 2020 16:23:19 +1000
In-Reply-To: <20200702062320.2903147-1-amistry@google.com>
Message-Id: <20200702162231.v2.3.I7acfb591bfacf3b1b04a3d388385098bfcc9fecd@changeid>
Mime-Version: 1.0
References: <20200702062320.2903147-1-amistry@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v2 3/4] regulator: mt6397: Implement of_map_mode
From: Anand K Mistry <amistry@google.com>
To: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_022404_382109_D2217AB5 
X-CRM114-Status: GOOD (  11.20  )
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
Cc: drinkcat@chromium.org, Anand K Mistry <amistry@google.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hsin-hsiung.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Implementing of_map_mode is necessary to be able to specify operating
modes in the devicetree using 'regulator-allowed-modes', and to change
regulator modes.

Signed-off-by: Anand K Mistry <amistry@google.com>
---

Changes in v2: None

 drivers/regulator/mt6397-regulator.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index d51e98ce1138..0a30df5e414f 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -53,6 +53,7 @@ struct mt6397_regulator_info {
 		.vsel_mask = vosel_mask,				\
 		.enable_reg = enreg,					\
 		.enable_mask = BIT(0),					\
+		.of_map_mode = mt6397_map_mode,				\
 	},								\
 	.qi = BIT(13),							\
 	.vselon_reg = voselon,						\
@@ -144,6 +145,18 @@ static const unsigned int ldo_volt_table7[] = {
 	1300000, 1500000, 1800000, 2000000, 2500000, 2800000, 3000000, 3300000,
 };
 
+static unsigned int mt6397_map_mode(unsigned int mode)
+{
+	switch (mode) {
+	case MT6397_BUCK_MODE_AUTO:
+		return REGULATOR_MODE_NORMAL;
+	case MT6397_BUCK_MODE_FORCE_PWM:
+		return REGULATOR_MODE_FAST;
+	default:
+		return REGULATOR_MODE_INVALID;
+	}
+}
+
 static int mt6397_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
