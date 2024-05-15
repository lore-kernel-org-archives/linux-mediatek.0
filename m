Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E425DC25B78
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 17:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aHE7vKazSCPusjGW9s/KeLr4sCT6I3eVwP0aPWhjdjY=; b=sEd1JQfQZjTMZWD05IE9fcA4ET
	NBo+AYu+RZvd9gm4SmSWYJnYBwAAPVOzEeLfDavT4Syu9rJaEX0e8tApGYkF66g+YZpJoCZ9/tH7m
	R9sfwEKbeTfBJMiiZDyfoAkr2u4rGcb8gMKSshy53hKrV6IVSWxdlO3FoWsd1nI+8z/mNsbkwuWD/
	eqRI0OsPMSKQlbakioRHL8RVDlHztIE4s+kdgK3fwlL2W6lr1kOEkrvxQsQKnjiT4ujSqI/VB+CvF
	FfoweYIclufkJOM0sPmNiR9L8M2z3i4pTk5jqcoGqJ830m81c7nMQSUD8anEUz+9mnZR2SMHTH9l1
	EkBnMzvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7IgU-00000002S2S-3d7Z;
	Wed, 15 May 2024 17:44:58 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7IgO-00000002S18-0mb0
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 17:44:54 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-23d1c4c14ceso4524546fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715795090; x=1716399890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aHE7vKazSCPusjGW9s/KeLr4sCT6I3eVwP0aPWhjdjY=;
        b=ZyGPrpvjjnP7rIsGqMw/hjE8+FaZqKP6JX/b+pbVXTuLUyHJ/XlC446dj/YQkrWVkw
         bd19fmJry9T+k0SRn9ppCw1WDpIZQGnhIBwcJ1gzZQgAphEVUNwISXptQBLy9Th4E77e
         1xlvH6P9cElUILIGkLo/HDIpqZi9B/3nOavsQqf3G104FJWuS66S7khidktKbpPRBy1f
         /kULut6zCpdqwccXKfh/43FignU7iZPT9T+VtyNFddedfQPizUPmyLtcLVct7w2BOLQm
         8cu48SkEHNbBONpkHD03CYop/Mwq820Uoagvw3ears9JcXTllM6RMQSwKfTF2eF7Kgx/
         nmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715795090; x=1716399890;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aHE7vKazSCPusjGW9s/KeLr4sCT6I3eVwP0aPWhjdjY=;
        b=P6EsyYh1vnY8ujYL577OknQRbg4/ZFU8HUU6xM+o2ydlvu8fMw9UdNYhQ0OiIUHRo5
         tqYyH7F5WZWx8hH/gWlW5IV1Tphcuo7gbsFzfPnCg6yrghZjIX8KGrkkz4870sXLgP6z
         UUOCfgvTD1h/201BygmO+GiPuO8oYSeMIDgBpkmIsqM0CP0gOY/Y5eH3ht1cEwFrj7uQ
         oyfkzhyx7s3Jpf1737gEAHF/YyHEWlK1Ne3pk9ZBqeYdH7XmMrEqxo94o5HVBDpxiuS2
         7wFuQbsfOfeubXdhknYhX4mPShPnjxlTkllsVfcII+ulXiuSr1w7oLg2vR2+41rBhVP8
         S8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUHcJsqtgzuf0uGuJi0FPg052h1KkrOLuKSYXiJHhvmXD7COSBMx7gUPJWC+0msAv2k1cIeYt0xIC64yXDO6NQ6x6XNTaPFaKGLgDe56jNCKXbO
X-Gm-Message-State: AOJu0Yx8paU63hjDzfQcTNHllEE0A6v4bzvwXdNR/aun99rkU0PkJfSr
	WDDnA9HQ2Pt8yTVCGXz55sub1vVDbPlHTMTUesJuFHVmJe3KxFmHUOxCIbL45A==
