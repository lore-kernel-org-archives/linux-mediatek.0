Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F0AC48260
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yAWGekgbqfYkQzUHzu8TbcTGfPAN/t51yxanUI/diHw=; b=G9Y7OTXGhnVdjC389fQ1uyT8EA
	6sPA+uq6XMjBKs7DddICN3RV84g84ukawmdnCzR61Ojj5JcWlZxz6KBTTjIzeEXPqEYZfpO8fpG3v
	9WBT289IjpILERouL6WwxXb0k1pTQm8k1CTl7S4go6SzNScW80ly0K3hF51VYCUqsRBEqSyHwDUhp
	xwNyEbWKhaSLqO6eBJU4QZDoUdOlK09FUfACiid8kHNplYv5kPDNaewRtLU2CqlXWgL+yR2HIypl9
	XMpW6nQ0p4XZrAoW8LfAuu4r/yYM9hFjMJDHwP0Nd+rzNCGgyKLKjvcj0JcgFFwX9zGyzjCDXpu90
	8ZI6CHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0MJ-00000000DlK-2W9O;
	Thu, 25 Jan 2024 14:05:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0M6-00000000Dg8-2tsP;
	Thu, 25 Jan 2024 14:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yAWGekgbqfYkQzUHzu8TbcTGfPAN/t51yxanUI/diHw=; b=G/hogcvU/VGktgWz8zaa9U9c1X
	csN1zLySMOswjoNUi04PK4dIy5jFuyPdRPqX7nl3yL5gg9XKszIgYkiYV6duzbZ132ysLhe7TbhLT
	qJpeVuM4h4zs8hcDz+z0XeyZc9x9+hC8Qcg3H8ct9RRpk32xV72fqQ3DeK20qYhJ+dxi05LdBGHv4
	dZWW74OfM7Zyv+MIm1tLAKitHTxBHf+j9nuFTX/8JQXKuBS7D8ug2ueUYEctlDEgFxsyQlBns8hJb
	vlnfRjsWEBjw5oOOUu3wld+evdelhdiPc54Lz0Do6BSWC1lC6pqUXQuM3jktXm/w4uIBWvLueq/+w
	0wFXwyyQ==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSy6V-00000005DUH-1JE5;
	Thu, 25 Jan 2024 11:41:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706182806;
	bh=PR4u1uqnWtL4FpwQTctaeO9GFlt3IXMBIyn9Kgq6A+M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eVKYlYU6KBauHZRU1CRYJAetxjkon0LICA7nDXhf+97gGq0E+QptID4kWpToeb4eA
	 6mMK13H4IBddoXW5Wl8PTX7flr1quUk+6Hdf9YpWGCzmu92Uix50R1f70ZjBBe4DNB
	 mmVGMZuvw+1IDCgc8pS+Xp2J1xtzovla0Dh9mBhTzB3lK5Yl94d/BNR1EvuszaXUyO
	 5PS0qOF87CEJhgBumoTA8uHokoUhKtyZ5ScsASW24j6z41z9ZNtbhDfAO0NMTwzJFd
	 RRLGYe8FscPP9xQu3MRgQbQwX7gnjdd9/TKMtF5RiYflwjvkTohCNd2XE0oTY7zsmB
	 K9K1UVyqjx5bA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DEF783782074;
	Thu, 25 Jan 2024 11:40:05 +0000 (UTC)
Message-ID: <f0ba1132-1394-49c0-954a-7efd7066722b@collabora.com>
Date: Thu, 25 Jan 2024 12:40:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8183-pico6: Fix bluetooth
 node
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240125095240.2308340-1-wenst@chromium.org>
 <20240125095240.2308340-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240125095240.2308340-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_114107_485415_8DBCABF1 
X-CRM114-Status: UNSURE (   8.83  )
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

Il 25/01/24 10:52, Chen-Yu Tsai ha scritto:
> Bluetooth is not a random device connected to the MMC/SD controller. It
> is function 2 of the SDIO device.
> 
> Fix the address of the bluetooth node. Also fix the node name and drop
> the label.
> 
> Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



