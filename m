Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4409C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 08:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ddbaMKtPwL33z0vbJqF3KIOjPGvuVw+bjm4FDZ30cJw=; b=q9cOrV3viymMt0
	3m7rm/dsg6hVde1pXINlCtxJnXUwBNGvT9+xa6NGXkigsip2ptJTPgVRH9UixqoUIkDTy3Tsb67bf
	VQJ1c6ScbtDu1GZ2xgA5L5rpDlEtyL8+o+iUVRYHM/xXa6ReyuG0dGiin3W9sJuiqTOJXcTHadBye
	M2mOsdJH8bh47DTtqHaRnKBwAHOydVy1ZxXztr23k9YoPJzUA5CIDDZA0Yh/3CG+zpRmMIa5YbrJU
	6YQ0ci/keR/41u/KdzkAOohDYa5lZ1u3Ru7s8ynr217TTVEK5HEiyaJjUhqNJCb6MY0GQjfYRnk0f
	yg3r4BoeVod3ff/622Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Lk7-00FLC3-2V;
	Sat, 02 Dec 2023 08:52:55 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Lk4-00FLB4-0w;
	Sat, 02 Dec 2023 08:52:53 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id F167020009;
	Sat,  2 Dec 2023 08:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1701507169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddbaMKtPwL33z0vbJqF3KIOjPGvuVw+bjm4FDZ30cJw=;
	b=MImHQNG5Ii9RatL5upAN8aIPNadAgJxmCKD08WX7dQIW3E16gLNltEfRjKRmIM4KazEhBD
	2WvCfJJP/vO/aUtRRLyGBEx4HHvUUg7Si7+Kf0rO0qwsyZWaBeOEitRhWWyI4HZA7OieRp
	igMmdtRXAnGKjXRvlf1ikXiFEu5iU8qX19mbUTcZ0Wm2CU7NeO6LY9vZs4ykufIQh2SoTK
	Nxy0g+78K1hQbTUE1GdzmCqAjNK7GzGtYT9YUYaPJouoMDGFebByhlMVbJYbquME7Vd5xC
	NwIs15iMJW7u2fVGfpPllPgHswuPKlzbIIsni9/2ob0q8gJMfCsXIXMcHox9XQ==
Message-ID: <45221d69-a780-4e81-b4c3-db1b9894a1db@arinc9.com>
Date: Sat, 2 Dec 2023 11:52:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 00/15] MT7530 DSA subdriver improvements
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>
References: <20231118123205.266819-1-arinc.unal@arinc9.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20231118123205.266819-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_005252_463681_042BBD46 
X-CRM114-Status: UNSURE (   3.67  )
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
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, erkin.bozoglu@xeront.com, mithat.guner@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Can I receive reviews for patches 6, 12, 13, 14, and 15?

Thanks.
Arınç

