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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D07C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:52:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0856E20748
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oDXQUz82";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8MVbo1P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0856E20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9akuQ0X+5TfMqmSWoktjATT73KO2LGamP7T8o7CEbPs=; b=oDXQUz82d0LI2yEGHc/bv4cUM
	NJJCDcHPY7OTTez4WOmfKJC0nfhYxdAEKsWQDqSMGLRjgSsc9fIejIpE+QOCmyrG8mJ5hPONu8mRq
	gC/7N0a8vXBXQA50GMer37OUc4qmtR/XkOQLqKgJMaTMfHYwAKw9CvfRdn7yEOgTrjSyiMK1tJ/VB
	lCvi9AQ3LV12DzUdOK5MCc+jzq6RxukGYY68W/V3YlhaJmRgPtxeeC8wKfmFrp4mej15Xch4/RXZu
	/1XiGMn9vZnh5KFTCdy2xEnFFyfHrxA1NduPxeCV47kHYXiDNPWj60UKmLpgKrrz9Zq++Q8l709jg
	AAjCSVZGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2lh-0004Qq-Cj; Fri, 04 Sep 2020 03:52:05 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2lf-0004Pj-OH; Fri, 04 Sep 2020 03:52:04 +0000
Received: by mail-pg1-x544.google.com with SMTP id p37so3648874pgl.3;
 Thu, 03 Sep 2020 20:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N6xRq1i2ZIJ2hKOpLEHhIn0ng/VBDSD16NJ/S5zJgog=;
 b=d8MVbo1Pysn28ePWKuVBfEhI8H7+LGEROm41dRgHcp6Olv0343S5sxa9NALyK09MBU
 6Dh16XNo8Cvfyh32VXOWgS+6OHMkP+6rY+FDrRjJxLdsWya+R+sCInvX+kZZ4Wqp1dVg
 5V0k0L/nKUJPMfRusazKsZvUdo9Upljd3Fejh3331JMIl+skxC4/78WMANYSWKmL+CJ3
 PfyeGaiilhRPXx8SicZgh17261FLnULqmqPw6uNzlkek/Bdrob4FZjiW8vCdgvSV6Y10
 Qy9jPKYmiGog9Hu0n5PSAUudP+zbgon2Jg3QOykh/1aBgVkNut//G/FC2GfaEqt7blVb
 5WnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N6xRq1i2ZIJ2hKOpLEHhIn0ng/VBDSD16NJ/S5zJgog=;
 b=TK3YGKNpC7QhQzNva3mPvLpFudCg6tDm1RcbnRr1Rgzd7FC6xON2GEXNSDjxsbiIzv
 ADuhmnjbES9In7io/Lmq6FQt+YrvWMPW5CiwFj8YquyUC3l7ckbrrUAmeNzJw3vG9h75
 981gGYyQJxLZpjMoZrQXVo1HKcjN0JLWe3L9SqxHKu/RQZdYS25gkFuc2MjG68uPX5Tt
 FgMBkgcZvn9KhVXfuI9DM4Pus8WOY5DsXml1XJteybhju8p5rj37udfvFpbuiroJC/5e
 Py+bD09InStd8t+NctpuYPlscI1ur5kzsFm/HwQACDncQtNQa/wTYUXWgSUlzCl2N4GO
 kJOQ==
X-Gm-Message-State: AOAM531My851ycdXyoVhHJNC7cwB6OYyRF+0nrCH9cAqtUEE8hnn03HX
 MY9EBvJ0IQIpQxVO1hvh5rgar18tbY8=
X-Google-Smtp-Source: ABdhPJxafdDiCNSaciw2SgcO6QNZKpZPsCklgXLdgOyD556caEaZJcVeehtiVpdF75EFR7kHrCH6eA==
X-Received: by 2002:a62:87c6:0:b029:13c:1611:652e with SMTP id
 i189-20020a6287c60000b029013c1611652emr5024090pfe.14.1599191521307; 
 Thu, 03 Sep 2020 20:52:01 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 187sm4923852pfx.174.2020.09.03.20.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:52:00 -0700 (PDT)
Subject: Re: [PATCH v2 08/11] usb: gadget: bdc: use the BIT macro to define
 bit filed
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-8-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <ea2d82e6-cf23-20e0-1f3f-628510bf3087@gmail.com>
Date: Thu, 3 Sep 2020 20:51:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-8-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235203_796478_160A5874 
X-CRM114-Status: GOOD (  11.08  )
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
Cc: Peter Chen <peter.chen@nxp.com>, Sasi Kumar <sasi.kumar@broadcom.com>,
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



On 8/20/2020 4:30 AM, Chunfeng Yun wrote:
> Prefer using the BIT macro to define bit fileds
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
