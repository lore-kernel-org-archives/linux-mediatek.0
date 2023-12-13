Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AAFEC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 16:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DO+XQgFKSsBWJhVaHsjNWAi6FsCEUTPXzosA6TLpkG0=; b=hQmFsBOcUSeD0g
	T1y201KstLpUZPbp+oq30hBM8fVtxMMhOJs/sytIp6wBMu/SoC/3IKdZ1BQtMGGORrUBqDvrgqvJ/
	pRHlNwQYtQqUpuynnxQgD3yyTgW/LOvBy96rP+YEVYJK/iPVNaU5j2U04kZalU0oAxVmjHkxoLBq2
	xRxptDL7W/JmuRfNcsLhUEj0hPWvCIzMF+GpJWAnb7ykg9yI5Z3+YJ4FSgBVfCzML478IYlgMMPjS
	dGPgUFEZCTbMJlR1CEK96nmka8f6m9ZVTvm4/JZMSzLQUfao1OwHiPkTQP/w9VdrOPD4hvA0QM+kd
	yN/ZKh2bgmze+I63OT9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDST2-00FVtr-1e;
	Wed, 13 Dec 2023 16:52:16 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDSSy-00FVre-12;
	Wed, 13 Dec 2023 16:52:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A636B60006;
	Wed, 13 Dec 2023 16:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1702486316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DO+XQgFKSsBWJhVaHsjNWAi6FsCEUTPXzosA6TLpkG0=;
	b=iYqRh1lE0vFH0qsU/MBWMTVw3nOznRswNPqjqKsuzFOzVOJjA3wKelXxC/ez3kzfJDIokT
	nOcHnJt5czuN/T8cHOgcLc3G7m31L8TfhSWJdHPU4rDq+DzyHsB97pgB7AwmbeQAbOQcxN
	I7ijsXFuXmk4wDBuYcLvsqBWPjRoiVn1f/0u+4dFBw5TzI/ihaTfmNo4H2tUPjIT8weoUU
	kDDpeXBIaMThHWPHgqlAyHA0acPk4Mdu2QbqXYUFBRiMO/qrdCnUtgwukNnJdMYPxqswYA
	psvrxd1eYzqxZIlzi8nsSJwYkoN3RXmMhNOQHqGzAxh9TFGNamRUxIYssv62Iw==
Message-ID: <fe48082e-1545-4cb6-a29a-79b4f6276c91@arinc9.com>
Date: Wed, 13 Dec 2023 19:51:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/15] MT7530 DSA subdriver improvements
Content-Language: en-US
To: Vladimir Oltean <olteanv@gmail.com>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
 <45221d69-a780-4e81-b4c3-db1b9894a1db@arinc9.com>
 <20231213151910.hr3n4px7a4upc372@skbuf>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231213151910.hr3n4px7a4upc372@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_085212_511223_555193DD 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, Russell King <linux@armlinux.org.uk>, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13.12.2023 18:19, Vladimir Oltean wrote:
> Hi Arınç,
> 
> On Sat, Dec 02, 2023 at 11:52:13AM +0300, Arınç ÜNAL wrote:
>> Can I receive reviews for patches 6, 12, 13, 14, and 15?
>>
>> Thanks.
>> Arınç
> 
> Sorry, I don't have time to look at this old thread anymore.
> 
> Please repost the series with the feedback you got so far addressed.
> Also, you can try to split into smaller, more cohesive groups of
> patches, that have higher chances of getting merged.

Thanks Vladimir. I've been fighting a bad fever with sore throat. I'll
submit the first 7 patches after working on your reviews.

Thanks a lot for your attention to my patches that's been going on for more
than half a year now.

Arınç

