Return-Path: <SRS0=M7U7=AV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D97DDC433E7
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:35:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7E9E207DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2020 13:35:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j4BxVyPN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU5vFsGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7E9E207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JQYaIC+Rm4+nN5kXDPWV/4xfQaJS8io/dxBPCxslsGU=; b=j4BxVyPNvegsEG1YwbV1JUL2P
	KGZFIbgZIe8paQW7TQ11Za2U1kmtWbGN1eYfOwQjUFutn5UunaXkCM8XFvaofwvXc08rdtZaUp6/5
	aYJF9b4YGRTeflsB6vZnq214JeEWv2d1SiisWQyPTJW2z05OytX9rAL4Fbu/eSufUW0AtvoYXgcHg
	o3HbNJbfWXN580hCwS+uhwsfFkJLpPe3yc41aDtKcwYMKQwQNVLg4E2C/K6Vn5X/61+XFNXCCSwWg
	eVRE9GyAamf2UqIF52VKVq3aeue2lrblg4wr6fYfAsRYrZ6KFfkdDeXWPPYBqJ2CXQcvBHuNU3Gx4
	xgJzBCyfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jttBr-00070X-1v; Fri, 10 Jul 2020 13:35:47 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jttBo-0006zP-GF; Fri, 10 Jul 2020 13:35:45 +0000
Received: by mail-wr1-x444.google.com with SMTP id b6so5947409wrs.11;
 Fri, 10 Jul 2020 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Pcu0Eg7imOgQYQ8JN6mtpvtmf6u//VnM39M0xQJqGUU=;
 b=aU5vFsGNRzaaoc86acvShDE01Vi87Fv1TgnVd9GBWaJB0URfyEzvQYA4+zUAy46Gic
 sRP7IHHhL2VNfAfynJa32+onW70//VypAZAe5h3ph0VcE16f7zcdYzZ+Yz4f2lz3cIRt
 WjFCOYGpdb3V2qFvtar7M09pbsBo/B5d8v+8u9M8aJ6RbDQvqiDGdXtbWuaXM1GGWzJJ
 0x71DvnBt4WIO8KStt1b0qsDLp8xuhGIAZQohN4h8OcCBeRittgEoRxdr68knrBUeG4j
 EYaRgR0h8uLRL4iXlYqR+BJROYe7HUNGJIzDFmTzCq6GmMFw1aFRJmtEL0F3tIBtcHA8
 Jhpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Pcu0Eg7imOgQYQ8JN6mtpvtmf6u//VnM39M0xQJqGUU=;
 b=q8YTP5hfDiuJiwr9PSLsTyDeWz01MBkKjsv4O7POK980GCenpBRi4gIlJnMObGOjkd
 yOzAWKrAo4137ZPAa2iP92bH4cnS1dRqTNh+UcUsn2j0iP1oXa4IRwRm/A1gVxXMWeLC
 kUh95LnCc4OWNTpN/63GVAiQh+8tNk8fBRz6eAhsEocSpKa7iu2gAvHCAr+uMpXH/SBd
 2QonFeoQFQt8EiBG8m9+NQO1yem49ekviPw7We0Nfd38QHKKfarO/PcqX5LxfX962Qeh
 R/mFjJx+7usCeb6k6W5sl7qe04J+nQWQ2RwrVfeE4ke3f0AaqVH1KethH7IaBqbC5FBU
 4+pg==
X-Gm-Message-State: AOAM531ozUanfhoRLrNa1vdzdxjtnL1jwKVEB/xfXBepOYTp7pPbO/cQ
 UsAVSWuXJg84S/IT2wFaA7ffal4abP0=
X-Google-Smtp-Source: ABdhPJyYDokQFADuzvB+3ohSsCn3hmF+qR7PKc2B+9jiNeNISA7L4M34l2vJL7aOR1Oxvz+Gbys+aw==
X-Received: by 2002:a5d:60c7:: with SMTP id x7mr63692271wrt.138.1594388143209; 
 Fri, 10 Jul 2020 06:35:43 -0700 (PDT)
Received: from ziggy.stardust ([213.195.114.245])
 by smtp.gmail.com with ESMTPSA id w12sm11053704wrm.79.2020.07.10.06.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 06:35:42 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] arm64: dts: mediatek: Add support for Lenovo
 IdeaPad Duet Chromebook
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
References: <20200625101757.101775-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e748b9b4-fa5e-b80b-d76c-305cc53aed74@gmail.com>
Date: Fri, 10 Jul 2020 15:35:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625101757.101775-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200710_093544_560448_5221EE2F 
X-CRM114-Status: GOOD (  20.10  )
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
Cc: erwanaliasr1@gmail.com, drinkcat@chromium.org, devicetree@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mars Cheng <mars.cheng@mediatek.com>, hsinyi@chromium.org,
 linux-mediatek@lists.infradead.org, Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 25/06/2020 12:17, Enric Balletbo i Serra wrote:
> These series adds basic support for the Lenovo IdeaPad Duet Chromebook, a
> 2-in-1 detachable devices using the MediaTek MT8183 SoC. The first patch
> only adds the new compatible names in the mediatek binding. The second
> patch, adds the missing compatible to instantiate the PMIC regulators.
> The next patch adds missing devices to support better the board and fixes
> some warnings found running dtbs_check. And finally, the latest
> introduces support for the board itself.
> 
> All the patches has been tested on Lenovo IdeaPad Duet Chromebook with
> the patches applied on top of 5.8-rc1 and with serial console, booting
> without problems and being able to go to the login prompt.
> 
> Best regards,
>    Enric
> 
> Changes in v2:
> - Replace cluster-sleepX for cluster-sleep-x (Matthias Brugger)
> - [6/7] Move adding #phy-cells to this patch. (Matthias Brugger)
> - [7/7] Move adding #phy-cells out of this patch. (Matthias Brugger)
> 
> Enric Balletbo i Serra (7):
>    dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-krane-sku176
>    arm64: dts: mt6358: Add the compatible for the regulators
>    arm64: dts: mt8183: Add MediaTek's peripheral configuration controller
>    arm64: dts: mt8183: Fix unit name warnings
>    arm64: dts: mt8183-evb: Fix unit name warnings
>    arm64: dts: mt8183: Add USB3.0 support
>    arm64: dts: mt8183: Add krane-sku176 board
> 

Whole series applied to v5.8-next/dts64

Thanks!

>   .../devicetree/bindings/arm/mediatek.yaml     |   5 +
>   arch/arm64/boot/dts/mediatek/Makefile         |   1 +
>   arch/arm64/boot/dts/mediatek/mt6358.dtsi      |   2 +
>   arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   4 +-
>   .../mediatek/mt8183-kukui-krane-sku176.dts    |  18 +
>   .../boot/dts/mediatek/mt8183-kukui-krane.dtsi | 343 ++++++++
>   .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 788 ++++++++++++++++++
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  68 +-
>   8 files changed, 1225 insertions(+), 4 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
