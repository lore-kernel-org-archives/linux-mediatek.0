Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE026C25B78
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 13:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GVH3hd6GTpYUkd0MY/d50j19yuf6w01ci9ep2ahCSAo=; b=07CoCyIrd7rVZBZ87n7wiEsHKc
	g34bWINEm7gZJZAaKppWSjnpZFYtMoP/YULUhPBH0dME8C9dRBxST2f0oSe6LRXeIiMuS/1tM/1JY
	ScvGAmiet3yVzPhjRbVF8Vj03AEt79BmagpSR3+CYGTrDwh+AQGVbscPRy2+tLHgwwa+ggwDqehQT
	iTe1ek8Q2oQEMBx1OKn7BeUqySnnAX0V82IQ/hYZE5ct8+vhXQ/znikX7Edsot59YB66RaeN+8ZnU
	AhbAHsDDRfJsvdXNnNpuhv3T1LjB+lHmUycoTrjUJ76M/8PqA1b+dUnTQAs2UkKySXDiQHUJDdFYi
	1fN/wZPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92it-0000000EXGk-1vL6;
	Mon, 20 May 2024 13:06:39 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s92ip-0000000EXFi-0QnO;
	Mon, 20 May 2024 13:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=GVH3hd6GTpYUkd0MY/d50j19yuf6w01ci9ep2ahCSAo=; b=R2Ea1JScnnU0BdrEbQd+F4498S
	ygj9NGUqj58arOvsoKndxyCcd/jBizW5dFkNtI/7zYtyuReuMoacQezcV9qS0u/WHrlqNlTRyJUnL
	sfBfRXL5FQELA+o4febjKFzHG4gD0tII+AeTa8BJD57MoULVoI/1ay/tQfPnJNR7B7Uw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1s92ib-00FhHS-Ei; Mon, 20 May 2024 15:06:21 +0200
Date: Mon, 20 May 2024 15:06:21 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sky Huang <SkyLake.Huang@mediatek.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Steven Liu <Steven.Liu@mediatek.com>
Subject: Re: [PATCH net-next v3 0/5] net: phy: mediatek: Introduce
 mtk-phy-lib and add 2.5Gphy support
Message-ID: <7f99f50b-b5c4-4a90-b32e-f2f7f5ce8e9b@lunn.ch>
References: <20240520113456.21675-1-SkyLake.Huang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240520113456.21675-1-SkyLake.Huang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_060635_170228_6FF1A943 
X-CRM114-Status: GOOD (  11.89  )
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

On Mon, May 20, 2024 at 07:34:51PM +0800, Sky Huang wrote:
> From: "SkyLake.Huang" <skylake.huang@mediatek.com>
> 
> Re-organize MTK ethernet phy drivers and integrate common manipulations
> into mtk-phy-lib. Also, add support for build-in 2.5Gphy on MT7988.
> 
> v2:
> - Apply correct PATCH tag.
> - Break LED/Token ring/Extend-link-pulse-time features into 3 patches.
> - Fix contents according to v1 comments.
> 
> v3:
> - Fix patch 4/5 & 5/5 according to v2 comments.

Ideally state what you actually changed. The purpose of this history
is to remind reviewers what they said, so they can

1) Check if anything has been missed
2) Check if the changes made fit to the review comments.

So please include a one line summary per change made.

> - Rebase code and now this patch series can apply to net-next tree.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html#netdev-faq

	Andrew

