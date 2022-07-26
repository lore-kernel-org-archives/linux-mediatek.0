Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A34CCA489
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 13:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpH6sKzIKmV9ebjuquoPpJqCUdyomLMUNpKFGyrZVvY=; b=ECd9AZs4+od6FomUxHtmtpET0U
	qXXvsAqKmojc+I5iNaR2xeB72hd0IRJpcHnXty8tTQcP/NXPoolFtYFMwlzxLM2odlFd1uF1f/fSD
	9Pv7M7tK9x190xP1WnUJ/pudOes4642MNuU+SNcy/Xg3Q5ZDMY/GkbxOZvj/PlOkqydD+kDqV6FBN
	lqG43jDEJtwyZ1jpr47d3ODu7kwwPHEuF1XVFf6GC23DUb/xmwLzjPAwvIOeOWnNgslwVnHBP9vhu
	bSx3CD646UwIJIGfCmhwDWuehIfdjfM8aIB5+A4hXlYbFF9is1EdC8tvPM4S4kGTCOs49/gqAKZds
	neeDpf/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKH9-00HFXi-N4; Tue, 26 Jul 2022 13:07:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGKH3-00HFTX-GX
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 13:07:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12A8F6156C;
	Tue, 26 Jul 2022 13:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6FC8C341C0;
	Tue, 26 Jul 2022 13:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658840814;
	bh=Fp0ETMXSf1u3HJPg8GQaoP+P+FapvKLn/mwE+gJI7rs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YCboPrdPeQPwh2ex7MGeu+llbROZNF9gz6JMv7KfTuPLd1oy8qycF38zn5HFiHaV5
	 c5Hv8wFscyatMyzj/C4px+BlemLaFSQoMI279jvzONakFAiOlecn1/lgrhNzC7QbyU
	 b0vIx8nuuI6DVqhDXwoFGitbNDFFX6J2/NBVj1SncSIbauQajrGfU8ynftH+GJpt/O
	 FfcNZx0L3xUQVcH/MY3Ef9dFW2Sa4dk9+b9/hJ1r3hTMKm+qYg+GUHOVvEAzCpYAVo
	 3fNiaGD/vrg+GCAhJlh1eWT9xRnIbkNxJxsXNDSNxGmJwmwThJp3CFNq3ExAGvZyhs
	 TEcI/hFmYwNOg==
From: Kalle Valo <kvalo@kernel.org>
To: Lian Chen <lian.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  linux-wireless <linux-wireless@vger.kernel.org>,  Bo Jiao <bo.jiao@mediatek.com>,  Sujuan Chen <sujuan.chen@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: address4 null frame using fixed rate to trigger WDS
References: <20220706090901.88929-1-lian.chen@mediatek.com>
Date: Tue, 26 Jul 2022 16:06:50 +0300
In-Reply-To: <20220706090901.88929-1-lian.chen@mediatek.com> (Lian Chen's
	message of "Wed, 6 Jul 2022 17:09:01 +0800")
Message-ID: <87wnc0koph.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_060657_627661_C140F5E3 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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

Lian Chen <lian.chen@mediatek.com> writes:

> From: "lian.chen" <lian.chen@mediatek.com>

Please don't use dot in your name and capitalise it as well. So this
should be:

From: "Lian Chen" <lian.chen@mediatek.com>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

