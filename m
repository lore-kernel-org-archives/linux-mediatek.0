Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93951C77B76
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 14:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Awbc5h9Woxhvnjsc932gtuo2omYGLdkb+mEuKC9/NDc=; b=I5hUePWL7qJ1rmKnjjA5E8ibrq
	v1KNvGpl9Lo/6ps/FXQTNReW5Z/HqEzg6rY18WexAf8AgI8VM8oo3oC72LoKOZm3jRZPHW04cXUzS
	5c44hRGghJP9H5Sw9eEC5h72T5L1botoYc+KXIQQjByroFKIhdDbbzkhemodKnimKkCvRZzeKnM0F
	CQ7M30G0FR89dIy2TgTX9ygBj89Q1/o5EXdFsKxuw/rLBW/JrPor/wwfkMDOaLiPyWFNmS7TxV03G
	GAeUV8EFABRD7LOyZEoV4rWgnKD1oaxpRV09T1xc5lArkNpRi5mtubJllppCaISpAbDDtoZ0XQ6mZ
	HyXWKgJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVLm-008JgP-2V;
	Thu, 20 Apr 2023 14:33:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVLf-008JeR-2d;
	Thu, 20 Apr 2023 14:33:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4786A63C0B;
	Thu, 20 Apr 2023 14:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252B0C4339B;
	Thu, 20 Apr 2023 14:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682001202;
	bh=q2atBF0cJlaYHiFetu0vG4x/7tLR7MTaSABzMRmXwv4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X3mPIEBX6NLvJa9OkFPu4tVqZSXj0fChyurge4rQ9NwbLE+Arg9GVSAdRNL2xU4mP
	 0Okkqvyuqzf3PKrpgRHsnY3QR6m5+R/ljLfNkY5QFOztMfiCJ3ki4U3GuxlF1GtCRd
	 r841Asy3mqEL5zIpFxVoLWvikElbPxz2mqrc10lJRJxsV2t4x5OTvJAIEslweVRLmt
	 7WrXAJlAYXdjKeOE/5Q0M41XWtTJobpY5wv0zI5qoTmJkHJwSHdF+qKkKwoJnhab6s
	 F/uYiomEphAYsJOuOfMZQaDebsk0vUsEjs4SJA8i29zMDx1n0LuULR8m49vjFHrdMI
	 TAKCv0QPp7+Gw==
Date: Thu, 20 Apr 2023 07:33:21 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Wang Jikai <wangjikai@hust.edu.cn>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 hust-os-kernel-patches@googlegroups.com, Jakub Kicinski <kubakici@wp.pl>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] wifi: mt7601u: delete dead code checking debugfs
 returns
Message-ID: <20230420073321.47dd0cfe@kernel.org>
In-Reply-To: <20230420130815.8425-1-wangjikai@hust.edu.cn>
References: <20230420130815.8425-1-wangjikai@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_073323_891340_5E5C366B 
X-CRM114-Status: GOOD (  13.07  )
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

On Thu, 20 Apr 2023 13:08:14 +0000 Wang Jikai wrote:
> Smatch reports that:
> drivers/net/wireless/mediatek/mt7601u/debugfs.c:130
> mt7601u_init_debugfs() warn: 'dir' is an error pointer or valid".
> 
> Debugfs code is not supposed to need error checking so instead of
> changing this to if (IS_ERR()) the correct thing is to just delete
> the dead code.
> 
> Fixes: c869f77d6abb ("add mt7601u driver")

Don't add a Fixes tag on this cleanup.
one - dead code is not a bug
two - the semantics have changed since the driver was added
      so it's certainly not the right Fixes tag

