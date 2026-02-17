Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3794E68169
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Feb 2026 10:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D7g+M4OnqYUjr5S0QKK+KNY+EsBCD3l6oGWripE5ZoI=; b=R8tLAFpTc5PWeIIiDAKLbwBq7i
	nWhjGwLQlGX2q8HLdLfF5eDaLhGNxYuW4d4EtveWL7/TzVe3IRex8dmk8pGIwHLkJmQYRineSWPpR
	3qFiUdBNnKk7S/UgYJ5Pk/TIwWEeHLhkguwKUBg7mrWZSDdAq/EmFS/szSpUCZAjFQwihPEfitRqA
	1mqKQitSFRTq7NCEdUPUhZUN30UCunsscwC50E7b5jfJ8dmHtuQuFbgXKp8V7UjwnOEXudn3Z6ugH
	ZQqcD3HwAN7bNSEZBUyOFPW0Uy7ibxN067PCw8eB5jQJ9zDFaetDSgj3xc8HDHu8of8wop9AEYnPG
	9SxtdAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsINk-00000008261-0Rpv;
	Tue, 17 Feb 2026 10:32:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsINh-0000000825q-3yKz
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Feb 2026 10:32:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 759F860126;
	Tue, 17 Feb 2026 10:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FC2C4CEF7;
	Tue, 17 Feb 2026 10:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771324356;
	bh=EU+F3qBEfwa2qi2OJwmfpHEKvticwtw+Y9NIdZ3pMr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VOWVnnv0/vR1b2OMZjXz5cRXcrLIPYXZ/Fqav7h70L/eCm6VBeLMYQV5vNmHCABRY
	 si58s7gzJHvwM8HHTMw0R5WPgONrQTXLuAe7hO6wBX8N0CZbpX1XL0hj6V7TTbGKRA
	 9m7+XgisfGN7I3xv9q8DcyH/Eaoq9Ka/tTw4m1kc=
Date: Tue, 17 Feb 2026 11:32:33 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	Evans Jahja <evansjahja13@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Otto =?iso-8859-1?Q?Pfl=FCger?= <otto.pflueger@abscue.de>,
	Denis Gessert <denisgessert@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
Message-ID: <2026021726-decibel-bootie-39ba@gregkh>
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
 <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
 <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
 <908f3c03-a8b0-4535-9cfa-294c6ade8152@collabora.com>
 <96e7f0fc-65f4-4613-b556-3a2d869dabb4@leemhuis.info>
 <86e2d0f9-5c25-4cce-b4a8-68fb569f987d@collabora.com>
 <6fce0406-1515-4cf8-afdf-24217148d1c8@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fce0406-1515-4cf8-afdf-24217148d1c8@leemhuis.info>
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

On Tue, Feb 17, 2026 at 09:18:00AM +0100, Thorsten Leemhuis wrote:
> On 2/16/26 11:46, AngeloGioacchino Del Regno wrote:
> > Il 13/02/26 10:27, Thorsten Leemhuis ha scritto:
> >> On 2/9/26 12:42, AngeloGioacchino Del Regno wrote:
> >>> Il 06/02/26 17:58, Denis Gessert ha scritto:
> >>>> Thanks for the quick response. I compiled 6.18.9 with this patch
> >>>> (without reverting the previous commit) and it boots successfully.
> >>> Happy to see further confirmation that the patch that we both
> >>> mentioned is
> >>> actually fixing the issue.
> >> The big question remains: Now that this landed in mainline, should we as
> >> the stable team to pick this up for 6.18.y and 6.19.y to get it resolved
> >> there quickly? They might pick it up on their own due to the Fixes tag,
> >> but that is not guaranteed.
> > Yes, please, that'd be great.
> 
> Hi stable team! Could you please pick up be0b304eeb8c5f ("arm64: dts:
> mediatek: mt8183: Add missing endpoint IDs to display graph") [merged
> v6.19-post, committed by Angelo, who ACKed this request; see quote
> above] for 6.18.y and 6.19.y? It fixes a regression in e72d63fa0563
> ("arm64: dts: mediatek: mt8183: Migrate to display controller OF
> graph"). tia! Ciao, Thorsten

Now queued up, thanks.

greg k-h

