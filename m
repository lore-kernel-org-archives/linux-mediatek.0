Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5D3C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 00:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lbl1z861LIR5O8tVQwbaa4PU0A1DuxY+uoYSNtOxsBg=; b=zH3PiphL+HdvuuGM61+xqjpijH
	kW1i5bXchXi82vzTSHMtrCPHgQ8iYorI7BZfaLmK2EYIwtGEcAn+Jbg22dxjEYE/Fwx7W0C4WTQ+l
	jfQ/as5DL/ai6lNCsOulyRx2Tvm6oV1Jku2wZ8hgqujFpxpTDNf3DEYX6WOt2GyNMfjSPQjdws0aP
	K2llv/HO4ybFrcpT7Fip3MMXCya1EaYNLZoQqHbdsN+9rDvOzL5hZMttJjB60gLaXyTq4zGsx7XGe
	FO2lIQ4CbVq1yEmQ+3VgWk/2ENpaVBpw3V0AteHe/YcduS/NzOgY0isWF2tagz8+ZvNQ0icrgFdYt
	WdP/P5uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppIMz-006kGa-2L;
	Thu, 20 Apr 2023 00:41:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppIMv-006kFd-2l;
	Thu, 20 Apr 2023 00:41:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC59D6420F;
	Thu, 20 Apr 2023 00:41:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56ECEC433EF;
	Thu, 20 Apr 2023 00:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681951308;
	bh=Lbl1z861LIR5O8tVQwbaa4PU0A1DuxY+uoYSNtOxsBg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Yv/xJRKv0vWLlwwR7lcAjEjff6EHOv6gbsQd9zB9oxWgZKE2wcqfkcW6AvIzLSF+t
	 6x3yT5kkklnRs6GMgJy02bqMHDjzaZ/MuTPpupokCQv8go1T1/Ks9WynkO5XpmWIaW
	 Rbp+glK9hNcP6kSbWfO1ufQciBcvK8pJvI1IPYBSPMB3WNpA8l5wPqHsNS6H8qgmEA
	 DeWIrWtM/96zeizwOUvRmYNd0L65t6Xjhqfu+kA44s/WNaH290R890OgNb4ix+gI5n
	 KAslLpSSdR1FNy9ce48irx6D2V32NfP9WE2w3kJR3aGrUnkLYFNcbhcs+eV9rhtN3F
	 qE3AZ4f+jD5/A==
Date: Wed, 19 Apr 2023 17:41:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, DENG
 Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Florian Fainelli
 <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo
 Abeni <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>,
 AngeloGioacchino Del Regno        
 <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Jesse Brandeburg <jesse.brandeburg@intel.com>
Subject: Re: [PATCH net-next v2] net: dsa: mt7530: fix support for MT7531BE
Message-ID: <20230419174146.5f797abb@kernel.org>
In-Reply-To: <ZECFvFnhW1D3IRxO@makrotopia.org>
References: <ZDvlLhhqheobUvOK@makrotopia.org>
	<ZECFvFnhW1D3IRxO@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_174149_957207_F4195797 
X-CRM114-Status: GOOD (  14.58  )
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

On Thu, 20 Apr 2023 01:22:20 +0100 Daniel Golle wrote:
> This v2 submission addresses the comments made by Jesse Brandeburg
> regarding zero-initializing regmap_config as we are now not necessarily
> using both of them. Comments by Ar=C4=B1n=C3=A7 =C3=9CNAL have also been =
discussed
> and resulting in receiving Ack.
>=20
> However, I can see in patchwork that the patch has been set to
> "Changes Requested".
>=20
> Can someone please tell me which further changes are needed?
> I don't see any other comments on the mailing list or patchwork.

Someone mis-categorized :( I was keeping an eye, tho, so it wouldn't
have gotten lost.

Applied now, thanks!

