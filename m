Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBCC8C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=afImBPkNO4AYy7O/fSC5ZFBSrEeshTCmwIztsZJI5CE=; b=Yil1UpzCMDmWmi
	J+O9q7ztZu58zlPoBI1wZlXu8rmgwo1lGnwKCv3mxUSwbEGbzh/g4m5u/vTLIkKztvd4aZBqCY8OU
	OYdeBg7fcnE+Sg54G37wjKa/WztL+8fOsiwmf/0qufGqhaH28sCHeECFLEDpbbaMTc/3HiHHQql4t
	3nJTaZXIZg4O+K2ZawkQ0F01uPa2m/LsBcYN4fJcM1mygAbOM43LT9OMw1ROx2GQJGXOGK6EaYx6b
	ENi9xH6PLlvvDLianRy19d50MLFUIRFNs3td5UM1GwcxXDvsqRp+iEWUWvabQibcaTSB8ZCw3JdaN
	8iVlT2JysKuZjIzGnomQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt7Ch-0049QK-Rb; Mon, 23 May 2022 12:30:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt6tT-0040Ro-G1; Mon, 23 May 2022 12:10:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F068D612E4;
 Mon, 23 May 2022 12:10:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF245C385A9;
 Mon, 23 May 2022 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1653307838;
 bh=lBPchX/uMDZs5nmazywffKCr1QG3UlkRSzoLoU/mwFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e2EL/keWEbc/7ewgZUW2ThW8q5nsSVwgSmB4WDUMJGwMPkPK99ThG+YeOYB+80tLq
 abrpovdkaqqqj/OSeSaFrDLZ5YRBIMe4vfEyMn+StVqqvixJnMX6NufcC6Vziu9hMJ
 YJqeLBYAJMvBauRyHLubKa83NQK+s4qrrQUj0UIM=
Date: Mon, 23 May 2022 14:10:34 +0200
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
Message-ID: <Yot5uls/3vLzZu7I@kroah.com>
References: <20220510122620.150342-1-angelogioacchino.delregno@collabora.com>
 <YnpeYGbo7JJK0lDk@sirena.org.uk>
 <b13b019f-f766-60df-3764-d375f64ea7d3@collabora.com>
 <YnphFjs4E4EYafT4@sirena.org.uk>
 <63169e65-cbfa-d495-754f-023dc8befa42@collabora.com>
 <d91977d2-ebc6-de6e-5eeb-61c25ba0cc64@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d91977d2-ebc6-de6e-5eeb-61c25ba0cc64@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_051039_648911_3DD9AB19 
X-CRM114-Status: GOOD (  13.67  )
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

On Mon, May 23, 2022 at 12:17:06PM +0200, AngeloGioacchino Del Regno wrote:
> Il 10/05/22 17:29, AngeloGioacchino Del Regno ha scritto:
> > Il 10/05/22 14:56, Mark Brown ha scritto:
> > > On Tue, May 10, 2022 at 02:46:28PM +0200, AngeloGioacchino Del Regno wrote:
> > > 
> > > > Sorry for missing this tag, and also I'm sorry for the noise.
> > > 
> > > Hey, if nobody broke anything all this testing stuff wouldn't be worth
> > > it!
> > 
> > 
> > Haha! That's true :-)
> > 
> > Thank you!
> 
> 
> Hello Mark, Greg
> 
> I've just noticed that v5.18 was released, but without this revert.

What is "this revert"?

> Can you schedule this for backport on v5.18?

I need more context here, sorry.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
