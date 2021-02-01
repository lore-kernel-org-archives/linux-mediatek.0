Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEFCC43381
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:31:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB5264E11
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:31:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AB5264E11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8BsiUqitGutJCjPuPHVKhEjnDrvXSEuJRCL3j4M1z8w=; b=wFdp7oBhcOcG8pj6Iqx9z1rTZq
	Y2NRhY0713QeX7yvkQZwrC5ENx05CBmNvRnYgp0972hgCvTGnHISMoJmHZogwOSEfUdn/4jOIyHTs
	jnawEyCA2o9tbbdiRLFM4Q+yn6DOv9sUt6ouKBpOCbYs+u/G5vhYaZGgkjvHzV64VJRmNYIiVXQgb
	z+9f0jRq2+fbsKF80eKew27S+EScXj0+JO4XbGJdvnx5fBont4jjjxOqQ3yMofQIayTNWUh5fsLnc
	Ck4tF+3S2vEGhp6LMsHFIAcLKOq9jN+PzlEK4aJGaH3Yd9xpfz6s03kY7ZTFTZCtC7eWe/Y3zyaSu
	KcyDbA5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6WTy-0008Nu-Ef; Mon, 01 Feb 2021 10:30:58 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6WJ1-0001lb-6f; Mon, 01 Feb 2021 10:19:54 +0000
Received: by mail-wm1-x32d.google.com with SMTP id i9so12678160wmq.1;
 Mon, 01 Feb 2021 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=jYgjAhuYor8KZh31mkKvytdAEVtP07GKVY07yWn/bqA=;
 b=eVF4tlseVEcY6UGfJwihEyzVzrpK4onBtWkBjI0rYTgUkGq4koCjlrxUYXOfGQ0AKv
 jTbJCdrXnd364JucdCpGtQ0bNvQA/SzvNJKZUoJvdt0JpoYoJVgm4x3sybjkyzfmcuMb
 f6I7jYE0yUeE16dzYRU4flRtOg2QT7i2BnKXM+YcEEqoA99v+DX4ey7K2Pbl/rfvg2Ra
 WnHik9Yv3tpkTncV8NV3CBlXEhYVl08cocr9mPh0JhQrlMTVQXkCRLafRuHWYMJjSXiU
 mu0N5L858edWBaKKYmyD18EqSu4MdHpIXFhZ/WSt2m9k/NZ9EC5dCwI3RE+JtT6WMj0c
 HNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=jYgjAhuYor8KZh31mkKvytdAEVtP07GKVY07yWn/bqA=;
 b=Yo+U1h3rpKsIdKuZ3bXEdyeMcq/vL0BPr3naYt6xwreJv+tC0mlLzGOOCds5D60bsm
 5h8/bedAiWI2w72ofF/BLV1NXu8QOFZz/E6fSgPkXLT6vWhYHKHqtuIX2EnN3wFb7KdY
 yvLOfabu0+DQMwTZRYT8nOtnfKWP6IMgT6SlzAYLFS5SwnXJjuIak9DJDkhYp7QF52PT
 VnGlmvRmeZb12dsHXNZEkExI9BVZDUXzyMrD/CA1H3VoY2ZbvtbbAarWqBVRZ4cBgPqo
 MncOCJMCw1Sq2TqrnlYbQH1Bl+OxxsU9K1CT6CVvUZUnY6g+z9tdvGpBsz7Bc7vh+9rd
 UaXA==
X-Gm-Message-State: AOAM530hppgF8byDLuIRd3cJ8N8tu1HnZievhDEpSDVvUkT6N9Sx6rln
 wDHMyxsbfnz77r5itSoe8+U=
X-Google-Smtp-Source: ABdhPJxOgwVGrhvLlhi1Yv2PKZyVe+vODoYrlI2aUzJLxpkh3nMIO48vwj59xXZL6neWUtnSvecRiA==
X-Received: by 2002:a7b:c853:: with SMTP id c19mr4223431wml.118.1612174777432; 
 Mon, 01 Feb 2021 02:19:37 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id m184sm21955555wmf.12.2021.02.01.02.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Feb 2021 02:19:36 -0800 (PST)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek: updates for v5.12
Message-ID: <aa5c6673-f018-00d3-42da-46a4976d8ef7@gmail.com>
Date: Mon, 1 Feb 2021 11:19:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_051939_432686_966C407D 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: Neal Liu <neal.liu@mediatek.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Argus Lin <argus.lin@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Arnd and Olof,

Here comes a few updates to the arm64 defconfig. Please have a look.

Regards,
Matthias

---
The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.11-next-defconfig

for you to fetch changes up to e25efbd140c296b52aaa5f0380628e55578c5eed:

  arm64: configs: Support DEVAPC on MediaTek platforms (2021-02-01 09:50:07 +0100)

----------------------------------------------------------------
- build PMIC wrapper as a module
- build DEVAPC as a module

----------------------------------------------------------------
Argus Lin (1):
      arm64: configs: Support pwrap on Mediatek MT6779 platform

Neal Liu (1):
      arm64: configs: Support DEVAPC on MediaTek platforms

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
