Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB6EC7619A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 20:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2tin/L6rJiFEqntay9mXA3bCc8hNKe8kUj52Bv9mJg=; b=auyiE9aaKtDlg3+5ycIVdYCkbx
	PIoKQPFb+hxCKjvEIyf84ENjRz5UAmthxd5Pk1nEZI3AlW7WTb1HZUVTPuygXAJt/EvDvpOXYT5jx
	zlzT4sRfEuS1xtIxHZsll4Buk3E2rdEdl2rdivXDuGSk9qWuka+a0x4NgyKk6uN8rHAqofOaNY4l/
	EKTmVBpI4oYrSn1zssH+yVBpcBNyJe3pXbbKEh9AaRWL7l2OkJbmm4306l/VcokSVvgb1CEp3nKBs
	CCOQifm+67PhhjdbK+Jh5GbmdYFooqGfzlbmcez9B+cdU6mYc05rv5WMKHXwG5tLFvV6M1abJmzVm
	FE3YKkyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phzM0-0053yO-0L;
	Thu, 30 Mar 2023 20:58:40 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phzLx-0053xl-1K;
	Thu, 30 Mar 2023 20:58:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=S2tin/L6rJiFEqntay9mXA3bCc8hNKe8kUj52Bv9mJg=; b=WFarSXe5sGwcuMs5tDBuETiH1u
	4MTWsmfB4TyOwOmsWpvgc3THG6NijDlwWieaRItG21r+zc9zCWHtm77n7U3C9MdL/o566tBX4SqTA
	w1yGVe34TV/w75dIQsgwkuRNZOtbzccqk37EBAOCsvygl/rboEDkyq2UDl67bRE3FJPA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phzLl-008vua-Ik; Thu, 30 Mar 2023 22:58:25 +0200
Date: Thu, 30 Mar 2023 22:58:25 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk,
	linux-kernel@vger.kernel.org,
	=?utf-8?B?QXLEsW7DpyDDnG5hbA==?= <arinc.unal@arinc9.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Sam Shih <Sam.Shih@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH net-next 01/15] net: dsa: mt7530: make some noise if
 register read fails
Message-ID: <55b7e715-2982-4c96-8ab7-9f9a71f2c3f1@lunn.ch>
References: <cover.1680180959.git.daniel@makrotopia.org>
 <9bc5f475099a4a8840842808ea1a1290abf2c0d3.1680180959.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bc5f475099a4a8840842808ea1a1290abf2c0d3.1680180959.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_135837_466241_3DA478DB 
X-CRM114-Status: UNSURE (   9.35  )
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

On Thu, Mar 30, 2023 at 04:19:26PM +0100, Daniel Golle wrote:
> Simply returning the negative error value instead of the read value
> doesn't seem like a good idea. Return 0 instead and add WARN_ON_ONCE(1)
> so this kind of error will not go unnoticed.
> 
> Suggested-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

