Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 473D7E77188
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2024 16:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q0cBgN0DXc0e/15sj0e0kTs7/C+rgSCSYUT4C/Y1b9U=; b=TvAJZxyQm01bGwITYZowHMSvs9
	rcI+2Dj10sx+PbrJtnem3N0ZSfVThvStVhwut9tqYSIckQsO/iyiUDHtgK9wlDxYc9J3jHT5lAYka
	4NArJ7zwT/xY4h4B7y0lj4oQgpLHF1zQEbvxKta1YKAe7+I0Q4sRyWkROtj80AQLtDBCEsB24I7Ac
	R11++UnYO93WGc+4sHx4F+Dl4L/MSsJpgvfpuUMpNbuUJsttzS5jFE8Y2ZL7Rjv2tNFz185h45E86
	aCoF1TA1hZvRaRjQcRL/vkk0pYEfW1GifR15Pe9HhfjjB1SloYs5TTnwZhKw0ljFgrz5aD7tFdAnZ
	XGVhA6uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSIdx-00000005VXY-0qWV;
	Mon, 30 Dec 2024 16:29:25 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHpOv-00000004FU1-3a7O
	for linux-mediatek@lists.infradead.org;
	Sun, 01 Dec 2024 19:14:39 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa539d2b4b2so633647866b.1
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Dec 2024 11:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733080476; x=1733685276; darn=lists.infradead.org;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q0cBgN0DXc0e/15sj0e0kTs7/C+rgSCSYUT4C/Y1b9U=;
        b=URPmTe/M9lLC0eUrL25ZyjGaSskihSL+Lti0Xmmbnx/xIl9tWBMhk3bLTj35/iSVPU
         SsMQdc4csfeztf+TrUcTjAOQtNGYRCoq9YGx4brvn0rJ93CJt3fdGB6gm6X19P+7xaPS
         TBFvC8osCGnvobFBsZVx9xl64/ONvZX/pvK2x7FrNIWXbElJVKQqf2IXlLQQO+FHVCmA
         GkTBttT+75apk4GRJeklG0SKv/cydLS7sKmxfXh5UxhcFANYmpYf9F2yebWkbqWnznFD
         DNlEcOO+OdBwiHYlII0Y13IooFiCqUNJs7oYq6D0zPTURKXjxikJA75NkxCbSMaKjsl5
         +vDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733080476; x=1733685276;
        h=content-transfer-encoding:subject:content-language:cc:to:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q0cBgN0DXc0e/15sj0e0kTs7/C+rgSCSYUT4C/Y1b9U=;
        b=lXTVXRcDOFypPWqpR2GbiPYTbyiywe8BsFsvNhdKlF8Rdis6ObJlign0MwVVDpq+cf
         05ThGtlu79TnKHYdd9quE1HQ8UDRq6JbTVxwQoHbK02ox+i4TGZdrRYSafnkpCO7/D5R
         KIDQXr16cNY9jKpDNN3KdJtTEL6oBQlcVbCu7+XgKVnpxokteCt+Guz6UKX2sBVm6KMk
         13lnk2RV03HSERO8GsZUSnKz02hA6nMCy6lW+7pAN0GY0tziTcH47N6FE9UudwAnVk/X
         fT6z4vYajr8bNWRiSl5KCq6ZtQxUsfWqkIuAGmlYWUWJdXtvDy1De9+9fqKja0QNjyCn
         4Yew==
X-Forwarded-Encrypted: i=1; AJvYcCUw9NSYYGTvOVV0UYgdJsdubo/F82dgn7waHKfdGXkGXy76G1ODcm51ZWu2Q5UxS1CthF7ZbUXqapE5E9Esew==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVliUht12Vs+c82RpDoaf8reOOiw49UoRyxbes4ankrg2PJjet
	zCe/AJ6pxoN4FKrtyGBPro3hiqoI0GJzW7fzc3ZjfotVec8EVCiX
X-Gm-Gg: ASbGncs5XjDVEiFT/rymmMNc3o7Ep7DjqqkwGn42VnBf/B4kGKd6f1Xcfuf8gLFbIYB
	RhlL+icZiU+8h5wzh8aupTUfA9wyAF3mYTX8TPL09qC6YdPtuadET7ksedoCQNma3BCrzzhdTfI
	H5f8D0TvtJL0gZmJxIMz5RDxYvslvp4DeLPYUvpTaRpgZ5wSiLI7rO2XM7TE5KS1fdrM/n6YAex
	yH/jKz/zoiwdyZiU5Bg5B+laDjChRSw3azsMsal6YQXjTVCv5BHN/+7fYPxl0YS01JXGUQl4xqe
	eJI9/tYr8HVOc1/hizuvfuqRyp2aQzic
X-Google-Smtp-Source: AGHT+IEbMH6bMLy/g7Dm2xw13TYYMh/jY8UDMMiPwK5FFCOEneUVCpf0MzU+CyGIYBN52X5AJpQ3pA==
X-Received: by 2002:a17:906:23e1:b0:a9e:b5d0:4714 with SMTP id a640c23a62f3a-aa5945fb940mr1627560466b.21.1733080475702;
        Sun, 01 Dec 2024 11:14:35 -0800 (PST)
Received: from [192.168.10.116] (net-188-216-175-96.cust.vodafonedsl.it. [188.216.175.96])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a8f0sm423109066b.160.2024.12.01.11.14.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 11:14:34 -0800 (PST)
Message-ID: <d64d354a-4787-4836-a45a-0e7f5b3e6c64@gmail.com>
Date: Sun, 1 Dec 2024 20:14:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sergio Callegari <sergio.callegari@gmail.com>
To: nicholas@rothemail.net
Cc: hao.qin@mediatek.com, linux-bluetooth@vger.kernel.org,
 linux-mediatek@lists.infradead.org, marc.payne@mdpsys.co.uk,
 Linux Regressions <regressions@lists.linux.dev>, sean.wang@mediatek.com
Content-Language: it
Subject: Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And
 Hibernate
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241201_111437_898545_21FCADBB 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 30 Dec 2024 08:29:24 -0800
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

>> On 20.10.24 20:04, Nicholas Roth wrote:
>> > #regzbot introduced: v6.10..v6.11
>> >
>> > My Framework 16 laptop (Ryzen™ 7 7840HS + AMD Radeon™ RX 7700S)
>> > recently started hanging when I open the lid after resuming from
>> > hibernation on the very-lightly-patched 6.11.4 kernel that Arch ships
>> > as `linux`.

I am seeing a similar problem with a Zephyrus ROG G14 (2022) that has a 
not quite unsimilar hardware to the Framework 16 laptop from the 
original reporter (AMD graphics - internal and dGPU, MT7921 wireless).

I am observing the issue with the Manjaro kernel that is also quite 
similar to the arch one from the reporter.

The last kernel that is fine is 6.10.x (tested with 6.10.13). Both 6.11 
and 6.12 hang on resuming from hibernation (tested lightly patched 
6.11.10 and 6.12.1)

Blocking bluetooth (rfkill block bluetooth) before hibernation seems to 
work around the issue.

Interestingly, in my case the updated mediatek firmware (241106...) does 
not appear to be enough to solve the issue on kernels 6.11 and 6.12.

Sergio


