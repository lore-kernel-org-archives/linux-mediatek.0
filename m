Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2391C606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 18:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iGR9hKEw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=J/8hRVbb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MIuIK6OTrAaRf7WvqeRgQl00U2uvIZ8xlyhNJbCOjz8=; b=iGR9hKEwkEvkd5PXZm9mMzYr8F
	w/tDmzibEAEXxIR9KecXF35SbJ1loiA+A0xiFBRML/nLDAV+WLhRdQ7yKQUZeYppyHDrKW1LoPtC4
	MJjIcwBbSz7ABeWXIf6UVM2AEL8XepWOjizS6DvCOoL4bNTPgTMsbdvDDSP2lPF9L/QMKZ8OCf4Gi
	Ipf81UTopr1qckw1IINizT2uP5GGRa6yFR4PR+WGczrn4+pNYauW9XkPX0fM7t/UNgkZxZa1gGWhQ
	F/+Vb92OzjY8noH3Ev3p6NO9p5ttJ/X5xEF2aAPp//QkEhHRmUGa7QHRDgu09OEXAKgpxQX7I1/R7
	TaR1f1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvTe-00000007WlA-3eDF;
	Tue, 24 Nov 2026 18:42:50 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvTc-00000007WkV-14mG;
	Tue, 24 Nov 2026 18:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=MIuIK6OTrAaRf7WvqeRgQl00U2uvIZ8xlyhNJbCOjz8=; b=J/8hRVbbPlJPInpoIKtpYnZtsS
	xcHTlKumZX31T9wKrIf1XWA2NUpIOlY5GDutg1KsZBx9byN0hrb5IYLSnGw+tTfn4xexCYYSe5Mhb
	S/MZcztXgWb5i5Q0v+VvUZaFqwmAVJKRM65x9KoukWc7a1A7DwZR14T875hiaQcWuXf4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvTM-00184Q-2v; Tue, 24 Nov 2026 19:42:32 +0100
Date: Tue, 24 Nov 2026 19:42:32 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 4/5] net: dsa: mt7530: disable regulators on setup
 failure
Message-ID: <d31b32a8-cbc1-4649-9a74-85a6d479a8d0@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875790.4156.6284290287819341762@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179550875790.4156.6284290287819341762@mail.zgclab.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_104248_294532_888387E3 
X-CRM114-Status: UNSURE (   8.48  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 04:25:57PM +0800, Haoran Wang wrote:
> Once the core and io regulators have been enabled, every later failure
> in mt7530_setup() returned without disabling them, leaving the rails
> enabled and making the regulator core warn when devres later puts an
> enabled regulator.
> 
> Route those failure paths to a common error label that disables both
> regulators, and disable the already enabled core regulator if enabling
> the io regulator fails.
> 
> Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

