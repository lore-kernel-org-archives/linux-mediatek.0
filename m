Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541BDC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 07:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E64860232
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 07:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E64860232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFMNI9ycePgRmB6S/muGoOsaDRt/X8tqCfIlNpJ9EP8=; b=dUbmhjmvI41mTu
	unQb/V0xgEIVw2mjwdwi7PTQY8TA7fV8nerCqsFOqk8XJOxWBcrMrQNMWbdZD8Hn5ZyvTlwZv4qRN
	Yzza66aD/rY5TH0Bk27/HYvlJbmJQ26mCdu4/f442Qw0zhV3OgG2X2A2xjS8y3aqb/P2MtNVt1cec
	VJap14IAdYy4eTXh42c8CYyikG/Y3iH48VOL72OaVgFrX3BS3GIEhhBF0SsLDfOjSNNGRtzPwt140
	FdjqYtJI13DiWErmecGI+YIFTh2QIYjBcKjIousNB431aAEF1MNeofezuhQXrmkx0tap/e9klUIja
	/50iYyRTDIDrrgRKM91A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMKM-002kti-JE; Tue, 10 Aug 2021 07:37:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMK8-002koP-Ni
 for linux-mediatek@lists.infradead.org; Tue, 10 Aug 2021 07:37:24 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 lw7-20020a17090b1807b029017881cc80b7so3076706pjb.3
 for <linux-mediatek@lists.infradead.org>; Tue, 10 Aug 2021 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iNVi1PJwomW2Lv5qQiFKSFJ6/Vv2aKjQw2zcbRmrKys=;
 b=GwAvGJKypx7dO1I0Quh1Zo3hfRBIgOhUAweuXo0i6JjHUCpYGk5+qJLXFbe9sLri1G
 P+WOkghCyhFndfyOID+H35Uf+VciyHQHnKrB9mVN4nbGeKfyEdpY8BXDBitOqCwCT+vx
 6CPzpG4vziCrjzO+Eztlu7jvoOMBI3oJjZKJILfLpxpIti5cJDfztxNKCtRnIZPuCD5q
 /BXgfXm5gexBx65NWelA9VY40xpGcO1xQU0MUlbeavFYL4HzuseUcuPG1z8uX5Lan4mN
 nj/5Gd33SFntKjuHOTGtTXO+SXADQdhJczErFnA8sHspqZ4y92OoOV7Wq/gcjxhEIm1W
 RnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iNVi1PJwomW2Lv5qQiFKSFJ6/Vv2aKjQw2zcbRmrKys=;
 b=ZGY1WVV/VZsPZfT5ZEJWu9zE4kvCVjVBp3FNWL2sHUOrYFQ4/rkNFKlHqbFJ/5DbY/
 oJ35/p6N6WApmVQa6GMvgBtDcmRjrxz7u17tLxk13Ni5OwdxRq3x2XFXQkO4RoZkNBY/
 FYBN1xwuIYTT/c4fKlV3ePSLAESgeNGRABu5OO4GueQ/okS5d9AXcWGLd8pI7mFe9mdh
 UUadM8h+Q4e7JCdyWgc8d/2u8hxCjiCmLVQ+UbeotTpEdLiRyRCgwQjrBiPEz0ybkpKy
 xSNSg2WqnTojwS8pCNTpCFbnbYzSNoB3DpiyIILg/6oicrKRf0ULEkFCP59a25ZHxkzJ
 51SA==
X-Gm-Message-State: AOAM533Kn/Oku8Ud0zPimhZBUQq1m7MGI8ebWabqZZUVv+n6u7FKkbV4
 mjDQxcouxDzx12oABhd3S21tig==
X-Google-Smtp-Source: ABdhPJyts3rEp6+rLE6LLZhtES2W8EMmMA7guXfr/FSHBEYAYcFpqAHvl/PTW8hkBqm+wpQy4E5pXQ==
X-Received: by 2002:a17:902:7144:b029:12b:24ce:a83c with SMTP id
 u4-20020a1709027144b029012b24cea83cmr5859162plm.54.1628581040292; 
 Tue, 10 Aug 2021 00:37:20 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id 20sm28187764pgg.36.2021.08.10.00.37.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 00:37:19 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rafael Wysocki <rjw@rjwysocki.net>,
 Vincent Donnefort <vincent.donnefort@arm.com>, lukasz.luba@arm.com,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 4/8] cpufreq: mediatek: Use auto-registration for energy model
Date: Tue, 10 Aug 2021 13:06:51 +0530
Message-Id: <fe10f291210bfd16620f4be766e6647c8e577995.1628579170.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1628579170.git.viresh.kumar@linaro.org>
References: <cover.1628579170.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_003720_810398_2299C860 
X-CRM114-Status: GOOD (  12.18  )
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

Use the CPUFREQ_REGISTER_WITH_EM flag to allow cpufreq core to
automatically register with the energy model.

This allows removal of boiler plate code from the driver and fixes the
unregistration part as well.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 87019d5a9547..4743f2e58b97 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -448,8 +448,6 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
 	policy->driver_data = info;
 	policy->clk = info->cpu_clk;
 
-	dev_pm_opp_of_register_em(info->cpu_dev, policy->cpus);
-
 	return 0;
 }
 
@@ -465,7 +463,8 @@ static int mtk_cpufreq_exit(struct cpufreq_policy *policy)
 static struct cpufreq_driver mtk_cpufreq_driver = {
 	.flags = CPUFREQ_NEED_INITIAL_FREQ_CHECK |
 		 CPUFREQ_HAVE_GOVERNOR_PER_POLICY |
-		 CPUFREQ_IS_COOLING_DEV,
+		 CPUFREQ_IS_COOLING_DEV |
+		 CPUFREQ_REGISTER_WITH_EM,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = mtk_cpufreq_set_target,
 	.get = cpufreq_generic_get,
-- 
2.31.1.272.g89b43f80a514


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
