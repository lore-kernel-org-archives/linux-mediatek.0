Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975D4C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 12:00:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD552206ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 12:00:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u5vTHC50";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="se/DLfBp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD552206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T5cGNvabXcmHZPNUhxkPhcOoz4MsK9AZaVdzzAtnpdA=; b=u5vTHC50ymu/nw7l3717G8OrFy
	xEASxfbMymaFTQ2t6wIZw5sOSXrl6bGuNQoszd33/3AWojyfn3MNkh85QO7T/jLWtKK8osFxvxuil
	cNHK1ynWOspK9qzFBbxqqAEpFfEw2dzY7WqQwrI48Zgj2tvET1nvUg2670NRia3W5WXHudzi1TFng
	RIth3aReARyDL+VlKegcYe9uAAbEgVlQW/2VD6SvdiMeaOy2jGB8KAruJ2Ky3VBTPQkx5CJVCnNmP
	8WGfYAm4JEMrUHSsne7roaZoAQFjYjNsl8+8O2lGqNXwvKv1pNM+jruiuWf/VoF0yo4X6xa2LzHnP
	HqmS4j/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kadw3-0005p1-4f; Thu, 05 Nov 2020 12:00:11 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadvz-0005nk-8b
 for linux-mediatek@lists.infradead.org; Thu, 05 Nov 2020 12:00:08 +0000
Received: by mail-lj1-x243.google.com with SMTP id k25so1271069lji.9
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Nov 2020 04:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hD+jTA+3CFbm6Cc6YXWQOBtuekF/Hqs80WB365oy6RQ=;
 b=se/DLfBpwBk2kG2zcKQ1QbC/k7rlYtozlHPB89l89B0J9DJimFbaCvwAaqaqjuU1VS
 1z1yJM5RfY9UqOKj+y1YwINuAWbr66pWiPOTFbN5dK5K3cwnzj73z7jMz4Akxx8TTUNB
 mIXU07VN1CWxp0VJtD9+oH2qV7rskSX21CWBjOuHFMQ3x9zCzd1ROXjSTaCadav4J4j/
 4diuQfz0ntcAdVMQw+ZIa5s55VCU5PiCsLnTuErkY9GxmUBIwmeQsM5d7SruoK1oSf2V
 3OpI+j5s34L7QbupBHwew6QWVlszJBXpIlZKUaY9wf5jHiYzGfXZh9icMVFtWYUvMebp
 V5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hD+jTA+3CFbm6Cc6YXWQOBtuekF/Hqs80WB365oy6RQ=;
 b=jb7HgwgQuM4iil7H1CZNDtEQYqbHIYTQvXf1ftMDdHCqrWDSsDKdKEHZzTfM3zrLsr
 K6nJKoDRIOZvnq1mpZoWrG9XuV3wEeKxs+iTS8Dd56C0g3wGPxzJDz4fyRyMRYPbQ+Ye
 zkYku7/bfniEBpFuT/oGrywtiUC7mkXDNtMxIbpMJ3W4JInD6vScbJ3AnXEUb1nVGu3j
 izLudTviGdKrICdUs3XP3lpTwanC47/nEkGzHAPMaPN1lPo1Z8bzvZb3SUBDdZcBqP59
 PzVk4EEV2yP2uuaJlkWBbAWPasAlhDuLGzgXrz2DmTsOZsuHmaeuJyXRyOeCfrOU7gQI
 pnsQ==
X-Gm-Message-State: AOAM533VAekZaUzKbmaXxxjG27ssflolVmAOmOhT77iF3PWK24qbkdmv
 m+6ALSeTjZpo+6uRLWdDl8UqOQ==
X-Google-Smtp-Source: ABdhPJxeGuSBmYyt3qkq1O4rs5PG3FDY0/PQS6egAACC/rH4szeNgwoAH/lrBc6CgnyvcOW6aXZ/FQ==
X-Received: by 2002:a2e:854c:: with SMTP id u12mr709140ljj.297.1604577604283; 
 Thu, 05 Nov 2020 04:00:04 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id s5sm161307lfd.58.2020.11.05.04.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 04:00:03 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 matthias.bgg@gmail.com
Subject: [PATCH] sound: soc: mediatek: mt8192: fix modpost ERROR
Date: Thu,  5 Nov 2020 12:59:58 +0100
Message-Id: <20201105115958.1850123-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_070007_321005_3E870A52 
X-CRM114-Status: GOOD (  11.05  )
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
Cc: Anders Roxell <anders.roxell@linaro.org>, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When enabling CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m the following
error shows up:

ERROR: modpost: "mt8192_afe_gpio_request"
[sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.ko] undefined!
ERROR: modpost: "mt8192_afe_gpio_init"
[sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.ko] undefined!

Fix the link error by export the symbols mt8192_afe_gpio_init and
mt8192_afe_gpio_request.

Fixes: 18b13ff23fab ("ASoC: mediatek: mt8192: add machine driver with mt6359, rt1015 and rt5682")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index ea000888c9e8..0286c95ed2b8 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -160,6 +160,7 @@ int mt8192_afe_gpio_init(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt8192_afe_gpio_init);
 
 static int mt8192_afe_gpio_adda_dl(struct device *dev, bool enable)
 {
@@ -304,3 +305,4 @@ int mt8192_afe_gpio_request(struct device *dev, bool enable,
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(mt8192_afe_gpio_request);
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
