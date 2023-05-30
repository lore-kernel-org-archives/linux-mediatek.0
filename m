Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB19DC77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 19:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLcjVDbnWOF4XpYh96gzZGQK8HzR3g7B1vMO9JY9ezI=; b=QTEOdKWhqPJl16Tq4TqIarQvGj
	5T4v2ITTIcO9F2z5B5XXRaCq5tfA744FYae3/fzzjZnXHMzy0GkCYQD6Oy3L/I328LBKE+5Nry8NX
	JdsnbHwDdm7o3SHqtEUlkEHTtCo76VwSA1MQe6Vmjay8FtucsyY+OPILjVJBIW++J3nh+LPmE77qs
	pG1ulyt7cRPdiUM6ll5ZBeDHpx9dq4mrj6uTRmfyMEQMshGvDEMzlUqYlzpOTzcUJCidS+rnXF4en
	MZPoxOhcdQbmChYDKtQfoe67wrkp26YIc85ZS0LglFgkCFurpY9ZAfh8lMKJ7mQbBFTsFqdV2nHjF
	arMkdjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45J9-00F0on-1E;
	Tue, 30 May 2023 19:47:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45J6-00F0nK-0n;
	Tue, 30 May 2023 19:47:01 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 459F56606E64;
	Tue, 30 May 2023 20:46:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685476014;
	bh=uuTnSILXVf1Z1lF8zz/SUkYOonCje3HPQu+Vt2KjcSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m+WUKYl5YEGoFVtSrWHrdUVw+b4VDr1eengMK7E4zEmSxWSrqDtrZfeuM5Qhdl1jL
	 qNXdD3P7KiBha5m8XuRaCsowQgxtz8dpWOVcgsSqFK6c39CjvxEXN6nbZGOuDtf3w0
	 hLQrsqWy2cMhepVQ6VlXODTrLJCKAxXPv/NyIGDXHLCwNf3HXr8vxT8PyYrQ2l4peB
	 Rt3wiDxICVu2ZiHl0aRG9zCL9TyKLJUDCWoWVKCXRXwiXODSp/ccpllC3YBh8AOnGd
	 H4nKIGT3AguTwt5gOX5B4WpucTjHNnZE4UjQBXLibiufCTGw74rDgq9e7ATzwYg+cl
	 JcD3cuzSBDV5A==
Date: Tue, 30 May 2023 15:46:48 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Alexandre Bailon <abailon@baylibre.com>, kernel@collabora.com,
	Balsam CHIHI <bchihi@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Amit Kucheria <amitk@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] thermal/drivers/mediatek/lvts_thermal: Fixes to the
 interrupt handling
Message-ID: <8a38a0da-3a4f-4e39-9f9e-42682edfd9bf@notapiano>
References: <20230428195347.3832687-1-nfraprado@collabora.com>
 <20230502103344.GA3388518@google.com>
 <87b0f5cd-67a8-fbd5-5ca7-a286b543d796@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87b0f5cd-67a8-fbd5-5ca7-a286b543d796@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_124700_468358_7125C99D 
X-CRM114-Status: GOOD (  19.29  )
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

On Tue, May 30, 2023 at 02:27:36PM +0200, Daniel Lezcano wrote:
> 
> Hi,
> 
> On 02/05/2023 12:33, Chen-Yu Tsai wrote:
> > On Fri, Apr 28, 2023 at 03:53:44PM -0400, Nícolas F. R. A. Prado wrote:
> > > 
> > > Fixes in the interrupt handling of the LVTS thermal driver noticed while
> > > testing it on the Spherion Chromebook (mt8192-asurada-spherion) with the
> > > MT8192 support series [1].
> > > 
> > > These are standalone fixes and don't depend on anything else.
> > > 
> > > [1] https://lore.kernel.org/all/20230307163413.143334-1-bchihi@baylibre.com/
> > > 
> > > Thanks,
> > > Nícolas
> > > 
> > > 
> > > Nícolas F. R. A. Prado (3):
> > >    thermal/drivers/mediatek/lvts_thermal: Handle IRQ on all controllers
> > >    thermal/drivers/mediatek/lvts_thermal: Honor sensors in immediate mode
> > >    thermal/drivers/mediatek/lvts_thermal: Disable undesired interrupts
> > 
> > This series seems to have solved all interrupt storm issue I ran into, so
> > 
> > Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> I gave a try on a mt8195 board and I don't see any interrupt firing when
> crossing the temperature thresholds.
> 
> Did I miss something ?

No, indeed interrupts seem to be completely disabled on mt8195, even after
setting the controllers to filtered mode (a requirement to get interrupts). I
haven't investigated that further yet. This series was validated on mt8192,
which did have working interrupts, but they were being triggered too often.

Also note that I've sent a v2 with even more fixes:
https://lore.kernel.org/all/20230504004852.627049-1-nfraprado@collabora.com/

Thanks,
Nícolas

