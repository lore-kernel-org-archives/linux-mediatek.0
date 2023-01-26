Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1780C27C76
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 02:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NI5V/7nTeYLGVaiqfSK4AlDeU6PyLgfnwGCBsE+e6SE=; b=BMhISLYps23+R432S1kwKq4l7P
	wUV1cUkbyktYO9ymGYn0OXeVissAs/iWSXQk1om38TqmNSWCkIlfSyHN9MMdHrRei1IKP7eksIuiM
	+tfb4gzQGX7XvIKMrYhphwtDoujqzNKJJZC7JvdWCnIlz10mknVHuRZMK1nNx7XdPTEWoMUHxcwTL
	sEI7I2BzHvwtI42Lb6+FC4QUBXlOxoc2rj1v38F7jrrZ8lRg6odFIbXFQMeD928c7f3Os5Tu2XOqg
	HIkcQCbLXpgQrqP/mluX574Q4WNgrDI516RItkaq8dfG5C8O34Ward+aN+xJQ5f7gq1iCfGmJS+DV
	pUI5nDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrs6-009QiD-Kd; Thu, 26 Jan 2023 02:20:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKrrp-009QcY-UY; Thu, 26 Jan 2023 02:19:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id F2B91CE21C8;
	Thu, 26 Jan 2023 02:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6168C433D2;
	Thu, 26 Jan 2023 02:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674699593;
	bh=NI5V/7nTeYLGVaiqfSK4AlDeU6PyLgfnwGCBsE+e6SE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FITw87IL/OjWa9qK/q8t2WlfflKeXXrWr1t70zN8CW8aUnj5sJdYDGZ4GnGkYmMb+
	 GThtxbl38M9hA8I3BuZZQqsHOp3bug94Mn1mHsS8Qr58uV9O/wifASYypM5yh8dYc6
	 7EFOHNCUhe6bVKfQK/4Dvs7rFNSrN7qK7Rry0wwIsvAsVO1NM0P4bPZmbSHujrzFx1
	 K8SXP9w98mrQpb3F0zMBXngCH9sMoW5oAB4CDIzV1AA3oEwbQPYHxiwv4QyghoMFu0
	 FtaoHHN0cDoIS0fiwudfrCpfCROt51wNJ1u9bo4vD6Zp5joe1tcq4hqkSMIarxwBuF
	 vfzTAF1uLWd7Q==
Message-ID: <730844d96d26823c993d51793a008d29.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <367cf74b038281d235681f6e7fd6f3f7046c962b.1674401764.git.daniel@makrotopia.org>
References: <cover.1674401764.git.daniel@makrotopia.org> <367cf74b038281d235681f6e7fd6f3f7046c962b.1674401764.git.daniel@makrotopia.org>
Subject: Re: [PATCH v4 3/3] clk: mediatek: add MT7981 clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, Fabien Parent <fparent@baylibre.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 25 Jan 2023 18:19:50 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_181958_177108_1126D83D 
X-CRM114-Status: GOOD (  10.15  )
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

Quoting Daniel Golle (2023-01-22 07:44:00)
> Add MT7981 clock support, include topckgen, apmixedsys, infracfg and
> ethernet subsystem clocks.
>=20
> The drivers are based on clk-mt7981.c which can be found in MediaTek's
> SDK sources. To be fit for upstream inclusion the driver has been split
> into clock domains and the infracfg part has been significantly
> de-bloated by removing all the 1:1 factors (aliases).
>=20
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---

Applied to clk-next

