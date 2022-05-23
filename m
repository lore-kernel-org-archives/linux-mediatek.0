Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A03FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zlxtw0/g/iY5KWwRkUikc+qHL/kvHbSExEPpbxPYh9s=; b=LTZaAEWoSdC3Up
	NXrabBzpyVJ1D/6bTn0ZO5jwCPGHGN4U5nGC8qA7bn8oWYcrgknbj6lRgBMn2GZuqspZ3yPGOoiLC
	g7M95DoRoyWJEt86QO6F3BmmPVMtrsQ8U0IMuDaAlF27ZiSZNemw5bwCa2u8Ft9lXH5m9mXzlDNIT
	Ar/yMipTtNR+gKJiStwWbgIpDFnwFLu9sCykFoz2bE6Cj+APGeKCo7a0vozXg6YtUMaF3XaPlmvV3
	l9NiOXsCm4zQfpCnnEs/h6RrKih/jxSqZQFCEqT/2q6pGuKKCKo1FIqgY31vn5fTRmeGgUrZ99oYF
	icjNLeYy+wOVc1BSfMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7IN-004ClC-Is; Mon, 23 May 2022 12:36:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt7EH-004AN3-Kz; Mon, 23 May 2022 12:32:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 04C7461301;
 Mon, 23 May 2022 12:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CD5C385A9;
 Mon, 23 May 2022 12:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653309128;
 bh=kFxFcM5U7DCGygs0xc9/IorhdzyDD33c1AOEJSIDPxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dwi1CRSYrd3+5S93sveEHTjANFjxe/hxsE95ccumwnmZ250ozaMe52yPEOcxQfhtE
 MuMxPEoXIIB+bdV7aaQHLUAqURCaA83aIXoqMdgKckhNa4tPgEH2iTkTMR5VxHBpHa
 CtYiqhUsVS6+gLOpCmHDw0iICCWMO4d+MLH2DuuU=
Date: Mon, 23 May 2022 14:32:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Mark Brown <broonie@kernel.org>, jirislaby@kernel.org,
 matthias.bgg@gmail.com, zhiyong.tao@mediatek.com,
 colin.king@intel.com, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wenst@chromium.org
Subject: Re: [PATCH] Revert "serial: 8250_mtk: Make sure to select the right
 FEATURE_SEL"
Message-ID: <Yot+xTBus04O9TUu@kroah.com>
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
 <YnpeYGbo7JJK0lDk@sirena.org.uk>
 <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
 <YnphFjs4E4EYafT4@sirena.org.uk>
 <63169e65-cbfa-d495-754f-023dc8befa42@collabora.com>
 <d91977d2-ebc6-de6e-5eeb-61c25ba0cc64@collabora.com>
 <Yot5uls/3vLzZu7I@kroah.com>
 <da1e4b31-de71-1fda-eff7-2e70fe1331ac@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da1e4b31-de71-1fda-eff7-2e70fe1331ac@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_053209_756948_C8CBC715 
X-CRM114-Status: GOOD (  18.61  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 23, 2022 at 02:13:35PM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/05/22 14:10, Greg KH ha scritto:
> > On Mon, May 23, 2022 at 12:17:06PM +0200, AngeloGioacchino Del Regno wrote:
> > > Il 10/05/22 17:29, AngeloGioacchino Del Regno ha scritto:
> > > > Il 10/05/22 14:56, Mark Brown ha scritto:
> > > > > On Tue, May 10, 2022 at 02:46:28PM +0200, AngeloGioacchino Del Regno wrote:
> > > > > 
> > > > > > Sorry for missing this tag, and also I'm sorry for the noise.
> > > > > 
> > > > > Hey, if nobody broke anything all this testing stuff wouldn't be worth
> > > > > it!
> > > > 
> > > > 
> > > > Haha! That's true :-)
> > > > 
> > > > Thank you!
> > > 
> > > 
> > > Hello Mark, Greg
> > > 
> > > I've just noticed that v5.18 was released, but without this revert.
> > 
> > What is "this revert"?
> > 
> 
> "this revert" == "this commit", reverting
> 
> 6f81fdded0d0 ("serial: 8250_mtk: Make sure to select the right FEATURE_SEL")
> 
> > > Can you schedule this for backport on v5.18?
> > 
> > I need more context here, sorry.
> > 
> 
> As stated in the commit description, some MediaTek SoCs are incompatible with
> this change, hence it's actually breaking late serial for some machines.

Did I already apply this change to my tree?  If so, once it hits Linus's
tree we can backport it to 5.18.1.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
