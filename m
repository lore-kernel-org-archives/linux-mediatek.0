Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF329C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jun 2024 12:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5bCWGCRHijKCXho1u1mEmDUahdCx5jAVYKe07QWeCQ=; b=CiDXp4iTM1/W/eCoDj/fO1839d
	x9G+w3ZNZlmH7zUBCXz+Y3/LZbtHoMmcoRPIKD+kfcozIS7kDplaA0XPnAjISG+JobThpLgfO3sW3
	POGnCK8miLXSeCKa+mLCyayi0Ozf/N0Zdx3/qH5nhmDQZ/ZZ0Fm5o9VFOZKg9xmQFdzrrvE93DrJA
	fzezGP8+IXUvcq1g+YSUmSB1umMFBh775H0k5gOKhVFfhWVpZvYcqBotZ5tbtLdSVib/4KdNKs9/a
	IYVKwH9sPiI8wtJoeYfzZmDDvNn/QQINYuRFwQP64/txfsVAQ4YIr4WWrD2lqQZiAgVr6BAitlA1p
	aOMjTgwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETU6-00000002KCm-1kZ7;
	Tue, 04 Jun 2024 12:41:50 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sETU2-00000002KBH-2PvL;
	Tue, 04 Jun 2024 12:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717504905;
	bh=cyDfqlYfY4BrvsNgQnxyilZlkyV1nbikZ0wAS+skhvA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1Wg2OU5WhPuMTBQwgn6cR9rWs1U4Lukso/PMtSv39RRLyuGEXsrrApgawFYlVeU1M
	 DHRIVQlOA6LNVE5ixxkgd2ezGPZOaLYDGTL2Q7MUumIy0jqNeEzVGQR5V3l+Z74gu2
	 +Mta6egdyJpuyQl8n/h8JmJ7MqiJd4VYPd60qHvsuoTjvAcTTUowj9vqpZaoOeLHMY
	 kfi+NhqE3zjWCwFEF4X1z6MNEnS433I5Ue73FPvKWbDioDYwoHWEFWgPPfJ53HAL6V
	 xyfTvDxzGpwq0SmECOfDWlRrE8tMmSPVHfHwruMQlCzT1GDuE1nZZ5GuR9o4WsceHn
	 fukaI4wqAs4lw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EF72637821F2;
	Tue,  4 Jun 2024 12:41:43 +0000 (UTC)
Message-ID: <281bb6eb-dbd1-4f85-872b-0fe105b940a9@collabora.com>
Date: Tue, 4 Jun 2024 14:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: add OpenWrt
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 openwrt-devel@lists.openwrt.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240527115933.7396-1-zajec5@gmail.com>
 <20240527115933.7396-2-zajec5@gmail.com>
 <CACRpkda-egxVtP8Tan9T_EfQX6ekqQDf3LaVUu0by7aWY1Qmag@mail.gmail.com>
 <ed191114-0259-4de9-8e32-6718fd5e6747@collabora.com>
 <a8845e9a-839c-4741-a868-1f415b926d40@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a8845e9a-839c-4741-a868-1f415b926d40@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_054146_766335_AD9EC519 
X-CRM114-Status: UNSURE (   9.97  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/06/24 09:14, Rafał Miłecki ha scritto:
> On 3.06.2024 09:37, AngeloGioacchino Del Regno wrote:
>> Il 29/05/24 09:42, Linus Walleij ha scritto:
>>> On Mon, May 27, 2024 at 2:00 PM Rafał Miłecki <zajec5@gmail.com> wrote:
>>>
>>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>>
>>>> OpenWrt project (with the help of MediaTek and Banana Pi) has produced
>>>> its very first own hardware. It needs its own prefix.
>>>>
>>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>
>> Hello,
>>
>> I'm not sure about who should pick this particular patch - should I pick it into
>> the MediaTek tree, or...?
> 
> We have ack from DT maintainer. Similar PATCH was picked by you during
> the previous merge windows in the commit d67c211261d1 ("dt-bindings:
> vendor-prefixes: add Cudy"). I don't see why this one couldn't go
> through your / mediatek tree :)

Ah, yes, right.

Cheers,
Angelo

