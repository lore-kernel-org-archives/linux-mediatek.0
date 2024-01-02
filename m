Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3713C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 22:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzt2SwyvJkT3cWwRAztqs6RAYo3+uR/xkztEwtRwNKw=; b=NC7j5RHMWTqrB5
	pfTrngjr4lmdPrmPqafQH5tgMP6aso5ohssSYq5GFiZ/N8QdYOWTe4doRtfQhKGMUXl146CSRR4on
	iyOGc4rgzxgGKT/J1QFVgsbjIlCOFvKdCS+Dq5iF9APGIDlqKlU/CduqujgKN9YDD/FE/qOD/V7tB
	A+8gnCLl+z7VQLga2hwPayFTb2HzrhJx6l9w5gkIrgo9ZmgCFXYBoHZhpxWRFeHnnE25IS0KX9UT9
	R6r56QB15YeZWmcr/oPbbcr0N2kRL9He3s7Z9Y69oVnySw4bCH6naWjV6A1SvrguhJQaWff2S6Hpc
	fJcza2O0E13r2qT6CxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKnKx-009DuO-1m;
	Tue, 02 Jan 2024 22:34:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKnKs-009Ds7-2v;
	Tue, 02 Jan 2024 22:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A919BCE0CFB;
	Tue,  2 Jan 2024 22:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3C7C433C8;
	Tue,  2 Jan 2024 22:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704234844;
	bh=dzt2SwyvJkT3cWwRAztqs6RAYo3+uR/xkztEwtRwNKw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qsvskS2Mw0W0xcDLDb8xYjmE5BCJNQKbDW7ZKsvrwwuHZnjXjSRLmpG4JWMbLhR4D
	 BQvxTdyjYrTtAAnhF7iIqZBQv7jzPGqoj5UXKG6LAy7JEQwk1rfdreexqPuvXQnLn1
	 8mWYl25V5GTlykfWBYbUxZvPXtvxgvmV8eNOUADAd9BO19lO+GEhWwi5pO9Zh6wbTB
	 r+jrsBD198mbSjRNLEQr1a1pztn6m0g6SNAvyFdUy7ICJEZaj4j4upPGs1XDBgDvld
	 Yy4EFHeDTx/+verYZ5MA984TEkRAFijC8pxkA75mzHWjDOlR5YafkmB+HfhOyWXLWR
	 k5gproqazy/KA==
Date: Tue, 2 Jan 2024 14:34:02 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next v2 0/7] MT7530 DSA Subdriver Improvements Act I
Message-ID: <20240102143402.5f639ec3@kernel.org>
In-Reply-To: <20231227044347.107291-1-arinc.unal@arinc9.com>
References: <20231227044347.107291-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_143411_172941_5DEF17B8 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Vladimir Oltean <olteanv@gmail.com>, mithat.guner@xeront.com, "David S.
 Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 27 Dec 2023 07:43:40 +0300 Ar=C4=B1n=C3=A7 =C3=9CNAL wrote:
> This patch series simplifies the MT7530 DSA subdriver and improves the
> logic of the support for MT7530, MT7531, and the switch on the MT7988 SoC.
>=20
> I have done a simple ping test to confirm basic communication on all swit=
ch
> ports on MCM and standalone MT7530, and MT7531 switch with this patch
> series applied.

Posted during shutdown, rebase & repost, please:

https://lore.kernel.org/all/20231205101002.1c09e027@kernel.org/

