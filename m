Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A208C6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 16:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPOEUPT2BDTLE2b+sHtR1/2pAlcoMaisMvjTVsGXPNk=; b=Elir8xoEwDpA0AGyKbJuWPCtkU
	tYtC3AYjjt/pU4mSRNgtZqdv+Rbj9gQySbx7rhJ54oPxCoPscCe6gzdPDUKXxKdHogNQXgS0KzKOu
	MxSSPWZNu2pXjYHrlgYNFrn3UdQpwy+jf86tWbBAqRCOYCF7c2DykXuEumLKfDC3Hb9qObnI7siq5
	BUTq26yCpSLRdpbgMZiyh8vfXdf+tWt8t24dobEc3yhCfMqZ4BgyD6saMUmaVdUv8SGwSZgxdcA0f
	04QovIU8kfX9pk795TVJdklqgY5g5obqCCshtk9j+WbYHSClp8/Ht5dJcH/SWUoehT9YGRS2NE/Ck
	wNEmLRxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phYlP-0017jj-37;
	Wed, 29 Mar 2023 16:35:07 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phYlM-0017iU-38;
	Wed, 29 Mar 2023 16:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uPOEUPT2BDTLE2b+sHtR1/2pAlcoMaisMvjTVsGXPNk=; b=CPfEevE81rhmL4/30vA2MbNYve
	vJZFB1uxzoRoFfu4xu9DCli9XnUagbopasJizjJBANG5Cs3uZqVuEwTwn/5Ra+OqU3W4j22tO/gjk
	a7bT3FPmuTVzy4Smj7Ic6AqaXlBv2PSBcqHt9V+mnLk2uC0uv+CnOeUO3y1+UIdVnKpg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1phYlL-008maV-CR; Wed, 29 Mar 2023 18:35:03 +0200
Date: Wed, 29 Mar 2023 18:35:03 +0200
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
Subject: Re: [RFC PATCH net-next v3 09/15] net: dsa: mt7530: split-off common
 parts from mt7531_setup
Message-ID: <2eed481f-e365-4116-bb8c-1740df138303@lunn.ch>
References: <cover.1680105013.git.daniel@makrotopia.org>
 <8e3a00982abc91dfc724ba1a21cbcd9f865f8650.1680105013.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e3a00982abc91dfc724ba1a21cbcd9f865f8650.1680105013.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_093505_012922_5569D543 
X-CRM114-Status: UNSURE (   9.75  )
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

On Wed, Mar 29, 2023 at 04:59:13PM +0100, Daniel Golle wrote:
> MT7988 shares a significant part of the setup function with MT7531.
> Split-off those parts into a shared function which is going to be used
> also by mt7988_setup.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

