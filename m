Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8E9C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 18:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE7ZZ+9xlkPR4lCdiKnmWCGkl3YlSD91qy3t6iG2whg=; b=Pmb0XsUnv5/J6Er3FLBf1VRLtz
	Y4mKNuKkR8wI74OCYhllzbstIlAM/pyLnL205EKMjVUqWLbrUNfVOOJkl8JazSg5F+ZtLdWR9mxfZ
	8BK0zPl+/T4YSgz0O9VMscAdR36tNEyfAUodu+6t449CqSOFb6VZaX8bUS/FijNTNx3rlxnutm+6U
	D9O5C2ODmS7WOb+dPZDX0OFMZxxTMPBl5XV427zUIfb/vuUwGmktD8YGeXEKT0vyPI2CcujGHWjVL
	8Bq5tJn/EKRI1Al8I/ZhLxvr0jjMnXWwoYOm9F9PIloRDlL80zZU21nP49ZNLxwlbbNRs8FO0JsBU
	BVjCsT1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBf5o-0000000G3Pd-1In0;
	Mon, 27 May 2024 18:29:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBf5l-0000000G3P2-1uuD;
	Mon, 27 May 2024 18:29:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BACB761BB6;
	Mon, 27 May 2024 18:29:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06725C2BBFC;
	Mon, 27 May 2024 18:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716834543;
	bh=WCEO9fUe+0GQf8DDEogefQXVqjO2ehsYlYrxbZijXSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ts958yWY3Uvgact64hd/8yz4QyfDipMqtBbY/9pVuFx+VF1ewGl8LXX5oEJyebBNf
	 j+b3dC4Dbh0v1012gogIXFfxbjJCf/QDEnnSW4dVov7qH0Mp1bcckdjelsWFugx+s0
	 4MRV+cu3sey7bBVubpney7vFb8erx5y5Uch8dW4o=
Date: Mon, 27 May 2024 20:29:07 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
Message-ID: <2024052750-rippling-catty-1cb5@gregkh>
References: <6061263.lOV4Wx5bFT@natalenko.name>
 <2341660.ElGaqSPkdT@natalenko.name>
 <60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
 <878qzy9zly.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qzy9zly.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_112905_652425_033AFF4F 
X-CRM114-Status: GOOD (  15.74  )
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

On Sat, May 25, 2024 at 09:26:01AM +0300, Kalle Valo wrote:
> Johannes Berg <johannes@sipsolutions.net> writes:
> 
> > On Wed, 2024-05-15 at 00:51 +0200, Oleksandr Natalenko wrote:
> >> Also /cc Johannes because of this commit:
> >> 
> >> 6092077ad09ce wifi: mac80211: introduce 'channel request'
> >> 
> >> On středa 15. května 2024 0:43:40, SELČ Oleksandr Natalenko wrote:
> >> > Hello Felix, Lorenzo et al.
> >> > 
> >> > With v6.9 kernel the following card:
> >> > 
> >> > 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E
> >> > 802.11ax PCI Express Wireless Network Adapter [14c3:7915]
> >> > 
> >> > doesn't work any more. Upon mt7915e module insertion the following splat happens:
> >> > 
> >
> > 6.9 didn't get commit 2f7cf3b61d85 ("wifi: mt76: mt7915: add missing
> > chanctx ops")? Huh?
> 
> Yeah, commit 2f7cf3b61d85 should have been taken to wireless tree but it
> fell through the cracks. I didn't realise that it's an important bugfix
> and the commit message didn't give any indication of that either.
> 
> But commit 2f7cf3b61d85 is now in Linus' tree so it would be good if
> someone could submit it to stable releases.

It's already in 6.9.1, does it need to go anywhere else?

thanks,

greg k-h

