Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5820DC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 05:15:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3A9E613C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 05:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3A9E613C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9URqepw9MyoDltF+BiCivOKGT/10T5zEnmdlhZROqbA=; b=y89frAuYZDomXZkEN+FS1RBMoC
	MdLxkPTX7X6Hd+1PcGPKbt2EweDgp2aSO40kV/qDvnYz5NFkduTASB+eSKMJ9H9nPrtdWrxSOwyU2
	SW44YyTanTcVb9v+wuxPuipVspb6Fi+F7iglEyQhbE+wNaUgJer2EcRjF1QsoGy0Wk6mWKASCNP39
	M10sM2FXfAH8EfY7HbneauSwqv1Bv6NGBWQWFLN3zH92PB8mdB7xAVEQLaAw57MmykWeJQwOGMxqv
	7fZPtxjDasg5ZNy7luBrP+dbdoFEpIu9nIZ34UQqIaJg7kF9URztwBKtI5+jG4IyRM+sG3YwhpmQ4
	PhQkp6cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwHho-00Clyr-2c; Thu, 24 Jun 2021 05:15:12 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwHhl-00ClyA-6n; Thu, 24 Jun 2021 05:15:10 +0000
Received: by mail-ot1-x32e.google.com with SMTP id
 x17-20020a05683000d1b029045fb1889a9eso3916767oto.5; 
 Wed, 23 Jun 2021 22:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ygVK/gHTe32gLfYg+HdMiky3oi3YqC6Bf5Vvmj5Zl+8=;
 b=sBvyWoSY43NEdsQuD2mpylbcW+pJ2OA/rEmAizwqasIEpG7j1cRvGQdQqkQOkkEPoD
 jpE3P/r6WjYYSBbhSZBQH6KGNMohNQcO6+z0iK2Y95X5k2ZgaK7/kVwW21/1M+cZLOLm
 +pn6HwIxlO4hGsf5ZyX5tUteSuhW447ykhqPhjxNjA2CpPvDIuWE0ZHcKy0SJZ4TMHSg
 xnowYIvUE235ox1gs2Dvrv6cr1JQaAvNcLP4tx15fIPWZ7xE52ILxsqbcgn65ydkxTP5
 IMNUkvi+5B9Qm7Ecw4HlIRVwE4W6ToiloA4yHh0q5xsFy3CKA58Lox3+wgbW4c+YcAHb
 UevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ygVK/gHTe32gLfYg+HdMiky3oi3YqC6Bf5Vvmj5Zl+8=;
 b=Y2MNhNrg0NQhRbdnXq5MygVsGOH38BvYfDSPPKYecfn1hPYsFskhqSt2jTH5AlokUC
 giJBrCpfPLxEhJKWCaH3qwZCjaHeK1sCpqbeTzsIf2Nys9rR5TySWdPxelJ1//khmQ5J
 aGcGhoKgdrvjQZ/sBf2Lk4yNJcQUbI5w61U+KMyJ3ZBUhey8SEdE6Jn0IidJqc2IRi/5
 acxnPciWAnk2UpbpjQEy+h8Ip+C8gkBWwBHfSPCRDnt7gtWdAAk8GxBqWYW2XaMju+IN
 F9a84sPUHM9l3TSNL9rDu78DfT4czy1XNvY5HbOraQFQ2C541v6JUQ1sO5FtvggWV1tA
 4NfQ==
X-Gm-Message-State: AOAM5337UYWzX8wbKtGRUb17WuBPhKQrAPT0CZr6RJ9u2VhBn1T8OTYh
 zLOO8AcQ2CbB2DXrVvnc+ow=
X-Google-Smtp-Source: ABdhPJzFTXWfeFhKgI+SmmsouB3/cWaqzN1wX0lKKpc8lOfLNfz97zh7StsBeRMv+x1D6+Quas1v3Q==
X-Received: by 2002:a05:6830:4cf:: with SMTP id
 s15mr3108209otd.72.1624511706557; 
 Wed, 23 Jun 2021 22:15:06 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.38])
 by smtp.googlemail.com with ESMTPSA id 61sm62037otl.30.2021.06.23.22.15.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jun 2021 22:15:06 -0700 (PDT)
Subject: Re: [PATCH 1/4] net: if_arp: add ARPHRD_PUREIP type
To: Rocco Yue <rocco.yue@mediatek.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern
 <dsahern@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, bpf@vger.kernel.org,
 wsd_upstream@mediatek.com, chao.song@mediatek.com, kuohong.wang@mediatek.com
References: <YNNtN3cdDL71SiNt@kroah.com>
 <20210624033353.25636-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <020403ac-0c2a-4ad8-236b-d32e59aef772@gmail.com>
Date: Wed, 23 Jun 2021 23:15:03 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624033353.25636-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_221509_322373_464D184C 
X-CRM114-Status: GOOD (  16.19  )
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

On 6/23/21 9:33 PM, Rocco Yue wrote:
> 
> The difference between RAWIP and PUREIP is that they generate IPv6
> link-local address and IPv6 global address in different ways.
> 
> RAWIP:
> ~~~~~~
> In the ipv6_generate_eui64() function, using RAWIP will always return 0,
> which will cause the kernel to automatically generate an IPv6 link-local
> address in EUI64 format and an IPv6 global address in EUI64 format.
> 
> PUREIP:
> ~~~~~~~
> After this patch set, when using PUREIP, kernel doesn't generate IPv6
> link-local address regardless of which IN6_ADDR_GEN_MODE is used.
> 
> @@  static void addrconf_dev_config(struct net_device *dev)
> +       if (dev->type == ARPHRD_PUREIP)
> +               return;
> 
> And after recving RA message, kernel iterates over the link-local address
> that exists for the interface and uses the low 64bits of the link-local
> address to generate the IPv6 global address.
> The general process is as follows:
> ndisc_router_discovery() -> addrconf_prefix_rcv() -> ipv6_generate_eui64() -> ipv6_inherit_eui64()
> 

please add that to the commit message.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
