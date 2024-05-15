Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EF2C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Inmc+syrxkqK6aZQdAoIkvH5UOxtf+2Na/UaXVJLBFc=; b=hHELud/ocT1kGkLIWCi6ihYEmW
	yAz2Wd9o7cFWgPYHiKqOUbKCDRsLaBFzw2uw+t2lfNFyULmuKrT4FUGZ12nzuHFU/fx9l6zyXXRr2
	JfKKA1pib8RNfgyDDAIwWvTMCbmBqYJg1teqyTxpAH1eHkqd+Eq13fR9jDrT1EgNxSC9fPTgiTzNo
	7xF5AC9xcy+mS5ocbS3VyAGQZpQADTStejhJOxFYd0bmAR9Dx5CF0esqZkBRyfL7qckhGC/bvg4J5
	ZHMEJXxUoN/mosTGLn99H3eg1SSEZIbAShJsppXMfYaNZaSrzv89uYXlt3B+AGdvFavtGITgtcnzI
	mxtm0rbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7IhB-00000002SGq-1YmV;
	Wed, 15 May 2024 17:45:41 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Ih7-00000002SFD-3kn1
	for linux-mediatek@lists.infradead.org;
	Wed, 15 May 2024 17:45:39 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6f44ed6e82fso6264684b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 May 2024 10:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715795135; x=1716399935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Inmc+syrxkqK6aZQdAoIkvH5UOxtf+2Na/UaXVJLBFc=;
        b=YLuDOJ6Ck7EqdFgDYU6vF+I3txI2N/p8956nonYYscsy56YiXVUnu548jt6QzQhsqi
         sCvQvYBKY38VmtauRYwltYAMKehk9qdxnuT4eig7a9AXd5ihOY1MvwNQl5w1s5M1/+ap
         WAefFJtgFXtlKp8Up6EkPtUy4m6DgcNToZqvbpBL8BSumfcq2ufRCzKIGRz02wJSzo1r
         mWick9hEWpRC+Mwxjp2RGS1i4kof0frC/yJRhASUqTuamjYMOCF/5kcY1Sp+72BzQkDb
         IqYhlC/7+Q9NMCVkvnf0t/KdjKjBFlfDTNE4RJvTtGjlwNEwfGD10TIIqTukOliQt3vZ
         LIXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715795135; x=1716399935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Inmc+syrxkqK6aZQdAoIkvH5UOxtf+2Na/UaXVJLBFc=;
        b=DfJST+Ll5cb14nA4sFmqu/oLQxARLoFQZZ1gl899mIJf6kLmWeSXV6z6SEq4DZrx0V
         hBiQ4WX6p2y0Kd/3LQ0ydskRD+nnrcemMC8RBzLAGUaI3G5yIe+Q22LTCFz21VF22wyw
         0zgQPUWSQ2qbHmq8Y7Zygn69dcNCa3zcmUwr9BAF34Zj48pE8PWRQGkizuhav7qIgr0I
         qjWj4mPUkXR4Hrp+iOeR3quSxe/UCIoW94AbK+/Dz7rHmJJMLLXFNQcRDyKJdjcmFtqj
         v7XcfOMfS/0LUkxpLsxhSrHB/Aa/hXzXtH1t2mcM/vZIWlELmMrChNOVxPVmNcSd+h0d
         DsrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1kY++tI5HTmctKJ+mjNYPAAd9Rem/78PWQ9L0Uk7z2HrILZqUogeA0JZOQk9n+mOcCfgsH1hN2aJvo6Jgsb2O2pcGlZyzUxzbZopxba2U3AUz
X-Gm-Message-State: AOJu0YyPdzMv011bTCs5IBM8xzRRTurCYmP8QrA5Krp2V6LLH19U0mSp
	lOOZ2Jv6Fx1sZ2nnCgia8L1cNT97cKBMpiF12NTRzlMkJoGuAvst/yo8wLOJtg==
