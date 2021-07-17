Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B19C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 16:10:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD0E561159
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 16:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD0E561159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BrUW4mACpsF9HIca3eSJxDI1pWnFDr8pq4mmrY1PmWQ=; b=Yz1gDljKpphf9c69Wio8J13RJ0
	LRz1JvmlbCZmQy4n6WjNjX11KYhQE2n9TEMB6TsKK957HqcxEv/6CdhG+KMAW/w3QZr2TT9YGvwDo
	LmCWTlh0j8GPvGFSHluQUeZQ4w3EKAmiqwhNZ/pp6RAPAGuWmwEK77djE1xR9ubq10VVm4kdnjeVf
	kIhEVS2XRQbcZQpnS+MjfbANsuovB6JfFNOYU2UHt2Fd6e/LfTN0xIgD4gRrk8+noGqkJmn03SDyL
	NWsPX9WLrarTOS3O/AwUTygNV3jd8flfk9aWakJlsxsce2cNyJm2NdFDWOr93CNLvLdnEC8bAP7rw
	fWx5kjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4mtW-006nqa-J9; Sat, 17 Jul 2021 16:10:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4mtU-006npy-8u; Sat, 17 Jul 2021 16:10:25 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 62so13468057pgf.1;
 Sat, 17 Jul 2021 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xddb+N0v+hHcIs8maktgerWuQ0JfLKpmotpQrY+Dm6o=;
 b=K3mWlWtGp3+sZiNKnyZo4q4zcJSrUR5+nVVmPc7EEIkqndxaK2XG0NxzboGgqTyI9k
 ziUHif5h6yzGkfjh5Tv1/V32G8rT94a1NOHTqopO8SE3nO87QRCpewBwgo206Ot2Nx7R
 rRKPI5A3FXsFw5d55LPFq6E8F47JFzf4ONaVIuw2Myy1+XaBf9BNkWkbykeP5NtRxN7k
 i7rsh0THw5OPhfe+271i50THyl/bj7/8GDExFn5mlp/iiLn+QKQWz/46TnLTboHZyurG
 v1+IRkBFdpx2sMM3xRn2NLj4iKODOamwtU2W158P+xus55bIwiQCQPMu0thHWAACaAoE
 WjDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xddb+N0v+hHcIs8maktgerWuQ0JfLKpmotpQrY+Dm6o=;
 b=VFcMU/8FOPon4TxX7gMAcOP6VbqNtw3DYkNmkT4lZkExYXnPhDeqLVoLtVq9UtCmiA
 EYZ9WxZZEPWgIU9oKQhCNp1++t/JxTIl1EqeSG2OejBsM4btpgMrD9cPdfyM0/Z+PnoV
 pXOrIEr7fSXHIrIBqMnxvu+M8TWE36T758WtA2Us2QIMBMI6FzxfjPkowbZ6E/0/5XAu
 pWbS5RLvUZgp5jHcWKDN/SWESs9i8KSVpJaRN8StndWStgElGrGlvw4teUDppaZaqq9H
 btgeKiIhXQ22KWXsNTEqanS128JD9xLdoNkH0tWi4pU8X2NEkzLcduX0RkwjH/iLMX1/
 EYkA==
X-Gm-Message-State: AOAM533JoJclSMjg9u7eth8J0CbeTaNd8JMSroQpjdLSZmQ+0Sgu6RR8
 a9fGd47iTw4881fwb2anXf0=
X-Google-Smtp-Source: ABdhPJwcTd76xSeBEG+xnuCq2rCXkuZNbJtwb9EbT6snml/J+5qteEAFArnsBXdPZt5MrtYlzAFO8g==
X-Received: by 2002:a63:171e:: with SMTP id x30mr16045233pgl.368.1626538222307; 
 Sat, 17 Jul 2021 09:10:22 -0700 (PDT)
Received: from [10.230.31.46] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id u16sm15735548pgh.53.2021.07.17.09.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 09:10:21 -0700 (PDT)
Subject: Re: [PATCH net, v2] net: Update MAINTAINERS for MediaTek switch driver
To: DENG Qingfang <dqfext@gmail.com>, Landen Chao <landen.chao@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 frank-w@public-files.de, steven.liu@mediatek.com
References: <20210601024508.iIbiNrsg-6lZjXwIt9-j76r37lcQSk3LsYBoZyl3fUM@z>
 <20210717154523.82890-1-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <d62aa80d-9ee2-23b8-f68f-449b488a3b0f@gmail.com>
Date: Sat, 17 Jul 2021 09:10:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210717154523.82890-1-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_091024_365142_7E8BEE4F 
X-CRM114-Status: GOOD (  10.38  )
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



On 7/17/2021 8:45 AM, DENG Qingfang wrote:
> On Tue, Jun 01, 2021 at 10:45:08AM +0800, Landen Chao wrote:
>> Update maintainers for MediaTek switch driver with Deng Qingfang who
>> contributes many useful patches (interrupt, VLAN, GPIO, and etc.) to
>> enhance MediaTek switch driver and will help maintenance.
>>
>> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
>> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> 
> Ping?

You might have to resend, when you do:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
