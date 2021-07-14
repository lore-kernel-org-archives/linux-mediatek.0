Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81C2C07E9A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 18:20:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9987C613C9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 18:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9987C613C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qRs6kGVnG1sMB8HcA3klNc22fMGQQp8XBQFX2z1jWPQ=; b=WE3IYDUCMyEbZKCLmDgrLPCDkF
	dpB15puSZcKEbaB8psYBah0X9QjvV+bwQOY6DMBcLTBt9S0FzE3Iki2UeQrpTlFCcIuWfxpaXyzoj
	HrNnkxXz7ntUHvzq1ckceFNKAUk74EytkgLGkEHjjUhKWWYa7QUR1sFgbs3S61+DTYf1NxAg6SWDd
	Tvw6BoOoPwrI4nyQwhj2KoeVdPPomPKAYdI4Q5s4Y1+mpcPhm1HYslVaBAH37lV9GlAzfbaHnRK25
	HwRalK1uRY5JIIe5NFiZbF81CBgyxXwNAQ4t+SVncpowJD/H4+h6ltNWHQHnjtBfJ1lkNEET2sJl3
	zSP6mm3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3jUl-00EPZD-9p; Wed, 14 Jul 2021 18:20:31 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3jUi-00EPXg-QK; Wed, 14 Jul 2021 18:20:30 +0000
Received: by mail-oo1-xc36.google.com with SMTP id
 j4-20020a4ac5440000b029025992521cf0so848558ooq.7; 
 Wed, 14 Jul 2021 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IZHV17HrDm3mXvlMglOQgvLLp42WlpMA1EiV1Ps+/BI=;
 b=H+vm6oqHFE6x5nWY0AIBWZrMU/JFV1E7RlfPV+htdU7SqDZZNrKwrdLtrafZc/AorS
 A1cI3NKH0fEKqOI4Al014QT8bwC0hHpab3fl6RAGB1cFpYFLf8fnP2oh4Rzrr+dfGKpw
 Mf0r3bS175zI3IYORzlw2VwRPBmPKAVYUF2pmBbeHNKu4K6n75aOez1hPrxCwm6UtxNK
 Jy+67R0NeXPH1meUzyTOjHe7YgUH46e0TKUhMdKS1PlV7MtP4wCP3tVD8ePGffDa5Xee
 9VcZqpMV9OmUPoBjvETHo5dMsjF5p98QUm1pHe16Z1ij/jmr9TMkRHlOPr8vZjoHrMJl
 e0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IZHV17HrDm3mXvlMglOQgvLLp42WlpMA1EiV1Ps+/BI=;
 b=LWd8fTcE0xW4PbzfzPZCEC9JbXsEYb1Y7NT18GOA0JZxJQnDf0QfrJArAGwtrqBfPW
 t4KXYM4xn1SLm2k3EIpVIa+OFCnQRN577Gh/bBY81+z/vubAEKVMMxfxl9lJuxQXLElQ
 pReP2XjMMHXARwacBapZ3fozHAYZYS8wiEddyzj0kUEd2HecIW7l5SAkARG1xr40yy1m
 m4gAps1IhQGt4Xmce6Qd38HHH2ahKoWjlkFYdknX96K4t/W15YIUsLSndzbyzHejCDjv
 xrUoMoMM75QUFUenmGTmlUfSLDJ5twe3LQuvITywIuQ7CFI+XwzRRMNIVE3d8EjHSy7S
 pN3w==
X-Gm-Message-State: AOAM531+YoUoRT8ap/XlFPhXxHi7dNBesZoKSolcBsXBwC481Od8zd8/
 g9GPedKZXOar4KSlRYuNUWY=
X-Google-Smtp-Source: ABdhPJzsxslVMe/u0X4ex3JA+B6DQS3NdJKCEqD6Tg0m4IaMXYXw659YBjHMM1dTLnt4gmZP+/qkdg==
X-Received: by 2002:a4a:97ed:: with SMTP id x42mr8831385ooi.49.1626286827439; 
 Wed, 14 Jul 2021 11:20:27 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.38])
 by smtp.googlemail.com with ESMTPSA id b10sm645794oiy.4.2021.07.14.11.20.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 11:20:27 -0700 (PDT)
Subject: Re: [PATCH] ipv6: remove unused local variable
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, rocco.yue@gmail.com
References: <20210714151533.6210-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <c524c725-84ce-0106-6e28-bf5c7dc36e30@gmail.com>
Date: Wed, 14 Jul 2021 12:20:25 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210714151533.6210-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_112028_940352_4D391619 
X-CRM114-Status: GOOD (  12.23  )
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

On 7/14/21 9:15 AM, Rocco Yue wrote:
> The local variable "struct net *net" in the two functions of
> inet6_rtm_getaddr() and inet6_dump_addr() are actually useless,
> so remove them.
> 
> Signed-off-by: Rocco Yue <rocco.yue@mediatek.com>
> ---
>  net/ipv6/addrconf.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

please add 'net' or 'net-next' in the subject line.  e.g.,
[PATCH net-next]

Reviewed-by: David Ahern <dsahern@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
