Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6B5C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 08:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpUCiW0p/4X5hmhVp/OhOhpi4cNDYmdm08i4Zkz9l5k=; b=oPtuVhk2rgMGov4P+eQWeGZpQ+
	3oIhGC5s1q2FGtw8Xd7Jme6JqYkHzYXxNfePNhQXBc2PiNjtKIFfk1ljL2iox1q2UC6ntAYeJnZJL
	EyM5fpJ3x61A01adl4X1W/SJ16fJxAcw389LLe6F8/sHQUA2Whi/5+nkqTltklXDdCQP62kLQQVuK
	RBxa7tSsNaCIsgW5ACRyc18z00FLjrHiRfU7aLEtsCPJlHeaBYhcvp53xNP1So6PNQzI3Ue4ln8Rf
	J1ZxNQd2ckMsINqb/f02hEZcvakAeB3snfJYNgt+xPtfGNHenb+mK0/gVmUmUlGZKQVQtqSCCjkUN
	j8VoHVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSD7j-005AdP-N4; Wed, 15 Feb 2023 08:26:43 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSD7h-005AcR-9T
	for linux-mediatek@lists.infradead.org; Wed, 15 Feb 2023 08:26:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 5D9A6CE090C;
	Wed, 15 Feb 2023 08:26:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03E3DC433A0;
	Wed, 15 Feb 2023 08:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676449591;
	bh=zQtGlDG1xVHfxVULJ3poQHX7O/rMIjMzR3+yzqktZ5o=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=FZTnt2lRasjFXMBj5DkWa1Kl00FlFl+WVMK8W3vvV5X4qs/2RUoGzhs0QrvMmzLn1
	 EM0HjmojIaPni/Z1Xb+LqBpLs8WQVxggIf3C6D+etthl+uaDzbh8YX24fkZeLGg+gd
	 /5qfPyadi9g2PHE2f2YNc/TlfDrIsrfCUxi05lHUUaHUoztxSck4Q9FpKGPyYUQjXX
	 F/QHVJsSrk1MyKwVP1XIxlIHHIw+ffHI2tDv6mUmn6FMZMugD7jaSxBjcoUmpFZbTR
	 sIw07p+VtxKWnht/TjvQE/DV0w7O5RLcUXn0PcVvmhzjL94IoUUnabwTXHaWsmttd6
	 2vTe+qOJyc6/A==
From: Kalle Valo <kvalo@kernel.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  <linux-wireless@vger.kernel.org>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  MeiChia Chiu <meichia.chiu@mediatek.com>,  <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] wifi: mt76: mt7996: fix radiotap bitfield
References: <79c72b8b101f561bae2350b7945cb41bef86aa83.1676095591.git.ryder.lee@mediatek.com>
Date: Wed, 15 Feb 2023 10:26:28 +0200
In-Reply-To: <79c72b8b101f561bae2350b7945cb41bef86aa83.1676095591.git.ryder.lee@mediatek.com>
	(Ryder Lee's message of "Sat, 11 Feb 2023 14:13:58 +0800")
Message-ID: <87pmab49mz.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_002641_554556_D07373B0 
X-CRM114-Status: UNSURE (   7.27  )
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

Ryder Lee <ryder.lee@mediatek.com> writes:

> Update radiotap bitfield.

The title says "fix radiotap bitfield" and the commit log "fix radiotap
bitfield", neither really explain anything. Please but more effort when
writing commit logs and make sure all Mediatek engineers understand the
importance of this. This is not the first time I'm mentioning about this
to patches from Mediatek. More info in the wiki link below.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

