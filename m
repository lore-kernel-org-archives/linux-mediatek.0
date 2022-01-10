Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD2EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uw1M5Q6vSicC5W8/S6eVcvQStwdwdNggrb0hnNvcIbU=; b=q9ROZq9nBd4gSefMVyNxkRAGlS
	8dVIVBXoOQvFoEJx0YskKtqOOYAMzrKeG4HXg8wWC5/Y33eeE/J+h+FIe4zCFNvV+S/1XDLMwIPXU
	QTzQ3W8WG17+oKkCfwNdRLmciZUmKoBXJ9DgsdTIenqlgzDJIAQZdJ09xv8zsbLbAgLLUAyE8vJ2W
	w8Re6B3MH+MtEabxCZo4K+As4kHZ9pZqml5aq2yDbOZhI0YcTQAcWU2XnqS1/cMrqhXgS55vwV42G
	bYpuwsAy7vRiJJZ/7XLXnRXS44NxQIziBB/twkp027XqWo+ubMJ3JK2avTG8gFoXmxF8+cnmT5l+P
	0VrVmYUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wwh-00C9g1-3M; Mon, 10 Jan 2022 15:50:55 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wvl-00C8yI-Bv; Mon, 10 Jan 2022 15:49:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 778E81F43224
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829788;
 bh=xtsNVNvDwlKbwSMsa8+rh3ndFCEccIfXfJEe81bHcpA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=A85IUG9tv1PogL9Ef2w4Vqqq9HQpGHhALrx6PT+u80Tmp6XsuitQkU5yBK+/md1AC
 DEZaXnuW2psJcbQWgEz2+zC/k3qYPpQpRNnq3LwAOwHWGZ6u8/iatB+6yBdvwAH+uc
 +nx9axw0BhCASnXFYLgYLZUwPJTZNGHrVTRxk5RMoxQbl7sdEC18S6xFaFgQNqf3fM
 WL0G4kLyO9D3PmtM47N1PIeF1ORtBb3F64Nj3/Ca6hmtxpE9a8FvbnTVhcX+RG/ZBc
 mvUFVKHXMtA6Kyspem7OHzuoJLsT+eXQYSf38ZLDIn62BcsMbGY8cdNfnSVmJLN6U6
 FCvqzHvUZsg+Q==
Subject: Re: [v1 11/16] clk: mediatek: Add MT8186 imgsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-12-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <81447fb8-eedc-d51f-a697-a631cadb8aaa@collabora.com>
Date: Mon, 10 Jan 2022 16:49:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-12-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_074957_598805_861DECDB 
X-CRM114-Status: UNSURE (   8.37  )
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

Il 10/01/22 14:44, Chun-Jie Chen ha scritto:
> Add MT8186 imgsys clock controllers which provide clock gate
> control for image IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
