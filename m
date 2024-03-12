Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40F4C5475B
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 01:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8OttdZlrG4D6n3/bWArb231lKpBo0dIW6y37zc5CZQ4=; b=pPHS8Df35tSSSUTci0OZxvW+e1
	V1LkebOJ5aXaexLuLSbGfgY2j7hEvYVdG6+xBdxJu/5DKWjkfBfi6wbp00YfuSJf/nDm3mDNF3gPA
	OE+pLewpsyAoGz28D2oODiD5EtDkb79Kj7PCvgj6qj/w6qgiH3FO4zhdnS9Spv+NZ9K4DwS6GcKKn
	Z/IDbt9gWNvLhz1gmNTGVtLWr5ZqO8FP6gjCNCjF4JRaR8HdcjHQDkf45aXL2atSo/WWbYq7cgGd2
	KJH9jOEcKjq6BMzeKk6VsiuBxX7AeMyW6IfONw9fqlNAwsqZaZTz02fdIvLS8tHjkiVBi/aoUmM3k
	WQuYcQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjqY3-00000003kW1-3Xle;
	Tue, 12 Mar 2024 01:03:19 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjqY0-00000003kVB-2dtR;
	Tue, 12 Mar 2024 01:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8OttdZlrG4D6n3/bWArb231lKpBo0dIW6y37zc5CZQ4=; b=Kr3vSSyP3usEfrbHqWqNQT6C3v
	p8ShX6NQ0jQ0h6m7vLjc0kJjht6nXakuEFxRF0jMi95vopHMnAJK96GYqyHC6vlvrPH1hh27rTUwW
	FbNrpLsqLKooJJhCEjSJTbW26m8N8loFhsU10SR0qFZaTnBBI561QPHuuJQ6vh9baJ3k=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1rjqY5-00A0Ed-2W; Tue, 12 Mar 2024 02:03:21 +0100
Date: Tue, 12 Mar 2024 02:03:21 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
Message-ID: <0793ba6a-6cc9-4764-a2eb-f2766d860315@lunn.ch>
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
 <6064ba52-2470-4c56-958c-35632187f148@arinc9.com>
 <d45083788db8b0b1ace051adecfe6a3a@risingedge.co.za>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d45083788db8b0b1ace051adecfe6a3a@risingedge.co.za>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_180316_699764_5ECD43DC 
X-CRM114-Status: UNSURE (   6.65  )
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

> (b) When a cable attached to an active peer is connected to
> Port 3 (lan4) before reset, the incorrect crystal frequency
> selection (0b11 = 25MHz) always occurs:
> 
>               [7]      [8]     [10]    [12]
>               :        :       :       :
>               _________         ______________________________________
> ESW_P4_LED_0           |_______|
>               _________         _______
> ESW_P3_LED_0           |_______|       |______________________________
> 
>                         :     : :     :
>                         [9]...: [11]..:
> 
>  [7] Port 4 LED Off. Port 3 LED Off.
>  [8] Signals inverted. (reset_control_assert; reset_control_deassert)
>  [9] Period of 320 usec.
> [10] Signals inverted.
> [11] Period of 300 usec.
> [12] Signals reflect the bootstrapped configuration.

Shame the patch has already been accepted. The text in this email
would of made a cool commit message.

      Andrew

