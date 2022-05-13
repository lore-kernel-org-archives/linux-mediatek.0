Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F0FC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 11:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vlvYxTQn4Be24iScNeR3QNwqO9wSXbsYHdE6w7AZ6Pw=; b=nZJJR2JrzFiKVMJSY06S3dfRYM
	FZlKRHifGQvDG8Q3E8R+0KqA8M90iXbkZ/ldOIl5p83yJ2C39lM5KqfTS300PiWy+z5GOor6t2Oh/
	NQYfrftBwJpDqiMuMcp9zoZhubcNY2Px20LJmdgwRHxd1QI81SnCVg9t7ENWvwyYwCvYiZ78Imrwv
	toajH69k/ealsNvflWD5oGWqiealV3/K5RRXE1+7EqPHxz4k+R9JwouJ2ddG75ebx/FQwRd3WrDVK
	2ai+/xG760w0uMzLdKIcwGguzFDPS0oOdjAy9FTRoJLfj7hJTXVd0iVYIC4Qlw4c2H4aiZbxd4Ng5
	UyQc7fYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npTKN-00FkDH-Tq; Fri, 13 May 2022 11:19:23 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npTKL-00FkCl-Ua; Fri, 13 May 2022 11:19:23 +0000
Received: by mail-wr1-x431.google.com with SMTP id u3so11030643wrg.3;
 Fri, 13 May 2022 04:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=8rkt3oYxVOR/PWPQlQJjtJ68ePt0dnMvHHHA7QmnJP4=;
 b=orP/HtIj9hqoy7n5j6hIM1bz9YTqi2yl7naaEdwfueFMCQlBsETdbQVKuPL51+kqMF
 21JJXE5Z3cAyHgL92d4cqzwsd9z4DMAefagEZYm2CMnxXTKKsz4uVnZns64ajAJ1vsk2
 ZO5JNFK01HbZWPJbo9OZBu8+nloSi22HCuN8sZS11+tv7WpvuLuaooHvJFc3+K2IByiZ
 secO3eILRL+QxfHEmsz6wNtR+lnjKmumCdvUMEah4jr3YDv3SoNH63mKpLtYoXdVzNF+
 cHQFid+JeVQzsKQnnEq1x/kIE8xQ17I4H/3lC3wig86omlBMnyUhfEy6j7NdyQXwm1k7
 4BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=8rkt3oYxVOR/PWPQlQJjtJ68ePt0dnMvHHHA7QmnJP4=;
 b=voQ9fRl9VfcU/MQrXv7Zmtl7zUEtxRUkp3cDKvWuuJmy+//M2e4vWXH53SmrzQ8wtR
 OkqT1RkHIl1YIBLpctJjhMPQEkDlTVD2FLq1e8eNeDtsGUaMunnKMATTTyTLd1nEUZZI
 al6sdHPPgg+CQhaPLYqjzSaMUohIfy5hAPJX0/wzv95gBtsyL2y4Yz6SxhlhuJsVWXox
 +deyYK63ejnWrmghW3gVo77dtmTqYz37YkkcHG5hQRZCtY23Bl7f3ETHzHXqa7elqTti
 jvil6s1v9BXjjysP+8ub91VjvHZqaXawQ8rrTYtD+MCWcdsWRVHANDf641m21+ugm9UY
 eLtA==
X-Gm-Message-State: AOAM532uyFfjOHNoCqb0U+h66BCXL7JzYKPZReiJL0S3fylZbTpepRdh
 gimbC5f6JagW+iDJ8i4XtCU=
X-Google-Smtp-Source: ABdhPJyexHP8kaHyufl+k+uLIpA7VyOfrzsHWz7cX5SucO2kdgYMe8edDObAbBWleF2jJW9Wx3OemQ==
X-Received: by 2002:a5d:6d0a:0:b0:20c:b640:45b8 with SMTP id
 e10-20020a5d6d0a000000b0020cb64045b8mr3487935wrq.708.1652440758031; 
 Fri, 13 May 2022 04:19:18 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 b9-20020adfc749000000b0020c6a524fd5sm2218972wrh.99.2022.05.13.04.19.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 04:19:17 -0700 (PDT)
Message-ID: <3a6e5606-7b89-2ad8-7b45-21d3a4e9e706@gmail.com>
Date: Fri, 13 May 2022 13:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Chuanhong Guo <gch981213@gmail.com>,
 Fabien Parent <fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] Mediatek defconfig updates for v5.19
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_041922_032291_2AAA4163 
X-CRM114-Status: UNSURE (   8.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Please have a look on the below defconfig updates for v5.19. Apologies for the 
late pull request but I got sick and needed my time to recover.

Regards,
Matthias

---

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.18-next-defconfig

for you to fetch changes up to d66aea197d534e23d4989eb72fca9c0c114b97c9:

   arm: mediatek: select arch timer for mt7629 (2022-04-22 17:12:05 +0200)

----------------------------------------------------------------
- Enable essential PMIC and regulatro drivers for MT8195.
- Enable Arm arch timer for MT7629.

----------------------------------------------------------------
Chuanhong Guo (1):
       arm: mediatek: select arch timer for mt7629

Fabien Parent (2):
       arm64: defconfig: enable MT6359 regulator driver
       arm64: defconfig: enable some mt6360 PMIC drivers

  arch/arm/mach-mediatek/Kconfig | 1 +
  arch/arm64/configs/defconfig   | 4 ++++
  2 files changed, 5 insertions(+)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
