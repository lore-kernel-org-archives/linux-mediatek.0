Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39DB3C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 02:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E6BE961C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 02:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E6BE961C4F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12719liWI2kU4eU8BMXtxHAfufyn1aQ9DPWc1mYFq5c=; b=d0oSIFBOeEUjQ5
	H1HhwepiDWeli0tDAzh/7r6MSDJBLrgsqqKfjFDA2g7qKAo31vkRWbtXxfxSRhSDGsZC0g7otRyul
	jw2JETMUJUZllzwlCQ5iQ0ZwhejVCes9IwxvbJtpg3BjI7nAabF+ge/pcdBykEAN9Qun+mzDtOjiM
	eUTOCJXX4n0GqgW8w+rC3QVS3Vl4zzFwlYaY1IfvQcoM5cp+9WxVAi9/af1EA4SqG+WjnKoqH54oj
	+t02uRiBdHEImgw6+OoGwzcfG4dZuBRJBRIPGAMTN1n/4M5nqJAvLag8Ma51S3fDIXPBJwocxcear
	71POKrl2IVcCfq0+Upow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmoOW-0005E2-0v; Tue, 16 Nov 2021 02:40:24 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmoOJ-0005CU-99; Tue, 16 Nov 2021 02:40:12 +0000
Received: by mail-oi1-x22b.google.com with SMTP id be32so39049235oib.11;
 Mon, 15 Nov 2021 18:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=J2P6f/Qll54psTzyshVTaRUOsXK9V7Nooaq1sBo16AM=;
 b=LpJQ9l5eNWhRzMJZ+xAPvmtGeEWSZcsq/EbnPw/xlX1wTgsD4R6fX1SkvGvn5mDWs4
 U/XDGd2vlLuUKQKTh5LfsTRVv9mleDxVzZNIL2O4wftg7UwDIDGNQxDPRhUPz01P1jpg
 wkQOekmP//nsHA37J3Q7Zd/+8EcFoV3cS9rN5OkUTxT3xki/jPwxD7UVJyK5ckKJ4hjU
 tZBoNZbERlVD5xA+nVjRpaJT6b1O+2vQVoTsoDlZ0D+8lggkNKpyRwf/EuvNjSG8d7H6
 u66OjPV3abPHiaaV8QPd48ug6jDjPRLP6vMjp+jnymNPIYs24eA9bCLu5YY1jHUcur/i
 6ELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=J2P6f/Qll54psTzyshVTaRUOsXK9V7Nooaq1sBo16AM=;
 b=V4/OX3KtptUXbkQSK6WkE6lDKdeRyMizPQ/x4HJwCq1kdSzNmSLCzeHa19bNYSVGDh
 jmwz9Xi2C+qlW34Om2JJkyO9YKtIqpTe0SkPhjyQTDKGZIjSUaFhu9rbd9XkUcsyEVdu
 J/CUK99157snlTvri8MBpriDFKhVGaDDWUIBtp0MlVkFQdDWtkZaFGMjGNLzdZUPEsw1
 /R04nS0XiSNfA82j12UpX2tBAyx58vaWKLIJqhdYvSJAx4gbPksOojBBMVurOs1VNH9T
 UQ8ur6VfKnjk0gdNb7z4EBhWeDV8WOfkNgs/qcKXuHjZzdovlDlSWp96GVSbJtgrRc79
 3huA==
X-Gm-Message-State: AOAM530Jtbat4/c+9Y8vzQp78qlZWReOg6WYLGkwwce6QLNh8xXZNwsw
 4P4FuUwjn+JHueGD/+rAddI=
X-Google-Smtp-Source: ABdhPJwrqr/f9zGtFfDhRDzosynmlvgk8Ol+BxnLfPEd/r3UzkWFd2RReMfqAjP0pnoJh/ol2/7uXA==
X-Received: by 2002:aca:ac8a:: with SMTP id v132mr36254278oie.44.1637030409922; 
 Mon, 15 Nov 2021 18:40:09 -0800 (PST)
Received: from [172.16.0.2] ([8.48.134.30])
 by smtp.googlemail.com with ESMTPSA id l9sm2902366oom.4.2021.11.15.18.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 18:40:09 -0800 (PST)
Message-ID: <69706525-65b1-8372-8ef1-1ee12e7bbc26@gmail.com>
Date: Mon, 15 Nov 2021 19:40:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH net-next] ipv6: don't generate link-local addr in random
 or privacy mode
Content-Language: en-US
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rocco.Yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <de051ecb-0efe-27e2-217c-60a502f4415f@gmail.com>
 <20211116022145.31322-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
In-Reply-To: <20211116022145.31322-1-rocco.yue@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_184011_372150_4C4DE754 
X-CRM114-Status: GOOD (  11.63  )
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

On 11/15/21 7:21 PM, Rocco Yue wrote:
> 
> Due to I can see this patch from the link below, I'm not sure why this
> happened, could you kindly tell me what the merge window is, so I can
> avoid such problem next time.
>   https://lore.kernel.org/netdev/20211113084636.11685-1-rocco.yue@mediatek.com/t/
>   https://lore.kernel.org/lkml/20211113084636.11685-1-rocco.yue@mediatek.com/T/

check patch status here:
    https://patchwork.kernel.org/project/netdevbpf/list/

check net-next status here:
    http://vger.kernel.org/~davem/net-next.html



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
