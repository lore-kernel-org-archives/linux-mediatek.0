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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C7C6C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 11:01:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5106611EE
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 11:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5106611EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:Cc:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3zNU7TfFqkKMqIGqmgaVBLS758/FMqmUj0yz2cumYaw=; b=GSbsLdgUJL8xvOsNUIe69quSUU
	k5ujNfEndH8qf+vdXvI0iYpPOvgopMC9ASECmoKKOMWaCUyadAsIxYi3i9ze+aaT1n0LgsgYLNZsE
	iHyMRysof1uA1VvLZM+oNjxn1T8z7RzX6QZNvKw1IlYT2If4TQxe/eB6jNkc/t7OFHErxPBrQGb4O
	Rh8ihO449UX+45a3gBmd0phIo9S2OszRPl6cRPAzMGbPcZqqRTFYhwoQs2fSJmT1Ua5uNKIDrD+H7
	Ug+7MNraKKIUiCDhPiwlV1phB4SMEyeF7qO7GZxcvGoyW566OQO7Tq/DrtWEDv/J4BfQ3hUzrJNQs
	g01JtNlg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU5vg-004nr5-89; Wed, 07 Apr 2021 11:01:00 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU5vA-004niQ-TF; Wed, 07 Apr 2021 11:00:33 +0000
Received: by mail-pf1-x429.google.com with SMTP id s11so12630393pfm.1;
 Wed, 07 Apr 2021 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=LQOymtko7HIAx5KTgF2SvD7yA3dJoLvQ8IWqPxL0aAg=;
 b=MxFMvHw92o+NleiXmGY6uehuhXwpuXclR7qxQCgz1Jmacm9tSFdoqYhiZd51wYtIUc
 O4nOOKmdVsh88W6ikSX/v+/HwHrtHctFPWYXaxk8iJy5xs5HOgDsEApWxmUpjoBXGG86
 RVmG1PRuHPnu90n41vYsSWtYaXuBZgzRCKHtbdiHXEJVy/E8k7wpxmj5EybvtGhBKc7w
 9qMy0x05WObSvyxAM+SswUZdAauaZedxsLjlu9cxh+1kUbYs22RO32ZJH4w4wogUsNmx
 RNEpOsc6iU0fTIju4NdxsU8+nXFj782EAepThpu3TfKMRMBXpaGiDDAo6FWEEkLHwZDP
 J3Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=LQOymtko7HIAx5KTgF2SvD7yA3dJoLvQ8IWqPxL0aAg=;
 b=J3CmEz5+Y90gfJM3UqjdT0bVHZ8DD9YE/9j7QAhpfSFwLHLTvVteI8eHt3dzXM4xWY
 IOSx3znFSXZabqujtZMXG7xMI0yOZtLIwjNkAdhJRsyGcyB4781eZsN92vEOXra/H5nP
 Dw8Ta3YglHOuCEptbwx1FrxWV2g+kMMNaxw9eW8QDxoUchC5PPC077piJ/IIWRNNm93x
 PYvAHXIeul4mFg0fw16ewEbIspRI+icGuLQK036D0RxG5Rph6oMdeyt0mHAXB530kqPR
 g1RguXRp8ChSL4pwTwi0vuXE0FnsQqfT8wlmmolZ5UuWuTb04V85qpxCiEUZECpputn8
 L47w==
X-Gm-Message-State: AOAM5319LIqbAD1bGTMHcBV/3jSjSWxsoys+OttoFddo1wuJCzEijkaI
 02oqsxiL/2bSLJFwpaWtg+k=
X-Google-Smtp-Source: ABdhPJxD1TZsuYjrVq53MEHRkgQgBKHD7KPa9iml5EDrde+7i3N9eN3cRfMeDqMrQmdAKkSTM/EC/g==
X-Received: by 2002:a63:5466:: with SMTP id e38mr2818659pgm.172.1617793227543; 
 Wed, 07 Apr 2021 04:00:27 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id d24sm5033895pjw.37.2021.04.07.04.00.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 04:00:26 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>,
 Irui Wang <irui.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
Message-ID: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
Date: Wed, 7 Apr 2021 13:00:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_120031_041720_B33D2CD8 
X-CRM114-Status: GOOD (  10.11  )
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

Here comes the second round of arm64 DT patches. Hope I'm not too late.
Basically we add several node to MT8167.

Please have a look.
Regards,
Matthias

---
The following changes since commit a7dceafed43a4a610d340da3703653cca2c50c1d:

  arm64: dts: mediatek: fix reset GPIO level on pumpkin (2021-04-01 11:39:10 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-dts64.2

for you to fetch changes up to 3a8c657a3b4a70405582bf8e1cc39ff3b55c53f6:

  arm64: dts: mediatek: mt8167: add some DRM nodes (2021-04-06 15:12:40 +0200)

----------------------------------------------------------------
- separate enconder blocks for MT8173

MT8167:
- add power domain node
- add nodes for graphical output (iommu, larb, smi, mmsys)

----------------------------------------------------------------
Fabien Parent (6):
      arm64: dts: mediatek: mt8167: add power domains
      arm64: dts: mediatek: mt8167: add mmsys node
      arm64: dts: mediatek: mt8167: add smi_common node
      arm64: dts: mediatek: mt8167: add larb nodes
      arm64: dts: mediatek: mt8167: add iommu node
      arm64: dts: mediatek: mt8167: add some DRM nodes

Irui Wang (1):
      arm64: dts: mt8173: Separating mtk-vcodec-enc device node

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 270 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi |  60 +++----
 2 files changed, 301 insertions(+), 29 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
