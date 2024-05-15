Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2095C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 May 2024 06:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fR3/NxAITdhdq3Ycr1Czm/xkzyiUXiiJ++SU9SO1o8=; b=qphKiJQkeqGwmO44L8osZ+d0zh
	uNfNveVe2cBBIx3ki0qI/dcCJEc1Jj0mYR88yme+e8EviyND0qFyOTfMKU5evWX4duFbU+m7TkRYJ
	Dwq3bAHfbgjklGqHlHE3im3eYolYKkjHHf7KbzvL8jUjNxZUjoMLVhDOSS8C+KuFJPMRL9ZQrmVg9
	gz5X4AbWQu0mcW8ECyFQubFONmBo9wwcJZT7MJdVAkGcweA4NFC86bCsX06TkZ8VMyvZ4exiuDkk+
	pu24csLvMbiK4++i6D9+hI3hyvFWntHMcNWbjObeOVVDQ8rlzo9OMO/RFSvZvPKXCGOnOkMS5XKe0
	Fp2plDyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s783I-00000000dfs-416y;
	Wed, 15 May 2024 06:23:48 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s783F-00000000df3-1uOI;
	Wed, 15 May 2024 06:23:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=+fR3/NxAITdhdq3Ycr1Czm/xkzyiUXiiJ++SU9SO1o8=;
	t=1715754221; x=1716963821; b=ZD2U0CjWMtQ9HPl6b9Lq1VYN4ng+k0VmXrY/IMfeIoZ5Bvn
	RB701lJFE7JwXYVPPLkgnicYwTHxRK4eGlkDtYschnHniuD+Z659647ZASysj0xTYlKuy356nNY6u
	U2t4v8qvA3BCcR6oj7+C61ey1/kLRqgGMe6SXBTC8aaZlo2mwU7OWhtJJhrL73RWPTIt/JhVBTjsx
	cYGv1asycxxpxDeN2VMJNJKh3X09NH+JA+NRd4t8fHL05oWs4hLbqE0pRXrUcQ0AxkSU91RmnRPo5
	lLEqRn5K8ZcgVWmY3dOg3cCClJfurOraWvwvRgkOKEoKd348lX3DLb4IygfE+6/w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97)
	(envelope-from <johannes@sipsolutions.net>)
	id 1s7837-00000005zBf-1jNr;
	Wed, 15 May 2024 08:23:37 +0200
Message-ID: <60fe8df750a74331b8a54a76d55d5e8349ac46b4.camel@sipsolutions.net>
Subject: Re: [REGRESSION] MT7915E doesn't work any more with v6.9
From: Johannes Berg <johannes@sipsolutions.net>
To: Oleksandr Natalenko <oleksandr@natalenko.name>, 
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, "Linux
	regression tracking (Thorsten Leemhuis)"
	 <regressions@leemhuis.info>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,  Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Peter
 Chiu <chui-hao.chiu@mediatek.com>, StanleyYP Wang
 <StanleyYP.Wang@mediatek.com>,  Linux regressions mailing list
 <regressions@lists.linux.dev>
Date: Wed, 15 May 2024 08:23:35 +0200
In-Reply-To: <2341660.ElGaqSPkdT@natalenko.name>
References: <6061263.lOV4Wx5bFT@natalenko.name>
	 <2341660.ElGaqSPkdT@natalenko.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_232345_723101_EF2A4F5C 
X-CRM114-Status: UNSURE (   7.84  )
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

On Wed, 2024-05-15 at 00:51 +0200, Oleksandr Natalenko wrote:
> Also /cc Johannes because of this commit:
>=20
> 6092077ad09ce wifi: mac80211: introduce 'channel request'
>=20
> On st=C5=99eda 15. kv=C4=9Btna 2024 0:43:40, SEL=C4=8C Oleksandr Natalenk=
o wrote:
> > Hello Felix, Lorenzo et al.
> >=20
> > With v6.9 kernel the following card:
> >=20
> > 01:00.0 Unclassified device [0002]: MEDIATEK Corp. MT7915E 802.11ax PCI=
 Express Wireless Network Adapter [14c3:7915]
> >=20
> > doesn't work any more. Upon mt7915e module insertion the following spla=
t happens:
> >=20

6.9 didn't get commit 2f7cf3b61d85 ("wifi: mt76: mt7915: add missing
chanctx ops")? Huh?

johannes

