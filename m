Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDC7C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMT3LfPqvkRqCY9P471/Bhca6DIlUkfXhiUewhPRrOg=; b=EwuzAn78yLtisDP7zr+cCTsIgE
	6StisiXDk+gM7G2e1adDSaYfs3TBt6yrwwyzUvYKakEEln4PfeUkShErfZzzQJ9SUdJxJ2uO/p1XC
	dT44ZfIGbRSs//sKBKiIati/Qn30YmDGjrzAVPrKcKcFb+Teb/R4spA4Tomnu5bnIkgBVJGLmqvqd
	W0XnOofZRHe/MlNNWujgROBKVOddl+QQPcEZaADRi1dJKPjQiYQaoIc9yMgj8ZDRWP/bQC2bBAcEl
	mso91nj/NGw25GxcJatRoGUqT09wKR7fA0ywGWVpbUAT0Jk6adyYUzTkQugsvzakEYO6KgDE6lFdp
	fBe7Qeag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFpak-00GEWL-2d;
	Wed, 20 Dec 2023 05:58:02 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFpah-00GEUs-0b;
	Wed, 20 Dec 2023 05:58:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id AB3ADB81AE1;
	Wed, 20 Dec 2023 05:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84096C433C7;
	Wed, 20 Dec 2023 05:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1703051877;
	bh=n0ckWVr2p5ZoAOLCgKU6Bdxii8DiBrVLcshx8Gs1Gv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPdecnAxw7khdyUI/WPAvwDX+64JC81cBxPIJZKCTcx1rFPLt/MPfyi6gBs9UhpxT
	 vuV6PuhPcLbQvgtBBSe3BMNSvM3/NvD5V86aQfgarfmfC7BuD8+eN4uxTzcsnYg92n
	 f9hAvwW/2HahH0NUxgo5zde7eshHtu+qkEvKp8Xc=
Date: Wed, 20 Dec 2023 06:57:54 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, stable@vger.kernel.org
Subject: Re: [PATCH v3 2/3] usb: xhci-mtk: fix a short packet issue of gen1
 isoc-in transfer
Message-ID: <2023122033-footprint-impose-9989@gregkh>
References: <20231220025842.7082-1-chunfeng.yun@mediatek.com>
 <20231220025842.7082-2-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231220025842.7082-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_215759_350899_1E09273B 
X-CRM114-Status: GOOD (  11.61  )
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

On Wed, Dec 20, 2023 at 10:58:41AM +0800, Chunfeng Yun wrote:
> For Gen1 isoc-in transfer, host still send out unexpected ACK after device
> finish the burst with a short packet, this will cause an exception on the
> connected device, such as, a usb 4k camera.
> It can be fixed by setting rxfifo depth less than 4k bytes, prefer to use
> 3k here, the side-effect is that may cause performance drop about 10%,
> including bulk transfer.
> 
> Fixes: 926d60ae64a6 ("usb: xhci-mtk: modify the SOF/ITP interval for mt8195")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
> add Cc stable

Why is a patch that you are marking for stable inclusion (and I am
guessing inclusion in 6.7-final) in the middle of other patches that are
not marked as such?

Always split out bugfixes from other things so that they can go through
the two different branches, one for this current release, and one for
the next one.

Otherwise you will have to wait until 6.8-rc1 for this bugfix to land,
which I doubt you intend to have happen.

Please fix up and resend 2 different patch series.

thanks,

greg k-h

