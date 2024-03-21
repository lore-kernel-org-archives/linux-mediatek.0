Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2853C54E58
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1X+hNJMGK6SqdH8ZPP6qaRmvCLvttst+h+aM4nW4TUg=; b=fD9BH7N3asOoFmWTXLBJIYR3y3
	xLTrW6VXCUeCTZuk4zusHfKjj+8o4KMZ7VDtAUi8L88ZT4T00dJArmZSELsT8ctDRejaxS8tleXh3
	xfRK/qOdq2xhUIsiCd3AJr0Zh/jKyYGl0YXOd0gQ2UGYMLg1+5Pd7+T3kSRbW1DUWZVtIjDi4TFpR
	7BQTML2o71sDNKH5Cji3XQKYymLjs5uqna0aUELsE0vGPouf21OXj2wF+48veAX0VytZ96m/Rp4ib
	MRmWvyszYz0D/kHo1+eGSSF6d5ftduADtlWI9R7TU2oIvNaZIYsaWCRjMZMZQD/zHi9vz0BOxS6PC
	Nk0W8Jtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJcm-00000003K1Y-0A4V;
	Thu, 21 Mar 2024 14:42:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnJci-00000003K0F-0Gnt;
	Thu, 21 Mar 2024 14:42:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 58752611D8;
	Thu, 21 Mar 2024 14:42:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 057FDC433F1;
	Thu, 21 Mar 2024 14:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711032146;
	bh=1X+hNJMGK6SqdH8ZPP6qaRmvCLvttst+h+aM4nW4TUg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hHn9p6gWloIhsr8q0wVLpZxCd0EDS1d4xQ6+pSX0XnN7d8yq5hF5uGnn+zpVoOZxP
	 KTvpbW7/DIp5PQE/Hjz2h1pDrrn+S2AZ4m7ZLjBwmyUOevV+KYoHuyu84VI4X4qbfd
	 vdizrvk2UmdojHguVVfEkKvPJZOFkr7ubHzlRIDsHjFpj6uz0ZR1eUHcG6dFb11s4L
	 NJB29Yblv/AT1QqiFOqLQV5NoZ6IV3eJKE06R8j/dANe3ocCOpUcw9UfekLoAyErvo
	 uSj5AYB3xmH0b8jq8WCZbrpIHSdKmZFS8TAfv/GdkWXCottixUk//xoI8dsSgW5gr8
	 5y5IPK6cMBayQ==
Date: Thu, 21 Mar 2024 07:42:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Paolo Abeni
 <pabeni@redhat.com>, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang
 <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Andrew Lunn
 <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com,
 mithat.guner@xeront.com
Subject: Re: [PATCH net v2 0/2] MT7530 DSA subdriver fix VLAN egress and
 handling of all link-local frames
Message-ID: <20240321074224.5850c05e@kernel.org>
In-Reply-To: <20240321-tentacled-pearl-ferret-efd5be@lemur>
References: <20240314-b4-for-net-mt7530-fix-link-local-vlan-v2-0-7dbcf6429ba0@arinc9.com>
	<f6f064b8-efb2-4ab0-94f1-468d5d273d6e@arinc9.com>
	<49d23df1340f342822702de0439674ddbc5bff6f.camel@redhat.com>
	<7a7e6c46-03a4-48eb-9f46-84a05259cf26@arinc9.com>
	<20240321-tentacled-pearl-ferret-efd5be@lemur>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_074228_170903_99F6F9BC 
X-CRM114-Status: GOOD (  15.65  )
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

On Thu, 21 Mar 2024 09:19:02 -0400 Konstantin Ryabitsev wrote:
> On Thu, Mar 21, 2024 at 02:29:19PM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> > > For future memory: I think the SoB in the cover letter is not require=
d,
> > > and is, at least to me, a bit confusing.
> > >=20
> > > No action needed here, I'll keep this unmodified, but I suggest to om=
it
> > > it in future submission. =20
> >=20
> > b4 puts it on the cover letter so it's not my doing. =20
>=20
> This is done because many subsystems use the cover letter as the merge co=
mmit
> message.=20

Could be wrong, but I think it was DaveM who originated this practice,
in networking..

> Those subsystems who don't follow this practice don't generally care
> if there's a Signed-Off-By in the cover letter anyway, so I don't see why=
 this
> is a concern that it's there.

Because we have to remove it, extra work. And the benefit of adding it
in the first place is unclear.

