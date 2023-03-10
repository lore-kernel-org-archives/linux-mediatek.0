Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756FBC6FD19
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 07:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaWchu9Dfr4OkYj45gkJcCczsej67GVRuUREReSvVXw=; b=pQsN7YYxpYp4s4nNSPVdzgyDn0
	lZ4tWFFkYbz7oN78AdAvvJCpyAI5lEDTEDxYlKjuHeqCnaOh/m5Z+iGre+VprDbdRgmQsjD6OHzBS
	V68Y4qjr0zKo3YM6usToEFQvO+5eqVHRCYzBgE9l5IRIZEZj2R+YGx7q4NAkrKIE+4Uq/tgXivnIP
	WYjgDQN6sZ9UxobsynYaTs2A4UryOHAlDEWxIc1wbPFRrLBvMziTQbPaPWKwj/8Nt9aM8Cpbk0To1
	i8ODzt6epBs3/7BAaP0rKL1h/aw3wIVgPy27w2nDCgqXUhg9GehSHiNFZWkpPeoX+nmzCxYbiSkHP
	R2+h+kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWu1-00DMlm-Sw; Fri, 10 Mar 2023 07:10:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paWtr-00DMja-Cu; Fri, 10 Mar 2023 07:10:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B299F60D56;
	Fri, 10 Mar 2023 07:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56489C433D2;
	Fri, 10 Mar 2023 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678432246;
	bh=VR1mKclschmFMjDRwvJBhuSRexdBJAOKmZHA86cnb2A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bmb6ZwhLV4T9BIFnVhpjm7NxRsX3o0ta05h619BcJ6VuKOCSKJMyuB+nnYdk34PyA
	 FeEtJdmhm8NGpwAvXc9kNVHl2r3ZQhi2gCii+nrGjeYC1VJmCbXFTYGI2fPCcmWXP5
	 D+JrF5PAsfqp0wapqvo1YPWOhKng2OwAWKin66IRXp60Ic7NxIWa+MxhUC2nJemz7n
	 aYNoKMTugt+UEy2vgAuRWRAYkaEjZ7QOCTIew2fxlFMZp4WOFrGrls3zM4KbABI+1b
	 RMPWYk06pZWPRoc8QZQrJQdfxk0i4WDgC3rp7iv2G4h2XBvyAHphbwERynjzwVLGMC
	 jZYxdGTASx8vg==
Date: Thu, 9 Mar 2023 23:10:44 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: arinc9.unal@gmail.com
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Andrew Lunn
 <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, =?UTF-8?B?UmVuw6k=?= van Dorst
 <opensource@vdorst.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 net 1/2] net: dsa: mt7530: remove now incorrect
 comment regarding port 5
Message-ID: <20230309231044.1dc41bf9@kernel.org>
In-Reply-To: <20230308130714.77397-1-arinc.unal@arinc9.com>
References: <20230308130714.77397-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_231047_501347_883208F5 
X-CRM114-Status: GOOD (  12.57  )
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

On Wed,  8 Mar 2023 16:07:14 +0300 arinc9.unal@gmail.com wrote:
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index a508402c4ecb..b1a79460df0e 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -2201,7 +2201,7 @@ mt7530_setup(struct dsa_switch *ds)
>  
>  	mt7530_pll_setup(priv);
>  
> -	/* Enable Port 6 only; P5 as GMAC5 which currently is not supported */
> +	/* Enable port 6 */

I think you posted before Vladimir's patch went in, so even tho 
it applies now the CI/build bot could not test it. Please repost.

