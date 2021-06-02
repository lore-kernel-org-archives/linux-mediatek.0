Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC47C47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 04:20:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E2E61040
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 04:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E2E61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pc9i2SFiAiwzuc9z5q2+IlwDqKLOvpuJbaonWIw0qrA=; b=WCc5pp9N5O0ND9uVkviWbE84E9
	Hj1B0mqngzevZhU2WnVGa+f6asBwwU7NKQ3x0yByASqqyWeOAX1jh4gEmleJfIIya312Iut47BTQI
	dAitDt9ZTjJrJ3AL6mgsVvpbJpEMUw1hJT/kVxCqMvh6VMp+74ErUKeDqHGtgqdCuWjZHG4mMzyTZ
	B/C3+qyvgYGcI3z1C2tLtkXVhzJ8baSJRi5dk5QmOdkUS4+i1x54fEHAPPrLJyDhsrYNODA6u/STv
	lgPQyw3OoZm789kRY3SYHqYSsu/pbjSxv4f930zARBQhP1DzwR1HqMqU1RNfPxUH2jli9NLQrodn6
	Y/m9N9/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loIMU-001og3-FW; Wed, 02 Jun 2021 04:20:10 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loIMQ-001of2-Up; Wed, 02 Jun 2021 04:20:08 +0000
Received: by mail-ot1-x32b.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so1352461otp.4; 
 Tue, 01 Jun 2021 21:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iMGGsERMcpA8geFW9RIY3rOzp/NmJwFBkoB6KSFK9fg=;
 b=kXURr4p8FYVcPWJPYQpN81Dnc23rFNR576uqzwHXok9JqcJIjI6lYm+b/65+Kc7BzQ
 r3lfmmlY/ey68rQd9erNzPIRbPTPUCxhzBZWVFFYM354letowY1j3NV0w5pkBdOTs7fX
 lTDz4+vUHQ+5wN/nV8MO+4oMzUADGYznF/ijy2lvw6uR4vhT/Dch7MpI8OFKHPLWdHNZ
 kPeOF4sU8Umpl/15u5sBC9ePcVHkxAoG46af2xb1ljN4C150i/RHON091eYeWHF9R0St
 K8tN98do0Ar+WlfhtnaJUj5tDrmoZcYtM+re/HfDitBJY0H3GWZ/Cg70t+mpnsG/DECq
 LNag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iMGGsERMcpA8geFW9RIY3rOzp/NmJwFBkoB6KSFK9fg=;
 b=GLDTnW+a1uyqg8rI0ECM6iLL0e9PILtqUTfsERGtdGDxyK9szdTmKOWMF/TMu7pH34
 N947VDH/OdUz+VJ4Enz0lrjhdOCIAXMdBbkzEZifAuUa9fLOrCDavG87a7pWP7DZQ4Gf
 QWH9dz60mJtg/uADSwEPvqsgReR08WD2quiQlYHI7q31+8yvm2paO2akl1Ujx/QgPL8s
 i1f2SDxQJfne2YPU49852O0S0Ty3lnFxZz8CXjiV1FyHorqQqtd7NBh7NilLfomj5rxB
 NO1Y5TO356AicD+ElPvBLIW2dQhr//Zt+mMW8VerH4uwegRGT8VNirwvTihufZXxo7hk
 iV/A==
X-Gm-Message-State: AOAM533mOlsOkvNuei+xOk4+E1PbgYuKJQ8LSdjFSABWaNvfwwG74Cvn
 VCsq1i9TV1D9Wi7k3g1bwcM=
X-Google-Smtp-Source: ABdhPJxIICiS9DApqp6rDz37Pujc3qqjy2E0zZ1KFQCNVyxmacAjPjgq5QQFR3HoGsyV5xY4tmfwRQ==
X-Received: by 2002:a05:6830:16c4:: with SMTP id
 l4mr25176368otr.93.1622607605823; 
 Tue, 01 Jun 2021 21:20:05 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.22])
 by smtp.googlemail.com with ESMTPSA id x14sm3932671oic.3.2021.06.01.21.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jun 2021 21:20:05 -0700 (PDT)
Subject: Re: [PATCH] ipv6: create ra_mtu proc file to only record mtu in RA
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: "David S . Miller" <davem@davemloft.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 rocco.yue@gmail.com
References: <7087f518-f86e-58fb-6f32-a7cda77fb065@gmail.com>
 <20210602031502.31600-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <05efe271-72f8-bc77-8869-ae4685af5ea4@gmail.com>
Date: Tue, 1 Jun 2021 22:20:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602031502.31600-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_212007_031262_784D5CD4 
X-CRM114-Status: GOOD (  19.48  )
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

On 6/1/21 9:15 PM, Rocco Yue wrote:
> On Tue, 2021-06-01 at 18:38 -0600, David Ahern wrote:
> On 6/1/21 3:16 AM, Rocco Yue wrote:
>>> For this patch set, if RA message carries the mtu option,
>>> "proc/sys/net/ipv6/conf/<iface>/ra_mtu" will be updated to the
>>> mtu value carried in the last RA message received, and ra_mtu
>>> is an independent proc file, which is not affected by the update
>>> of interface mtu value.
>>
>> I am not a fan of more /proc/sys files.
>>
>> You are adding it to devconf which is good. You can add another link
>> attribute, e.g., IFLA_RA_MTU, and have it returned on link queries.
>>
>> Make sure the attribute can not be sent in a NEWLINK or SETLINK request;
>> it should be read-only for GETLINK.
> 
> Thanks for your review and advice.
> Do you mean that I should keep the ra_mtu proc and add an another extra netlink msg?
> Or only use netlink msg instead of ra_mtu proc?
> I will do it.
> 

I meant DEVCONF and notification to userspace was good, but using an
IFLA attribute and no proc/sys file is better.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
