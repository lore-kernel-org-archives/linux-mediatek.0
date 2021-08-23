Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FBEC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:02:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706C161361
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 706C161361
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VKgABkq8Ocj0kiUidQ96pFthoka+pq+VbJCdZ3vgXVE=; b=NDcA95HDnueGgqIgsjt3CPVE2d
	VMQ4BtOkSmk4DonBrnVc9g4QV3mOvEFNFXmxyrr6sSudS2n0PpGB2kqyF+cBmC+m1rcrkv4Wlcp+J
	EaWcSWAYfxwDAe/0Zlc/3XC/2utomOj0nUte8X3DpOAbmuH6GzkbgFtZ9LoLfN/JD1SBJC5ESsl9r
	yFD+8xq17IMOne92qgxNSVR5/7NKZ92c3ge6KVucjjB2sGCufxEtkBLMPObpYvPVOrxhxAk2dwA2D
	cNwO4SS19ouJNX16wNk8goMt1v4ZTWDPiRF4sszr33iwDz/1vcCkvzsUM9Hi1qC26CCEWvyRozB94
	mTxaeWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI0Df-00FEsr-R4; Mon, 23 Aug 2021 03:01:51 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI0Dc-00FErR-N0; Mon, 23 Aug 2021 03:01:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id c4so9296110plh.7;
 Sun, 22 Aug 2021 20:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VUSCWaHr794uxKbw9ZSl7eYSMxn8eUX4SnaHucm+ud0=;
 b=hJ2KLDu4n+kQBjkiaj+Yo65M/r88NnH2nM7kiC4/3ilhwd5qqh4rXXHITzQr+4kf/M
 639/nj28RSaoAcR2Fdyrziin5L/MMxeQJNfN0jOnlYlGOozL6BsUgDnAQgorCqIxEDwy
 IR71UH43gdxi+tpHFdPyCAWA6RJn8jn0v/R22nXTYHAbFJ4hhObhDG8n36uYWkoEIT3y
 QGfjVlH0g2Zxk3F1k+A0RWBPykbRJoaSwRjqiFaIwi++F+xr1vXcdojTZCXGDw14T34Z
 HnM8HwX63d80xs1vhlGvW4bABS0vE/3wS/B4N0jSjY646uriq710UhCF1ETmU5IYDfXI
 o8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VUSCWaHr794uxKbw9ZSl7eYSMxn8eUX4SnaHucm+ud0=;
 b=Dilk4l6cPoM1L89XIMQyvO4iAy6j3unhwa7tYAWLXwEPwRutSwIVolNJh5iUnVTWul
 xlHq5lPrdWVSa7w9aMqozSdAFdRwUlsD5YqHyDcJSUado/yQFVzCEyHFXldPkCm+oOcX
 9x6rqw3s1Y3xsUwAuPQ7g6vkPWQpRdKOdkQPc0/SB5Qp6Dp8nG0DjYLOW6+sFz6BomL3
 FcaO2ZiphgIbWDI+waBfMNhAF8SugscMzlyKgdHC7B6OiE6NEWfrQVaTY+V+mA/OP87A
 QK3Vo53KG+wNfe3NarQB2DE0OH7NfYr50jqktHq1F8jQYngZJFvPl2EXHIhoN9vk0S06
 39Qw==
X-Gm-Message-State: AOAM531Yl2vIApM65CWei1M5Hx6l4JJ98rA+lGBFB4cObeKkYEX8CLxZ
 ekip1KJOgh7oI9p2xkFAzQk=
X-Google-Smtp-Source: ABdhPJyn7EDf07XPgwZJOFJi32fo1jg/MVO7kaTlBY4eMx/tOVZ2oMuX1Z65Qs4NFgK0iQSCHf0JVQ==
X-Received: by 2002:a17:90a:ec0f:: with SMTP id
 l15mr1573221pjy.82.1629687707322; 
 Sun, 22 Aug 2021 20:01:47 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.45.42.119])
 by smtp.googlemail.com with ESMTPSA id a15sm7192486pfn.219.2021.08.22.20.01.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 20:01:46 -0700 (PDT)
Subject: Re: [PATCH net-next v4] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, rocco.yue@gmail.com,
 chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <ad32c931-3056-cdef-4b9b-aab654c61cb9@gmail.com>
 <20210821061030.26632-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <a4a52162-c645-b369-a9f3-120f48115cde@gmail.com>
Date: Sun, 22 Aug 2021 20:01:44 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210821061030.26632-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_200148_829615_6D0C530F 
X-CRM114-Status: GOOD (  19.14  )
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

On 8/21/21 12:10 AM, Rocco Yue wrote:
> In this patch, if an RA no longer carries an MTU or if accept_ra_mtu is reset,
> in6_dev->ra_mtu will not be reset to 0, its value will remain the previous
> accept_ra_mtu=1 and the value of the mtu carried in the RA msg. This behavior
> is same with mtu6. This should be reasonable, it would show that the device
> had indeed received the ra_mtu before set accept_ra_mtu to 0 or an RA no longer
> carries an mtu value. I am willing to listen to your suggestions and make
> changes if needed, maybe it needs to add a new separate proc handler for
> accept_ra_mtu.

fair point. Consistency is important.


> 
> In addition, at your prompt, I find that this patch maybe have a defect for
> some types of virtual devices, that is, when the state of the virtual device
> updates the value of ra_mtu during the UP period, when its state is set to
> DOWN, ra_mtu is not reset to 0, so that its ra_mtu value remains the previous
> value after the interface is re-UP. I think I need to fix it.
> 

Please do. Also, that problem should apply to all netdev's not just
virtual devices if you are referring to admin down (e.g., ip link set
$DEV down)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
