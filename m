Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A946CC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 21:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9WsKYP78qtCT0ErIavQs+Q5NIpoTLGobCYxRumep4k=; b=WEl3yXmU4AyIFwgS4X2pzUX6k2
	VAoOLKrHTu5IR0FCw4uFu384x5oNJIsS0vBf6gTAeY+C09oMcqOygXATH5xxbWeBEnL6JJfdY1lhg
	eaXOyi1cpBUb0fBOCWzrJOywboOelnSDWo2Y8nJVVUM0Qw2FOfoszpTlyKdMAJK/+PMJ9WRHfPEJc
	HWxAZPO1WFMI0bAa5aIL7qv6EZ/bSJaouDqjPPhNHwx8hredtpFQUv0+a2E3XKb3mRlevL4UXK3fB
	7p+PVHBJQhEloNTMYUyCaNbJEYcuuesFWfmU3eVAYZM/xbHO+yj4jqIpX9ROMEaawXVgfjh8INEGl
	W4KVEwgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEzxE-00BOZO-Rn; Fri, 22 Jul 2022 21:13:00 +0000
Received: from mail-pg1-f180.google.com ([209.85.215.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEzxC-00BOX2-9c
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 21:12:59 +0000
Received: by mail-pg1-f180.google.com with SMTP id 23so5332948pgc.8
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Jul 2022 14:12:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=c9WsKYP78qtCT0ErIavQs+Q5NIpoTLGobCYxRumep4k=;
        b=mUoeMQKBXpkRUXQ5osx04ys22Wap0AzA9aDFuOK+xESnUoY+k2HnfGNoQqEy1XVXZ0
         DId5sb7Js3lps0vO1feaeBnp0X9gnI8fJxM1zXeYAtoruqR5NN28q+cT5wu5mlEpOE5S
         cerh4QQeYXhgYcP2oi1yqXgoa5MAiW9apq1ocmdvAXRH7fdoaeSG6wfPICvizTgWoyTu
         YQYR3PrTDVqQE9pfIztge3JzW54RI78ZUbynZJzB4bhN7x09477295BQIX85ES5Sc4js
         ewhjHV7PvPZEKx6Y03BRT1m1QJTutGM99TU2MOPa+iHDFH87lQQUOTqOx4WKEaioq6Iu
         4nyA==
X-Gm-Message-State: AJIora9apKK/QNl77oKa/wt4DsU8EKi3xd8rSZW8uvumGIFgfUpsy7He
	8SOVGy7tJtnmgSJwOPrThds=
X-Google-Smtp-Source: AGRyM1skqTQGIq8EhXNOZW/llHdz3ok4Yt+f/wc47H+x9dyaLS8CpI3xeEkInEGO84kmTs6bP/YNog==
X-Received: by 2002:a05:6a00:1589:b0:52a:eb00:71d8 with SMTP id u9-20020a056a00158900b0052aeb0071d8mr1805063pfk.38.1658524376175;
        Fri, 22 Jul 2022 14:12:56 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:805b:3c64:6a1f:424c? ([2620:15c:211:201:805b:3c64:6a1f:424c])
        by smtp.gmail.com with ESMTPSA id i9-20020a628709000000b0052aca106b20sm4404311pfe.202.2022.07.22.14.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 14:12:55 -0700 (PDT)
Message-ID: <2f66f4ba-f0d5-6b8a-cc3b-fa896a302d60@acm.org>
Date: Fri, 22 Jul 2022 14:12:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] scsi: ufs: correct ufshcd_shutdown flow
Content-Language: en-US
To: peter.wang@mediatek.com, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220721065833.26887-1-peter.wang@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20220721065833.26887-1-peter.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_141258_363944_24B93334 
X-CRM114-Status: UNSURE (   7.67  )
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

On 7/20/22 23:58, peter.wang@mediatek.com wrote:
> Both ufshcd_shtdown and ufshcd_wl_shutdown could run concurrently.
> And it have race condition when ufshcd_wl_shutdown on-going and
> clock/power turn off by ufshcd_shutdown.
> 
> The normal case:
> ufshcd_wl_shutdown -> ufshcd_shtdown
> ufshcd_shtdown should turn off clock/power.
> 
> The abnormal case:
> ufshcd_shtdown -> ufshcd_wl_shutdown

How can this happen since device_shutdown() iterates over devices in the 
opposite order in which these have been created?

Thanks,

Bart.

