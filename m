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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CB2C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:52:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 309C820578
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:52:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u370Ua+m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="u03d4tmW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 309C820578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TRdRb0TqWiS3XFN9EQVhfthDwdTkJUwXzFXWE+rMDvU=; b=u370Ua+mYjjdHcoCU/N4MRVvc
	UHfKBhPeG0Ys5/xApoYRkIL+C7l9qfZqpuixsAL+XvT3OZmhw+94wOSnMVSXAd4bZOy/esacCwsHC
	ZII4G1ciiPgWdWe6lTeiPLpSur12lotzVSL+6uqRDpvdfaKhHFI0HaMTE1n1T0ZlIUDMWsqFjP7zz
	1X5jItVAC3ACV16KHSUveTmm3eQyWUd284AU/1bMfaDjcNuq0khg641uxSkxsNNcixhRVXGqdUZ/h
	Te3mDOyBZUepPdbzG9aiKhBgmz6rnJH9VGvp/cLNrOuX7fpHriiearwB4T/oX3JMxqeIW3uAQEZAh
	O4X3XLe2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2lx-0004ZI-Ue; Fri, 04 Sep 2020 03:52:21 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2ls-0004Vw-Uy; Fri, 04 Sep 2020 03:52:20 +0000
Received: by mail-pf1-x443.google.com with SMTP id f18so3864383pfa.10;
 Thu, 03 Sep 2020 20:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=elyY3FogBHot5CN5hK6byMac4qADUpfN6udqJsXO4hA=;
 b=u03d4tmW+TnpYHqPYeSSsOh0Oi9chvWtfUdmcTrMysZo3Df4fL+NWryFcYy2sUIltB
 rCB5rqfZYBUXKuK7jCORQTuNiimlfykj2YuTeeNWg+8ZEGG7/Gu6ic4CjH28G0sjd4eJ
 z+1jOx9BYg7D9Kq4e+OumPEBi3IZjpbe5c4wHRP+DmoRjPpHj5yaqaZvvBHq/Z7zIsqy
 alS9uMLZocIQWvALNOW4bFdXcWTCO4SCLAKwb7G6mvQ4j/Rp7NyIakzEYLue+coBWQ6c
 Dx1KmIxjpCKZZNWYxLFtk45Angn4I6M/S9ehcT2MOv9sqYpO91mUMfn7KmcpgVjPiRI6
 VSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=elyY3FogBHot5CN5hK6byMac4qADUpfN6udqJsXO4hA=;
 b=HeJeekq03abR0DhJmk6OTnmiCZaIN8zDTgRBg9VxqBeNg3OX0vYg6esUNI2AbIj0Nl
 p27t9MOroKYTsOMhkQUstrVOkUEyA0dEP16hLClw8tc3vy9VnxMoF2476Gkb29/KuWZ0
 oBHed9AMhKlOziCm01CSCtmXvUcCW4Nb4jyq51B3kQavE8ezGmSCyc3nLuhNEW3XPHF8
 vqb7YIbPMyux6ExXCs9Eu398vG6fj/YrFMm7bVR3od/fUsAlJTdNJ9jsM0KoQD4BVhCt
 il3pG0eUKYwLiARe2P5kE1yqIM9xOcHnBHjPqYz8KWlUuNYSl+dFIgQKoPutrPvu60dW
 n1Uw==
X-Gm-Message-State: AOAM533Axp7YGbluOFUKgimIoovpMPnFjr9QmXj5j8U4alQiAgFt4Nlm
 sxPA316mUyHb9Tm8LYcke9EdPf3HEm8=
X-Google-Smtp-Source: ABdhPJyCxCcbp9Tp+u1fFERs8e6XkvIJ0T06AEwJQXGYcS3y4b38I1RZGnvEcdAet26hobuBZKx4rg==
X-Received: by 2002:a62:6dc1:: with SMTP id i184mr6674304pfc.57.1599191534579; 
 Thu, 03 Sep 2020 20:52:14 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id bt13sm3964718pjb.23.2020.09.03.20.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:52:13 -0700 (PDT)
Subject: Re: [PATCH v2 09/11] usb: gadget: bdc: fix checkpatch.pl tab warning
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-9-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <476d20c5-33aa-d0d4-5996-78f6bf262918@gmail.com>
Date: Thu, 3 Sep 2020 20:52:12 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-9-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235217_024998_684C9F9E 
X-CRM114-Status: GOOD (  11.44  )
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
> WARNING:SUSPECT_CODE_INDENT: suspect code indent for conditional statements
> WARNING:TABSTOP: Statements should start on a tabstop
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
