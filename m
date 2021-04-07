Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24D4C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 11:01:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36786610D0
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 11:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36786610D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=I1RxTQJ0ZSLSHcLyk+JD5OYQ6H8Vp7ROjpXd8Snlxz0=; b=TQh0znFrXymj2wZUuFYIshFbbM
	qHc8X7kWSJmly8qe/zjbMZyFvxGtDonGlAezootCQ2Kk/CVGGQjDKEuf7o9qoYI03AxpDTRCPxIrJ
	BrjyatkbCazfVpkoH4zChhKxfGVSpCnuMOi93QFuCaI4EtQO7uUqq2+GqQ7mLWpJZV2f5yeRsaweI
	lVuGkjA6hPjRlm3Y096dGbhDQRfqGQfpaUNMQjG07RWinigUtMDCje7xwYPd82bAs6CFcNAWuYZ3x
	mUjXS7HmRyDqvFSJMpY5TtCTccUTYp8frTetQiU2HfyofVGdYb3dw8w0RYKvIETdINbKqIChN+Kik
	o5tapNqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU5vb-004npl-SZ; Wed, 07 Apr 2021 11:00:56 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU5vA-004niA-7g; Wed, 07 Apr 2021 11:00:33 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 d5-20020a17090a2a45b029014d934553c4so350087pjg.1; 
 Wed, 07 Apr 2021 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=Mt9KfRdpeYOA5awgbDGEbpZTSey436IhcDpa95JCGAg=;
 b=vf+jW23hbPu165Z6rb8Wd0nORwct8v7KoxypIcLpXXeVQrrvog3xVvxx+gv6wt+DEx
 e/I8WqC5L4yCkp/G31qtKszlE1WrkkqW1E/iuLR5P1TtoILivTLUpb73L04I3BKtgkzE
 9gzKBW3Pi/NGI4r6055h6Cr24Jh7VmcZ1Sr4umLb8DahZNXcBgUEGJ0xBtC4a6i40vCW
 eQhTT680ytDOZ5nZGjW7qmhUKSZDdD77ftU+qutMQygZev8SGjB7LW0SeMpgN9BXevGn
 SZkb/m6i8HkfUYOGo50tibGeZPLusrB9hNbqajaYqhO2J5VmYj8MCVLjclb5THJUR//T
 WKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=Mt9KfRdpeYOA5awgbDGEbpZTSey436IhcDpa95JCGAg=;
 b=HO7nFmQQL3DCnTJo6qmnFY0KgANu3d66DVUerdG47kXuFr4jGTMikXXf8v59nLieha
 R5m2R4tes5ehW6Tjx4Wd78VWN4Bc3AKLF457yY0hOEIj8WrNMF8Ox9y9ODDzDlXlSCYX
 ZYWkpojcKgVtNF1uo+YkNKurhe0loyNKsGJhMROc3Dp659r5ugfPWgqP9Cy+R1PRm7sJ
 hjZBrPLrOm1xWzXbUrhk3o5qVbTa5i+/qMfcmM6gSdqhoN623zkFIjFnwGCiVafQse+i
 5azIwxU39AWf691yRMpCHfV++/NTfBuYQzezrmArDPfT3uFuyoXzArO4Jah80VyDKbQK
 qw7g==
X-Gm-Message-State: AOAM533qtXtjPJTczjoOfK4H8tnSZFkQWVvLJmu2caNOOBrP8gXfziEG
 aUXgK+kc4aaN0ZC3mBKne4Q=
X-Google-Smtp-Source: ABdhPJyRB+ZpALjRHUybazSAfkHVNhkXiRuqBVDgggcXU4NHm1R7LFP+04DDpq2q+i/YyDMGtTM6Ig==
X-Received: by 2002:a17:902:9b8a:b029:e6:17bb:eff0 with SMTP id
 y10-20020a1709029b8ab02900e617bbeff0mr2550725plp.54.1617793222678; 
 Wed, 07 Apr 2021 04:00:22 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id q13sm1817953pjj.17.2021.04.07.04.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 04:00:21 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: changes for v5.12 (second round)
Message-ID: <14104322-3a6c-e8eb-cd21-a5343a81aa0f@gmail.com>
Date: Wed, 7 Apr 2021 13:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_120030_824893_5A11218A 
X-CRM114-Status: GOOD (  11.68  )
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

Hi Olof and Arnd,

Here comes the second round of soc drivers patches. Hope I'm not too late.

Please have a look.
Best regards,
Matthias

---
The following changes since commit 60d93f64a851d276b23b7ef68ddc638258485d32:

  soc: mediatek: pm-domains: Add a power domain names for mt8167 (2021-04-01
11:36:04 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-soc.2

for you to fetch changes up to 060f7875bd230df1a8f83a988faaee09d693e465:

  soc: mediatek: mmsys: Add support for MT8167 SoC (2021-04-06 12:57:10 +0200)

----------------------------------------------------------------
MT8167:
- add support for mmsys subsystem

----------------------------------------------------------------
Fabien Parent (2):
      dt-bindings: mediatek: mmsys: add mt8167 binding
      soc: mediatek: mmsys: Add support for MT8167 SoC

 .../bindings/arm/mediatek/mediatek,mmsys.txt       |  1 +
 drivers/soc/mediatek/mt8167-mmsys.h                | 35 ++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c                   | 11 +++++++
 3 files changed, 47 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8167-mmsys.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
