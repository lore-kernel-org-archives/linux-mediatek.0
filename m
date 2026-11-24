Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45FF606A334
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 18:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a9e7WKgS;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=tOVWl4QK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NrprG34boI04kXZ9Q38+5sflqcdYytZcE3UW4XNCMJo=; b=a9e7WKgSnfp5pfmZOEf3xBm9Pz
	7A6xXPrTGnIWUes7Jy49XsldeDhHvnA7TsVotaM0T0tum3BW8RlpfQT/ZoffvAUH58/CGPU8lOWL7
	YPSHef53hbdEpsHQflWad9VWmOEygY1h4CmmKTzBhFDEJDTGrU+0su3oHZ5kQBla9rwEY1FfIk1WU
	0VUoeXDHmcE9yaIyQyTuOEtC5ElMx2QZC82JjXV1lRI+reICNYQqnsHvGoW0YiKnkj9k0KKhCDNS+
	AhPOh1VNsdjRSw24BOLJ6ZU5CwhUJbkyeRMZnrZB61d5N2MSc5u93kRCOztjIYxQ/pL1sZyeoXS7w
	q0yP2MRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvMS-00000007VjL-2gP9;
	Tue, 24 Nov 2026 18:35:24 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvMQ-00000007ViA-16uH;
	Tue, 24 Nov 2026 18:35:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NrprG34boI04kXZ9Q38+5sflqcdYytZcE3UW4XNCMJo=; b=tOVWl4QKpscERkcaHBZZlNGaNx
	NOymZFBpt80W5ebSC0m9QtHoie/kbWj+asymVOUSOhOWBInDFq5tWtMk7W4u5UGycHD5AfaQfxbX5
	IDc2cVNRiwD8QlcbimQGn9eRK7umXUN3MRIzSoP3Lef5BgxV0P3hZne6/wJIR/7daN4I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvM9-0017yD-Ig; Tue, 24 Nov 2026 19:35:05 +0100
Date: Tue, 24 Nov 2026 19:35:05 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 2/5] net: dsa: mt7530: factor out
 mt7530_disable_pwrs()
Message-ID: <a86b68ca-83e3-4d0c-a655-bc2574bfe8c2@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875790.4156.10911645527208536694@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179550875790.4156.10911645527208536694@mail.zgclab.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_103522_309926_3A12E640 
X-CRM114-Status: GOOD (  10.44  )
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

On Tue, Nov 24, 2026 at 04:25:57PM +0800, Haoran Wang wrote:
> Pull the regulator disable out of mt753x_teardown() into a helper so it
> can also be used on the setup error paths added in later patches.
> 
> The helper stops reporting regulator_disable() failures. A failed
> disable on a teardown or error path is not actionable

While i agree there is no need to add code to try to recover from the
failed disabling, if the disable does fail, something is wrong
somewhere. So we want to know about it, so it can be investigated.

I would keep the error messages.

	Andrew

