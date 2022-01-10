Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F779C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ozb3K7Gf762C4X1K5TCIUxD/cR2OofKtAOnZ5vu2DGQ=; b=MkXkokKuvbF36IGA7O6DpezH88
	BcfQFLsO0SY/jS9XLFrHZQOBLH6ZkdENwbQZk24Ij3TQgYAjY+muBI7Ghu8wpGBcSkk3p3/SyIl7r
	buBJh7lXhazkjh5KaBxGjYS4sWfM5QJBIOD7I8QT/C6sixwP7gdi5OgCIYstVZkLIEraXoA0j0oS7
	SqbWby00Ig7ijguFAVz4v8+259D4XQzPZMs18/Wu3AfsnYUEvrPzhcq4IoEQNDl6i4VdccD4+JkHW
	SCSbECPnDFt1/ajgQyawEWe3jbrcX0/rmk81d/TMgsNHYpHvw8jDArimO77wWfH5kG6/4jI1di52z
	MTPRTm8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wvM-00C8nK-MA; Mon, 10 Jan 2022 15:49:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wvA-00C8j4-8A; Mon, 10 Jan 2022 15:49:21 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AD1671F431E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829758;
 bh=h8/ZybSkjTANhLXAkddHPctf8TJco3amtHZ3qngOj/w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kRfsoAASOVLSZA05f3L5jCsW4eCrlUTXS9b3u8/dbwqx2IMQrlHbK5YLM+xaEFg3u
 jkVUNKOsbHq3gzBg/nJw0DlXI2jYlF3QWByTHribcqEbNNdlcuQI1GMra3u5sVuaQy
 USzNQ62oHI2Lp1ERqKu5jgIsAPpKGtopfyNrJlnHoz8cVfPv6GJlrQLB7tNk5th9lb
 oK8e5waQVk1vwL27b1nnOLBjX8zsWK8XQedxDMH5YTgOMEOr5Sg+hXgo5NqZpjZaQM
 VOtEk/EO1FmA2NzqavBT5cnfYuVJxOPR+tuVYZrWw3gNrrk61yiuUgSkfHxtOPfixO
 SOVY7+OZfNLOw==
Subject: Re: [v1 16/16] clk: mediatek: Add MT8186 ipesys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-17-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ac78fbe2-cb96-5426-8281-3730f2114214@collabora.com>
Date: Mon, 10 Jan 2022 16:49:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-17-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_074920_496583_CC62D9E7 
X-CRM114-Status: UNSURE (   8.36  )
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
> Add MT8186 ipesys clock controller which provides clock gate
> control for Image Process Engine.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
