Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF0CC53219
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 11:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U2B5+ZNIbt5wpYmMhwGwrVTQ9DhkKPd2GAMOogsvhGQ=; b=YuAtLDg+N6sPrS7VYUQC/M9lIu
	TvmBXHTrj1sLaE2KCrbwpqHOjsu8nmAGOey49VMekxxRGdwYqNHr93u61WB/aMirVjOe+Ttwfn9kw
	wpVNgA1ob4ube+T6r64rqWIM9UBGev6KgkC/O59HXJx5pa1TZNAvQ3B8PSUA1SaBxgcN4OXE8OzJy
	iVxiCjXgY3lvvzBXf3u48onLDMAHniZlgbubkJK0a1/HHjItUk4kk6esHY/gfns+H+qLhYHghM0To
	9UWjSizzTatCep/f1LG3iIccr8uHDwT3zWhkF/dO6GfoBHvMT6U32gYzAg0yo/7lfOt+4TjY5zKZy
	R46IQkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJpb-00000002c3M-1u6l;
	Mon, 27 Jul 2026 11:49:15 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJpX-00000002c21-3rDd
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jul 2026 11:49:13 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so4093371a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jul 2026 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785152950; x=1785757750; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U2B5+ZNIbt5wpYmMhwGwrVTQ9DhkKPd2GAMOogsvhGQ=;
        b=fpBhx0jkX3uzfN++gj0Pj7bCa+LgSlGQfMHg1gtDXL9K8+UxbjjnSG48KcKAvhf9+P
         SehLVMsLKxaMXICySQw87cl8XmnsSBffnxobY0v8FX/UsknRPB2QBCSyDMSGqaTFf6zy
         Vbx2g0mK5KmdOl1EsfIq6sSKCreD8TBSwlVGcXoRmgqQwA0CLi0meUd7v2I85zeP21oq
         fY73dxrW9c/Es6QnDuqRj/jS+lr3SkyIlURHgJ/VV+T76b4v/XhjXJZ9qSi4tkkN0jCY
         b6JZnAMSi33BHZ6gqnFoON0DFwABHq1tX0yZ4qdVXCTilXgwND3ACfbisJo/rgeHHqDj
         ofHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785152950; x=1785757750;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U2B5+ZNIbt5wpYmMhwGwrVTQ9DhkKPd2GAMOogsvhGQ=;
        b=Gz8Cfg7FHv3L3aMoMwQ3n/9SIq30ZxFdu0kWRyiS15V2RO+X0ay7HtzSHXjivfwH6v
         Gmp6nilX5tZ8BzcUC7jeRkYP0XxBG2iljqvsgSzlzB6qS1w47WZ86YlEjyqeVWsKAw3j
         sZ9g9Wd9jwAzz3bYWbYoQKeaYfwgNzPOya0ZVzqjd9+mOq0KVoi+MrTgshnYGQBubdRO
         s2Hvz3dPBwbIUjdsGsBh60s9h9STAIE5Gjv7e8/P63K9VD3fNRlkBx+BMMu14yaUrQ10
         QZLSRfSHVK1oEyl/VAlo4OX9WLzpgkB/pGfn4y4WIWqQiGa73UQvB3UjOZ3GCaEThVh2
         ThVw==
X-Forwarded-Encrypted: i=1; AHgh+Rq1JCK+BESOl0dKHiFFEudwx0b6tt9VhPkLe2sKQZW6ZyY+XAll8nolgIOuImkQuTxcTrFvaNttbqHyIzkZyA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx04YM4mpo8ZEH25CFyvPIB+2WY0SD1kg6RhQ2v+tVjCOCMFf3m
	PAnLdOmIgBfRgJEiZlw+O1et8U4ccfRsUtQ6OA8RoreWSusUAEkx7KJvuWPRfd5Tog4=
