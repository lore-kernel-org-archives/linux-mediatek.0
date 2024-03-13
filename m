Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA71CC54E66
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 23:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bFw+xrxCOa8u2TLCE3nHHl1dTIg3OERcQT3EJYsmHBg=; b=iYMGPWP/oOec6QcDaDNo7W4RQn
	FJrYBkoft5EHZSOmT/cZWve8A/O3sf+tnT2LnY8Xlpub2orHWUoUHXiN+5Z/TxQz0FN5MaZ5XnLKX
	bqpkvfEN40eV083sqKGeADWZlCSdpjnczxseVvMjURibl1syZwzbfWmZq3a6/KfDfiPvPJitV2WAR
	t5yubmWnKgeTsKUkJU50f95XDrHzPE3oVruPoG28gkaz3MN2Y2d4+3uEfP1O7LbOpeYnFHjtbGAcE
	YSG5wPQ6nDb/KADt5Kklu34zlBZGVfSzQClsS0W6m2iYAPmytVqSAVL+p4ZzNxm3nNLHuJ32HH1nT
	MM7J5SWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkY1K-0000000CGN7-1Sek;
	Wed, 13 Mar 2024 23:28:26 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkY1F-0000000CGMC-34JP;
	Wed, 13 Mar 2024 23:28:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7CCBCE1C6E;
	Wed, 13 Mar 2024 23:28:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB16C433F1;
	Wed, 13 Mar 2024 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710372496;
	bh=bFw+xrxCOa8u2TLCE3nHHl1dTIg3OERcQT3EJYsmHBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=M1TzvUrJLVq8ycew3FNIpAJzJ1ibziRDUW4guiXP7OiDSvfKGNFuvEuM+Lm7zHbzr
	 ON6LgnxSDywN3PLlBpH8BnI00X5288oLIWDeBCMwT1Gl2ifb/XLtuNMtND6JnFrLLO
	 7cuTfJnCnF3y0aZdvxAfPFNeL+vii89UMBA4LXRBygi4aXutbVlbc55QW2e25FYYn9
	 7JrCeG7ghAFHpAIf6dl/SZNWQnDmdUSUwcuK4iHvdJRdtDuEtc7mUEOlRO+JgIDW4R
	 IUBA4FhLMD3hbi0ViqyZiRn5/nM14WCg7aik39Y+WoOlcVhu4dXxZ4y8aFVB/uPqRG
	 sYHBhP+EWV6ZQ==
Date: Wed, 13 Mar 2024 16:28:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Landen Chao <Landen.Chao@mediatek.com>, Bartel
 Eerdekens <bartel.eerdekens@constell8.be>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Justin Swartz
 <justin.swartz@risingedge.co.za>
Subject: Re: [PATCH net] net: dsa: mt7530: prevent possible incorrect XTAL
 frequency selection
Message-ID: <20240313162815.1bc0a740@kernel.org>
In-Reply-To: <48fadb58-4b81-4271-919c-102943354c01@arinc9.com>
References: <20240313085546.710679b0@kernel.org>
	<48fadb58-4b81-4271-919c-102943354c01@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_162821_976967_40B760A2 
X-CRM114-Status: UNSURE (   8.03  )
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

On Wed, 13 Mar 2024 23:12:19 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> On 13.03.2024 18:55, Jakub Kicinski wrote:
> > On Wed, 13 Mar 2024 14:25:07 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL via B4 Rel=
ay wrote: =20
> >> Reported-by: Justin Swartz <justin.swartz@risingedge.co.za> =20
> >=20
> > That's way insufficient for the amount of diligence and work Justin did.
> > Co-developed-by, at least, please. =20
>=20
> Fine by me. Do I need to resubmit or can you add it while applying?

Please resubmit.

