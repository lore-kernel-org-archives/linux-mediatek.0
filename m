Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2AF606A326
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FZQdaqnF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=ddPmOKDQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BB4dvpr20SC5e/Tv9sGOQ+I4hmkO5OM8JeoWCYxHvq4=; b=FZQdaqnFx924M1ZluQXTgC/TBs
	OPuKIFM0eqZp2TCza/eZKebxIak0Qu3Tor/fE6aRsYZsER2X0C72IKW28ArGEKRXfGAzElDxalwlH
	Dtqrxd40VZnSqvQToPQ7zP34oHQXOWLomBnm02iMXjspQOVMZNNsYX7T7cn4lbp6nnTu/isJb5zrw
	W5IHSItdf3PTa6A+AkzvWUKnsALBZtODZ/K1r5CdnZABPNNDfsVGAqWEQRlh7IjXrdQfuAA9FJxKz
	MhV4QUVwfyB7GqDQxbf9YCpmqnMQTO1jhsFMZgpxikQH/+hqyIq9HTH8m5ZkV+yCE+BM0WHKUImil
	pT7+NzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvbZ-00000007XhW-3Ifk;
	Tue, 24 Nov 2026 18:51:01 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVvbW-00000007Xgn-2IFn;
	Tue, 24 Nov 2026 18:50:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BB4dvpr20SC5e/Tv9sGOQ+I4hmkO5OM8JeoWCYxHvq4=; b=ddPmOKDQV22XD0M6C23IL+CB1f
	+JA+iNr/RylCv39jhqyB6O04Xk459XyUrGmsVeylTKN7zcKoT8UJWDtnPfC+O5JRCJlcgD3nHQ34O
	88QAtZm1AHXtUt0JJsmbf+0ESdJISO+1iN0tH03TQPKP4m5KaQiNCkAb+AcfDx+RHBik=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVvbH-00189o-VW; Tue, 24 Nov 2026 19:50:43 +0100
Date: Tue, 24 Nov 2026 19:50:43 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
Cc: chester.a.unal@arinc9.com, daniel@makrotopia.org, olteanv@gmail.com,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 5/5] net: dsa: mt7530: disable regulators on
 mt753x_setup() failure
Message-ID: <cb1f5ec5-61f9-4513-a80a-c07a37e20e36@lunn.ch>
References: <179550875789.4156.361477684651496992@mail.zgclab.edu.cn>
 <179550875790.4156.14185923394520188230@mail.zgclab.edu.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179550875790.4156.14185923394520188230@mail.zgclab.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_105058_588686_A99A8E29 
X-CRM114-Status: UNSURE (   9.18  )
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

On Tue, Nov 24, 2026 at 04:25:57PM +0800, Haoran Wang wrote:
> mt753x_setup() calls the per-variant sw_setup() (mt7530_setup() for the
> MT7530), which enables the regulators, but the steps that follow returned
> on error without disabling them. The common case is mt7530_setup_irq()
> returning -EPROBE_DEFER, which leaves the rails on and re-enables them on
> every re-probe.
> 
> Route all failure paths after sw_setup() to a shared error label that
> disables the regulators, and move the mdio irq teardown there instead of
> handling it inline.

From an architecture side, this is not great. We have a per-variant
sw_setup() function. To keep things symmetric, there should be a
per-variant sw_teardown() function.

    Andrew


