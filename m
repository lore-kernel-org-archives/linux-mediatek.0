Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56622C43458
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2026 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77oBzAV2L9TMXx/bROM6lzOXrpNGNQibPHkuk2PAc5A=; b=yFET35Js1FyGbsotGvLxAW1h4R
	buDlFLdjzoNJN/mY2AcIkljmd5PAgMEREo9YfWhBw3Dtmr704Ft85mDFNEp7YWS+JyMMhe5ZCtLch
	D5z4jOG3/dMURViYidFxXnVi8e1oy7fO0r0RTj+vL8zqxGgmEFsG0iznuEgWCpYjbK9npHp/SI+fK
	/lgZrberCyfr1Mv+hOxhq7hQW6PuNQF4V5ol7Mcpzm55irT2jZ9hKDWQSwGTBPLEUgpGkitV0o7rm
	DTNyM7087KkpTp2XVeDsgsuGFMcZnbAtZGZab6yuN4afUb3pQj3iEAllDrpS2YDueR4ko5n83GcKO
	ClQYFQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevIj-00000002D6g-0mBO;
	Wed, 01 Jul 2026 13:48:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevIi-00000002D6S-1Bxt;
	Wed, 01 Jul 2026 13:48:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E41343662;
	Wed,  1 Jul 2026 13:48:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA31F1F000E9;
	Wed,  1 Jul 2026 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1782913707;
	bh=77oBzAV2L9TMXx/bROM6lzOXrpNGNQibPHkuk2PAc5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f/vNQLW8ImL4jHyjGc8nEK6bGmRZFup8Jt35n8uPPAo733kpsB+g//kU0VwI4IRJz
	 H/aA6pzVHbubiCMYOiYOygF9QbBkcXvmsgwkdY8s/0KKUojafMTNChZAe6xb7g4mUi
	 ARdTZH/zPBnd3w2LQYfHNaY9qPewv9ltfU6nkg50=
Date: Wed, 1 Jul 2026 15:48:38 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sasha Levin <sashal@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Jiajia Liu <liujiajia@kylinos.cn>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>,
	Leon Yen <leon.yen@mediatek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH v2] wifi: mt76: add wcid publish check in mt76_sta_add
Message-ID: <2026070127-footnote-usher-160d@gregkh>
References: <20260528033814.46418-1-liujiajia@kylinos.cn>
 <b143b62e-ca11-4f00-ad60-f71ae55213b9@leemhuis.info>
 <akSoHk-BozrpWPmZ@nature>
 <dc7657b2-e3d5-4777-af52-1169fe743761@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc7657b2-e3d5-4777-af52-1169fe743761@leemhuis.info>
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

On Wed, Jul 01, 2026 at 08:16:07AM +0200, Thorsten Leemhuis wrote:
> On 7/1/26 07:39, Jiajia Liu wrote:
> > On Tue, Jun 30, 2026 at 01:29:51PM +0200, Thorsten Leemhuis wrote:
> >> On 5/28/26 05:38, Jiajia Liu wrote:
> >>> Since mt7925_mac_sta_add publishes wcid, add publish check in mt76_sta_add
> >>> to avoid reinitializing the wcid->poll_list.
> >>>
> >>> Found dev->sta_poll_list corruption when using mt7925 and 7.1-rc4.
> >>
> >> Jiajia Liu, Felox:
> 
> BTW: @Felix, sorry for the typo!
> 
> >> given that the problem seems to be in 7.1, should we
> >> ask the stable team to pick this regression fix up, as this change was
> >> mainlined (as 20b126920a259d ("wifi: mt76: add wcid publish check in
> >> mt76_sta_add") [v7.2-rc1]), but lacks both a Fixes and a Stable tag?
> > 
> > Yes. It seems to be related to cbf5e61da660 ("wifi: mt76: initialize
> > more wcid fields mt76_wcid_init") [v6.14-rc1]. But I didn't reproduce
> > when I checked it out and tested. So Fixes was not added.
> 
> In that case:
> 
> @Stable team, you you please pick up 20b126920a259d ("wifi: mt76: add
> wcid publish check in mt76_sta_add") [v7.2-rc1] for 7.1? It lacks a
> fixes tag and the problem might be older, but I saw two reports about
> this with 7.1-rc -- so it seems some recent change made that problem
> more likely to occur, so it might be good to fix it at least in 7.1.y.

Now queued up for 6.18.y and 7.1.y, thanks.

greg k-h

