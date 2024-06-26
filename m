Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ADA1C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 12:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QvDic69Yfk1BR34oi63YBpyjFIiTOZqaeL4DJmcTtc=; b=hQUdwJ0zl4JxduAK1ffb9yoZan
	6TBjaxIrG5APiLC5TY6ONkqorXKGSekQaLgU5BG/L1JnVkRYW9Geu7RUqoiy5VfLSrFXkByVI0BVQ
	5owWrq9KHSslf0dWko1od+oaD1hCY+aNlHgfqGKWoqkp0dKrWx3z+Kwf8/OpZgsLB9jh0YtPUDcQi
	tvoHM23S+9eZIs5jQ+o+NuVgEsB1qOZXd3JOAYiB9cDn3X0tqzkvniyrWKnwgdJmNVOE7inJLJKrt
	PYPHQ20FjIZUpvW2mKhMj1ibdkutkQWbt31ncNAlBs5JiDf1JUsl2db/8wDSUVGT1D1RhvNNNUQwl
	6U5TDc3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMS0f-00000006muV-0Z0w;
	Wed, 26 Jun 2024 12:44:25 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMS0W-00000006mrc-07Pv;
	Wed, 26 Jun 2024 12:44:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719405854;
	bh=eo2f+raRsg9XoFkHoh06Dm4qF3Kjcfs2lWyUX0Svobs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zi5g1+kzo4gjYePu6oPdwtEfBCIvcnJFIYt5wtDXiSRnHjic1HMkNZ2lX05rt4QVf
	 M7bDkFKP5bU3/74lPSm99peB+8uqeUa2tFedIGX0fqHdNmqahGXaSu/cYptjelwl9t
	 9oLf3w+YrpWMokFU6y1QA6Q8PQ0CWRZhKxnLuK3NJjW+6iF9tnilin/60m1mXw5UYj
	 p8wm+0Q+rFOPmbBSuJI2gak7IGmtpoXy9HG2+1NWv//SzAsBOZ3kTiQU+kBceHfszU
	 xFw0WVDN4sYmH+spOBJ2JADm2QzIk9HNiT/rB09JLXEheBDz8kO2rEKlZUUOp5cINe
	 WgB7sPmm78k3A==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DEA8F37808FA;
	Wed, 26 Jun 2024 12:44:11 +0000 (UTC)
Date: Wed, 26 Jun 2024 08:44:01 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: Allow setting readable driver names
 through kconfig
Message-ID: <0b5f6fe0-fdb7-42d3-9c91-85a28b50526a@notapiano>
References: <20240625-mt8195-driver-name-too-long-v1-1-8573b43a9868@collabora.com>
 <b838b9a9-0ce3-40a5-b7a5-d1c825a0fa20@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b838b9a9-0ce3-40a5-b7a5-d1c825a0fa20@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_054416_648200_BFD2A30E 
X-CRM114-Status: GOOD (  22.75  )
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

On Wed, Jun 26, 2024 at 09:49:55AM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/06/24 22:23, Nícolas F. R. A. Prado ha scritto:
> > Commit c8d18e440225 ("ASoC: core: clarify the driver name
> > initialization") introduced an error message when driver names are
> > automatically generated and result in truncated names.
> > 
> > For example, this error message is printed on mt8195-cherry-tomato-rev2:
> > 
> >    mt8195_mt6359 mt8195-sound: ASoC: driver name too long 'sof-mt8195_r1019_5682' -> 'sof-mt8195_r101'
> > 
> > Since that truncated driver name is already used by userspace (eg UCM),
> > it can't be unconditionally updated.
> > 
> > As suggested by Jaroslav, update the driver name but hide it behind a
> > kernel config option, which Linux distributions can enable once the
> > corresponding support in userspace audio configuration software lands.
> > This ensures that audio doesn't regress, while still allowing the error
> > to be fixed.
> 
> I can propose the following plan of action for such a rename:
>  1. Temporarily have both UCMs
>  2. Wait until distros update their packages

It's not possible to monitor the package version for every single distro, so I
guess you mean tracking only the big distros and hoping that no small distro
still uses the old version.

Also, is UCM the only userspace tool that might use this name? There might be
others too that we would need to care about.

>  3. Change the name in kernel without extra config options
>  4. Remove the now deprecated UCMs
> 
> ...that's requiring a bit of time, yes, but I think this is the best way to
> ensure that no breakage happens in the meantime for any users.

My worry is that we don't know how long it would take, if a small distro decides
to keep using the old version. But even in the best case it might take years for
the old version to be phased out, I'm not sure I'll be around for that, so maybe
we'll just keep using the old name forever.

The nice thing about the config is that distros and users can opt-in immediately
to get rid of the error. For example KernelCI, which is monitoring such errors,
can enable this config to fix this error right now.

Thanks,
Nícolas

