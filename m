Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23137C761A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 02:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6G2DYg8ELtbcds+HAzH8fVD7RX7HwcvzaOlUuI7kips=; b=M4hWxM44v+xQmV
	ERKUpjTkOCi/56zlNgLfAm9+Vj9ADGa6CWwwBlsApUe7Y4466PzcP+aYT1F91xJ4tPEJK3rxgsh9B
	z5DGdUUn47J0HXnMirxJ22ZdOy0KzZcw19RdijcGkbT9NQq+1WllLiEpJz9Q0USFEWdEK8gDh+d/a
	1f0IamgUNKxf71Ewvd3xr+5cGBGyS5TsZQpg3fP3hsPIAoKpad40dcMAdU8jIUan8S3BtClZXg4FP
	ei0zJTeaIv86iqNy2n5yKylpqU5SoKW152wU2GMXOq44mUrnwEpyJkoGdHIxoGbF++EujBDMCmAtF
	g4CaGZu5ll8VTg5fUCtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgygb-00Cr4a-0C;
	Tue, 28 Mar 2023 02:03:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgygU-00Cr39-1I;
	Tue, 28 Mar 2023 02:03:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94FB561551;
	Tue, 28 Mar 2023 02:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F85C433EF;
	Tue, 28 Mar 2023 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679969017;
	bh=6G2DYg8ELtbcds+HAzH8fVD7RX7HwcvzaOlUuI7kips=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OX6ScXGO6/rjGImEN7aRNFH3B2f7/2aBDNXKhKfqDPgJg+3VrxOY0NG5rJoxK7ZxW
	 vVrYX2UbNF+502CXMPlTSLm933frp+X7XJ4XMlhHEMy4rbnzuB6VnzJzwJ8OKepnZb
	 gZED4ue40ZcVTlTiGjd1ywtJmGLf4kLtONmtVNYhA2s1Oyu6hqVrnOvUnPbmj0dTP2
	 cLumXnQh7MfGEyYmwbrdasOJqtI7NRc72ycgdgqq41PkEgVQZhI3j97prLV9X/5kak
	 JXBkGLfpdYCADfJwaN4+XfwuKVKkq0ai8OyHm8Uvh8vta/obJBc7XSLjSgabAT/1oy
	 ughYp2bWCDqlA==
Date: Mon, 27 Mar 2023 19:03:34 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net 4/7] net: dsa: mt7530: set both CPU port interfaces
 to PHY_INTERFACE_MODE_NA
Message-ID: <20230327190334.6c5bcf87@kernel.org>
In-Reply-To: <8450084e-1474-17fa-32c2-a4653b74ff17@arinc9.com>
References: <20230326140818.246575-1-arinc.unal@arinc9.com>
	<20230326140818.246575-5-arinc.unal@arinc9.com>
	<20230327191242.4qabzrn3vtx3l2a7@skbuf>
	<8450084e-1474-17fa-32c2-a4653b74ff17@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_190338_482168_9D1DCAE0 
X-CRM114-Status: GOOD (  15.09  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 28 Mar 2023 00:57:57 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> I don't appreciate your consistent use of the word "abuse" on my=20
> patches. I'm by no means a senior C programmer. I'm doing my best to=20
> correct the driver.
>=20
> Thank you for explaining the process of phylink with DSA, I will adjust=20
> my patches accordingly.
>=20
> I suggest you don't take my patches seriously for a while, until I know=20
> better.

Maybe my bad, I should have sent you a note on your previous series
already. The patches may be fine, but the commit messages need to do
a better job of describing what the goal of the change is, functionally.

For fixes the bar is even higher because, as Vladimir points out,
commit messages for fixes need to explain what user visible problem=20
the patch is resolving. Think of it as a letter to a person using the
switch who hits a problem and wants to look thru the upstream commits
to see if it's already fixed.

