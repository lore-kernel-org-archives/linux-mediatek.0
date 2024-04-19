Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E73DC04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 10:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHoB2/u0iQQD7Qs2J3/fAxz53BAIZJT4DssPOxGoyP0=; b=lvXPO4BRKIWxaX8QSE7B6OTNFt
	G3nZjwXzpwTAMw2HWrVf0uqj1sLrOURJqlw7uD2dJPpJ5KaNuAQfvfJE2oeVb852Kr6szivmKU+5K
	RV3e/BdQ9/nLr02hDm1VA8exE1alpnvti0NHnLM0sMkTgERThxCxivB6FpRMpahBvtVDlvtFxsuUx
	QfMUSWx+z6Y+cZD6CfYOvkOsXoRdW6789I7h6D9f3TQXC44kdnZO3lRX2aSOksN8bCU4NbnLkCQlV
	GgmwPB44GdUKBJai7auIvCPxR4jsMDQCU1m2NV1PZs1/LLkvL+uDRtlJaS8exLCEqGdPaQcADd1Rp
	4jQaR/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlIm-00000005H1Q-0yox;
	Fri, 19 Apr 2024 10:17:04 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlIi-00000005H0O-0fJx;
	Fri, 19 Apr 2024 10:17:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E20E240005;
	Fri, 19 Apr 2024 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1713521816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GHoB2/u0iQQD7Qs2J3/fAxz53BAIZJT4DssPOxGoyP0=;
	b=GuuK84x5dPkVEXdmw3BGvsscchReg5waiZd4jxUhkBYIlSlt6KBz2Na0Sk/lD1ASxOfn2o
	+5UX5fFj8IR/QSXF129J6es1YrrXomAomSIVUzm3TmTnZVBGigdCJ7gRJtMaH4RDeXSGP8
	j0eVMxZk0bYs/Yj0gnqDLMhjeDwfgbvOLdzFi6HMruHenkydK9AndHX+2WnVim28+VjuyK
	5fqECcwClbMuulgga7VnWQbb2YmJP7uNGtCZYtfAd3s7LVaHZiuyhbEOluKRfU7P43yejZ
	IHaNEZngc507/yi+tdutr7HpBI8sBg1rs0mCoWdK37Lux155PVn8y0I8CHVDgQ==
Message-ID: <8e85298c-aad4-4b05-94bc-f92e339e526c@arinc9.com>
Date: Fri, 19 Apr 2024 13:16:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 13/13] net: dsa: mt7530: use priv->ds->num_ports
 instead of MT7530_NUM_PORTS
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240419-for-netnext-mt7530-improvements-4-v1-0-6d852ca79b1d@arinc9.com>
 <20240419-for-netnext-mt7530-improvements-4-v1-13-6d852ca79b1d@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240419-for-netnext-mt7530-improvements-4-v1-13-6d852ca79b1d@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_031700_357077_5F8EE802 
X-CRM114-Status: UNSURE (   6.29  )
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

On 19/04/2024 13:09, Arınç ÜNAL via B4 Relay wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>

I forgot to write a patch log for this. I will submit v2 next week.

Arınç

