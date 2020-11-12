Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9848FC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:42:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 233F620674
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 10:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MYX9OXqL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p8bk+nmK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 233F620674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6ZcNtfJo03G8SrAzasLnOVNTRWryzMvUuFbpek6hAb0=; b=MYX9OXqLoHkz3i49EZrERiOUod
	oeaWl5xheblpjFn1Jwjzkk/vSgL5GwBIzh7rodtUl/i1ZA8rDjIKqDS++1sD5m162kcEHVZSjifeu
	7wfRtFfDAREK5xZgJibdV8KZl1gFRu8TU88TtDU5e7v66vqgHZPGW/IJe66zSR2wSdLnsgvk0vEA+
	WFyuacsxC/2lJQy9XS36k3EK6i4VRrB/BUJo0e2LEx6OPkOkl2O752iCb1d/O6SJ1ID7vWVUQO+zQ
	UzLKr081217bJhBlt5lgsLa4bq6Wbd7ILYSspwYVhY53/swQNoKq2NJ14ij8HlrvYB5WBWhGUgyOM
	yc0usBIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdA3l-0005ce-Uc; Thu, 12 Nov 2020 10:42:35 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdA23-0004dY-4t; Thu, 12 Nov 2020 10:40:48 +0000
Received: by mail-pl1-x641.google.com with SMTP id t18so2583919plo.0;
 Thu, 12 Nov 2020 02:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=algkSlHd9xkfYBolwCg/NlFH/Qse31ebTNBvgmeLrlQ=;
 b=p8bk+nmKSFWkl2/QhMWBU8QPK/uYeIgIKtq5OMDQUj2mMyQioK5Nk83g7qvV+im28+
 bn4Abg42K2nHukiyzYR2FWxIDx2m4rlRaRaS6zEkzpsTeWYmUXYUXf+gHmX6SZgB9GF2
 yepJ0pZZyGYbJQO06A5cKs6jUuQUu0lI0uQHPvLwSLph4X9xlqSWt4R1WUhRdUSMM0bs
 d2dVV8JleS6d1UG/BYiwton/HxI3ytdE81WzHAN9spVyEWFsHpkPAYDX1jOpNrsFLoZW
 mJVbg43uU/SwBlHkpM4nR9eF/OlsycnbKlZUhHY9JnrDxUuw+jLEQ+C2Aa5q9eqI0Ji4
 zhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=algkSlHd9xkfYBolwCg/NlFH/Qse31ebTNBvgmeLrlQ=;
 b=VNFe/qi0LdbUpwvyJfCOPLTCJVI8yeph+weTE/WfUqrWcUUOSrz2GDzoG1xBRPEEGn
 GceYOXjpV/WwJyEb0eSDo9on6fEmWEyP8DmQL2GE89toQ/npLGmqbDoeSdXWJPxYw2Ai
 Bo3PUhkzhlyY7Zbgme/BK1q2xd6ue5XXTvs+ZAcx1FD80D+mIHNGSa7y68LoL2g2vwlZ
 GIpXgmSz5ijui4aS1xUtL+eJX4PcSYbj6NVLtrv4Up/g806Vxxu1AhYBs74O5FdeRh5s
 3ZpOzsl+qAiFIQ/d6KI2Flz2Y8KDwVkZRyokk47fEQhLeqy6Dkj866FJQCoBv1I47IYT
 3Wag==
X-Gm-Message-State: AOAM533GiF8EUwzNdddf6ZudO4Vu/TgkVVIdyPwJUYRLo4ozSEX9a0lc
 7GP4fRc5e81TAwbwsdJq3kM=
X-Google-Smtp-Source: ABdhPJzaiS/rMlHBIj6j/OIZ7fIO3SYXFG15fig7ahQKNClWWUniD2E2NwKxev/dJVEOS1c8rPg55g==
X-Received: by 2002:a17:902:8303:b029:d7:eb0d:2ffd with SMTP id
 bd3-20020a1709028303b02900d7eb0d2ffdmr519608plb.78.1605177644610; 
 Thu, 12 Nov 2020 02:40:44 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:47a:a27:cf8e:7817:51df:a883])
 by smtp.gmail.com with ESMTPSA id
 mp16sm6414094pjb.13.2020.11.12.02.40.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 02:40:44 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: sre@kernel.org,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org
Subject: [PATCH v7 11/11] mfd: mt6360: Remove MT6360 regulator of_compatible
 attribute
Date: Thu, 12 Nov 2020 18:39:58 +0800
Message-Id: <1605177598-23501-12-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
References: <1605177598-23501-1-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_054047_438000_63D8956E 
X-CRM114-Status: GOOD (  14.09  )
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
 drivers/mfd/mt6360-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 4bcfa7f..3b6490c 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -339,8 +339,7 @@ static const struct mfd_cell mt6360_devs[] = {
 		    NULL, 0, 0, "mediatek,mt6360-chg"),
 	OF_MFD_CELL("mt6360-led", mt6360_led_resources,
 		    NULL, 0, 0, "mediatek,mt6360-led"),
-	OF_MFD_CELL("mt6360-regulator", mt6360_regulator_resources,
-		    NULL, 0, 0, "mediatek,mt6360-regulator"),
+	MFD_CELL_RES("mt6360-regulator", mt6360_regulator_resources),
 	OF_MFD_CELL("mt6360-tcpc", NULL,
 		    NULL, 0, 0, "mediatek,mt6360-tcpc"),
 };
-- 
2.7.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
