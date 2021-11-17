Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 08:37:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C949661BF9
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 08:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C949661BF9
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fhnJchziVlN2AmlGoF4EhJySnGMFhOPwX6skP72JLOA=; b=YhCNu9OUCDqEte
	MBFYTT/tpfZIMgWk9JMCqnr+D0NtEen7FnAFbUyjriqEyQ/ig5/kSedMl4NcOMW6w7ecDHa6CVEmg
	QRXm7NWSSvRv8CjgfBhI01es5XmGo3W+yKMA6blfzMUT4WqUm9DPhmalCa38ceCq94x1q5ZjC2yk8
	zli4byYqNSaOqjrh2Ijoxt8PNu2HDnCE3vv6x9jFInEI801mcWfmWI4BLFczfEg9hMYw5Vh4Lyfip
	OVWHgDV6yoJUHE4tN/Ik1HcBWLYUGTQoUw1dsTpA3z5diGpFxCe7m1LAVjIV8fpF5ggToXSTQGLBq
	NF1Rn6MJim2eAh+CEnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnGRL-003yHK-3F; Wed, 17 Nov 2021 08:37:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnGR8-003yDl-L9
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 08:37:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id t30so3024244wra.10
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Nov 2021 00:36:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WrPEvEbWf6Wc0DXft8xWpwNHryeVDMkAQS+5Bf1seZQ=;
 b=Rd51I7u6tzAIugOkmci8FtxptCl14VCBCDb6jJFoovrmWDH0iwZXNjmaPZnEmwGHB7
 w72ZBxf27jaCOtqb58DxUYnlcqiVFDRteNX2hZjDkqikexdq9zY8qFmJL60i0CYki3QD
 X9AUTtQ7351p7c+fOqHxRmC9YJy6mOquiKUw6didobc2+/sMQSG35P0qyqB1PAPtnYu6
 lniKzdhUFjxVi2BurMR1evX1WltkWpjTQHo60fKPgciofbGIRdLywt8znfsPKg9Q/OAC
 A/zLFZV3heNlL2xnW+IVAZjbMw9m+vYJXrcyDLH9/h1WCxh44tFaiO0oG38pzlCK9LII
 q+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WrPEvEbWf6Wc0DXft8xWpwNHryeVDMkAQS+5Bf1seZQ=;
 b=g1XHd1SZGI4okffA7OV6mpt3pZHwOpr073y9qAhqHWGcyiY0OzQgA8l67hZpMBY/Fw
 ArUSxpepXmREbiX4ms4XXEBSY7EIYGa2XdwkAWW1NzX1RuMa/Ox0U6HgwFuNKIffh/oy
 QaV90h3TTOZw+xZ1gik0QhChwxoADus8Is2L2zjHT4nFiylcVDF4geHOFWkaeX99XZHx
 GYv7amLbp3/2raqG7iv9zTI3vOy+tz9ZAr1slYDXHn9wArFSdR2Vh1QnM+XnbgCDm0Gt
 grlgmsJulid0i1Lkpk0siLLsudUkh7CkTf6qORqfkojGjybCxJHnvvALswmejj9w+4Od
 xrtA==
X-Gm-Message-State: AOAM531xxzfnlr37LvOJ95zrtxLH347MqIeIIMSsU0o/G6qKJBifP6hQ
 OVvv8xD5TpJT8V/H9YEC6hAjOQQWwXZBKDHGQi3w5w==
X-Google-Smtp-Source: ABdhPJyttg1bVl2qBGNNhXrWHmcwegsT28FZnB6NKWXtHkaTk8EOWeGGvP1WXHR4QqR/ZZ1eg9EHTJJxDmxDy6c+SF4=
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr17009629wrq.311.1637138216539; 
 Wed, 17 Nov 2021 00:36:56 -0800 (PST)
MIME-Version: 1.0
References: <CAKD1Yr02W-WuLx8ouvP+wTtkxeyTBW_dp1deo9sim7wfLA2LXQ@mail.gmail.com>
 <20211117071732.7455-1-rocco.yue@mediatek.com>
In-Reply-To: <20211117071732.7455-1-rocco.yue@mediatek.com>
From: Lorenzo Colitti <lorenzo@google.com>
Date: Wed, 17 Nov 2021 17:36:44 +0900
Message-ID: <CAKD1Yr3CMPWMmNNU6YvpBiaXVttS9T8qGVgmddijYfLSfK-Rog@mail.gmail.com>
Subject: Re: [PATCH net-next] ipv6: don't generate link-local addr in random
 or privacy mode
To: Rocco Yue <rocco.yue@mediatek.com>
Cc: dsahern@gmail.com, "David S . Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, rocco.yue@gmail.com, 
 chao.song@mediatek.com, yanjie.jiang@mediatek.com, kuohong.wang@mediatek.com, 
 Zhuoliang.Zhang@mediatek.com, maze@google.com, markzzzsmith@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_003658_713211_5184D7EA 
X-CRM114-Status: GOOD (  15.17  )
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

On Wed, Nov 17, 2021 at 4:22 PM Rocco Yue <rocco.yue@mediatek.com> wrote:
> Disabling the kernel's automatic link-local address generation
> doesn't mean that it violates RFC 4291, because an appropriate
> link-local addr can be added to the cellulal NIC through ioctl.

Well, it would mean that the kernel requires additional work from
userspace to respect the RFC.

> The method you mentioned can also solve the current problem, but it
> seems to introduce more logic:
>   (1) set the cellular interface addr_gen_mode to RANDOM_LL_TOKEN or PRIVACY_LL_TOKEN;
>   (2) set the cellular interface up;
>   (3) disable ipv6 first;

I don't think you need to set the interface up to disable IPv6. Also I
think that if the interface is down autoconf won't run so you don't
actually need to do this.

>   (4) set token addr through netlink;

Can't 4 be the same as 3? The same netlink message can configure both
the addr_gen_mode and the token, no?

It seems to me that the following should work, and would be much simpler.

1. Bring the interface down. All addresses are deleted.
2. Send a netlink request to set addr_gen_mode RANDOM_LL_TOKEN or
PRIVACY_LL_TOKEN and set the token.
3. Bring the interface up. Autoconf runs. The link-local address is
generated from the token. An RS is sent. When the RA is received, the
global address is generated using RFC 7217 or randomly.

Cheers,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
