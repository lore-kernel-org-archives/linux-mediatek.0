Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1B0C432BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:36:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E193060F48
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 13:36:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E193060F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9y09exrOPmXY33rqtHPPmjyLfIVtDpLQh5aUD1Qjxr4=; b=QHQC9HV7RYt+tar5hFpDfUZFU1
	l9/SSzmM9LbplVlq7bFlqWCd0tJg5HdDSgS1+2UEv2W4k3JRw3UrKZYPxFzlRGU5lRgvhENkoegHW
	0IBGviEXS1gegJPjV/Hw86EWOBcLuu7KcxbnjKMTdyIgeTIGkUD0inId0AVijeRLVpW8sKOsUJaKe
	O7NvjIoNBd62a+N+agIdrMR15Ecx2AMXyo1wGlA7bDQIY/Bkb8fLktIfMgS3/h4+U9NT44h4dhkHa
	D2g02mQKgAzp1yJpJer1yBi1DsoStz9ndzQhI7eMmYAcC+SYYGlRcGfaFW3K7l4GHwuv0rLIwFC4W
	JHGZC7zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAY6e-00GPHr-PV; Mon, 02 Aug 2021 13:35:48 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAY6b-00GPES-8G; Mon, 02 Aug 2021 13:35:46 +0000
Received: by mail-oi1-x231.google.com with SMTP id x15so24064574oic.9;
 Mon, 02 Aug 2021 06:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=X53LpF2kO65kz803KOIFSNLqcQAq/CJTKMFv1axedq0=;
 b=GszpJG+QV6Tr45bD/TAem8TbYsT69ak6AZLfwtetur1m18YxkhllwVNq3IFUiyzHX6
 O9kr3M5wkRktx9eD5vN/DoZGn/bDIRGuC5jipqH0AssiPS8AMjAZ/lEOcMyovVnB/+pV
 1bkREY8Y8hug1n9cCwYluAkXYzK8gyU+T+fGKMmCKJqjul/OJsGbQ9SZjIuzODnFd4hj
 z5kAtpR2vUuw1Mr2PEkiO3VnshktUwur84+HWkEQi72BsKXjDcW/trbPY/DOf1bbxM0x
 MD8uLONZd+qImcZozj3AOjWd5QkzzQRbJTP3TowTHXpA0SaeOPYz7/URJD0KsfZt0+Po
 y63w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=X53LpF2kO65kz803KOIFSNLqcQAq/CJTKMFv1axedq0=;
 b=VwVUkyC7AezhYbwGkhW76rnUZ0ZmgwI3Z1WIemLlaxVgvr+7XYP1MK278dW/3kh/Ey
 9wBQG7HXHB4TA9Hu/nstdqOkVe+BDinqgvf0lesG6knVCspXAHxUmw7Kho5RK4gIPjIr
 WqCGHXRcCwi6wv9i3A0QPOVrkmCECKJZvqWMLDO4zMPOuCZ33Frt9pV2bsOiUVQtfb5O
 RD4JX56Ekalecsvr/rUAyq5iyWCjRdB52ZbtkM8BQQiH0VspVtpVmXlSINBtRuL4+byG
 u+bKRDVUnjMEX8OyYmIaJmQgOWX+rYBAdm9L4d7WoPh3o6sFojx+EGvfpUx2gKy8Ntd+
 4cwQ==
X-Gm-Message-State: AOAM531cUc4decV0AroM7zXDfOWPenDiS4t6/OgcwMFj++2WG7nKJd4F
 lo+BwvE3Fl5z8k/2gTq27YA=
X-Google-Smtp-Source: ABdhPJyH3oocCaQRCCUiP6oA4SY0kwqhDuto+HIg3zCsoXTPSDhN6JNZdaflsgv6M2wgMpoecvZ+pw==
X-Received: by 2002:aca:240b:: with SMTP id n11mr10753237oic.63.1627911343834; 
 Mon, 02 Aug 2021 06:35:43 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.27])
 by smtp.googlemail.com with ESMTPSA id z8sm1534840oog.19.2021.08.02.06.35.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 06:35:43 -0700 (PDT)
Subject: Re: [PATCH net-next v2] ipv6: add IFLA_INET6_RA_MTU to expose mtu
 value in the RA message
To: Rocco Yue <rocco.yue@mediatek.com>, David Ahern <dsahern@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 rocco.yue@gmail.com, chao.song@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210802031924.3256-1-rocco.yue@mediatek.com>
 <20210802124039.13231-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <c20aa306-81a9-f083-25e8-85002063b4cc@gmail.com>
Date: Mon, 2 Aug 2021 07:35:39 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210802124039.13231-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_063545_382290_7C44611D 
X-CRM114-Status: GOOD (  17.32  )
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

On 8/2/21 6:40 AM, Rocco Yue wrote:
> On Sat, 2021-07-31 at 11:17 -0600, David Ahern wrote:
> On 7/30/21 7:52 PM, Rocco Yue wrote:
> 
>> IFLA_INET6_RA_MTU set. You can set "reject_message" in the policy to
>> return a message that "IFLA_INET6_RA_MTU can not be set".
> 
> Hi David,
> 
> Regarding setting "reject_message" in the policy, after reviewing
> the code, I fell that it is unnecessary, because the cost of
> implementing it seems to be a bit high, which requires modifying
> the function interface. The reasons is as follows:

The policy can be setup now to do the right thing once the extack
argument is available.

do_setlink() has an extack argument. It calls validate_linkmsg which
calls validate_link_af meaning support can be added in a single patch.
If you decide to do it, then it should be a separate patch preceding
this one.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
