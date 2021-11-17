Return-Path: <SRS0=BaWb=QE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AB08C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:51:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C40A461B42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Nov 2021 09:51:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C40A461B42
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XE/s1Ksrtajfo5b16bX5bs1g2mlbLSeJElTlsGwtdJo=; b=S6yfVMsV6frh3z
	Q7uDGBiGB3ZLWxCuPYpbS2QeKA8dKkhbmPpai2wBDrlyTjTBEJnfwmGHrGuY+JmwwYjQfrlEP+mEx
	fFldsd6zJobMdrD95ziR6h1pvc7nvSLBcHE47M5J0fRDJ6CKQkAZYDuK0R2IOR4ELkOR3MmowIIta
	djrWyYe1VzZYRnvd0gQa0+2WMZ/KrbT04PaDvtHWgtQ+HndOioqdAelxJ4FHLYvNfFwusIGUpoMRa
	IX9fZP0zXaCV0mxaG8RSrIU8B+SNEAhRc2B86oGrNtGETNipESrioaNZPBn/y8NNZsWeHi2OsKOlN
	C66gkGnfJP5u21wzz8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnHb7-004MFj-LM; Wed, 17 Nov 2021 09:51:21 +0000
Received: from mail-ua1-x932.google.com ([2607:f8b0:4864:20::932])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnHav-004MC3-5a
 for linux-mediatek@lists.infradead.org; Wed, 17 Nov 2021 09:51:11 +0000
Received: by mail-ua1-x932.google.com with SMTP id ay21so4480857uab.12
 for <linux-mediatek@lists.infradead.org>; Wed, 17 Nov 2021 01:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6oHxCHdQqk1gh3FI9+RJPzkWEREzp+khMC/c8pj77v0=;
 b=YcoRJxjwrtTyqW2qbj7FcIlHAZHzUpSqJD3/jwPU17gBIgwXX8bClDU4AGEa6CsGcW
 SQPY9DvEJiMxr34YDITdg7chA6y4IfS+AOYqb5HtS1uOYLY+YlJKF15ocuXn1w6hwBdP
 ZubXsmXuLlLks+zSTc8HlZycwcUQQsDPqCt20e+vf/2uxEKVZu/CFMw8UuyiVyH6ZGuE
 0ouB7pwpJezqDbAR9M9NO8rm2C8R0AmOmRWNArG2q0Nk9ePetXThkZcDAdHCtycJ7v0C
 ggR242uBjrTkh9wKQPObQ37WFcMYKxYxXmf5N3rdrthB/ZwGA2gk0gqIVPgQsynKWtWo
 PUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6oHxCHdQqk1gh3FI9+RJPzkWEREzp+khMC/c8pj77v0=;
 b=5LeqVHxEo58WsME6cout13uSr9Zxvp+CjQOoL+2aMYyVtiOq1JvhzkORT3SHtJJoN9
 X1MWjTiOsV3XBJk+4x3dP+UDdMJY5jC5rW8hZEUqrqIHgkpf0bdtRSfBsjUtq1lYaecv
 OoY0ErkTbMbJ60xb5dbkyS+Qt1yD34ZYqYCR3ImxCn+3E47yRagzonsccQSdL0rw3lUu
 V+EZ2Ydce6vj9whxFyEhiJoBWbkxkNM4hbSpHahVaTBSHmCqw/vslhwY17Q3LqO/x8ol
 BEAMfAdoA+nhni1/Za2WEsPAytVJvi6rbGZfiI+Gmd1qSSUQy8LxJL0VSspujQERii0t
 HO+A==
X-Gm-Message-State: AOAM5317Fx4nZrK4/hYbtEkL+vxch/aUecclkqq7w3rRuzD0emEZVQat
 l29pTVs3BRTARqKhuw21/JlpKd4Pisx76PIiQ7CKeA==
X-Google-Smtp-Source: ABdhPJxSidgB1PW9yP9u9BdHEQuv2rP1drUYCBdYh8is5tDtH4wIN5ovaQZc3DJK07EXhI6g5X/uImaIFGytGxx1GLM=
X-Received: by 2002:ab0:6998:: with SMTP id t24mr21846787uaq.60.1637142666659; 
 Wed, 17 Nov 2021 01:51:06 -0800 (PST)
MIME-Version: 1.0
References: <CAKD1Yr02W-WuLx8ouvP+wTtkxeyTBW_dp1deo9sim7wfLA2LXQ@mail.gmail.com>
 <20211117071732.7455-1-rocco.yue@mediatek.com>
 <CAKD1Yr3CMPWMmNNU6YvpBiaXVttS9T8qGVgmddijYfLSfK-Rog@mail.gmail.com>
In-Reply-To: <CAKD1Yr3CMPWMmNNU6YvpBiaXVttS9T8qGVgmddijYfLSfK-Rog@mail.gmail.com>
From: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Date: Wed, 17 Nov 2021 01:50:54 -0800
Message-ID: <CANP3RGdrhrSYOnRRq1r6Uq6a4hK90f_KsUW2VOYQGW0GHMv-oQ@mail.gmail.com>
Subject: Re: [PATCH net-next] ipv6: don't generate link-local addr in random
 or privacy mode
To: Lorenzo Colitti <lorenzo@google.com>
Cc: Rocco Yue <rocco.yue@mediatek.com>, dsahern@gmail.com, 
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, 
 Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, David Ahern <dsahern@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, rocco.yue@gmail.com, 
 chao.song@mediatek.com, yanjie.jiang@mediatek.com, kuohong.wang@mediatek.com, 
 Zhuoliang.Zhang@mediatek.com, markzzzsmith@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_015109_234390_78F7A8EA 
X-CRM114-Status: GOOD (  13.22  )
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

> Can't 4 be the same as 3? The same netlink message can configure both
> the addr_gen_mode and the token, no?
>
> It seems to me that the following should work, and would be much simpler.
>
> 1. Bring the interface down. All addresses are deleted.
> 2. Send a netlink request to set addr_gen_mode RANDOM_LL_TOKEN or
> PRIVACY_LL_TOKEN and set the token.
> 3. Bring the interface up. Autoconf runs. The link-local address is
> generated from the token. An RS is sent. When the RA is received, the
> global address is generated using RFC 7217 or randomly.

Could you simply manually add an ipv6 link local address to the
interface while it is down (ip -6 addr add fe80::..../64 dev X), then
bring the interface up (ip link set dev X up)...
All that would need to happen is the automatic link local generation
would need to be suppressed if there's already a link local ip
configured - which sounds like a good idea anyway, since why have two?
(btw. even a manually added link local ip will get deleted when the
interface gets brought back down)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
