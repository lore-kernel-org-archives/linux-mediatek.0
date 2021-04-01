Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B714EC43460
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 13:59:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EB49611ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 13:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EB49611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2BaDVBmAkwGdfUZJd3AJr69cSimcDhf6oo3mRuDsf88=; b=O3szJ3L9O4KmaB7QGSRPLSp1Rt
	oAVSYvyUc3WP5DmPZrID8lAtcg93iQDpEpY78hi0a0aZIK9KNIMmIMfFoWrv54yGAvki13QoIb92U
	ydbM6Tg+PMJj1jevSv6uVxXs12R+Dd+KhdW6/6nybaR6K18EQ+ThVZRq4SKL1A9FaAHb7Y68PzXpW
	o7TMHytxjzWVXq8DFB+l/ofcFsBt5lYySrb4nEJOH2e97mwTJzvkr7KSuAgbxn6Us7eHRoJN6FTpS
	SlQdUWrq0Rk7VKoUfmuvlu9i2d/YFmGicjRhVCWbs8pZ5h6aCwe1zzJUuWjxgdgaGVf/hTY5Qx5FC
	af+os0YQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRxqk-009leP-Us; Thu, 01 Apr 2021 13:59:07 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRxqO-009lVD-G3; Thu, 01 Apr 2021 13:58:47 +0000
Received: by mail-ej1-x62e.google.com with SMTP id b7so3060670ejv.1;
 Thu, 01 Apr 2021 06:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=xTb1jwz8SQDmyElm/xtUO1oJ/mtFdgNw0V3dZ43+jcI=;
 b=aqsla2a/ZfdrAn8xkqcG1DykVFT8gLVzGJv3cvduLc624BYv+82eMmM1c6gIIPQZpE
 lekvBuVdifF6zTvWL61DO3A8uNd2YZSHhmVDCdi5wdp18+AwSOZMnQ9a4/qJceZqoxR+
 CxefkN6p6sMUZsayfdr9sE+6NMFXvWjts6M5Av9+1HRoO0PudUiN/FSsC0aE17xZ7POW
 b4G7WiZ5ZO38C1U20A+R6/kVRNJnet1v2yTMjyQ8F9lm2mAA0f7WbbMWGGrIFcBL+L0G
 dkzoWmcFOfht4Vg33Fa/sF3/GJeuqqEzQQ/7mu/o4M3E5ZD2NU4Tyi479bPgBpFYNLFV
 ZL9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=xTb1jwz8SQDmyElm/xtUO1oJ/mtFdgNw0V3dZ43+jcI=;
 b=mpC1dVmVqk47JLLLXIGOe/DhfcpAkh2hr5C/qn2yXvw/iLDImV/97jRGYobTzma3Dy
 7uRnyZKHKl3Y70LvA6w9b5HNeLAYvYIC9zX8wtzSaxTYkR28ujlH703Y1lNM6rRcUwd8
 wv166pTzUQXMpNy4dwe6v7saaIyUhZaMiv1xKcBmhTyVIqpNAToup+ij8RIRUWyNo6dW
 gMotIzh1Ss2wu+1hZN/7Oi9o8XuLQSV6BfuHy42speRwCKgnpsI8uPrKt6Di+A2niW6k
 REWe/221qfNqymvrSV9P6ef6uwOB22sDLp1A9idya2mfucragVa6VN9+4Sfsz9DbupPn
 cXLw==
X-Gm-Message-State: AOAM5302rKKqW7w/u2kmphFHPXYg7dzpShFZ58y6XZDMov79cFjotlAh
 LgdepxyzklvS3XD9ZKWcXVE=
X-Google-Smtp-Source: ABdhPJzxMao7xjcNhb1A+vwGPbTmLoQFLDt6Kwn60PwROSaODT9ewxHmJoIKKgSazfaEXrK1mJJDXQ==
X-Received: by 2002:a17:906:3544:: with SMTP id
 s4mr9395502eja.73.1617285523296; 
 Thu, 01 Apr 2021 06:58:43 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id hb19sm2803175ejb.11.2021.04.01.06.58.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Apr 2021 06:58:42 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek: changes for v5.13
Message-ID: <70f6a2ae-2a99-6861-e591-9cc71bb174af@gmail.com>
Date: Thu, 1 Apr 2021 15:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_145844_799997_97D41E1B 
X-CRM114-Status: UNSURE (   9.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Please have a look at the following changes to defconfig. There is a small merge
conflict with the IMX branch, but it should be trivial.

Regards,
Matthias
---
The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-defconfig

for you to fetch changes up to f6dc45610879f88b1c37c07c8342f6764bcd55f4:

  arm64: defconfig: Enable options to support panel display for Mediatek
Chromebooks (2021-03-31 12:12:59 +0200)

----------------------------------------------------------------
Enable option to boot MediaTek based chromebook (mt8173 and mt8183) with defconfig

----------------------------------------------------------------
Enric Balletbo i Serra (2):
      arm64: defconfig: Allow mt8173-based boards to boot from usb
      arm64: defconfig: Enable options to support panel display for Mediatek
Chromebooks

 arch/arm64/configs/defconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
