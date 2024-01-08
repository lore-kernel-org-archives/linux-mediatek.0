Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E902C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 19:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAZKhoc1sQaXAZyI0XthhLVPBiZCvaLujckzoEmqp6w=; b=MzRymYab1eNCSyi3zd1OGA2xMy
	w9NoSJFzBtAs/eQRUAh6Sug1hU7DX45wYUaZS+9HxztRl2LDsofbFFfnrlAfRrMsxBseBPb1A1OKX
	9AIE/5ETrUb9EOgyitfKj9cj2OLQ1dv+8KJVr9/l3F8qcmEEOpLbsVK4DVWvkOb1FWrEtL2XEULvp
	bmxk9aO7mck8q5yM5WmjOHkXqLxdBE0WwjIbmlrmQovCf8X5FfwIDIajT46nIYc/Cju7+P62Oi9cL
	GmuhDT43DFTMhYkN4aPW3ctX/Wl4Cpp/BAu6sg9gHyCljLlhxTwfYYaK0oJPCr+b8/HkNhtq+YYRk
	uBBRAWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMvBo-0061Om-2u;
	Mon, 08 Jan 2024 19:21:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMvBl-0061M6-22;
	Mon, 08 Jan 2024 19:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=cAZKhoc1sQaXAZyI0XthhLVPBiZCvaLujckzoEmqp6w=; b=uuhCwomrY3L6fLdraat+dg7C/X
	mR2Jpw+vZi7E/9/ixt9zJNELThCJB3Ss7Koen0mY7nXlpAOK4rP84gHrTIT4iMM4o1Geu4X7Q66Mv
	euT6khRIMozafBtozorvtOYX5FzSjeHwEsnyzFhQJQOFydpSWRH6t/v5uihWAvdoX1bw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rMvBH-004fyv-K3; Mon, 08 Jan 2024 20:21:03 +0100
Date: Mon, 8 Jan 2024 20:21:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Breno Leitao <leitao@debian.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next 10/10] net: fill in MODULE_DESCRIPTION()s for
 PCS Layer
Message-ID: <cf825e28-cceb-49e1-9880-7971cc955b2c@lunn.ch>
References: <20240108181610.2697017-1-leitao@debian.org>
 <20240108181610.2697017-11-leitao@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240108181610.2697017-11-leitao@debian.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_112133_665767_56C4A101 
X-CRM114-Status: UNSURE (   6.05  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 08, 2024 at 10:16:10AM -0800, Breno Leitao wrote:
> W=1 builds now warn if module is built without a MODULE_DESCRIPTION().
> Add descriptions to the LynxI PCS MediaTek's SoC.

Does pcs-lynx.c also have this issue? It can be built at a module.

     Andrew