X-Gm-Gg: AR+sD12qdIM//pWkMahZGJBYepWV1ejXk8jJbMCRjW0NOsxNA6xDAxYJmZBX+yUnck8
	1/2cRGG41u14/r3S0P2k3jHwkzdXcS5pKEANbLuSsFISENdPMzytECqQFNQ5UXmUAs0fNSVyK38
	3dQXzXbCR6ZcWonN78pmoE7+X2CUXm5DzEsV0QcTSVbNDV7tgmgD+79Hiq8CiWSz1KrkCwOO77+
	epuMLIlJIYJPi3We6Dx/tL2kTGRfVApEabAR/p0BgRwfqb3Ukq5JxSzxdq8uJLO6I+8Oe+qtydQ
	qksLviD+LJYl0SppXvb0QQtIc0SPNr3c+gRcaU8aXSrlN0jdv0pKekJGtkP6xwWQoxpdQbctOdu
	Q6UuS5451bufQsGSgOc1UdxYz3ZzCbJDygu+YdxNMiC0/KzKWCn1Q2umPHFRQC/5ydGVttcPDu4
	PI5ex5DUxX7XOQ+EdW+ouQJ1XrCWIA05C1FvSqwhQEn5BNio/QxkVYaHPF
X-Received: by 2002:a05:6402:44d4:b0:698:c1d9:8134 with SMTP id 4fb4d7f45d1cf-69fc0ff874bmr2476224a12.9.1785152949730;
        Mon, 27 Jul 2026 04:49:09 -0700 (PDT)
Received: from localhost (host-87-0-90-136.retail.telecomitalia.it. [87.0.90.136])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5958ea0sm2526661a12.31.2026.07.27.04.49.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 04:49:09 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 13:49:06 +0200
Message-Id: <DK9BWMDFMNK0.K7MAJJAZVKM0@baylibre.com>
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <dlechner@baylibre.com>, <jstephan@baylibre.com>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Carlo Caione" <ccaione@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Jiri Slaby"
 <jirislaby@kernel.org>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial
 ports
X-Mailer: aerc 0.21.0
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com> <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com> <a3298120-f5be-4a8a-bb71-1d6923a28d6c@collabora.com>
In-Reply-To: <a3298120-f5be-4a8a-bb71-1d6923a28d6c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_044911_976120_0C4B5C7C 
X-CRM114-Status: GOOD (  14.04  )
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

On Mon Jul 27, 2026 at 1:30 PM CEST, AngeloGioacchino Del Regno wrote:
> On 7/27/26 09:38, Carlo Caione wrote:
>> On most MediaTek boards only serial0 is aliased, so the remaining
>> enabled uarts get first-free ttyS line numbers from the 8250 core in
>> probe order. When the console uart defers on its clocks another uart can
>> win line 0: console=3DttyS0 then ends up on the wrong port and the boot
>> looks like a hang on the serial console, depending on probe order.
>>=20
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
>>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
>>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
>>   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
>>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
>>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
>>   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
>>   12 files changed, 21 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/ar=
ch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> index 0e086dd487d9..63659e240b1d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
>> @@ -20,6 +20,7 @@ aliases {
>>   		mmc2 =3D &mmc2;
>>   		serial0 =3D &uart0;
>>   		serial1 =3D &uart1;
>> +		serial2 =3D &uart2;
>>   	};
>>  =20
>>   	backlight_lcd0: backlight {
>> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/b=
oot/dts/mediatek/mt7622-rfb1.dts
>> index 8c3e2e2578bc..7bccad118d24 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
>> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
>> @@ -20,6 +20,7 @@ / {
>>  =20
>>   	aliases {
>>   		serial0 =3D &uart0;
>> +		serial2 =3D &uart2;
>
> Why is that serial2 and not serial1 =3D &uart2?

To tie the alias number to the SoC uart index instead of to the set of
currently-enabled ports.

The problem is that uart1 exists on mt7622 but is disabled. With serial1
=3D &uart2, the day uart1 gets enabled the aliases have to be renumbered
and uart2 silently moves from ttyS1 to ttyS2 (or we have to again mix
serial and uart number).

Also in general it keeps ttyS<N> matching the schematics' UART<N>.

Ciao,

--
Carlo Caione

