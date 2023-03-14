Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A0EC7618E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 11:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PFWRE/I5fsxNEryuVloHW3E+e5Lfhok41nQroPHFwhk=; b=AcMQIuhpgw/NmpBqf/OHGsD6kM
	kictpEXsnbMGoFr8Tl4zslwUy831/oxb5Un6P1/cbapxV4EkSLG98q2k23MXZfm3CTONIu+OpDC8G
	qqaik/3YmBFbvT79HV6s/pSIQcgD7jPL0lFsXDq5hEDZZZT9VzIokdhVtWe3NuuIm7GVoMyr82sYv
	KrUy3OkeonwVGdqsf8sWOgSgqVbAfQT/3fSLYzHH2PiTNelQJs/mtnA+TS+8WOd8xdNFN6Z0LtLef
	d5lt8gDA5Tj5KSeF/i7mfaYpehQzKu2PYJZ/EjrYG77RRSTc+hx4PYUmpUG1WpR20SpeD6gAm4ikH
	BGpj+u3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc36Y-009xWB-1k;
	Tue, 14 Mar 2023 11:46:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc36X-009xV8-08;
	Tue, 14 Mar 2023 11:46:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=PFWRE/I5fsxNEryuVloHW3E+e5Lfhok41nQroPHFwhk=; b=Krk6v1ToyQpjrVmIdcrTmM4F/T
	6GM83SZgbdeCPwRcppjq/CTtsTr26G42L6DeuVHxvYua39Ry9DAyLrfTDM8MqoP5YXGPrU523Cnuv
	NsLJ3Kpz+iDWYW3p8j4exQNyHgo9VwfErb5zk+utqOKyeavhKxC+EN+TFXXBIAzyPSkOKCsakpqjs
	yZSBx4g4cEnrlyRZEdeOBGhUWMnd2WjiQpxomzRuLhVpTgUprKN3zFcm2CPw8snJoDne5hv/wkasI
	9YJJnIcdpoZXB6vJeE6du80Nl3yEdTlyqVH80lPz81LqbafnhOCTu9OvYST4z3HtTRv5YtvcaE7QQ
	q+3j95oA==;
Received: from nbd.name ([46.4.11.11])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc1w8-001kUZ-0N;
	Tue, 14 Mar 2023 10:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PFWRE/I5fsxNEryuVloHW3E+e5Lfhok41nQroPHFwhk=; b=pfqogIwF/3ALZvN18MlQxQtKRm
	8oiwm7EQYLEUAy2jvbchG84Rr5AMh2rQJr06kalTbYjyHgaStdhnLJJJPOhXITMCYL5BWgwE44nd8
	cZM2kcL+Ehu1zj0VHPpusyq/cXSho8s6xuf/tHE9l/G3zOgur6ugiMZtYdIJod6HWNFs=;
Received: from p54ae9730.dip0.t-ipconnect.de ([84.174.151.48] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1pc1vh-001pnc-N0; Tue, 14 Mar 2023 11:30:53 +0100
Message-ID: <4a229d53-f058-115a-afc6-dd544a0dedf2@nbd.name>
Date: Tue, 14 Mar 2023 11:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s since
 6.2-rc1
Content-Language: en-US
To: Frank Wunderlich <frank-w@public-files.de>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_103120_284024_72544CA8 
X-CRM114-Status: GOOD (  14.33  )
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

On 07.03.23 19:32, Frank Wunderlich wrote:
> Hi,
> 
> i've noticed that beginning on 6.2-rc1 the throughput on my Bananapi-R2 and Bananapi-R3 goes from 940Mbit/s down do 620Mbit/s since 6.2-rc1.
> Only TX (from SBC PoV) is affected, RX is still 940Mbit/s.
> 
> i bisected this to this commit:
> 
> f63959c7eec3151c30a2ee0d351827b62e742dcb ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
> 
> Daniel reported me that this is known so far and they need assistance from MTK and i should report it officially.
> 
> As far as i understand it the commit should fix problems with clients using non-GBE speeds (10/100 Mbit/s) on the Gbit-capable dsa
> interfaces (mt753x connected) behind the mac, but now the Gigabit speed is no more reached.
> I see no CRC/dropped packets, retransmitts or similar.
> 
> after reverting the commit above i get 940Mbit like in rx direction, but this will introduce the problems mentioned above so this not a complete fix.
I don't have a BPI-R2, but I tested on BPI-R3 and can't reproduce this 
issue. Do you see it on all ports, or only on specific ones?

- Felix

