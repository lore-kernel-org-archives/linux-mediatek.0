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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8DDC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 23:32:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCCF861477
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 23:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCCF861477
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qjQpPmPafqKuYXSsGL1CgEmCJAsw7VOuqpObCMPtt6w=; b=E6eCJRnFRfAxtt37ET8ueqikZ
	K2lroXjZovDaMJqvGoMlxA51MDYoPhDl9tiACCKCHmXyY962kQgihZxonbfXLQusH7MyockuHsE/t
	36Fw7YHeo+m5mTIIyFGPUOpncYJL3jJtjl7/c04R3EJdDRQ6aXLjiGwommTS8cfVOC+xu/zXLMmxM
	CLF+9DKwmxJvCwVKKk0PxU52Mc1Q/L5F8A1kKyKIEmK7eb2Bw3Xz8hkO4YrFfY2PRGjRw4ZbJ8qor
	lL2bRa1NgqNJY9k9vCBmmgCsZQB4HltfCjZ74IYEpFFEgcOMRGpU+YFGSuAx/9WrBUuTD4JxY6RLF
	Ha8592Oag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcG8K-006j6E-Pv; Thu, 29 Apr 2021 23:31:49 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcG8G-006j5Y-9S
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 23:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=fzrD8zY4T8i1Ckg0kK2XoOEO/bZAqdILp4zvyRz37iw=; b=fmvCpdVh23+Dmv+fE6/8bnZPBq
 oNTJ5rH0RCbF1uEqB5YNLGuSxP9h9LKw43C2Lu7q0K9nIeRnSAyv9CstAvFk0lEZ2AgVS/FvQfalW
 /YgYPoZfRhB2OH59bk0r6D7ep0Gb8yUSizEWx7bYQJEOFL+gKQo/Hd3QZ9ZoDVdoqBhXKwg8zJpbd
 1wuZ/jr94AyXUS+KrjxKSQupqv+ThR4x5dwmC5wIPA1V4QyZIdI0XcXutWChvWTWgEBLr2IfKzpgx
 pNScHMDUy5Uo2JCxVma18hglJudmYnn3dR/u48UJz2/Qz1O5z5pSRGhOWbV3RmoFgiSJvw1yW/XIS
 RRrjcTSw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcG83-0011s1-Ji
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 23:31:32 +0000
Received: by mail-pl1-x633.google.com with SMTP id y1so19977616plg.11
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Apr 2021 16:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fzrD8zY4T8i1Ckg0kK2XoOEO/bZAqdILp4zvyRz37iw=;
 b=b43WsVVuC1Pa50Rdjt8xEgtfv2ddcX3sBZP9uXpmXZei6HzUJv6Kb2Zx3106FHcadr
 tuH3onKSd8k5gRaJ3cWKe3cqJJkF2m+lgoeLAo5PJft50r0MAKLTTHFS57FWn6QPh8h5
 TbsEva+ro8/iG0OiPU2uu4GLupnkow4ERibmjggcbM4DqWPcLDiAFryJ2slFzdxtgqUu
 ltgIbphu5kWu2oV7c4it4iISb7LgvHIiS6vTYWoRQzhYvrtfHRMkbcc+6vCeK6SdvpaK
 DQIX+pVPkP8Rsh2/J3AGRbn4/+KkCYendHKmUrwt5TQZOJ7ZwipRT8v/HgWJzTv28vME
 8pEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fzrD8zY4T8i1Ckg0kK2XoOEO/bZAqdILp4zvyRz37iw=;
 b=LOUpxYfrMc7TWwLH9snuJxaB5+zJljln3u7mZYQvRH77ZoQfROBcuxU6anw53BINnh
 Uqk2T0iPpzA89ynQnnq8T1JpZWGZWGQInJSGliel+45sE+jUNafOLjShNcSRv/M/r0CV
 MdPZ1e6FeyZM4ICzTXDAES1aL4ncFqd3RLDd4ELCRGXAJ+9yRnJoVXC2LO8sNZ3+1bGv
 aibfHjO6Z5YQB7AHJ/BrqbCfE51s7SffBOuPO6e4ZtkmfaRq00TanX6ywb6ZtYR/pGbd
 yNdU6ueBMGgena6jrl0oPnpIF4EY7FCj4k62w1G984HUB51HxTV0FwNRAZu8sES8ai0N
 2w9A==
X-Gm-Message-State: AOAM532J3kA1/KBBdYI9npB6zJkc2PC+BLbSi2t7cJpUcb8M0WbtyzYA
 WTs9QG4SIhSv19/idT87mRE=
X-Google-Smtp-Source: ABdhPJxQFWHd9h1MRuUh+9kk8UbYLL3eHDb36/Y5upxqrmZxsITxtsK/7ISTVNxcSJgTeLL+/GEDmg==
X-Received: by 2002:a17:90b:3686:: with SMTP id
 mj6mr12127837pjb.116.1619739087898; 
 Thu, 29 Apr 2021 16:31:27 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id q19sm101794pfl.171.2021.04.29.16.31.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 16:31:27 -0700 (PDT)
Subject: Re: [PATCH net-next 4/4] staging: mt7621-dts: enable MT7530 interrupt
 controller
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
 <20210429062130.29403-5-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <f397c8e2-7ee0-f67c-6ea0-412fc671d418@gmail.com>
Date: Thu, 29 Apr 2021 16:31:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429062130.29403-5-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_163131_697258_906E2A3F 
X-CRM114-Status: UNSURE (   7.52  )
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
> Enable MT7530 interrupt controller in the MT7621 SoC.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
