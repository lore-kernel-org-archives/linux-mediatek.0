Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E343EC761AF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+3TblAQZ7f3GLFOam0DVCsq9yh45FYA4sRQ01W++LlI=; b=ZuoXrcrXXQin2oZIzyDdOjNVZs
	l+NNpYH1c1QvE5TCEWsxp/uyjrW8l1lU/YZIGoAtG2/QjPz5uoddN5H6LhTEjdmIsXdPTW+85whcK
	wjuqJjs5IJJYMesIk4UeVajbpv1z84GZVbw8/XQnzeHMDKF8Ywojxn8f04L1g9stwPFTSkvquNa3K
	bphDJ10bAfjRSlLBxhVqSPlPjAKurYkUm6fRQFJmsVT+W6L6UdyBPaladr86BmJAZiSXQcOJ7GQmG
	KIVTHj5xNO0bGQij3C8PUPtucklmMk92F59InpnscPzni6oOGTLVDym7FddNOToxSz9g0HBLXtKym
	jDlD4OMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYku-0017XH-02;
	Wed, 29 Mar 2023 16:34:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYkr-0017Vr-0w;
	Wed, 29 Mar 2023 16:34:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+3TblAQZ7f3GLFOam0DVCsq9yh45FYA4sRQ01W++LlI=; b=aIUOkH6aLlWlZN/XRWWni0J0Ch
	lJzIVf+wOwlRD2Veb8cKC6UI8JJrym+2jP2zgx/yrMPOi+HVK6KKuNAeiFjEmykiv5/pQ2bffg0Fz
	DFkHMfpYKq8OuWObj55RkGqhAX7ub9+c2IBZqAPkTrL6acC1Bnqy3lx1nxAa/GfT+ca4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYkq-008mZd-1n; Wed, 29 Mar 2023 18:34:32 +0200
Date: Wed, 29 Mar 2023 18:34:32 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
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
Subject: Re: [RFC PATCH net-next v3 08/15] net: dsa: mt7530: introduce
 mt7530_remove_common helper function
Message-ID: <68345e8b-14ea-433f-9fe3-50ed9fa54852@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <e417f0cd6dea15fe7a0305eeaef6b8f94d654f45.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e417f0cd6dea15fe7a0305eeaef6b8f94d654f45.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_093433_330256_AF4ED5A8 
X-CRM114-Status: UNSURE (   9.15  )
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

On Wed, Mar 29, 2023 at 04:59:03PM +0100, Daniel Golle wrote:
> Move commonly used parts from mt7530_remove into new
> mt7530_remove_common helper function which will be used by both,
> mt7530_remove and the to-be-introduced mt7988_remove.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

