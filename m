Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43780C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 23:41:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CF896147D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 23:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CF896147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tK27ijX/MAfGKroMDjSKbztxDjDZC1U3zctQmRBiKBQ=; b=mRaGCmu8se6tHVBu/fb2cSGN6
	zzaV4GEtyHpuiMMKGOgTObYW7zFgxkCvAmDpvf5fyebyyKb2hMWMxYyB2fOYfx5p95ZQmn3nS2Rp4
	xz82ND/0FMMRvyUXJ6lGfGJ4Q5YBwsbadMdnXst3+UHaEWsl/2sNySN/8bMsFYO7ilos+Lx+p8x1L
	xdgerNB6J/CjgrlMAQehMW/BoxlT1ZrS7VOX5iXJfCr66rqSm7rIshZruASBo2g9jT2Vg56KUv81R
	nGkZQJE/6JRiKfFFQlFlZ20LqK4SyqlSWZFu+HfetfV+0Dh0nQh1I+ObZCgyy7f//WOrxvo71j7oi
	9vnveGNjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcGHM-006jew-9F; Thu, 29 Apr 2021 23:41:09 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcGHK-006jeF-Uu
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 23:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=XhukHwYbMb8O314H4ZGGa+i+YIDh1nbMFFV8k4MmwUI=; b=lKsgjz2HLX8WemM2bu8ErYuAEV
 E+MQ72l5EqRpmeqtnDX8qDlNTstVi+8c9HlMcNOEyQqqSWFF4PO0TKidYdbGGXTrDw8CA8xfRDC3p
 147qNvglNM06/Sq0TUjXQl4K4NWBcbnsdJ5pnZGlUysFiZi72gbDRD8Jm0kQmFeg4BnyF13KVai/3
 hRBcEaLXmO0PJ4iaz7e7dLzpI3Sj9xT6+y7yJb9WypdWNk2s9C/zc8HuFTCCgKvW1NnzBEPIXz+/n
 hKg6hDsn0Kro5U/lHR7SsQEC+ALhNluF/TXysM9GwkglkZD1+iLJqEEwil5j5H9Htj71OP8bNRdfr
 iHRCPUeQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcGH8-00121y-JJ
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 23:40:55 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 k3-20020a17090ad083b0290155b934a295so734150pju.2
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Apr 2021 16:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XhukHwYbMb8O314H4ZGGa+i+YIDh1nbMFFV8k4MmwUI=;
 b=op9P97+VwniEZEgl6V0uJg4liTBfCSve0gYuIwtJV2VxgUw2uUscBqDXghoZPDnU6f
 kmbxPcA8HMaMk9tqhS0jkzO7vEHxBQU70muIVCdylatZ9w3zGSt44TC3VOxcSJHLkdk8
 HF7pjnC265ouFoBV4707RyhBohR2M7FGgk3tuRDZhZxKL8HrWpiXBOk5po+DkFwTPJiE
 KKQNrgRjFEc2xWJhu3cSdmQhT0b5UW/Kmv4aYB6IFMprXMFAviFbSnYw8yVV596Z52b0
 nLL7Ac0HUC1DYwzPnV4gn9R7Y9oS+3ZcDr/YsqIgEWLniuGvjD9Jo9T8F7uT60zX8IA+
 03Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XhukHwYbMb8O314H4ZGGa+i+YIDh1nbMFFV8k4MmwUI=;
 b=d2E7KEVbklC0N8wooyXSscYgdZObVXMA9dOw0KQYmcSvGzknIpjHJg9ANLh2B7PrJI
 SfbHOB855FR62l3UNamHOhq9QTZiCf1H1AgQ1xwqsI7wrSTF2omUgBq6xv7gpMoWy+rY
 cuj+keixhhYVoXRHCuQE28btPmk9YtNRrFVyiTIk3QS9eHjT5B5pwv7jtYqz16r6Rt7Q
 aLl6ZH29I11dwyk0xb6H6cBaS23baxJXvN+2GA+04nRDyH08owMrY9b93vvh2GGQpteu
 3D5cDP8/kvqkTRRyZQwILWUIaQT4bi3mQWTW4pJ4UEue7+rlM3+34iQ97Nv6WPYdUtcY
 1nuw==
X-Gm-Message-State: AOAM530wOMsxIrUas4KjtG93g3wqgPa7wPTWAkwDYczDK4/UYREYCszA
 /XTG9T97oiZEeX9Q3sQr2H4=
X-Google-Smtp-Source: ABdhPJwjGyTLCdT6s5cn8i6gJu489rSGDxoyn02TFF4vVytwGrZ2VZpOChwO4adx+To7A4ZukzXXtA==
X-Received: by 2002:a17:90b:3615:: with SMTP id
 ml21mr4991739pjb.28.1619739653805; 
 Thu, 29 Apr 2021 16:40:53 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id q21sm23807pfl.152.2021.04.29.16.40.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 16:40:53 -0700 (PDT)
Subject: Re: [PATCH net-next 1/4] net: phy: add MediaTek PHY driver
To: DENG Qingfang <dqfext@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?=
 <opensource@vdorst.com>, Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-2-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7330e4f6-5e7a-1993-1577-fefaa163b6cd@gmail.com>
Date: Thu, 29 Apr 2021 16:40:39 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429062130.29403-2-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_164054_672551_69B1E7BA 
X-CRM114-Status: UNSURE (   8.62  )
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



On 4/28/2021 11:21 PM, DENG Qingfang wrote:
> Add support for MediaTek PHYs found in MT7530 and MT7531 switches.
> The initialization procedure is from the vendor driver, but due to lack
> of documentation, the function of some register values remains unknown.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
