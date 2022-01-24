Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F763C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCM17/jEX2dFcCXMzPV/gK979AUJ1EM9gjdf7iIn9Xk=; b=stQzs5f49/jeA+4sTiUZyNPTeh
	zGc/VZ5duYc73jeu78DIdNwlEEcTVwbbZnlf3nwPQ9F0BTN4Z9MAEcwSSNaNwH23loMtF9427OWU1
	qL1uOd02JWCperzoLmNZeC6w5aQlY9De4ZAKgkkqifsxHAmOKAYLIK+lJUv70PCUcncbCwv3CFL4a
	M/D/Qbl4Dkigw/A7TSsrjg39L4c4bi0U2YAvkJBfKrfengFfGHz5kDJyRqwYMqAt4HWBUg7xjMvkb
	U99zXQQcMNeLnwCpwKaHIBmS/I30eexwMEYmavOjIU1YyFogbwb1+/U2DNqo6yif3O+yoiR6cKEIf
	hoOBe/CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBxrA-0036kn-JS; Mon, 24 Jan 2022 11:49:56 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBxqy-0036hx-BE; Mon, 24 Jan 2022 11:49:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 777391F435C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643024982;
 bh=FSC7K3juKE1eNNYIPrdbq7OnFxlkDzU7nCffIASlRCY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CKJ8A1n3NySKOB/dkSSLGnk+EZTf6gzzmu3PRyPsb8skJ7ZaZCUyNI3rXDejvTBC/
 Kdk5BjFgN0tV5ckYE1J9k8tybsX6uh2SG89yZYKCjK+dTrt9zZEbWHnOJD8MogqWJM
 4aBlQWaWQKIO85Pe+eENUzkiTzvtP5RtHhMNUY1HRUjyG4ZPiP8L+42K7YZT2nPJ5P
 h+qLSoLa/SMjabbDANxg8FsXbZ75XCqPBpaanhbY7kOhbTW7Zjcref85vdcXBVB8K1
 pALpT+IXth7FC4Z1ZJvNcfcnajuuq0YbgT2uqRIpwM/VbBmSnMGjLdnROppk7ZEOMk
 IoNEssr8ByMiw==
Subject: Re: [PATCH v21 7/8] arm64: dts: mt8192: add svs device information
To: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>
References: <20220107095200.4389-1-roger.lu@mediatek.com>
 <20220107095200.4389-8-roger.lu@mediatek.com>
 <010f9b6a-d6bf-b27a-cb2d-c5fd181c3ac7@collabora.com>
 <3d3518ff5c332129af5d10766477b9776bbbf55e.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ffafbbf6-3049-ec14-da24-18b6f1b4d147@collabora.com>
Date: Mon, 24 Jan 2022 12:49:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3d3518ff5c332129af5d10766477b9776bbbf55e.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_034944_557159_3D3FA9D0 
X-CRM114-Status: GOOD (  16.10  )
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

Il 24/01/22 11:48, Roger Lu ha scritto:
> Hi AngeloGioacchino,
> 
> On Fri, 2022-01-07 at 15:33 +0100, AngeloGioacchino Del Regno wrote:
>> Il 07/01/22 10:51, Roger Lu ha scritto:
>>> Add compitable/reg/irq/clock/efuse/reset setting in svs node.
>>
>> Typo: compitable => compatible
>> .. also, you're not only adding the svs node, but also efuse: please add that
>> information in the commit description.
>>
>>>
>>> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
>>
>> This patch seems to not apply on top of the current linux-next, can you please
>> rebase it? That would resolve issues with this series and would be picked
>> sooner.
>>
>> Apart from that...
> 
> Sorry to make you confuse. After having discussion internally, we'll submit
> another complete mt8192.dtsi patch including this svs node. Therefore, I'll drop
> this path from svs patchset in order not to make the reviewer confuse. Thanks
> for the comments a lot.
> 

Yes that decision looks good to me, as this allows different maintainers
to apply patches on a per-subsystem basis.
Thanks!

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
