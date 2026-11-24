Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698FA606A32D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 18:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R+U5Lp2N;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=q8HaVf5u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p+agDox9kVQ83fzlX6/BiStaduoiE4kUc+zWt2GTCa8=; b=R+U5Lp2NzruwelfEcEnsLMMjdZ
	yVJ761p/f6Ge+Flgzl3k29jU6kRFaNhnlyYYGJqMd1ltn28Jkkcot0Bf2JjQIx5N/LkHZdGfrd/as
	LaknMc3XQ3RXc2dvvNB6ElQTa3P7X1ufU7cijoj5g/ZWzUdC9s8X33iUdvYYce9ZHuMg3UkGABLA5
	T4OrXZFnNyDHXMQAFeM4qq/fgywigkT5UU0kVPzkMS06VVhgC3Dtv8P4UU2/M/jW2XfZIfQGS0ZSh
	gY91hG/9ojlqS1N48zDDSL4x+SihniQhBu1jeph/IJSMx/VMozvN/Sr8VfIM3L2RK4GrX/0W6VrMm
	km9ym+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvPO-00000007W7T-0a9z;
	Tue, 24 Nov 2026 18:38:26 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvPL-00000007W6f-1VJB;
	Tue, 24 Nov 2026 18:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=p+agDox9kVQ83fzlX6/BiStaduoiE4kUc+zWt2GTCa8=; b=q8HaVf5uZYmkddjTchpkhlpBqO
	Df6L98WUbTOOSPrmiWomdz5IRkDogZWLGIvXNGw/Fu2/2ohBCXoXhi2MGcadLjjoOyfOoqVIa3cxb
	gTuAH5Q/5BG9ZBjoEChOVGDKPQWYdBiGZbJBoClWq1x2TpbX7818HaxNXNa5GBjs2rj8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvP6-00181E-BC; Tue, 24 Nov 2026 19:38:08 +0100
Date: Tue, 24 Nov 2026 19:38:08 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 3/5] net: dsa: mt7530: register the GPIO controller
 last in setup
Message-ID: <0159905c-44ab-46b9-b8b5-337b2aa4ca91@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179550875790.4156.7464757884919680732@mail.zgclab.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_103823_393650_E90E3892 
X-CRM114-Status: GOOD (  11.40  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 04:25:57PM +0800, Haoran Wang wrote:
> mt7530_setup_gpio() publishes a GPIO controller that userspace and other
> drivers can use immediately, but it currently runs before the FDB flush,
> which is the last step of setup that can fail.
> 
> Move the GPIO controller registration after the FDB flush so that the
> controller is only made visible once every fallible step, including the
> FDB flush, has succeeded. This becomes important in the next patch, where
> the failure paths disable the regulators and return an error, so the
> controller must not be registered across a failed setup.
> 
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

