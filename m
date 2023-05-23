Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54566C7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 23:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x4bKN3ZI9dbZNCt524aR0Dd/liOmfjaxlLXLdzdDj4M=; b=eBOBGDXdofJXZ8IVJCn9StX0xQ
	ry3VR3QvH5qZmv/2Bd/QmLqXwsWUQaT4oRZvmP/7qt63aWVcUmp7QcC7Q0eNzeQq3pdW02mmkjPrh
	xFjC5RA7hBwgCAIQUXqaJ9n6K0qgEpSCpML/Jx2k2ALy/IGgOGHit4c4rIknXlWq8bzododwWw9WN
	nC/XIWGVo5sXttm3UU4gMFeMCC9pxR6Tb5PNw6J2/BH3ply5kXG0FNGB8Hy7yclPeyAgs7sjCEVNz
	MiHYu3ne092mui4LmgxVbLrLQEY9guFz1aDwbFlutoQpZxw/IIRBO4IihZ2r7YlAPgO+zb/lVltQr
	/htQCqnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1bd3-00Boie-1N;
	Tue, 23 May 2023 23:41:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1bd0-00Bohq-2v;
	Tue, 23 May 2023 23:41:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=x4bKN3ZI9dbZNCt524aR0Dd/liOmfjaxlLXLdzdDj4M=; b=PeokA/NKfESiJXGgvI5wjdeEmP
	/8s7DUL32x6HuqGIr5AU5C/xJ26DTmGsmn6CfQBX45Vp3XKVTXG9zFVthAX6uw/rX3XXYbAwVhnkF
	mcMZfAmL9JTlW9+CGoEvRfXGALLowVHWEppaCpXaWMbLsFy2kTNJXlEBEPh8AmBO13ggZBy4hTb8Y
	NDwZusBAIfEtzE3kNkshu9LGuyjSn6aJan4ZkNHgKyyIt6PI5yIPH/xCRdMZOCQ+x2YT2E9HFXU0j
	UGUyx9EdFMkHMDJuZ6tr7Be0Oes4BUfBYwVs49gfrYvKL/HnqZFoHWdJgR+Qytc28LZNIvsq7P+BQ
	stfvYD+g==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1bcx-003eS7-1o;
	Tue, 23 May 2023 23:41:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=x4bKN3ZI9dbZNCt524aR0Dd/liOmfjaxlLXLdzdDj4M=; b=BS
	YSvEV8gWjnWZKg3eIJTRcAxoNROwJstbj41MGY3yGMP7rccqeeieBH3Kx8lhYlcNQKCuCqSldgNsU
	09kGW21QtU3XED0xjqruUIkE2SLySM97pMTrAhkoNFCtfqyeNNe1AK9RIGfTHB1dnSjGsYzifaX+J
	Gkq49Cj15j+WWm8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1q1bcd-00Djho-TS; Wed, 24 May 2023 01:40:55 +0200
Date: Wed, 24 May 2023 01:40:55 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 12/30] net: dsa: mt7530: move XTAL check to
 mt7530_setup()
Message-ID: <dcac517e-60e1-4a39-8c7a-0a00ac682553@lunn.ch>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-13-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-13-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_004115_969400_ADFD06C0 
X-CRM114-Status: GOOD (  10.87  )
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
Cc: linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:14PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The crystal frequency concerns the switch core. The frequency should be
> checked when the switch is being set up so the driver can reject the
> unsupported hardware earlier and without requiring port 6 to be used.
> 
> Move it to mt7530_setup().
> 
> Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

