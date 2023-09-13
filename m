Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD49CA5538
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QP7vtOC0vMZKgfNCyDIjqRQrFRGEZWWujRbWl7LO1Ak=; b=yCz0ss5QPNqhy8
	59K+/L0tlyBvq86/w6cKyfFVFDg/JjNNRFN8gKpJ1AaF72gPOWMAL8ihBhxBycsx5FdsyHHoLVM0e
	o/HfDzxwDZ8KpdsOSGCVv6vRYZxWJ2Yvs631UJGBhY3+JnFYUhyXjYGsoiUz/Z2isCltnZAmvZ75o
	vwhHUMzrWy+etryZN5BTdI+McQOmaU7XWUP2RmrZgPx1QH6kFpZN4PcvbKVnKin5k5gZMDnynyVcH
	qrFVE1CqqYRG82X1W8mq6IXunD+Kg5FzLFSqGD+vQpZVTmy8i3Vgf5sTa5gFnLQBh9JzodoUiRPBA
	enfzrApvL8PrfdhSXByQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNZb-005gFm-1R;
	Wed, 13 Sep 2023 10:58:19 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgNZY-005gEb-1E;
	Wed, 13 Sep 2023 10:58:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1694602670; x=1695207470; i=frank-w@public-files.de;
 bh=bSRWYaYQ0khyb6xbfkDColhDf9wdyfkxTjFUBDhB3C4=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:References;
 b=kMj0WG93os91VqkJU2ZgN71rmrw+I+EN7OBB1AxApdXbwalZ3gj4GbrwkC5/hVKAQpBamSBPwud
 NqxPr5a/ChM0hruGyfPyGplRjzlOfj3Bn80fT78fA+TUR5k5sr9ket+416S2Qlr9bGStxRatk1fwO
 eGiRYwmGNtEJfSyRj3RrMz1twKPhIagzfddkFGLm8hF30vaF1zDvmbQS9DjwwOeeT9zqxfUhCvdmv
 8TWqhGmuEIZ30Y4YLwoAol+4QAwuXxuUr/rRD04vUWo+i3lHSSjUEQinsWRKhoka/c3f5EeuxYPtM
 vcWnSK81qvaotXaxFyqVSYwus5KdIpoyr7aQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.70.211]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeU4y-1rGXCE0hSG-00aYwA; Wed, 13
 Sep 2023 12:57:50 +0200
Date: Wed, 13 Sep 2023 12:57:47 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
CC: "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v1_1/3=5D_dt-bindings=3A_therm?= =?US-ASCII?Q?al=3A_mediatek=3A_add_mt7988_compatible?=
User-Agent: K-9 Mail for Android
In-Reply-To: <e93aa8a6-e088-2864-6ffa-050b211be21f@collabora.com>
References: <20230911183354.11487-1-linux@fw-web.de> <20230911183354.11487-2-linux@fw-web.de> <e93aa8a6-e088-2864-6ffa-050b211be21f@collabora.com>
Message-ID: <DEAA91BC-C55C-4AAC-BA35-0060A01D289E@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P3Bh59IR0CZ+4cakEyrw+P8/vHsqffl806aZ4VhOX0cOdTGRGJ8
 spofiiLodYt/JAblmpTgCBDGE+BwcmzqlODYe9Y2276ak1tbsORhJ7kfWrnMfb6lZRRDbJO
 8dD/Vk37X354hAjlgKpa677prg7duYc5YHnbLKNVSn+NnjhW16qcwNdf7s6MDuFu+yZLM2I
 PHdFri8VrzomudolhiWMg==
UI-OutboundReport: notjunk:1;M01:P0:aEbIlY82UE8=;NjT7OolnkBBpoK4W44sx0TBsn0U
 V6fZPe6XnhR4SxuCxft1CP1vLnyhcJ08n9zHnyVtaWhrUHWrguG2IRj1Y3GfEcbtx88lFvMAO
 Jmgz19HYbXY6xTSvnjlodxoTD4aDjr1moe0jj6x2pBfpzgKkn7tt59icsdivwx7QivGSC/94J
 cG6dS8py6W9E4tNWcs+ZHsZnB6N3b6wwdI6LEscRGmGqweiDdVNZx/KiL8jC3N6EFxNCYz25h
 gFl89/Hn7v/Yd/c2lWyI/z0k6DuQ2GUwPD3LiFMSbSLou6hi9bFp3iw8L9qBz3xIM/o+qL52S
 ciF8XkenfUK86MeMKyNomVIdd86twS0tg4xZAXvzLyJ2rB2jZI62pRej8galWPSWVDvNvtEsK
 e5jByNS9KTsss1FYUy+q7/vUPfne8qcYwtRhCqJQj1eMxG/t5dSNfIw2CSBpi1YgPfeUq9eD9
 YwSZY2rX4GF2+X0WNh5NrwfA1MtE1nLBBv+myUf6ywqZgcji8LEALioureEEwwgjPZ6J11SEA
 iN736wEBhJy7ikN8+iyEDswW5zUAAacwA6vGaXW74lCYQEdu+XQD5pj4/dKy8gDqDQiIxoGDy
 meNgg1ZIGzxwSroSDhpqS1AW6NCXdgB6u0AtSGeGrk0aT5dMFn2cmjx2jQq94cPlnH/fbhTuH
 y1eNztntFcEO0FE+VG3tVtb+QssuMR8LLy3SLv4BgrcnzWqSiflxuIutrkND0TdqhHuZPh8gM
 XslhVpOsjdXUw937zuQcxQf3jXBSRK1XWA33cgtGMHvdCIoSK7NS6G0mVCoiPyG+l2HE11thr
 WPwT6qvGyIid2cjdYFdxff5bCRr1D8D5JKcD7v3/T9MnnDOC2XCB+UGg4yMJvsgxQx1id3UHO
 m6heoQzrAINKGtA4WbekOqTctmCDLijoLRDmj1X3NqAFVMaYsLVL8kN2veEOvTFMl4K0mcX+k
 kv7dbnS+AiFLvgv8xyWrvgVxcAM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_035816_705078_8F05F349 
X-CRM114-Status: GOOD (  10.61  )
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 13=2E September 2023 09:49:08 MESZ schrieb AngeloGioacchino Del Regno <a=
ngelogioacchino=2Edelregno@collabora=2Ecom>:
>Il 11/09/23 20:33, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add compatible string for mt7988=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>>   =2E=2E=2E/devicetree/bindings/thermal/mediatek,lvts-thermal=2Eyaml   =
    | 1 +
>>   1 file changed, 1 insertion(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-th=
ermal=2Eyaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-ther=
mal=2Eyaml
>> index fe9ae4c425c0=2E=2E49effe561963 100644
>> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal=
=2Eyaml
>> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal=
=2Eyaml
>> @@ -18,6 +18,7 @@ description: |
>>   properties:
>>     compatible:
>>       enum:
>> +      - mediatek,mt7988-lvts
>
>Are you sure that MT7988 has only one LVTS controller, and that it is glo=
bal?

Based on the information i have it is only 1 lvts device (dts node) with 2=
 internal controllers=2E Do i need to define it in different way?

>>         - mediatek,mt8192-lvts-ap
>>         - mediatek,mt8192-lvts-mcu
>>         - mediatek,mt8195-lvts-ap
>


regards Frank

