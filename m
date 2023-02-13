Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B80C636D4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Feb 2023 12:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MLymFjb+nYu4LEQsF2Xphe3WIi2vUjwmmAyGtpdrUqQ=; b=WivkkX3FINzju4D/nUdcpPQPFC
	X5ONr81X1FoHTJqdHxX443Agvu2vIzy9/Yx1DWlLe8q1NG+KjoaM2OIkMF9B3MgOMA3j4V4aFkPud
	6y7kO6LYa2XTwI7YWSplTdREnZgikkDMTeItr48hcu67GwU2g+yRWcYjubRNQhP9zk8VO2ZSq0JCv
	MknUDySSaFMFoEKlru3zr+zjfbhT8AorbWXaZ7b5cwE5BZZ+R6meErQK05q4l7vQRDSDoR7D2WViw
	y38CBAgsBZFPJtVAYwJLtGpisVvd+9hx6n0oI65GurJbeusIeMVXY2EjLF44pUXzk1zYhK6EcYNTZ
	pM/Gx/Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYC0-00EgUk-DQ; Mon, 13 Feb 2023 12:44:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRYBx-00EgTs-EX
	for linux-mediatek@lists.infradead.org; Mon, 13 Feb 2023 12:44:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB00461025;
	Mon, 13 Feb 2023 12:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE4DC433D2;
	Mon, 13 Feb 2023 12:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676292260;
	bh=jrLyf/GztDce91rXsuNwGlZZizqPgYCMfxS3dR7fo2c=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Vp92LeHeRxy3a3k7lx7Q1Xdz2yyfIR8QtHrubDHG7dH4cwBDxAyH9akiMICG6A4bR
	 vzIFixpZ7z6VgReJzirTi1HTKQTCKTo3t0coS2hJ1RbLX+MowBdCavdrCso1M9ENtL
	 HqLBC96Xwb/2DRn+I4kidjleRLBtxyyrKLr4hX8K0gYaA3OnV02Wt2kH16ZqbsFJtQ
	 byhi96Fs7vkiTGZ9jOP4Bwe8K7AykEZMt2hNXn1tvbBkFK0/O/oxFVy+feGDH97MgM
	 tCG8H8N0uSQr4nup7pWqLji8GU5m86oo9+9MlB5aHm7Nzp9kKS6WidbIm2fUVfH+Jb
	 RpO0Bb4OUtA/w==
From: Kalle Valo <kvalo@kernel.org>
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Evelyn Tsai <evelyn.tsai@mediatek.com>,  Ryder Lee <ryder.lee@mediatek.com>,  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,  <linux-wireless@vger.kernel.org>,  <linux-mediatek@lists.infradead.org>,  Money Wang <Money.Wang@mediatek.com>
Subject: Re: [PATCH v2] wifi: mt76: mt7915: remove BW160 and BW80+80 support
References: <20230104090352.31938-1-MeiChia.Chiu@mediatek.com>
Date: Mon, 13 Feb 2023 14:44:15 +0200
In-Reply-To: <20230104090352.31938-1-MeiChia.Chiu@mediatek.com> (MeiChia
	Chiu's message of "Wed, 4 Jan 2023 17:03:52 +0800")
Message-ID: <87fsb968gw.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_044421_662672_7F8985E5 
X-CRM114-Status: UNSURE (   9.74  )
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

MeiChia Chiu <MeiChia.Chiu@mediatek.com> writes:

> Remove BW160 and BW80+80 capability in mt7915.

This patch is already applied, so too late to change it, but I comment
anyway as this is important:

The commit log should _always_ answer to the question "why?" and explain
the reason behind the patch. For example, I have no clue why you are
removing these features from mt7915.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

