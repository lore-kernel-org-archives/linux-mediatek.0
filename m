Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093BFC30638
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 15:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DKP06GTm2UEoRkPtJ6JzcH9TiCjw7XjIVx81S52Mds=; b=QYffh3Vgjww26etAowb6cK82Wu
	/ZPefhMi/R1fFQbPSAZG/SbUSVBd3pTywo/fatewCAIj0i+5vf8fqJYqnYOb0DTMsa+DkZKzHMejP
	9iKP/z3Y0pr4IOCRAWVvtYdA6dz68wCW5NJKFEuAhbxiS7KHOz5GggoIAjieFWXvNAqHRxpHdRxCv
	6Z61xlzDMO6b9wwNT7DppnS1MwGZGUPGV0357WT/g29mf/0ZZu18WP3Kvq47CzJBLuzK+l3Vq3Cx4
	R9mAThPZwun/Fhk1qUt8j/HoPwK16M/2y9JOFnE3P/3Z3/0c9kZt5AK6jJLmoAx1ISrvU1GqC7hXZ
	8zRMXUKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWefc-006eXp-3D;
	Thu, 17 Aug 2023 15:12:21 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWefZ-006eW7-0o;
	Thu, 17 Aug 2023 15:12:18 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qWefE-0002gb-2L;
	Thu, 17 Aug 2023 15:11:57 +0000
Date: Thu, 17 Aug 2023 16:11:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Alexander Couzens <lynxis@fe80.eu>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next] net: pcs: lynxi: fully reconfigure if link is
 down
Message-ID: <ZN44tDZydQfFqZqo@makrotopia.org>
References: <e9831ec99acd5a8ab03c76fce87fa750c7041e60.1692273723.git.daniel@makrotopia.org>
 <ZN4arCVzdszcIBX0@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZN4arCVzdszcIBX0@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_081217_288946_F720F419 
X-CRM114-Status: GOOD (  34.11  )
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

Hi Russell,

On Thu, Aug 17, 2023 at 02:03:40PM +0100, Russell King (Oracle) wrote:
> On Thu, Aug 17, 2023 at 01:04:06PM +0100, Daniel Golle wrote:
> > On MT7988 When switching from 10GBase-R/5GBase-R/USXGMII to one of the
> > interface modes provided by mtk-pcs-lynxi we need to make sure to
> > always perform a full configuration of the PHYA.
> > As the idea behind not doing that was mostly to prevent an existing link
> > going down without any need for it to do so. Hence we can just always
> > perform a full confinguration in case the link is down.
> 
> And this is racy - because in the case with inband signalling, the link
> can come up between reading the status and acting on it. It could even
> be already up, but the link status indicates it is not. Lastly, reading
> the BMSR has side effects: the link status bit latches low until a read.
> 
> Basically, do not read the BMSR here, it's buggy to read it any place
> other than pcs_get_state.
> 
> I think what we need to do instead are:
> 
> 1) mtk_mac_select_pcs() returns the SGMII PCS or NULL. Presumably this
>    is the driver which supports 10GBase-R/5GBase-R/USXGMII, and thus
>    this returns NULL for 10GBase-R/5GBase-R/USXGMII.
> 
>    Phylink doesn't cater for mac_select_pcs() returning non-NULL for
>    some modes and NULL for others, mainly because the presence of a PCS
>    _used_ to cause phylink to change its behaviour (see
>    https://lore.kernel.org/netdev/YZRLQqLblRurUd4V@shell.armlinux.org.uk/).
>    That has now changed (we've got rid of the legacy stuff at last!) so
>    there is no technical reason not to now allow that.
> 
>    Vladimir did have some arguments for not allowing it when we had the
>    phylink_set_pcs() interface:
>    https://lore.kernel.org/netdev/20211123181515.qqo7e4xbuu2ntwgt@skbuf/
>    I'm assuming that your requirement now provides sufficient
>    justification for allowing this.
> 
>    There is one bug that does need fixing first:
>    phylink_change_inband_advert() checks pl->pcs->neg_mode without
>    first checking whether pl->pcs is non-NULL.
> 
>    To allow this, phylink_major_config() needs:
> 
>    	pcs_changed = pcs && pl->pcs != pcs;
> 
>    to become:
> 
>    	pcs_changed = pl->pcs != pcs;
> 
> 2) with (1) solved, there are a couple of callbacks that can be used to
>    solve this - I think pcs_disable() is the one you want, which will
>    be called when we switch to a mode where _this_ PCS will no longer
>    be used (thus you can reset mpcs->interface to _NA, ready for when
>    it is next brought into use.)
> 
> Would that work for you?

Yes, and that actually even makes things much easier.
The case of mtk_mac_select_pcs() returning NULL is not even relevant:
In case of the interface being 10GBase-R, 5GBase-R or USXGMII
mtk_mac_select_pcs() will return a pointer to the USXGMII PCS instance[1].

Hence simply implementing .pcs_disabled already resolves the issue.
I will post a patch doing that instead which replaces this patch.


Thank you for reviewing!


Daniel


[1]: https://github.com/dangowrt/linux/commit/c81d14e214c8bbbab81fd6d6d49e6f7b87015e1e#diff-6f8a141b53de471a9fe00ac68f8c82b9dda3bad057c160327d6bfe1b0b9c8b23R550

