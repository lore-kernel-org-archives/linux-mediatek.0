Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A84ECDFA1
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 23:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ClspvyXTECiETgdUQTzdfSfb1fdhiX3Hnq3vM9YFJKg=; b=wXaWvv55X3UJQPB/AwAIUD518+
	jbU8xjvOP/hPkLnYozzZspVe+LgfdSwZuyyW0HS2/13Gv/AvuM10kq8lS9AtMB0XJlidf+uwPOs/u
	Q5S6n85W7ukR5Nj8TtgeMmil9cjSpq4cvXBFCzWoP0emkQWxPe2XtSUCYjQ193TzkQIqIyZEs1yjn
	FsDZj+Ihc7H7soUJ++vfSnvWOeLdzF4zAiNuUcwNOgrFCIe1mHh8HBsjbm6fLk8qiV/DERb3i5trB
	05NhqazRJ4UuAjU/dHBSmxHDijvCHHOGW+c/t60LGa3xqMvLIG483EOUlXMSlGRy42r6mFNznFcW+
	U0WanqXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onSyi-007V0F-Ao; Tue, 25 Oct 2022 23:05:00 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onSyg-007Uyb-Md; Tue, 25 Oct 2022 23:04:59 +0000
Received: by mail-qt1-x829.google.com with SMTP id h24so8737180qta.7;
        Tue, 25 Oct 2022 16:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ClspvyXTECiETgdUQTzdfSfb1fdhiX3Hnq3vM9YFJKg=;
        b=OGVQx/2jN+RSO85l2tT+FBBLDTg3+Zwd7kPErhrGyLOvARiBsC6CG7mlS5qehrVYjz
         ihtrkFKVyhxJhSYcMvV5NWm9PskAi/kmNQQmlfOa/Atw95eHt5E/xoWUmo4sZqo3vl6j
         CFQyTygR+2sMm/0/KV7GFc4CoMhIlc5XmYa/1tJQAXFJdrhS0cF3+wNUENeelrFXVU52
         B+fJaSn+KrN1P/cNjmuab6WTcWn/9XgYj18k3hKTDHoKhxqIHLAQQtgY7Ei3jjIvIsAG
         fcVYL7OzlTbJRpGXtu8aguc9N1G0gMaX45lDxLj2aL/avr2nXoN6LoTK0/S4kgTRI4RP
         T+7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ClspvyXTECiETgdUQTzdfSfb1fdhiX3Hnq3vM9YFJKg=;
        b=HYnDtESOYZm+ntx7wj2e/+AtOZn/GIpTslgrTTN5ybNZsTG8uf8ed/Rs8SNpZyb/eK
         Za60XItybI2gH/vBBWl93FVXDk4/PkmNyqZvLP/hX5cEPmSHwPp/7I1/afjXwqV0De0F
         ln/j0dGpRTgkI76MDzs04BTw7CVvV1h/wT7JAXlypouBszLz4QJdouGXn3lh3v99dgD6
         bPOEg5w2Hf2VzSSiLN7quWwGQMnQ6riYa/EKlxEhxlqmaTKF1V3283V+c7quBay3H1OM
         pGWrf32hAjQ4hE69X48U2XCd2IX9vjY9FAG59Ia1MSl3iuIsFHb7H2lpCs+P+P9xgXhE
         FstQ==
X-Gm-Message-State: ACrzQf2L1Zu+YIdhPjxUnHu2RmZfAtyfoNmPZy2aY72l2nBEpyGsc/y2
	4WbGox69ZWy6s9ohgWLOHFqs3O/10Os=
X-Google-Smtp-Source: AMsMyM7rTVsA7B/1nr6n/+LBGSf6vGViUcnpSdM2UVcJd2IwE+vvSTBrnUYbSAFzBatpLBuidNMdkw==
X-Received: by 2002:ac8:7d0f:0:b0:398:3029:3328 with SMTP id g15-20020ac87d0f000000b0039830293328mr34625420qtb.99.1666739095917;
        Tue, 25 Oct 2022 16:04:55 -0700 (PDT)
Received: from [10.69.53.73] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t18-20020a05620a451200b006cfc7f9eea0sm2913312qkp.122.2022.10.25.16.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 16:04:55 -0700 (PDT)
Message-ID: <8fbc9d02-3c73-5990-85af-82eecb6d64e3@gmail.com>
Date: Tue, 25 Oct 2022 16:04:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [linux-next:master] BUILD REGRESSION
 89bf6e28373beef9577fa71f996a5f73a569617c
To: Jakub Kicinski <kuba@kernel.org>, kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
 netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-scsi@vger.kernel.org, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Florian Fainelli <f.fainelli@gmail.com>
References: <63581a3c.U6bx8B6mFoRe2pWN%lkp@intel.com>
 <20221025154150.729bbbd0@kernel.org>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <20221025154150.729bbbd0@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_160458_756698_D9928A14 
X-CRM114-Status: UNSURE (   8.93  )
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

On 10/25/2022 3:41 PM, Jakub Kicinski wrote:
> On Wed, 26 Oct 2022 01:17:48 +0800 kernel test robot wrote:
>> drivers/net/ethernet/broadcom/genet/bcmgenet.c:1497:5-13: ERROR: invalid reference to the index variable of the iterator on line 1475
> 
> CC Doug
Thanks for highlighting this for me, but I happened to catch it from the 
linux-mm list and was just looking into it.

It looks to me like a false positive since I am initializing the 
loc_rule variable in all paths outside of the list_for_each_entry() loop 
prior to its use on line 1497.

If desired I can submit a new patch to make coccinelle happy.
-Doug

