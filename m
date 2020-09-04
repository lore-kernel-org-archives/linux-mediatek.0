Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14709C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:53:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD15E20748
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yVX3nUK9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WrkeKOpL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD15E20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZStVM4fpmxX7RXPvXQhmroV0wVsWt5MryPvThjiL6v0=; b=yVX3nUK9JprWetUtyObxJgK05
	qUS++7p5cFO5DIgM7cexsSfM/G6680a0aIUOxslU2Q/GJkHq8piyIHCXWrVKUykqYjmnoIBtnLvlc
	ukwB330Qlr7XXOW3hinhbaU3sJbKI78Wji5qLD9VpuWzOjHdtpsqZ8FPSHvid2VhdMMzO6Pd/FKlI
	OOl1TLVN3IWLw+3Dhp9ZfBnFmPOTKnnE6cg30MXUl8HcROP83JfSjvhs7+1zT9W6sJmqw2avXcoN1
	KiKlWL07y5wZgjOIZEW80I/wDf12N9IzBQd9oo21Nlnve0MQ3oIrRUiEIkRLGyRjg4Abvob5zPqMQ
	rVfQHO9jQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2mq-00053W-Lr; Fri, 04 Sep 2020 03:53:16 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2mo-00051I-Hg; Fri, 04 Sep 2020 03:53:15 +0000
Received: by mail-pg1-x544.google.com with SMTP id v15so3641422pgh.6;
 Thu, 03 Sep 2020 20:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hKioT0wjDTd3HyPaP33TayX+qRWZn7CovAFQRZ/15Ww=;
 b=WrkeKOpLSbJxDXVmyA8s6DCES7y33/VoPusNxlh12V8XVbhCn6FLIWQujlJfM5Zf2J
 60lvZ3ZjeOCFcct2uoED5eOjgSM+yJdPNtcH9JdHIE4QlZsIr7sbDyg/vyFihcDjFwFt
 65lDb+Nyb+YNTN7E5gCFk8FbEIYXyqbaJphxDj/sNiw7kEOh4tx1/ewUXSopDRrUoZmL
 3AN5RiRbfrwjm0YX9G6WqNv966ktq92Vhl9hW5frdqJe20khkiOubc5Akn09KWyW42R+
 n/VhMC+eDVV1JMCeGEJIuXjKFt3K6FHIPd3DlJmyuZGfQmA6siRQKz8lNYEMAiUf3RwS
 mJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hKioT0wjDTd3HyPaP33TayX+qRWZn7CovAFQRZ/15Ww=;
 b=KYpZT7DrWdE79NtdDICXwZepWcDMzAU6mJhl6oGEeveaatO/w7xzwqMLV6B+2fvovb
 +sMo8egnJq8C/M437tibHhMULuUUiuoHioC6c3xqQR2OHibfMtQEwW+KTDsDb+k2X420
 maGCr6mNi6XHD8gUVMGdxlbMLk0sQjIAhhb1T0xoue1tl8QIZGlanZtovBKtDTcT4gOa
 2C//59pL1MXq6lyvTTKiKora+i6m/n8u6nL+Gmqk9UwyuYfK+hB5/rFNJdNOzqUC003p
 fSgzXAZZOtTA649/Ac0ErnUUDkG9Nd98zX6b4Z1QDBkZYeTZX1kvPjXpEKFrqXOl6S6J
 CWpg==
X-Gm-Message-State: AOAM532MjaFr3KR464rKTt37QM/G/DuGeeMP376v5pmoD384V8Rysvun
 BSMb6gd1Wy3FHZuSqx9Fycl1mfqDq4Q=
X-Google-Smtp-Source: ABdhPJzqti3IptrNuUSV13GjWu324l+mciLP0rzdo4Vg7VMbN/JnTv9YYroozlxYfRpDVFnkrgZAfg==
X-Received: by 2002:a62:e404:: with SMTP id r4mr6625289pfh.213.1599191592357; 
 Thu, 03 Sep 2020 20:53:12 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id x140sm4690544pfc.211.2020.09.03.20.53.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:53:11 -0700 (PDT)
Subject: Re: [PATCH v2 01/11] usb: gadget: bdc: fix improper SPDX comment
 style for header file
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1599189448.11403.33.camel@mhfsdcap03>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <4c7e1125-beef-51ae-2784-2850b38cc8e1@gmail.com>
Date: Thu, 3 Sep 2020 20:53:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1599189448.11403.33.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235314_613299_53FBEE3D 
X-CRM114-Status: GOOD (  14.51  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Sasi Kumar <sasi.kumar@broadcom.com>,
 Peter Chen <peter.chen@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 9/3/2020 8:17 PM, Chunfeng Yun wrote:
> Hi Florian,
> 
> On Thu, 2020-08-20 at 19:30 +0800, Chunfeng Yun wrote:
>> For C header files Documentation/process/license-rules.rst
>> mandates C-like comments (opposed to C source files where
>> C++ style should be used).
>>
>> Cc: Florian Fainelli <f.fainelli@gmail.com>
>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>> ---
[snip]
> Would you please take a look at this series?
> I'll drop the patches that not fine with you.

It all looks good to me, thanks and sorry for not responding earlier.
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
