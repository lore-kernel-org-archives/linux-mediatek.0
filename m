Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD6EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eznpGNCfTRTUBun1r7XM7iPEfLUbuHQH+pC6c4uiuCw=; b=t3+17mnhiMx6huKtKdsjPFvaxA
	3haxr0vXBDjWM0qRv8T7f1h3BRDO1bZvSYPBLuqXTCFgkSIQjVDeb9yTStY7H/wre8mXTONi8F7hL
	jOfm1v94DRm3t4ATzyvzf7DUWpCF2nfHnXHfm9P5+6zXpLLSHcbTwok7RblEkU561/737qlAupT7g
	q6cRR7hlCPaGrXz9LJULUWStPVOY3uxgc3n/smPhKlUi7YtlskXr4dFMyj1QRLlty0vrpP+LHkued
	CN5s9gmC7h1W+icKoQtQVzF/uOCWnM5ztY1eFtF/JOvRwNQo9FiEAt9HADuJNN4tx447vPdLXDUJs
	+TzuAFRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6wvy-00C97Y-JR; Mon, 10 Jan 2022 15:50:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6wvP-00C8oC-7G; Mon, 10 Jan 2022 15:49:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8E3F71F431E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641829774;
 bh=ne0Jraqe7n9mrUjbbOsC59asC6NyKUf8d8vKtrvix6g=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=L2wlniuov95/Oi9A1Q1uEyADH0A7GRTGJsw0YDc6LlbnqV31MqLNSbx/Zvl1yFABF
 hHGDlBj9mlInDnzT+sUDTpgI3rQaqpeJCXM9XmAYW04gTzP+YtmmokOjc9uLsXpb7s
 khllVkTRCXdQaIZEhRrSCWiNSvcirxyKt8vpQMTiaoY2zfcYkRmMTIqmoBWFwSgIQL
 +LFzKUo9O7nu8r+nAOaYVLTKrVq27rCyB5MD7gr+lnp2HmM/W3cBaoeA+MqAyXNqeP
 n/J7T7Q7hmHKisTyenyHPvw6Pb0SzB9vRZFav81CEGGeFDusPD4kl6+GGQZ48Mqwl2
 O1D6mE3ni3LCA==
Subject: Re: [v1 13/16] clk: mediatek: Add MT8186 vencsys clock support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220110134416.5191-1-chun-jie.chen@mediatek.com>
 <20220110134416.5191-14-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <159e2406-4f1b-9ade-8daa-51d8eb055394@collabora.com>
Date: Mon, 10 Jan 2022 16:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110134416.5191-14-chun-jie.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_074935_439196_5FE61A49 
X-CRM114-Status: UNSURE (   8.65  )
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
> Add MT8186 vencsys clock controller which provide clock gate
> control for video encoder.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
