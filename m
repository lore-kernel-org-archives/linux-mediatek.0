Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAF6C25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 18:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNwqDkuFgKjhVHJW0w5JUYp4JYk3Ki4mNKDdPxV9apI=; b=LdRoishJi4m0pUM3rxIZPgFAGt
	SFnyIl6f0HrBiXKdoGik68Z7UPHVh++4o/WbgbaBhlVLxcEzbQiXBmqg8kGdllW6PzC/6BC+NBiWq
	D2X6u9be92nwy9PS1l3wKl3uEWjeYYyPeqH/lI7ZIeUxUg46uXPqWMdFisPUm3IHVgVgmvnrk3ZjD
	jqbbH1wfNs8Vari9z04Ke7r9nOoxa9KXbjfLPvdb3/J6scgUQ1PvVT3f6tFa3hNiaFmExQtLbEvzq
	miOVHz41ndFmamuOFaz/L1dISH4nQaREFwT3cmaMdCZNmopWwmE+YdzHdcfQxX/vkR61lxktSlkL6
	CT76MQIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBf7N-0000000G3hU-0mGo;
	Mon, 27 May 2024 18:30:45 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBf7J-0000000G3gG-2sZT;
	Mon, 27 May 2024 18:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=VNwqDkuFgKjhVHJW0w5JUYp4JYk3Ki4mNKDdPxV9apI=;
	t=1716834638; x=1718044238; b=qq294NiMW+Umd//R+Iek7poOaRGs2K1N+kxAfA++JAMN4WX
	AH5YRPm6GZchkqKp4X5SINGVpOC9zRJxk7f3mDYzRPNVQw497X0JsNNIA/67Jgv7GrlnPjvp3oScr
	R0KC1q0I8yMlBhw4NW17tNI5NMF5W2kf8tzmlYUWLNOJqH2g3AiGzZK9mYVgW7qdE52AK9/CJjeiX
	wQLap1ly8oRafHyClUxs/Jb/WXhaGwPv940xDmPVHzBGMEIxt/QYiptlezfMKCwyuZCn2HbQrMzqT
	53613LhEH/eVR2HRldiXAG4n/c72aegBxp41AglEceokZfoHH7KfxEfZMbB2EFZA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1sBf7B-0000000D2t4-0Xcd;
	Mon, 27 May 2024 20:30:33 +0200
Message-ID: <98871a58e675aef7ad7f2e5bd3bb2ee526d29d5f.camel@sipsolutions.net>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
From: Johannes Berg <johannes@sipsolutions.net>
To: Greg KH <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, "Linux
 regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
 linux-mediatek@lists.infradead.org,  linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder
 Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter
 Chiu <chui-hao.chiu@mediatek.com>, StanleyYP Wang
 <StanleyYP.Wang@mediatek.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>
Date: Mon, 27 May 2024 20:30:31 +0200
In-Reply-To: <2024052750-rippling-catty-1cb5@gregkh>
References: <6061263.lOV4Wx5bFT@natalenko.name>
	 <2341660.ElGaqSPkdT@natalenko.name>
	 <60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
	 <878qzy9zly.fsf@kernel.org> <2024052750-rippling-catty-1cb5@gregkh>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_113041_896940_97962D9D 
X-CRM114-Status: GOOD (  12.76  )
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

On Mon, 2024-05-27 at 20:29 +0200, Greg KH wrote:
> >=20
> > Yeah, commit 2f7cf3b61d85 should have been taken to wireless tree but i=
t
> > fell through the cracks. I didn't realise that it's an important bugfix
> > and the commit message didn't give any indication of that either.
> >=20
> > But commit 2f7cf3b61d85 is now in Linus' tree so it would be good if
> > someone could submit it to stable releases.
>=20
> It's already in 6.9.1, does it need to go anywhere else?
>=20

No, but apparently we need a similar commit for mt7915e or something? I
have no idea why I missed those. I'll take a look tomorrow.

johannes

