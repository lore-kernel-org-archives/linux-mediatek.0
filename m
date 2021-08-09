Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1317C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 12:20:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 791FF60F55
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 12:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 791FF60F55
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aZcBs8i6xvV18Qb9/m6oc0NqpOhzjCAXIrdCHLVscSM=; b=Mt+pNUrqSIIlZR
	vqBpobSC1nz4gKlbPGBaIISapcpMGWZG7pmpdY9YIAfzSZjBVia2Zyw9VxwMnHwvFVCmOX/NJPWWz
	Sx++RzAKqf82iO6MQXU9Y3LslJEapn4EBY9+da9p175HuPF8H1JyJK9S398XiGKNd9e4g+R4eDiVE
	FBWIAx9nORx9jphe0+QFxE+RRgR7T2SDBPuZqdNY/Wxxjbk0LaJN4TTJhAPkPJf7CE6CKyfOuyv7Q
	E7nTJMj9+7Q009b2YYvFpnxFSWG2Pk1HbX3KcJsh/kK8qLm2MMBjmzKh6ljaGPydEJV8gp0lO1a1V
	GnhVsQYNMCtAugvT0elQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD4Gl-000WT5-JJ; Mon, 09 Aug 2021 12:20:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD4GM-000WMW-E3; Mon, 09 Aug 2021 12:20:15 +0000
Received: by mail-wr1-x434.google.com with SMTP id b13so21173892wrs.3;
 Mon, 09 Aug 2021 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=1/Vf6khXnMrxkAMIT2n3x/n+5pDItmvi3VuJWN3SJoc=;
 b=Aag/zScHv2Uw7pewKl5p/Tli0gqoxQqe4OsnKmuW9smx2rAGXO8CCeVCjXblDpmYJt
 nMVMMEwf6CRvU5T6qjOsvKV3PjdWRTDWl/YSuUUQ0uK4kL0mTLXDhJwKVk0M2AC9p07M
 hQx073MNXcWmtA65uuLSP/ZHbJm07BPgW2gDCfjtIN7Arn+qOHwIsZVb+pOdUfbZC9ce
 4i2M/l4ahpImfqkLqnIZq4ry9gpv/HzB0ip+M2XrjEqv1VaYMTbk+la49hZFR4zqb+od
 HL07drGAh7X7m3YGkwO75Tcl5RIeGRTdKRxiGY+/xRz7uNATiUhpb1TvraMcc+Cop8YL
 h+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=1/Vf6khXnMrxkAMIT2n3x/n+5pDItmvi3VuJWN3SJoc=;
 b=DKC+PNsgP1yUpS0qUAM86/PJcbvS4Hc1N98N04HsMw2Y+cQRI6cUeiS1Uv0Hkf6vmJ
 2sc2hx6bO6a03hgh5QDnoU+do65IxKqJUMsn1Ia2jXEzQ4uYJ0Cjiu3pF14JwMNtwsX3
 vvBI0B6N1u3gjIvKNDHSMHpz1tYn7bpS4qVuonrJ+kkzsNH4/vxr/FQINCBmV0CoxsMR
 vX/2ZuKnNLxzsJB6KOo75CE2gklvB5GAE1xHyrJhQPvZyJpjuTyXQtLs95ldbB68j4vh
 tF6IrrbIef7hNCDjK1scLTHAgtciVmf6uv/ZEwdFmGXeXFJEbRnazA0w5qfxvxSVjMUZ
 qJ5Q==
X-Gm-Message-State: AOAM531AKOdUey81JGuwj2DpgdVnXrSyJRtuggk/tWVswiFSIusrbODA
 gehbXZK3V/Qe7BbD/I25VqQ=
X-Google-Smtp-Source: ABdhPJyeQrS6U506drqM/mRWodOZkXMDuZnGOitClStMmWat9pBhcNXm2avMXsszjMO1sMPL+MwuWA==
X-Received: by 2002:a5d:44cb:: with SMTP id z11mr25066859wrr.100.1628511613037; 
 Mon, 09 Aug 2021 05:20:13 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id j4sm17427937wmi.4.2021.08.09.05.20.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 05:20:12 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Bilal Wasim
 <bilalwasim676@gmail.com>, Hsin-Yi Wang <hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts updates for v5.15
Message-ID: <26c4026a-9f26-d5a3-c30f-439120a4eaa0@gmail.com>
Date: Mon, 9 Aug 2021 14:20:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_052014_539577_9FAA6663 
X-CRM114-Status: GOOD (  11.55  )
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

Please have a look for the arm64 DTS updates. This time we only have smaller
changes for existing boards, but no new HW. But don't worry, probably for v5.16
we will see some new SoCs.

Regards,
Matthias

---
The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.14-next-dts64

for you to fetch changes up to ce5db043d2e8811f30de3ebb5d9e6bd8a33596c4:

  dt-bindings: mediatek: Add optional mediatek,gce-events property (2021-08-05
17:37:54 +0200)

----------------------------------------------------------------
MT8173:
- Add regulator for MFG_ASYNC power domain
- Use alias for MMC to get fixed numbers

MT8183:
- Use alia for MMC to get fixed numbers
- Add optional event number for Global Comman Engine

----------------------------------------------------------------
Bilal Wasim (1):
      arm64: dts: mediatek: mt8173: Add domain supply for mfg_async

Hsin-Yi Wang (4):
      arm64: dts: mt8183: kukui: Use aliases to mmc nodes
      arm64: dts: mt8173: elm: Use aliases to mmc nodes
      arm64: dts: mt8183: add mediatek,gce-events in mutex
      dt-bindings: mediatek: Add optional mediatek,gce-events property

 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 15 +++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi          | 10 ++++++++++
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts           |  4 ++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi              |  2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi        |  2 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi              |  2 ++
 6 files changed, 34 insertions(+), 1 deletion(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
