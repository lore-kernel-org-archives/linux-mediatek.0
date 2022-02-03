Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D44FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 15:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XpnDTFx5cHgX2Dk8ZIa1yrC9h/pRbbhZFlk/zlmebk=; b=oGzvplnsc+VjTG
	tV1epq95VyClliYRADJJWs890N8o3ZxFPTYCkoj2Qh8qmjRkZ9Ti/5mk/cgr3CwgurtYs+KPWZMD8
	AmpAf2xZE0DxntogT8AUErtNEYV0VG9VAYnuFCH1NugUQCkW8Hzcj4x7plFyL6Q97DMtn5DTNcOoJ
	NDRPnYxriJdLh5T9wMKETK+ee2Z6zBG4rA+pJ4O9UNLnpnk2VZlqi4+W0vylPsdP8C+Qn2bhm5YqC
	1LlgQ7/+SgTariq1Zlxu/GrFwKLkDXsK1ezCuwsyc30rmgc5F/nM9Y85HWOUPyTwXN/m2ne2bAtRJ
	2e404wMLP5xYucdsXufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFdoC-001mJ3-Dx; Thu, 03 Feb 2022 15:14:04 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFdo0-001mFU-QE; Thu, 03 Feb 2022 15:13:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8BCD81F45D8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643901231;
 bh=DRwHtfUXeJL5SMxS9YpwuFtjuxZGjG9oCJIGYngKhtg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CjPM8sjeGat4WGVSY4jbQoZJZRoxsZJQLq4pt6FmmJ4IIQc8gaa0uKCzlz5m7gh5n
 Y2B5LbSljLG0DYKRg56/2iPN+AxtN5cdUitanzNK88KKhFCkOWtzr+pUOqPbb+FdhH
 C/2L7hHdSws8U0EhubdOyOIUI+a2gnFZhAooIIL8X1BtjIBTvjt5gepqY4yeK2gzih
 Vc9jh2bRxfyhtW3rvM9Q3XGyNkYQy4+nHKCL42Kc4OSa+FAl//Zeh8EvhFvOWqOvvE
 F1mFbTrfxd9YRWucoUiXQfOqHAcirQ4EmTuP2h03M0KVk6AqdChAxNVB+m110fPo2M
 o8U1mYASq/blw==
Message-ID: <586066f9-c201-ff37-3e77-28ab3eb1c733@collabora.com>
Date: Thu, 3 Feb 2022 16:13:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [V11,PATCH 05/19] soc: mediatek: add support for mt6873
Content-Language: en-US
To: Dawei Chien <dawei.chien@mediatek.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <swboyd@chromium.org>, Ryan Case <ryandcase@chromium.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat
 <drinkcat@google.com>, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fan Chen <fan.chen@mediatek.com>,
 Arvin Wang <arvin.wang@mediatek.com>, James Liao
 <jamesjj.liao@mediatek.com>, Henry Chen <henryc.chen@mediatek.com>
References: <20210812085846.2628-1-dawei.chien@mediatek.com>
 <20210812085846.2628-6-dawei.chien@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20210812085846.2628-6-dawei.chien@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_071353_013396_CEFFCA1F 
X-CRM114-Status: UNSURE (   8.90  )
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

Il 12/08/21 10:58, Dawei Chien ha scritto:
> From: Henry Chen <henryc.chen@mediatek.com>
> 
> add support for mt6873
> 
> Signed-off-by: Henry Chen <henryc.chen@mediatek.com>

You forgot to add your Signed-off-by tag here. Even if this patch is
not yours, you're the sender, so you have to sign it.

Besides, can you please fix the title?

soc: mediatek: mtk-dvfsrc: Add support for MT6873

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
