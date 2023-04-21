Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E1BC77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 14:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RsZO0aByP2vNyNm10Q625p8xvxW9viKnWnntJA7FUw=; b=eAayh4WlUEzFcQjK6lK5WFlFDh
	EldUXKfsONeRVI9zRi9kKA/h4+Ah09iVg07IRcK5hQChFRAiLfZd8HJYxjrdWG0fdCi1VwcTysA+P
	wlNIH+GYmrDgdzB1fsBc4yvBSceUxfTon7CKwp4eI6WGayslGBNYAvRfJzVOY+mR/9qIqIOB5AN+B
	MLkYU2o4ZzDBKd43DYMQlqT1lVuh4rcqxJVkWTnO+t8fEC1m9sM1QAQ6cZXUT2KqXKHp2mwfIyqqu
	iIAae9fSEFEj7xwHDkAA4jqRBcnXumOIVAQfmH+oQ0b7hZ/04Tde7+IZe2tnw9jI3RHGQpF8ppZp+
	CYRyNV2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pprky-00B6LQ-0y;
	Fri, 21 Apr 2023 14:29:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pprkv-00B6KA-02;
	Fri, 21 Apr 2023 14:28:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9337D63E64;
	Fri, 21 Apr 2023 14:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F192C4339C;
	Fri, 21 Apr 2023 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682087336;
	bh=SqeL1ZjkoRfB8AReeHRqh0HINangrhAFQKlYy4oXftg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Th0K9geNEH69pqjscKcQfL3qpAFMkpWCc+gR6hBFLwEQ6p3/CtvF5IXgdbe6uhh++
	 rdVFOI00HZ8WgQcDIATtz9KYRKtMsDH6GwroH5aU+EkMsj0ylwzcXMNy15p4T3IHml
	 U4jX2ZlkkGgQy63R46X35rYMZpxQLIz9ablkeEH92233CKEcZmAQ4QC3TqelBQxm57
	 K1u3fVZSLGJ9akkB4ZO2nqoKgbDkBHzCVbV4V4i7cSrpyJ2zxiVx5oabBaSZJNv5g5
	 R5plKo1KeZjncc8dBfeKRe1+j3LM9CR4DJK7IaeR02NIjkplgHCUk/Cg//c2Rzs5X5
	 A9/7AeWW8fgoA==
Date: Fri, 21 Apr 2023 07:28:54 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wang Jikai <wangjikai@hust.edu.cn>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 hust-os-kernel-patches@googlegroups.com, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] wifi: mt7601u: delete dead code checking debugfs
 returns
Message-ID: <20230421072854.6521ecef@kernel.org>
In-Reply-To: <20230421092200.24456-1-wangjikai@hust.edu.cn>
References: <20230421092200.24456-1-wangjikai@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_072857_087312_F515D4C5 
X-CRM114-Status: GOOD (  11.27  )
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

On Fri, 21 Apr 2023 09:22:00 +0000 Wang Jikai wrote:
> Smatch reports that:
> drivers/net/wireless/mediatek/mt7601u/debugfs.c:130
> mt7601u_init_debugfs() warn: 'dir' is an error pointer or valid".
> 
> Debugfs code is not supposed to need error checking so instead of
> changing this to if (IS_ERR()) the correct thing is to just delete
> the dead code.
> 
> Signed-off-by: Wang Jikai <wangjikai@hust.edu.cn>

Acked-by: Jakub Kicinski <kuba@kernel.org>