X-Google-Smtp-Source: AGHT+IF16vw5ldq2DEQeMTmXB3e2sX+wSSbbVPVrx/3sJzxb2YomXPDc5Mwow7eXWfCtuMlI4cEQLg==
X-Received: by 2002:a05:6871:a00f:b0:240:eab9:1635 with SMTP id 586e51a60fabf-24172a904bcmr18531712fac.21.1715795088326;
        Wed, 15 May 2024 10:44:48 -0700 (PDT)
Received: from google.com (57.92.83.34.bc.googleusercontent.com. [34.83.92.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ade2c9sm11332969b3a.125.2024.05.15.10.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 10:44:47 -0700 (PDT)
Date: Wed, 15 May 2024 17:44:44 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Yenchia Chen <yenchia.chen@mediatek.com>
Cc: stable@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sasha Levin <sashal@kernel.org>, Simon Horman <horms@kernel.org>,
	Ryosuke Yasuoka <ryasuoka@redhat.com>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Pedro Tammela <pctammela@mojatatu.com>, Thomas Graf <tgraf@suug.ch>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.15 1/2] netlink: annotate lockless accesses to
 nlk->max_recvmsg_len
Message-ID: <ZkT0jFN-XWKf4jQK@google.com>
References: <20240515073644.32503-1-yenchia.chen@mediatek.com>
 <20240515073644.32503-2-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515073644.32503-2-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_104452_294651_2DBC665A 
X-CRM114-Status: GOOD (  12.74  )
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

On Wed, May 15, 2024 at 03:36:37PM +0800, Yenchia Chen wrote:
> From: Eric Dumazet <edumazet@google.com>
> 
> syzbot reported a data-race in data-race in netlink_recvmsg() [1]
> 
> Indeed, netlink_recvmsg() can be run concurrently,
> and netlink_dump() also needs protection.
> 
> [1]
> BUG: KCSAN: data-race in netlink_recvmsg / netlink_recvmsg
> 
> read to 0xffff888141840b38 of 8 bytes by task 23057 on cpu 0:
> netlink_recvmsg+0xea/0x730 net/netlink/af_netlink.c:1988
> sock_recvmsg_nosec net/socket.c:1017 [inline]
> sock_recvmsg net/socket.c:1038 [inline]
> __sys_recvfrom+0x1ee/0x2e0 net/socket.c:2194
> __do_sys_recvfrom net/socket.c:2212 [inline]
> __se_sys_recvfrom net/socket.c:2208 [inline]
> __x64_sys_recvfrom+0x78/0x90 net/socket.c:2208
> do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
> entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> write to 0xffff888141840b38 of 8 bytes by task 23037 on cpu 1:
> netlink_recvmsg+0x114/0x730 net/netlink/af_netlink.c:1989
> sock_recvmsg_nosec net/socket.c:1017 [inline]
> sock_recvmsg net/socket.c:1038 [inline]
> ____sys_recvmsg+0x156/0x310 net/socket.c:2720
> ___sys_recvmsg net/socket.c:2762 [inline]
> do_recvmmsg+0x2e5/0x710 net/socket.c:2856
> __sys_recvmmsg net/socket.c:2935 [inline]
> __do_sys_recvmmsg net/socket.c:2958 [inline]
> __se_sys_recvmmsg net/socket.c:2951 [inline]
> __x64_sys_recvmmsg+0xe2/0x160 net/socket.c:2951
> do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
> entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> value changed: 0x0000000000000000 -> 0x0000000000001000
> 
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 1 PID: 23037 Comm: syz-executor.2 Not tainted 6.3.0-rc4-syzkaller-00195-g5a57b48fdfcb #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
> 
> Fixes: 9063e21fb026 ("netlink: autosize skb lengthes")
> Reported-by: syzbot <syzkaller@googlegroups.com>
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
> Link: https://lore.kernel.org/r/20230403214643.768555-1-edumazet@google.com
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: yenchia.chen <yenchia.chen@mediatek.com>
> ---

The conflict resolution looks good to me, thanks!

Reviewed-by: Carlos Llamas <cmllamas@google.com>

