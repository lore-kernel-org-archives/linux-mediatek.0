Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DEF0C54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Mar 2024 16:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7nvosDKIXaYzFECdhZZyUrOF4mJgzGjiwhQVEGTMaA=; b=PdWxiarQyjzVI/
	rcDHHAvhrn9zR0LJjjZLZe4hEaGVJa7PJKi/hF96qtHvVuqz8qcv75AyMwHbL8rfrT648A+WPWxZS
	6ZvrFXwyItx1M3WJw6MhsUwmfFgHAaDR+fFSya9ks66Le4hIlblg4hd3OiVt5e+Q1kcBgdj6SI1tq
	kSzlRQ6CsvbMqeNiSmEJyc3H3l+6qOeGCNyG/9aNSbt3DzcYOJMIFKV489RhQSmOHkRZhzlC+TDr3
	M2iaSW928J9Xj2WPiSkKskyFl8kNFg2M4ekIhn85/eFia3NE3/7GrwW8UNfp2X9DEZx5w0GQrOmbe
	1u9o6NBrWyFCfi9RD9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rji9c-00000002Cxj-0rCm;
	Mon, 11 Mar 2024 16:05:33 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rji9V-00000002Csr-3ofX;
	Mon, 11 Mar 2024 16:05:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 718E324000C;
	Mon, 11 Mar 2024 16:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710173121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P7nvosDKIXaYzFECdhZZyUrOF4mJgzGjiwhQVEGTMaA=;
	b=TlqipGJ1rEEaJ3ox6Xp5LvcDJPWE1VQXzp+62p2VfdX53SAoRyfXXnb+2JDMIYSkEnVNhz
	zLN7IBvZlq7TFV8BRmuaJpHSFibS+2fZqWehPuyxOTSFFTiE5dZ2K8twesfTtAV4ESMUvL
	OAtmEezXDDRtyOWm5ep/s9+uTJHYz15cXP9rFRWJ5mSOm0VPLXGskMqlnLWikRmfZ+1gnG
	LHX/m2AbV7KO/WK7fMpDGGvy1AjIrEcs2KYAWPTxaroxAz6i49h1UvOe8TKnOATcf/GG0r
	zIrXoviPlgyVAqI4jwFgWDmjZmQ7Q4H6xQbJRwcukPt/Ny3igRyrgC0zoBmbng==
Message-ID: <d6dbc174-50bd-46dc-8da2-910d36782d60@arinc9.com>
Date: Mon, 11 Mar 2024 19:05:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: dsa: mt7530: fix link-local frames that
 ingress vlan filtering ports
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20240311-b4-for-net-mt7530-fix-link-local-vlan-v1-0-d67e6cc31af2@arinc9.com>
 <20240311-b4-for-net-mt7530-fix-link-local-vlan-v1-1-d67e6cc31af2@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240311-b4-for-net-mt7530-fix-link-local-vlan-v1-1-d67e6cc31af2@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_090526_118118_8881ED9F 
X-CRM114-Status: UNSURE (   3.47  )
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
Cc: mithat.guner@xeront.com, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, netdev@vger.kernel.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

I'll add the "Fixes:" trailer after I receive reviews.

Arınç

