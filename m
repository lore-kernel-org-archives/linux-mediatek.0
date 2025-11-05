Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437CBCCFA04
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Nov 2025 08:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xeCToDpF77EsIJG4CskwROg6Aur9i/zqdDoaDVS/8kQ=; b=ALzQDJz9whVVL6BoXbN/WqtYyX
	0z7q4IxIF4qsRSrojDaFtgv2OUa8RYBoAP889FS4dKj0s19kmkfuRfsEBp3sHAOK4PLelXHXJP5kp
	NBUxDJ1HYZbaokMj3ULC13BLrnsAGKGsil+JX/YAqatfAAp15kRlELAUOxt6hNP+jvHjEbWoPjLly
	bVAHYmrr5GuKAryVRNDifwq2MLWjl1R0veon+rq2wes1QosjTMDqni7nvuWkKA4r7U6kSWLB6CEGl
	EpuVz0b6bd44I185ie0bVs25tbDt3l20ktnIcXXQWl3ql8ZTR4xbWx9/QzIIJZIFpfC081776oQbI
	oz/GuZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYXx-0000000DFuE-0GyI;
	Wed, 05 Nov 2025 08:07:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYXv-0000000DFu7-1A5W
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Nov 2025 08:07:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 66A0D60200;
	Wed,  5 Nov 2025 08:07:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10C75C4CEF8;
	Wed,  5 Nov 2025 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762330030;
	bh=ysdaCTaAgAss4/GsTrN52AKA2BxvM2SH97zvlE6w+YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZGq89TIXF5jVACh67jprFUvkT789XJgr1728AnIv90SRnE2erOC2+GS9k1mZ2Cqr
	 /5TwLpSx4Q674iV1MyRjTUJ6F4jPzIKRj0BEZLUMr5yfpitbHJOsbINCrIekDDJX0Q
	 wlHyVZOvixujHbaGsjty6L7ia/9IxcasojcgwQxZyRLKQedsBbPaBawTfqnq8Zqb6T
	 YrS31qjL8Nz0LvZPAQpd1UCheROL+7XFDlelNj5fueMnsdWCZMnZDP+qZCuaLUAMa/
	 T8XMdwMG/mCBz0u2MzIpteeAY1ggDejkTzeqa7orL8/gvZk3pq4o0PtADInXMU2xDR
	 3lJI04UaXoZZA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vGYXv-000000004tG-1gIA;
	Wed, 05 Nov 2025 09:07:11 +0100
Date: Wed, 5 Nov 2025 09:07:11 +0100
From: Johan Hovold <johan@kernel.org>
To: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v2 0/2] media: mediatek: fix VPU device leaks on probe
Message-ID: <aQsFrx_wHor7CAPD@hovoldconsulting.com>
References: <20251028100454.4086-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028100454.4086-1-johan@kernel.org>
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

On Tue, Oct 28, 2025 at 11:04:52AM +0100, Johan Hovold wrote:
> This series fixes VPU device leaks during probe of the mdp driver.
> 
> Included is also a minor documentation update to make it clear that the
> VPU lookup helper returns the device with an incremented refcount.
> 
> Johan
> 
> 
> Changes in v2
>  - drop incorrect vcodec patch since that reference leak has already
>    been fixed by commit bf1d556ad4e0 ("media: mtk-vcodec: abstract
>    firmware interface") which added the codec release callback
> 
> 
> Johan Hovold (2):
>   media: mediatek: mdp: fix device leak on probe
>   media: mediatek: amend vpu_get_plat_device() documentation

Looks like I forgot to add Chen-Yu's reviewed-by when respinning:

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