X-Google-Smtp-Source: AGHT+IHqT+V07QT8d8OIJOetBXVRP2MvqJqTkiAGp4q63p16McqvNFOMMSJe88kfRvnGTsQMprg35Q==
X-Received: by 2002:a05:6a00:270f:b0:6f6:7b6c:51f6 with SMTP id d2e1a72fcca58-6f67b6c5295mr995107b3a.24.1715795135090;
        Wed, 15 May 2024 10:45:35 -0700 (PDT)
Received: from google.com (57.92.83.34.bc.googleusercontent.com. [34.83.92.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a828e2sm11379011b3a.72.2024.05.15.10.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 10:45:34 -0700 (PDT)
Date: Wed, 15 May 2024 17:45:31 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Yenchia Chen <yenchia.chen@mediatek.com>
Cc: stable@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sasha Levin <sashal@kernel.org>, Simon Horman <horms@kernel.org>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Pedro Tammela <pctammela@mojatatu.com>,
	Ryosuke Yasuoka <ryasuoka@redhat.com>, Thomas Graf <tgraf@suug.ch>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 5.15 2/2] netlink: annotate data-races around sk->sk_err
Message-ID: <ZkT0u3RMc89Fe6PV@google.com>
References: <20240515073644.32503-1-yenchia.chen@mediatek.com>
 <20240515073644.32503-3-yenchia.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515073644.32503-3-yenchia.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_104537_958007_11B356B8 
X-CRM114-Status: GOOD (  12.14  )
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

On Wed, May 15, 2024 at 03:36:38PM +0800, Yenchia Chen wrote:
> From: Eric Dumazet <edumazet@google.com>
> 
> syzbot caught another data-race in netlink when
> setting sk->sk_err.
> 
> Annotate all of them for good measure.
> 
> BUG: KCSAN: data-race in netlink_recvmsg / netlink_recvmsg
> 
> write to 0xffff8881613bb220 of 4 bytes by task 28147 on cpu 0:
> netlink_recvmsg+0x448/0x780 net/netlink/af_netlink.c:1994
> sock_recvmsg_nosec net/socket.c:1027 [inline]
> sock_recvmsg net/socket.c:1049 [inline]
> __sys_recvfrom+0x1f4/0x2e0 net/socket.c:2229
> __do_sys_recvfrom net/socket.c:2247 [inline]
> __se_sys_recvfrom net/socket.c:2243 [inline]
> __x64_sys_recvfrom+0x78/0x90 net/socket.c:2243
> do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
> entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> write to 0xffff8881613bb220 of 4 bytes by task 28146 on cpu 1:
> netlink_recvmsg+0x448/0x780 net/netlink/af_netlink.c:1994
> sock_recvmsg_nosec net/socket.c:1027 [inline]
> sock_recvmsg net/socket.c:1049 [inline]
> __sys_recvfrom+0x1f4/0x2e0 net/socket.c:2229
> __do_sys_recvfrom net/socket.c:2247 [inline]
> __se_sys_recvfrom net/socket.c:2243 [inline]
> __x64_sys_recvfrom+0x78/0x90 net/socket.c:2243
> do_syscall_x64 arch/x86/entry/common.c:50 [inline]
> do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
> entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> value changed: 0x00000000 -> 0x00000016
> 
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 1 PID: 28146 Comm: syz-executor.0 Not tainted 6.6.0-rc3-syzkaller-00055-g9ed22ae6be81 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/06/2023
> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Reported-by: syzbot <syzkaller@googlegroups.com>
> Reviewed-by: Simon Horman <horms@kernel.org>
> Link: https://lore.kernel.org/r/20231003183455.3410550-1-edumazet@google.com
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> Signed-off-by: yenchia.chen <yenchia.chen@mediatek.com>
> ---

The conflict resolution looks good to me, thanks!

Reviewed-by: Carlos Llamas <cmllamas@google.com>

