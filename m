Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA56CC05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a5KZiRymOgmoFKYb+8KOC0oIVQvjXLlNlO5a0oUzbIA=; b=SNoEJ+wwCFHEg6AViVaQXPOw56
	ckTI4EZ2MYojN4VyWMyXH1exrNI5bZRrBrl68fsHTY1Bct/5JsiqtM/+8tmNvg12t9zOZaRb+w5Uo
	hMIV6Wbh/2jnjyPEwCa5AcGzx0YHqsXHkfJWhpgaTtyYVchRNzs45QsHpqGkYQ9zBY4QStuEhZYsb
	eASmIoe56bOeyXtSpij7LIpwDCxzXzjMKnSgz5Dgh6GJxhnN+wZJ+s6xwqdG+xZ/xXYeY78xfWFVH
	HfPMTEAKlcTJ3vitXeM+7j/kU1u9NovVzaQH/KkVzJx9gkUbtc5XgzWBaDhtti91xVZtuwMTLp5Lh
	D2gLr0eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHTA-00D7ZF-C0; Wed, 01 Feb 2023 18:04:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHSw-00D7Vb-HT; Wed, 01 Feb 2023 18:04:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l8so13311402wms.3;
        Wed, 01 Feb 2023 10:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5KZiRymOgmoFKYb+8KOC0oIVQvjXLlNlO5a0oUzbIA=;
        b=aRux9YeBsiH2fL6KfgbAKLyE3sNBDd3BocoZKmTpwA90gnMR2gpbghljQk3JfHgPgy
         38eWNkef5SWeS2DG2lZLPj95YOgFlfo65uiWtGmJNhQV2/g8LsNE0dG13qBfr7ON9TYb
         iGokrU/f0uVuZ40wS9X27Sqfp4on7rZc7xtz/nPIoXjcLmAO36mN/kuut+zCUni3MLA7
         stGptPSdjZBoCbR+vjJYnWziMKKC/E0Jq/lXJzdU+xpX5D00wlrU3vYvzqw4g79IpGO/
         5nsN+V02nHdv8ITr6M5X9fmq9O87EVfI56jZFsffFUchQgsaZ1YsJ1wq2FDubUnRg59H
         i6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=a5KZiRymOgmoFKYb+8KOC0oIVQvjXLlNlO5a0oUzbIA=;
        b=Yc6Uom3VuYgvsbgUIX91b9v2bojnMUVvYuoWVJwAj3D3yiGuqkPIWIxg/8sBwckkxQ
         CX5LAoTXIlrCL/2kOPAsJ6mtIdygX28Tr7zZ+1vz5DKRAXRU2l0pJeln3nUHsmjias76
         4H5vg9u0U5JL2jZEUC6zgXKAb2Y8sGETf32Gwjw5QbpqWlDP790W5aJQKlBmRgUCy0cr
         As1U6zIP7WfbJhBiOiPx4X2YpOMSyhBPqjP9xF/398WSM3Zu9GAv5IJYdcfIQYsfVAnH
         sdSqLfKca1C31WTFSc51lKbMhIOIWY3tCUURwUR/egQI5ZeOWGOZViNNS2Vc055B52w0
         mRWQ==
X-Gm-Message-State: AO0yUKXuUHn6PW70bF1fFIh/maBGkbFrEJqSr53g5yW4ay5dJtAY0/Qf
	u68z3xH6GhBGfDXibZZROvkkoZ8c6fU=
X-Google-Smtp-Source: AK7set9kk0lcUIlRMhhZtfA8auRzjpmAooJQay9/78Dr+EZSBsrlntyCTXYT0CTkmeLGrXbSIOt2sw==
X-Received: by 2002:a05:600c:3554:b0:3de:e8c5:d830 with SMTP id i20-20020a05600c355400b003dee8c5d830mr2552480wmq.28.1675274650534;
        Wed, 01 Feb 2023 10:04:10 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i40-20020a05600c4b2800b003dc42d48defsm2273504wmp.6.2023.02.01.10.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:04:10 -0800 (PST)
Message-ID: <17aee808-1f3f-fe75-68d4-adb71915e5cb@gmail.com>
Date: Wed, 1 Feb 2023 19:04:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] ARM: dts: mediatek changes for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_100414_596133_97B7ADB5 
X-CRM114-Status: UNSURE (   9.25  )
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

Hi Olof and Arnd,

Please have a look on the 32-bit DTS changes below. This round it's just a few 
cleanups.

Regards,
Matthias

---
The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.2-next-dts32

for you to fetch changes up to f104d74bbf4859a628c2234d6f86a53949b9b1b8:

   ARM: dts: mediatek: Remove pins-are-numbered property (2023-01-09 17:17:19 +0100)

----------------------------------------------------------------
Clean ups only:
- deleting unsused pins-are-numbered property
- not existing second IRQ

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
       arm: dts: mt7629: Remove extra interrupt from timer node

Bernhard Rosenkränzer (1):
       ARM: dts: mediatek: Remove pins-are-numbered property

  arch/arm/boot/dts/mt2701.dtsi | 1 -
  arch/arm/boot/dts/mt7623.dtsi | 1 -
  arch/arm/boot/dts/mt7629.dtsi | 3 +--
  arch/arm/boot/dts/mt8135.dtsi | 1 -
  4 files changed, 1 insertion(+), 5 deletions(-)

