Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890C0CFB43F
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 15:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AiUhZYra/S3TwkrQaWv+4k/n6y9o56HzZ1mWTaA3EEo=; b=5GB2m2gIHvC6MvMRejyZydS12p
	HeFcnpB5tSFnxt1HEYEnZTEJ1bRvxju9rXo9AGUouboYLQwUP2/zjuurPYwg9bJb1LL1bPQ3No7jI
	xAXW/1hWtvHRmWIziEqEoX95Vn6rG1NDRoL+MiE8m+r/N8xQAYfwMKG6B2FTCUKdTih2qv2rPiuUo
	My3v9/duSwPJHo0jEGY8tHdlCEpiTMS+zjU23Q8LfhenyJJ0XeYBr1E2O9Hnm7geFCvf7BPG4iHTZ
	WcZKBabFg+Oq9w4/ZM6BCua0YsTZtCaJY9oDIako46/qaZjICVaOiROaEVr5FHFEbr98eowXp9Cxu
	iMaI5Mwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxSwc-00000000Cdj-13ts;
	Sun, 06 Oct 2024 15:13:14 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxSvJ-00000000CYS-3tcR;
	Sun, 06 Oct 2024 15:11:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728227502; x=1728832302; i=frank-w@public-files.de;
	bh=AiUhZYra/S3TwkrQaWv+4k/n6y9o56HzZ1mWTaA3EEo=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=IT55S9/zb6+UVYGRv5GNvFhzx8sz4iXDSJdInl2Xq0yCDvJVE0fa55tM7QYRgF0G
	 sQ38OEVBi7iJedov/PJS+7UvZ7g0q3S368wHAq/Z6EcZsiryLR36r4QMjM9OZkqQd
	 qqvOM9Oo1mQvAX7yruCmQF/V8eB5+ov5Y3UncVbleJ4jNL7LyF7hMfAFJHXPrPxNP
	 AHS7OqcrE9vgDYOfeCvLARf7QcDhNn9ErkM+/IGF8GGFZuZOxWPOPaQ3tciPPZQ45
	 RAB/IVZuqsYvytmXOPulnrBhCsETnhjLPk4Kpc8ogcyIA4den8L75JNse4uUMzUZm
	 B8L2it+tx7tI2aKobA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.101] ([217.61.153.101]) by web-mail.gmx.net
 (3c-app-gmx-bs41.server.lan [172.19.170.93]) (via HTTP); Sun, 6 Oct 2024
 17:11:42 +0200
MIME-Version: 1.0
Message-ID: <trinity-5ceed296-8a65-4892-b449-6f832a978d69-1728227502700@3c-app-gmx-bs41>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Leilk
 Liu <leilk.liu@mediatek.com>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, eladwf@gmail.com,
 ansuelsmth@gmail.com
Subject: Aw: Re: [PATCH v1] dt-bindings: spi: add compatibles for mt7988
Content-Type: text/plain; charset=UTF-8
Date: Sun, 6 Oct 2024 17:11:42 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <kmzl5zmqqudoq2jcdacfsbwq3axdvcml4m5kw5oqqo2hj6iiuq@xzeg6penuic3>
References: <20241006102740.17948-1-linux@fw-web.de>
 <kmzl5zmqqudoq2jcdacfsbwq3axdvcml4m5kw5oqqo2hj6iiuq@xzeg6penuic3>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:Btf22OQQiWHbAxP7CwpcejS6hY9mQkc8eIiKzvNtfMmCAlN3qqALUu45gnV+SHw4ffNOm
 vSi1wjtYZBy1hSY9rNpHbU6+Ye7QfBx3k4TmOufADwfaZwZhI/yO6oVjngQPo2YzptkWh/MZupkp
 QPiWcKXAMoQnStXeX8m/Dh41uvECwPHspqdn6TE66cCAm7Lly6UMyiosIpVTqF90TLsz00ojI9qm
 BeaNtuPimSMpdLQiQ/aY+85k3qrfJg/kOZzaPq5dCJydhL6seQoBsSL8cYNbl4bNbTIKmshZ69t0
 rw=
UI-OutboundReport: notjunk:1;M01:P0:O7onKpdDbCQ=;P1dfCcTaf7pXMv38K6Mviv5Zqig
 vo0g/fwJLt9POd1LtSUXZAaYt7sg/LAtgKdTCcgOMwo3X5W8PipUr/JMqJjn8fiOlTbynrUv0
 PYcKwCn3BtdkKoMnVuTz9GKb3belALvCc5uTVVCSv+jSOOXt/+GNWXinC8XmZtjqq1YQaUmrx
 DrdgcHKPLRGkMxDtxwI+AUNjVekHXY5ANDIU6fn3D3NzSGdaSDHxHnY6Fsq0PCDOOCJxCc6B6
 dhX3jBTaDuTNG6huH1BD6ayqRd3nUdFrRMfaashBy3L8zBuzQhWNogQ3jUNZl8GwsGR/++kW0
 TeyBU73mi/H2lYu6pYYWDtnQkhwEppf1UzfQ4u9n8kf/fx7a2U9RoO71uy1nhwAAcjjkRBiaX
 o5sVnWgLyADrobn+L20WmvF2IJ9p03535zf9cYDYdbbHjYq4hFO/NlmbECFz9dr0F2TOQGG2n
 EpxVxHW+P7q2THuQIRyWiUedArJL/ZhSAmvFzKr5Mo70AfJv+olAkwHH15mLTVTmvwCl2cKKX
 8eWC4t0XVkSuCE1wCaD/AxyxIRFqvvTp8DW08oydRpdyaaYumKTd1sHco6cevpnqovsmmZyyl
 96hMmUQywTNZU13hFlLttrzX1xYYWajzDfJAs5wLNDWRHzzgq8vu0KxHVevcaH/M7XDAiEcXK
 TBrzmhTwOIYRxLTX89yaXoHk78MEiY4VfudKOmkG/g==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_081154_273674_9DFB92CA 
X-CRM114-Status: GOOD (  11.49  )
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

Hi

> Gesendet: Sonntag, 06. Oktober 2024 um 14:48 Uhr
> Von: "Krzysztof Kozlowski" <krzk@kernel.org>
> Betreff: Re: [PATCH v1] dt-bindings: spi: add compatibles for mt7988
>
> On Sun, Oct 06, 2024 at 12:27:39PM +0200, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > MT7988 has 2 different spi controllers. Add mediatek,ipm-spi-single
> > and mediatek,ipm-spi-quad compatibles.
>
> Why generic compatibles?
>
> These are supposed to be SoC-specific.

currently i used the compatibles used in SDK, but got info now, that there=
 is some more discussion needed with mtk.

> Best regards,
> Krzysztof
>
>

