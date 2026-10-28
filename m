Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3443C606A324
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 02:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0GyCe1br;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=E3j3F7Y+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=S0yM+Za6i75m67uWOOTgt8atqe/7TENA3+sFmUmADnw=; b=0GyCe1br/+qamLjhpwKCTH9szq
	kO6SFx6qqKiWGv/u9/HQ89BunRyCvHsuuOHwqnrY7fxD7qQiOjQ66h8pdOn6LGkrZAFgcX8nwmkUu
	r67S0Nsoxfoz7k50BNcjeI205r/nZY3f9gXGQKwcC3kQ6ot7uvJ2MO0XWtgh+AdTArdOttn9gZaws
	UMPwBH9//48id9cJ4XonoEAn9mR2QLPGJxfhe/6N1AnjbVmSDeaq/Y5VKi1LNGmOHDItQtoPQxf1+
	+CuQF4xOYbtET8SEZrP5BIjECcyexTgqR7iYAtQW8ibLWHUEDZc5e20fn0EvRsUlytMXBh/0Hfr1D
	7NuuSO+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtDD-000000065Nh-2EsB;
	Wed, 28 Oct 2026 02:16:23 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLtDA-000000065Mz-2QYG;
	Wed, 28 Oct 2026 02:16:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=S0yM+Za6i75m67uWOOTgt8atqe/7TENA3+sFmUmADnw=; b=E3j3F7Y+u/kGXbJaO3M9WgbuEH
	w8vTnDWs03s3uQEcnY6GlWG6WNhfro/6yV0Ngud7HTlLGWFvp9FYHTF6Hp0IFmB/28PDpPdSB4NQs
	1HezBmIZWGKMi9mCnPMzSIuS6M0GllBwq36s+ZIMF+kcOGhlMwlURjT/ufM5LMDRuF64=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xLtCp-00D2nO-NZ; Wed, 28 Oct 2026 03:15:59 +0100
Date: Wed, 28 Oct 2026 03:15:59 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, olteanv@gmail.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	chester.a.unal@arinc9.com, daniel@makrotopia.org,
	linux@armlinux.org.uk, arinc.unal@arinc9.com,
	Landen.Chao@mediatek.com, dqfext@gmail.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, naseefkm@gmail.com,
	b.larsson@gmx.com
Subject: Re: [PATCH v3 3/7] net: dsa: mediatek: add support for passthrough
 mode
Message-ID: <734d4f06-26af-4bea-9c83-eb92c1b3b894@lunn.ch>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-4-cjd@cjdns.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028011317.1557238-4-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_191620_644991_D7370840 
X-CRM114-Status: GOOD (  10.71  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> @@ -199,6 +199,9 @@ static void mt7530_port_fast_age(struct dsa_switch *ds, int port)
>  	u32 val;
>  	int ret;
>  
> +	if (priv->is_passthrough)
> +		return;
> +
>  	mutex_lock(&priv->reg_mutex);
>  
>  	/* Flush all non-static MAC address entries */
> @@ -970,6 +973,9 @@ mt7530_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
>  	unsigned int age_count;
>  	unsigned int age_unit;
>  
> +	if (priv->is_passthrough)
> +		return 0;
> +
> @@ -1386,11 +1446,14 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu)
>  	int length;
>  	u32 val;
>  
> +	if (priv->is_passthrough)
> +		return 0;
> +

What is actually left?

Is there sufficient code reuse that this makes sense?

Would it be simpler to have a much simpler DSA driver just for pass
through? Or the mt7530 driver has a second dsa_switch_ops instance
with all these functions set to NULL?

     Andrew

