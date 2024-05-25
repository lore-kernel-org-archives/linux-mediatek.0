Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AACDC25B78
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 May 2024 06:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RkSOasl4Cv6gTpeIPkA439lTvWAtTE6MvjOB6/84eGE=; b=fzfC0pawqSAfPWaulToe0G9HMu
	PnKJr6KTlwy1nSPpbqTN6SNgdRLo3rqM3Ie1NL3VC2QozFIj7EGcAE5aUyorSLXjgFFO2k/Xtj0qC
	VEUZDXHNbK8or4x25vetPr7E6hzo5QiMHyuog5Ca7J936idaMQ9uMfRb7zU3du8DhywIDgpk3pZoq
	8sd8uP/8lO13Si3oGKNMz1pIkVHh2vKeoZduKpXmn58qUTDVcha3JuAKZSK6/HzTnyZA5ZE2bv5uB
	OuRG5wgGxFugKdBVZhWetGbVGhE8qVI2BSE6c8uk56losJzGtWQAQbxMg2mXNgA3gNh4NuqzFnEch
	p5061Ovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAl0R-0000000AVQ8-3nKN;
	Sat, 25 May 2024 06:35:51 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAl0O-0000000AVP2-07or;
	Sat, 25 May 2024 06:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C9A0FCE009F;
	Sat, 25 May 2024 06:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C4AC3277B;
	Sat, 25 May 2024 06:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716618944;
	bh=RkSOasl4Cv6gTpeIPkA439lTvWAtTE6MvjOB6/84eGE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=BG560QP0UQxEWQoWfBDB4EzUDAgarM8NaD1brHxJIl4va5VvnTnDLhgU9RmF3VwJO
	 lIqke26BqnMsQrX+hQBExNl2u1ydwWB2R6+dPbvW8CBk7MitPiiz1WmfztYHnd4FvJ
	 eJzYblpUGpZBapkJQ2FUt/zPadAqBvENABxBuWzVSmArPVKFNECKFirLPRp2Gdqto+
	 fcAO9XwQAl87KnDbQdhlDHG6KIr3q5zGNAVkV0Um2iW1cJASuh5gu9QK1VaOUioKeU
	 OWMsayQgurS8WIWtxO1DK4VdJgedMmWpB8afQpHzc5MzAx7cGfF4ej0TjPYAF+nfU1
	 DYZLZH3iDNIAQ==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Oleksandr Natalenko <oleksandr@natalenko.name>,
  linux-kernel@vger.kernel.org,  linux-wireless@vger.kernel.org,  "Linux
 regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>,
  linux-mediatek@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  Felix Fietkau <nbd@nbd.name>,
  Lorenzo Bianconi <lorenzo@kernel.org>,  Ryder Lee
 <ryder.lee@mediatek.com>,  Shayne Chen <shayne.chen@mediatek.com>,  Sean
 Wang <sean.wang@mediatek.com>,  Matthias Brugger <matthias.bgg@gmail.com>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Peter Chiu <chui-hao.chiu@mediatek.com>,  StanleyYP Wang
 <StanleyYP.Wang@mediatek.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
References: <6061263.lOV4Wx5bFT@natalenko.name>
	<2341660.ElGaqSPkdT@natalenko.name>
	<60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
	<878qzy9zly.fsf@kernel.org>
Date: Sat, 25 May 2024 09:35:38 +0300
In-Reply-To: <878qzy9zly.fsf@kernel.org> (Kalle Valo's message of "Sat, 25 May
	2024 09:26:01 +0300")
Message-ID: <874jam9z5x.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_233548_345869_CF13C1A7 
X-CRM114-Status: GOOD (  13.64  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Johannes Berg <johannes@sipsolutions.net> writes:
>
>> On Wed, 2024-05-15 at 00:51 +0200, Oleksandr Natalenko wrote:
>>> Also /cc Johannes because of this commit:
>>>=20
>>> 6092077ad09ce wifi: mac80211: introduce 'channel request'
>>>=20
>>> On st=C5=99eda 15. kv=C4=9Btna 2024 0:43:40, SEL=C4=8C Oleksandr Natale=
nko wrote:
>>> > Hello Felix, Lorenzo et al.
>>> >=20
>>> > With v6.9 kernel the following card:
>>> >=20
>>> > 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E
>>> > 802.11ax PCI Express Wireless Network Adapter [14c3:7915]
>>> >=20
>>> > doesn't work any more. Upon mt7915e module insertion the following sp=
lat happens:
>>> >=20
>>
>> 6.9 didn't get commit 2f7cf3b61d85 ("wifi: mt76: mt7915: add missing
>> chanctx ops")? Huh?
>
> Yeah, commit 2f7cf3b61d85 should have been taken to wireless tree but it
> fell through the cracks. I didn't realise that it's an important bugfix
> and the commit message didn't give any indication of that either.
>
> But commit 2f7cf3b61d85 is now in Linus' tree so it would be good if
> someone could submit it to stable releases.

Johannes pointed out to me that the commit is already in stable:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-6.9.y&id=3Dddb02739a2be54ed922bce3cb57d5f901590ee70

So all should be good now.

--=20
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatc=
hes

