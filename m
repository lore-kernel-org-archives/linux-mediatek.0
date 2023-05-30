Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57ED2C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FiS5c6zZkJ+xAX4VGba307pG2mdpaM2GPSO79PcG6yY=; b=JTiO3nU5ngvVi86NJ4DANTmrfM
	3/wLnFlA5GGYDTRjDbQOQdhg5lnlGsP+zGcq7cHNi96TUktPlXGMC+l0pA7ZPkEar+sQFSlNAGJdr
	NzX+cpDyJ/Gbe8Gua/4m4U4lAUEgbd/EIOk2YZXuVQQ/i2oMqBvWPeOVQExyE53ggtGO6H8CJ7LcM
	tq+pXuuKOIWt2ORlH69EiSqEvV559KKGOjf1fkeQOFgPKxeup9/enFdMYtiN7AznhYJwPt0w7eGVK
	y/bvjIZCgfEaSs1mjIegsx2XXnihdmLNCpOO/ItzVF0nTcmJEM2HPDFxEEBpDXeSLWIWHkSEQct6/
	uUWs7WfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wbr-00DNMv-2W;
	Tue, 30 May 2023 10:29:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wbp-00DNMF-1I
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 10:29:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AA5CF62330;
	Tue, 30 May 2023 10:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CA3C433EF;
	Tue, 30 May 2023 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685442582;
	bh=yaQ1s4zqJX+CR6dLRA+UZTtmUpMxJSpY3TwJ7NIb7pw=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MtphMf9fx4Ckf8MUWsnOC2+KfKZgeU0ZtAT6Nhi/dHL1UBFE+4IIHm3yj1wmROfkS
	 gRMBm/TWmoBooKy7de9GhOr1U5is9vKttU35U12v+0JWKDL9Zi6qQt0Uvf2GyxF3PZ
	 41o1dB1Ge0DR/YSgun68lWzlnKm4fR8fJXCDGPCW+y8D0D2pVJ8TaPDqZghvc3Zc/c
	 tBOe/l/s/uwLrQ11oJlUhIhILhvTbFAYfuY8PYn8n2AfVRNkCXdDboUOSNvkokQQfL
	 KZ+WAZ6KN8V7iYyfwgyrEPaNUXpeAdm0OlXQwBZ53o9Pxva9DZ7gmdbS1Oh52kYMz4
	 WLyLk7FAXqC5g==
From: Kalle Valo <kvalo@kernel.org>
To: Osama Muhammad <osmtendev@gmail.com>
Cc: nbd@nbd.name,  ryder.lee@mediatek.com,  lorenzo@kernel.org,  shayne.chen@mediatek.com,  davem@davemloft.net,  linux-wireless@vger.kernel.org,  linux-mediatek@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] debugfs.c: Fix error checking for debugfs_create_dir
References: <20230524160352.19704-1-osmtendev@gmail.com>
Date: Tue, 30 May 2023 13:29:37 +0300
In-Reply-To: <20230524160352.19704-1-osmtendev@gmail.com> (Osama Muhammad's
	message of "Wed, 24 May 2023 21:03:52 +0500")
Message-ID: <87v8gajeni.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_032945_688107_F96899BD 
X-CRM114-Status: GOOD (  10.88  )
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

Osama Muhammad <osmtendev@gmail.com> writes:

> This patch fixes the error checking in debugfs.c in
> debugfs_create_dir. The correct way to check if an error occurred
> is using 'IS_ERR' inline function.
>
> Signed-off-by: Osama Muhammad <osmtendev@gmail.com>

The title is wrong, please see the wiki page below how to create titles.

Also no need to say "This patch fixes..", saying "Fix..." is enough.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

