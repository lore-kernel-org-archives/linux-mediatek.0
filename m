Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA97C001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Aug 2023 18:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hbko1ie21EmrHam9zE7OmrbWipe6Zn4PD2Jb8HdIlvI=; b=wGlD2EyoCrVSheGvnC0l4XUA9O
	0XExYeyT1k4qk0f/slvycXgU6Kpzc+vAmEdYFe0d0/zsytCD3OyYEoXvWWrIpDxmKbDLfyumZZpxY
	zVYouDDcU03RTtOeEEApWFn7CJ0nf4UXgZhj7TcWBU/W8jmqZ73DqGWgbETyzxpPfRehKNp/yRx2E
	yL1pP5BNYR75rRj74BaRYVjogZYDN69xu2KdmJvBAnGCmIkB/Ez2gfjJoI5U2v2ZPCxRB7tlyVwd2
	/oJPQs1OskVJgEnzn8LRQnaM70Sn0OoD0QBBKk6M47837+NeeKTExvd8o/P72pm0eW+pBweVL8KsW
	zEdjViFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUA8t-008OFU-1f;
	Thu, 10 Aug 2023 18:12:15 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUA8q-008ODr-1V
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Aug 2023 18:12:13 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b9d07a8d84so19312201fa.3
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Aug 2023 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691691128; x=1692295928;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hbko1ie21EmrHam9zE7OmrbWipe6Zn4PD2Jb8HdIlvI=;
        b=ZXrkVJwXoMvaalWcrMIqQqkVyieuWdVsqozNAsI3wa4cGtWajQiwWuMikaxEImsXA8
         ra7Gba3+QHfB96/Yq+nAhmELTf4d9xeCfE+Lv7BA4oy3aNSD/IJl79pmE4ulzdV98QT+
         6wfP3fLdijjTV7Ftjvf4v0fqUvADIYqZiIvm0SPRdGdRZRynuoP7OmlTma5nfHDzm47K
         5ulRlMjPwtDp2mX5iviVudPwUk1KNLkL6ZIF76x5togadcVSIj5G0TjrfUPeFnhrYgdY
         OrRNiD/lO8vX9ZMQPD3i3cm03Ik6JPgCexNd63LuPBtv1gHWIw886kn9gs7yAbtS+P1U
         EFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691691128; x=1692295928;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hbko1ie21EmrHam9zE7OmrbWipe6Zn4PD2Jb8HdIlvI=;
        b=UZ/Dom3NyHQv4dsBxZp1kQLYPcYaHNqtel6oSibtBD+89gIUyoy476yQz1UAoFaL5j
         6Qgan6t3TcHrQGoj0C6orVDJG6y1SvutfPiK1UeRlAmiVwGsA1zCJ+zVMMPGogfpWICX
         dmybrDKY4ij6nuVvMyszMZ1hviFnrOAMXNLm5cruga5jl82hIKgOUCqdm0seVu89M9H1
         ffozsijN4aHyn596dosiI1VLraFFiwPR+CvFgiUPj1AltP884kCeJyIBG/tdhfKkqBUG
         xdpsOXaXHuN5FJwxPTf//Zl2Vk9uWjDvUSUuCjPBxPDgwNslY7JrmqoI+6GVLCUj+KBy
         ZwAA==
X-Gm-Message-State: AOJu0YzkJXQs6M1ggV51QVbIy0Z/OAxBNp0MMHK49iNCHUZrwx4FHkQ+
	IXuY70EfFbTL0luviBgHB0emSQ==
X-Google-Smtp-Source: AGHT+IEwP7fzvIS0NEzTzMO1heFpeKEKZ7p3yiRnTAYgiv0QUz/QETCEH9UHAyRhmI+7NIFrAq2X8Q==
X-Received: by 2002:a05:651c:238:b0:2b9:5eae:814f with SMTP id z24-20020a05651c023800b002b95eae814fmr2404041ljn.50.1691691128330;
        Thu, 10 Aug 2023 11:12:08 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
        by smtp.gmail.com with ESMTPSA id n19-20020a2e7213000000b002b9f239df62sm457621ljc.74.2023.08.10.11.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 11:12:07 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 10 Aug 2023 20:12:03 +0200
Subject: [PATCH] cpufreq: mediatek-hw: Remove unused define
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230810-topic-mtk_fixup-v1-1-88022eaea0ac@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHIo1WQC/x2NUQqEMAwFryL5NtAqhV2vIiJtjWtYraVVEcS7G
 /yc4Q3vgkyJKUNTXJDo4MxrENBlAX6y4UfIgzBUqqrVRyvc1sgel+3fj3zuEUkPzn+NMbUZQSp
 nM6FLNvhJurDPs8iYSNbvTdvd9wPmgW6fdgAAAA==
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691691127; l=878;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ifZhDFap5bks4IWvBGc5lYMz3WsqWbWti71CuknCvOE=;
 b=L/I2QS1YREUvkMZGYEnL9kfATn0rRfKSXj0r+utNJGyDY2HdOOKua0fKaNfRDyEP96V1DtNrQ
 rwSt/HYJlYTAmNA3YTbUjlTGse9mcnLmkWpthz7Y03g/RioQSXLEWVK
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_111212_502376_4F390009 
X-CRM114-Status: UNSURE (   8.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

DYNAMIC_POWER does not seem to be used anywhere in the tree, remove it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/cpufreq/mediatek-cpufreq.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index fef68cb2b38f..a0a61919bc4c 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -313,8 +313,6 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	return ret;
 }
 
-#define DYNAMIC_POWER "dynamic-power-coefficient"
-
 static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
 				    unsigned long event, void *data)
 {

---
base-commit: 21ef7b1e17d039053edaeaf41142423810572741
change-id: 20230810-topic-mtk_fixup-e1dbc955535f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>


