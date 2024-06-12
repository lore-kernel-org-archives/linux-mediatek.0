Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6026C27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 20:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PaC74ph2B4sszZqK3hgeEld9ICYHpkTErRTyz8f3NpY=; b=CtideawwlBu7y55HhBZJ1rVDpj
	itJHJpVj5xlt2a1VtCf76Hq+AjlQhth16lmX7wwdw+CBZoP8xT61z05L+8PPAsIVaBcCrhxsDhmvJ
	/B5GzVNPEKwRecmNoPikKh2MVrUsvEvNOQh8GwZsX9LPQYs39Cc0bV+h6K1rlMlplFzPs1VRb5t3H
	/rJkNwvZIcxS8G4ZKkApt79gQCaJVP7li2+2nuA8Vhsl2qQBrLZ5Vnu0rYXKfZDePkrkzX2RJF4ZR
	GeoGu8RUQbXtu5jURxUhoDQHHDOlvEqmTALiqvR/KoFU79rDbGsHp67taTRJtTbD2ngjcqmNBRJbx
	MwRwDzRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUXG-0000000E1zx-0CAg;
	Wed, 12 Jun 2024 20:25:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHUXB-0000000E1yS-47CT;
	Wed, 12 Jun 2024 20:25:31 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 919A812E4;
	Wed, 12 Jun 2024 22:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718223913;
	bh=0Rgb+lTc0MFdKvGyTfrXC3aT7qcl8gWlicq53gT7wlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i1EJeHyEyBLVJMaCmD6MMJ/4PaC7EACNJSaWwx5Om1+rzKtu287UiS64ji4v+60wf
	 G7n+RsI6Of8utZV06quo0BpHScZg7/Y4+g0Nou7FhlK5NyDV3nMJoC8DA7bBjpABhk
	 qsbpo6SXUZPHufygXpHW8fK2Yxv8Aa/GvB45uVlA=
Date: Wed, 12 Jun 2024 23:25:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Jeffrey Kardatzke <jkardatzke@google.com>,
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
	Nathan Hebert <nhebert@chromium.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Yong Wu <yong.wu@mediatek.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory
 flag
Message-ID: <20240612202507.GT28989@pendragon.ideasonboard.com>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-5-yunfei.dong@mediatek.com>
 <20240522111622.GA31185@pendragon.ideasonboard.com>
 <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
 <33d38919f3f94b6e1848aaee20cf52ac9c1df606.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <33d38919f3f94b6e1848aaee20cf52ac9c1df606.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_132530_187881_A761FDA7 
X-CRM114-Status: GOOD (  21.21  )
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

On Wed, Jun 12, 2024 at 03:43:58PM -0400, Nicolas Dufresne wrote:
> Le mercredi 12 juin 2024 à 13:37 +0900, Tomasz Figa a écrit :
> > > Why is this flag needed ? Given that the usage model requires the V4L2
> > > device to be a dma buf importer, why would userspace set the
> > > V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> > > buffer to the device ?
> > 
> > Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
> > actually useful to tell the driver the queue is operating in restricted
> > (aka secure) mode.
> > 
> > I suppose we could handle that at the time of a first QBUF, but that
> > would make the driver initialization and validation quite a bit of pain.
> > So I'd say that the design being proposed here makes things simpler and
> > more clear, even if it doesn't add any extra functionality.
> 
> There is few more reasons I notice in previous series (haven't read the latest):
> 
> - The driver needs to communicate through the OPTEE rather then SCP and some
> communication are needed just to figure-out things like supported profile/level
> resolutions etc.
> - The driver needs to allocate auxiliary buffers in secure heap too, allocation
> at runtime are not the best

Will the same driver support both modes on the same system ?

> Note that the discussion around this flag already took place in the very first
> iteration of the serie, it was originally using a CID and that was a proposed
> replacement from Hans.

-- 
Regards,

Laurent Pinchart

