Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC30C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wVRbk//vpIlm7v3nZgV1W2Plu/xvwotk1XsV7EnvkMI=; b=SnjJOeFm1P46ZRUKpE6m9RodwH
	+oozj10swhoiJ6eSH0KaGWla8dxnAZyfoUrHaeb68jaZMqRHj0b0UD6Cm2ot4Su7F6+/JIweXtoaG
	wea6UejIXh6+4PxI7syj94oGiv/6Rs5foFoiNJIkYm2SYJL9mXNmYtqXScVav9SvpHymyADLzHtU5
	+rjthv1KtNe2AN89Sb258RxfcFVPXOS4tTcKYhhAJanFrqCaYhYzf3lXzdeZJ5swMPl9Db+Eb4tN9
	bXLvuWHebPUAXfoDcZ4NCQYKKoqoJMlBdaX2Ru4GtcliH/popn5H6y63l1CHUZCiWucy470cDCJ0t
	oXThtVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6vfC-00BoP0-W6; Mon, 10 Jan 2022 14:28:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6vf1-00BoLW-Mb; Mon, 10 Jan 2022 14:28:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2BD8E1F43965
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641824908;
 bh=wGHQz4aZXJUlLvuS23HzaOjfM4EVtupP1GIjfzLwJf0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LGOx3pR4H6mpWRbDdbbBvR/3gZbLz1Pyx9FXUaWAy09uyAEtDm7PBvIcdQJ4NfadH
 ceKAGb09dutec948Vhhky212kCtoJwpzyklhhFF52qfR5V/u6eUmDUHww+1en4j4h/
 BCd6HKeuttaEm2/gf1EpKtQ+9wNVR1o8diEG0DWoDLwx/wWL+U4egqLXd6ztlrNYzP
 qt3YlHW4Ag1Ai1nP75JkjjZjOmElmsxP1ROyoRXm8FN1oMekBHafM/n7Hyirp54D2p
 n1Fy6JGaX9j2sdocRzikKwlR2xZ/dISH/skEbtYoq5fHRWaoriDqMrBEy4Kv8Lwk0E
 E6B/2xURuZ7uA==
Subject: Re: [v2 1/3] clk: mediatek: Add error handle when fail to register
 clock provider
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110005902.27148-1-chun-jie.chen@mediatek.com>
 <20220110005902.27148-2-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b3d59493-7819-94e4-343e-d0514ab9f72b@collabora.com>
Date: Mon, 10 Jan 2022 15:28:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110005902.27148-2-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_062835_908764_E16B3990 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 10/01/22 01:59, Chun-Jie Chen ha scritto:
> Need to deference registered clocks when fail to
> regisiter clock provider.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
