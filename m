Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40400ECE57A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CBNFOIO3TEenWtGjGPFTLkAeQvP4vWnSVrDaQqGydKI=; b=2SA9PZoXomagQNH4QGyOZLIpVp
	LDca8GhExovc3u/0od8pD6xbawT0NrxatmC+ZoSTcdA0/R8WRo8DpgmS8Q+Ml9UMbvkVIH9R6ww4m
	14ZQw9q28gfBUTaBrnE6h1mgoY9pxwiJ65cm9uJOjYSxVviLhBOBLtLjexg42rVuSKtMCd05ogyUv
	qtaHpdlnF998PkAp3NyxXs3OUMoXzkhSLJE/I3LiJwEBlXt0Oax7oX2mKrdkXqODAvI4KQ6YUPQee
	jzWqU988iioJ5+Neseaw9UekIYPQFYBh0xNALc/p2yeLoscdDFb4RQwOnKGqogG245e7LrTTwZhi9
	htOd2W7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncsT-00000001jel-3CMA;
	Mon, 09 Sep 2024 11:48:17 +0000
Received: from a7-28.smtp-out.eu-west-1.amazonses.com ([54.240.7.28])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncsA-00000001jcg-3osj;
	Mon, 09 Sep 2024 11:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725882118;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=IdCditF+fELDvgkw3sLyWuY+BayYAd5MhQ9wNy2likg=;
	b=iNlzqMNY5cQLCUq8TLpzo5/xO0wavPYhqY5RrJfvfuwqMbTpBulL1G27JgpwAni/
	nvTAQ2yOF0DOkmje4jUdV2Hv8FlXPnxPxdrthAKqi/ylPAXtAdWGmqQHERHSBb2B2rG
	fLnzfujdWZyskTmQoROXIq74AvyWiJavEZsDmLi0wQl/ybJ9CY/wxAqrlaJEPBnTS4F
	NDxE4LBcj7pUoQkPRwVq3HWQsFpYX7jfRf2Tq4BiZYRnaBAL3Wxk8DeQVBqtgk91Lew
	d7kk8ytiH2tkxdv715+Gt1nMrKPR7YGletn8s03uji0gtespcfWIe8g1ZD6rRRls/5J
	cJ/WDSk5tA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725882118;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=IdCditF+fELDvgkw3sLyWuY+BayYAd5MhQ9wNy2likg=;
	b=Hnhzb93uKSHuxIhrpy369Cfvcy/yYiBONNWt3VYf0DZxuzPPn8DA5jtOd17Pz0Ni
	LcC1ftENJSwtIf4b1aq9Q/P8BH+CbYwIqNS7qsubFnDNnT+9d7BGzyRwWexxrAv+u1T
	K34VKI+5E4fkLkC+nKo/0mxyrv5oiXl8btWUOgPw=
Message-ID: <01020191d6972ef5-12c59f31-ae58-4aad-b33e-5b7618c0443d-000000@eu-west-1.amazonses.com>
Date: Mon, 9 Sep 2024 11:41:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: krane: Fix the address of eeprom
 at i2c4
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Ben Ho <Ben.Ho@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Nicolas Boichat <drinkcat@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
References: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
 <20240909-eeprom-v1-1-1ed2bc5064f4@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240909-eeprom-v1-1-1ed2bc5064f4@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.09-54.240.7.28
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_044759_102803_44F58A26 
X-CRM114-Status: UNSURE (   6.22  )
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

Il 09/09/24 10:33, Hsin-Te Yuan ha scritto:
> The address of eeprom should be 50.
> 
> Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



