Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B0F7C55179
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 12:50:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED52820867
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 12:50:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f8A4Gr8f";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8u26zDO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED52820867
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aSj74nKCV4laW8Q2gGi/kFHSjT+hWR8cRgD0FwcGgWs=; b=f8A4Gr8fATyFXfo7nPhXu9www/
	OwhVGqPYX9ALQR6daW6qNPrHuZWHKGN4lh+FkcXc3K6VZ+jcEiMtYXItes6Y9VhgY+T1x28+24fPL
	lKJgKwtYbVyuVYNuqCu8JajS4aPQ8PQAwsni4r2SNCNZU74en4PUc4BYZbe4F0RLhI4TnNdibD/Y4
	433l4othgEjTf0nXQVyaiFyMlClWiXSNDKPY9ToicWM+PrqR2q/EYB9ri/RGcUc2WHN51ljAr38C2
	CQzbKmVDRA4M7+SMXOJcYRYGsZK4GuyuP3VYY+DZWVD2T47X35jkCuqF4sZJMBwP3dv3CSlTlnpgU
	Fjwu+WcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaeiN-0003cc-6b; Thu, 05 Nov 2020 12:50:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaeiJ-0003bN-8J; Thu, 05 Nov 2020 12:50:03 +0000
Received: by mail-wr1-x441.google.com with SMTP id n15so1634416wrq.2;
 Thu, 05 Nov 2020 04:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+C+hFQf4fR17sqAg53ZRGOMsBqw3qEsg3zbacKAW2d8=;
 b=f8u26zDOnu1BHe89VUV3H5l7cWUXq3IOJJDl3y9WOFjOWmn9enFSVWlENWcnFAVlyf
 FWW36yGMR49eouTFeMSwwlCN0RzZUoO7J+ZmVG5zfNzP7UJ0IyjS9lEF0PxD8Mg7U8yb
 3TuvgD62sf0Q6+wkpvAPJ7QiZ1jKRwJceI6KW7o9o3iGSISI0HrZi719NZTNn9YaEPBq
 n0q5VzdIkgpGpMmdadSqhXACzqhgQ0hdCvY/ifc3feBtkPGkTxhOZOjjnIsyZGaPmsXr
 pnj/+6oNEMgEaNaZkEEXX5paKK17nM+/J2NZl5aWlAeBCzybf4uFAQhOQuyB+5HfSeO3
 gv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+C+hFQf4fR17sqAg53ZRGOMsBqw3qEsg3zbacKAW2d8=;
 b=rW3OKE9ahksnXbgMc99jZbCxdPV5dE6RzgkPFGkeY/HczOJ7gp9WjuN/ILzuzrfz12
 koGCV2VzsEERHHU0aWgFGZqAQwQdZjVQARFaKtVFVMzMPKXMc2qePPm8042Kt8pmZVHk
 0fijD9i+/bUFdTRMVGsZZiO/rEWO4yE171Tzkw1PhJAu1vKNhgS1JX9KJVa/Sv+IqQh8
 gesYDq38eKY1nnrCu2NmxezgqWXfaqcPqN1tFYnyZgrVJAIVvZ3mOp879ZCzIVkZOwuv
 iU6Nwze1oZDxhhXKrXUruiCTUcYDzcvxbVRmsfoeKkW19/Pgc6TyvivmrmW8k6GEL2ww
 4M0Q==
X-Gm-Message-State: AOAM533w2Cq+ShtQgrV9+B/OSf8fwxn8NXYtDoj0D1KqnJwwdLugEIKC
 jmUkrlrZESi1SUd4jBX+442/jyfopzjmVQ==
X-Google-Smtp-Source: ABdhPJy/qX5s2E/jLJsvII8+siT5LuOIrYywzGOEyLvMOrkQ6pRobv0L+e6n83dwD/3JM2IetjjaRA==
X-Received: by 2002:a5d:4ed2:: with SMTP id s18mr2744512wrv.36.1604580600491; 
 Thu, 05 Nov 2020 04:50:00 -0800 (PST)
Received: from localhost.localdomain (host-92-5-241-147.as43234.net.
 [92.5.241.147])
 by smtp.gmail.com with ESMTPSA id n17sm2188378wrw.69.2020.11.05.04.49.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 04:50:00 -0800 (PST)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8192: Fix build failure
Date: Thu,  5 Nov 2020 12:47:47 +0000
Message-Id: <20201105124747.18383-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_075003_307021_497C4BBF 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

A build of arm64 allmodconfig with next-20201105 fails with the error:
ERROR: modpost: "mt8192_afe_gpio_request" undefined!
ERROR: modpost: "mt8192_afe_gpio_init" undefined!

Export the symbols so that mt8192-mt6359-rt1015-rt5682.ko finds it.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---

build log at: https://travis-ci.com/github/sudipm-mukherjee/linux-test/jobs/428486008

 sound/soc/mediatek/mt8192/mt8192-afe-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
index ea000888c9e8..fbbe9ed9adb3 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-gpio.c
@@ -160,6 +160,7 @@ int mt8192_afe_gpio_init(struct device *dev)
 
 	return 0;
 }
+EXPORT_SYMBOL(mt8192_afe_gpio_init);
 
 static int mt8192_afe_gpio_adda_dl(struct device *dev, bool enable)
 {
@@ -304,3 +305,4 @@ int mt8192_afe_gpio_request(struct device *dev, bool enable,
 
 	return 0;
 }
+EXPORT_SYMBOL(mt8192_afe_gpio_request);
-- 
2.11.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
