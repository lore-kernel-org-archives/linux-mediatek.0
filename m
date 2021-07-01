Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D7FC11F66
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 03:03:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D003961352
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 03:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D003961352
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kMWCuoy+jagt87okaKjyQYBIryPj8+EW4d5kObqr5zA=; b=IQaqPYmOE7lQTm7xKKvlrkgEkX
	BSb7i/iKwkb7VdgMK5nM4SQAlarNyW8DtGqvBUey+D4QbAiRiGmAE/N4rZC2aVrGKFm4n59dWeEuP
	rRzMJIwaotYskZZryW53G/44Eu5lmOszFXOFwj2l6nzNnCybECyDAPLvz5jFdWO94UNS4KDYmesKK
	tlZmvG28iPhUSUzVtaGMUf4zuECI1/EzRHokMAMBv+frGXrBnA7Lv3uShNx9IwTt5t1/VoU19YTQO
	NSTe5ZILTgj/wOOfhaH6XG30gnyo8A99roRcYv16/mRPHgkJFNQrnccY35sCMf0sCd3dMf+QQnSOI
	IDo993sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lymzQ-00FxBi-MI; Thu, 01 Jul 2021 03:03:44 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lymzN-00FxAy-SB; Thu, 01 Jul 2021 03:03:43 +0000
Received: by mail-oo1-xc29.google.com with SMTP id
 k1-20020a0568200161b029024bef8a628bso1198334ood.7; 
 Wed, 30 Jun 2021 20:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=miX+HUGNry9LPmmE01qiRM28/4hRXxW/rSyq1X5RMvA=;
 b=rrcLIpMYDVHo8YMMCg+C5g3Y2pyHlfkH9Yasw0GfBTJIJG5VkNl/+aT2dHxvcG0KsZ
 58ARZrBU4ydpsDCtR+e6MwvgQ08Y4ibgDTktIZ6qHftwV2zNobAZm0Ke0KvdEBDdjJeA
 FHi5esfucH4d0STJBO/p9uYNtDeepR4HxMhnAO9G50xqtpMaHe1BQZJim6ZRYeaxZBBO
 5kRB5Tb5rDsvbJJzpnY68MmDDr1K4Gm+PicNXhDZHyx58gvPWIoraS5uflsiArm/o70G
 4W+fctfsQQVHlRXh8/PsKiaQdBuom0cXbMOnGCwKcxokZ/O5i/M++eR3WO81Sz17gBBN
 e1Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=miX+HUGNry9LPmmE01qiRM28/4hRXxW/rSyq1X5RMvA=;
 b=Ueva6o7JvDMJT10xesCNTFzdq6/DlZLz3d0xgW6iU9yDgHbLHpWodtEQSOVyMuViKT
 OXWyt6Hwx0znWIaHL8kHEZYAdRDSGDmUJeE00ElEfIRN6Mrs5LiiRn38w8Yuy0IC1lwY
 LSARRoC17tLn4tKIoV5XopArJrlUQU7FXcCAvUQoX6Vg3V/nGohxImo/OlZQ4At/7r5v
 ojD0E8Yxg4Rp13qU5ZSUaIdNnozKuNJMVUk1K8T/Lg5RcisQ/NVfqu6MbowVr9WRTbXD
 t181oo8z7EHVlEpuIM+jT0rvqwY/Trxc8ZVkhPY3O57M2DzeICZs6kmxDJEyBgvoYCK8
 Klkg==
X-Gm-Message-State: AOAM533UJ0OkUq6xJ5VBA45SogwO2QcPi7E3Ud+64gDJTGdgbUeOUFp3
 nxjtPvrZQuA3sVu+yiLRrS0=
X-Google-Smtp-Source: ABdhPJxNS3uM9ZSKZcUsFOgGvl15CC7VjYn6u1n4W3yLMranX1a/tzUlEv8HZdfoRQfVP/XaZUYLaA==
X-Received: by 2002:a4a:cb06:: with SMTP id r6mr11136256ooq.15.1625108618137; 
 Wed, 30 Jun 2021 20:03:38 -0700 (PDT)
Received: from Davids-MacBook-Pro.local ([8.48.134.38])
 by smtp.googlemail.com with ESMTPSA id c34sm5236974otu.42.2021.06.30.20.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jun 2021 20:03:37 -0700 (PDT)
Subject: Re: [PATCH] net: ipv6: don't generate link-local address in any
 addr_gen_mode
To: Rocco Yue <rocco.yue@mediatek.com>, "David S . Miller"
 <davem@davemloft.net>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
 David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Rocco.Yue@gmail.com, chao.song@mediatek.com,
 kuohong.wang@mediatek.com, zhuoliang.zhang@mediatek.com
References: <20210701015940.29726-1-rocco.yue@mediatek.com>
From: David Ahern <dsahern@gmail.com>
Message-ID: <3c0e5c52-4204-ae1e-526a-5f3a5c9738c2@gmail.com>
Date: Wed, 30 Jun 2021 21:03:35 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210701015940.29726-1-rocco.yue@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_200341_985527_00E81825 
X-CRM114-Status: GOOD (  12.56  )
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

On 6/30/21 7:59 PM, Rocco Yue wrote:
> This patch provides an ipv6 proc file named
> "disable_gen_linklocal_addr", its absolute path is as follows:
> "/proc/sys/net/ipv6/conf/<iface>/disable_gen_linklocal_addr".
> 
> When the "disable_gen_linklocal_addr" value of a device is 1,
> it means that this device does not need the Linux kernel to
> automatically generate the ipv6 link-local address no matter
> which IN6_ADDR_GEN_MODE is used.
> 

doesn't this duplicate addr_gen_mode == 1 == IN6_ADDR_GEN_MODE_NONE?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
