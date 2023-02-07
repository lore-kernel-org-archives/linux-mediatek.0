Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC805C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 23:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGXVaRq6vYQJqxYDtBacKqsMgua8qseAvNZKfXM4PXY=; b=py1lf/aC4ipLOr
	iNF9v5t7NUHevNnIwe2Nw7bp8NuK7SZ7MkFefnATBi7txlp/ssHM4KakCG3ux+t5HK/rtmZofh4Dk
	ec9CXyQnPbxKHSgHTA2n0QIjTnWwkwQtW1hW0cckU8gYWDkUgm+KDM3bpFfXZR4FcZqjv3shoYHIT
	2Kn0MJtAUVvPxLXhQkvdKogPaLneQ43NyV3wb/sC0KKkjpW+5jH0dq3xkKA9c/U9LH7GbYJ2Okfia
	d3hFjeSmXvAn8rmAXuYMo3hwjgbF2JS8mzKdzugIuwG+UC49PKFbU+Px5xqrQPoPB8JQ/hi/unrFG
	6cz3/I9UE8knd28SF82w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPXqo-00DhLk-Fu; Tue, 07 Feb 2023 23:58:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPXqe-00DhKO-IZ; Tue, 07 Feb 2023 23:58:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BD6CE6143F;
	Tue,  7 Feb 2023 23:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88304C433D2;
	Tue,  7 Feb 2023 23:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675814283;
	bh=sGXVaRq6vYQJqxYDtBacKqsMgua8qseAvNZKfXM4PXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bqKCVz+Mave8Fx0zq4+M9qYMTm6ZlSWC2rAFunG41hjqgDqk5UJtVuwWBn03cGKRV
	 aWvZUKFTvEPyFi2qOTONmDbuqbEXbZsXZQ97yHpL1TZ4I3lFk1h86CqtFFd72RvzRW
	 pcOoPLGqq3pBRqMacLJWsYdNiWDBCKnfsagPYaksIY/CbUcZBC4Q0Wuv4EWyxePl39
	 A9NlmcyS81s97RzyP3dE1U67sXxVIIgKcvG2twTQspMTepg2aOyQtpBfFH09X9vLxs
	 QaxB0Etglbnv/xlu7YsIymkLms6gaxwJJbXl9erWtJzyLt1VU67qCped3nXH1ZcXOC
	 +7Cpr2+cTmhPg==
Date: Tue, 7 Feb 2023 15:58:01 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: enable special tag when
 any MAC uses DSA
Message-ID: <20230207155801.3e6295b0@kernel.org>
In-Reply-To: <52f8fc7f-9578-6873-61ae-b4bf85151c0f@arinc9.com>
References: <20230205175331.511332-1-arinc.unal@arinc9.com>
	<20230207105613.4f56b445@kernel.org>
	<5d025125-77e4-cbfb-8caa-b71dd4adfc40@arinc9.com>
	<52f8fc7f-9578-6873-61ae-b4bf85151c0f@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_155804_668329_AD7A71A3 
X-CRM114-Status: GOOD (  14.23  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David
 S. Miller" <davem@davemloft.net>, Richard van Schagen <richard@routerhints.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, arinc9.unal@gmail.com, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 7 Feb 2023 23:25:32 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> >> As Paolo pointed out to me off-list this is pretty much a revert of
> >> commit under Fixes. Is this an actual regression fix, or second MAC
> >> as DSA port never worked but now you found a way to make it work? =20
> >=20
> > Second MAC as DSA master after hardware DSA untagging was enabled never=
=20
> > worked. I first disabled it to make the communication work again, then,=
=20
> > with this patch, I found a way to make it work which is what should've=
=20
> > been done with the commit for adding hardware DSA untagging support. =20
>=20
> Should both commits be mentioned with Fixes tag?

No strong preference, TBH.

The motivation for my question was to try to figure out how long we
should wait with applying this patch. I applied the commit under Fixes
without waiting for a test from Frank, which made me feel a bit guilty
:)

