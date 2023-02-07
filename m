Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82ED1C636D3
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 18:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqHMAfcgAHmn0AywjMx67EOJkstVcLSam6liL8s+4lM=; b=pd3CDIF3+SAi69qWQI+Im0o8/6
	FXcrKgl5ISZ6wmllhJoXGBYW/RElo7qSa1Lg9SYpyPwZfanx1Vu1tM4dmilbI6kVguJysdlyaKln9
	KK0Tf5l9z3kXqX3y43WnE4gTfyYxRxnSL1P2pXyjy+nWDOEswKwjPdvbS9Y4WCa5H4EUV1TPs6g+W
	ncd4+ktDp2L8uBpmjj84Ev78+nYYhYeQN9KV3bnOcqaK8KtstROSXOkYMKf0b966FZDBXayNyAH4Z
	YaadoMgs1UdFtxRVbE1GQoS/jhx60W65xHPCiP0xx6kdTsxKfngN/7uy2WiDJRQnVQxn3kS/geepO
	Vash2MNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPT8m-00D9OD-8B; Tue, 07 Feb 2023 18:56:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPT8b-00D9KJ-Fz; Tue, 07 Feb 2023 18:56:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4A4A61137;
	Tue,  7 Feb 2023 18:56:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FC9C433EF;
	Tue,  7 Feb 2023 18:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675796175;
	bh=7ZCUewxyzsIBjoHKDSWlL/p0bac+EsMZWQozA9IaisA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fMe/+c0Hyi99+yLXoOFBxo1q45FYvb1erXcZsuZ5+T+N/Cq6iLJ+psoGOfpnKsTyZ
	 dHDHGiOyn+a7+7m+76zc34yV1YXpDX/MKYJ3aeihxdNFMhFlB5C9xOk4WZeMvhVglR
	 LhnF4vQ76OxuHo6ki6JZOQFw0PIcdZp+84CZNh7Gs9bKwL4M+Z8ok9lh8noEHNaM9d
	 hOL6HYCGm2TTitWaxUgGP5qhGSdBO7Ik9L3XN23jXUFlQ7EZHLtEh56Jtc3bHpgQKC
	 TpyElNotkZstA/GwmhmAT5+sVjdqupIqORa0L+1O9y4LKGtkXhfFaClkiTv+P6HocJ
	 hb/CR3NRpRhLQ==
Date: Tue, 7 Feb 2023 10:56:13 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: arinc9.unal@gmail.com
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno     
    <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXLEsW7DpyDDnE5B?=
 =?UTF-8?B?TA==?= <arinc.unal@arinc9.com>, Richard van Schagen
 <richard@routerhints.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: enable special tag when
 any MAC uses DSA
Message-ID: <20230207105613.4f56b445@kernel.org>
In-Reply-To: <20230205175331.511332-1-arinc.unal@arinc9.com>
References: <20230205175331.511332-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_105617_596273_2BC2E439 
X-CRM114-Status: GOOD (  12.11  )
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

On Sun,  5 Feb 2023 20:53:31 +0300 arinc9.unal@gmail.com wrote:
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>=20
> The special tag is only enabled when the first MAC uses DSA. However, it
> must be enabled when any MAC uses DSA. Change the check accordingly.
>=20
> This fixes hardware DSA untagging not working on the second MAC of the
> MT7621 and MT7623 SoCs, and likely other SoCs too. Therefore, remove the
> check that disables hardware DSA untagging for the second MAC of the MT76=
21
> and MT7623 SoCs.
>=20
> Fixes: a1f47752fd62 ("net: ethernet: mtk_eth_soc: disable hardware DSA un=
tagging for second MAC")

As Paolo pointed out to me off-list this is pretty much a revert of
commit under Fixes. Is this an actual regression fix, or second MAC
as DSA port never worked but now you found a way to make it work?

