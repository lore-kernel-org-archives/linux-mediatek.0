Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0554E606A33A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Jx9RaI02;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=uioW5R3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=95O1hAVf4NX4xcv4/2PCB3dB77b5Bx8lMkGNIBLpcJ0=; b=Jx9RaI028pSd3E5EVUAZ1J91Kj
	UXVJBcQ312lFZpkSgJZHckIE7uFrjoz98QFiOajdN/eTQ+zA0F/TefTgGjLuN5r1ZatSH3P4nuDcp
	svkuXwlgEsBFCLcVnW1Vmv1+IB2IJG0ukdcWcisScKAxk/SArLf19GbnCfGv9D8ARg1EeDBbiSngM
	bkzIzmDC4DLdC73KVwkfERH2f8VmZ+I7OHIzEY/kd+Dbb3h66rT2kvom/kuwVtyZbeOzPpw1Kt0Ie
	lGXW37zrFjx24QV4i7LhARlc82epolZXVYn6fK9asVoPMNVnodhcY52jrjkmHTMChIRBAHPbFD4mU
	AoIuEQUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3lT-0000000CNOs-3116;
	Thu, 19 Nov 2026 15:09:31 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU3lA-0000000CNG9-12Cq;
	Thu, 19 Nov 2026 15:09:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=95O1hAVf4NX4xcv4/2PCB3dB77b5Bx8lMkGNIBLpcJ0=; b=uioW5R3zu7p/h5XWeQCkCg4SAn
	TrlyNatcVx37afiH3LAiPh20Y/5v/5XrkfScsRhklEjWzb3n82SIC8WsJJypI4tkfBh1jzzGS9gZY
	qpJkeR7kq4U4V+AbX1MauctFUxhk1PHLPaH5hScKdRIp5rK3c3XKgMLnj5HV6v18p3gI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU3ki-0003yZ-HF; Thu, 19 Nov 2026 16:08:44 +0100
Date: Thu, 19 Nov 2026 16:08:44 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Wang Haoran <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: disable the power rails on setup
 failure
Message-ID: <37b97f59-d37a-4ede-88a8-6a70635a3019@lunn.ch>
References: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1795076103951-10-8fa23d94@mail.zgclab.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_070912_316878_0963ABDF 
X-CRM114-Status: UNSURE (   5.06  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

Does this bother anybody?

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html


    Andrew

---
pw-bot: cr

