Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB390E7717D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 11:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A9dUYxdLQqAJA7lxU1CnCFYE7S/UjE8BswNDmSN90O4=; b=NT/cyREklVemLd
	yH9JnShHfsK05o//cCepfjoW249cQQy8iTpnASrBy6qnA59Q3czV8uK5BBcNRnW5ukKmq/euEkNAH
	lFMJYPNPjTEBGQttfwMZmPrV+gk4zijFPgYyBmSKO/KQOfGP5u0vKRX+3kP4zWQjn0i8EjamxW1bR
	bMSqT5SNyQ9H6J5NaJBylVl7GyVCBM9OBUNZNj+Vsu/erIL9gV9xSD1+6IBWBB66QjOGWOIzNUq4L
	O35xWxs3VlyG9J77fe6Sqq1mc+XjPPfRskVL3DO1ImsYjC0s4PWCpoIhd4dj848i4u6Koe7PudW0/
	fGEs8isg4WRpDUczj9IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcLA-00000007Zkv-3EPh;
	Mon, 09 Dec 2024 11:54:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcJI-00000007Z7V-1jp9;
	Mon, 09 Dec 2024 11:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733745139;
	bh=ia2lJ8ngWHko8cdWKYZn7u0ZWT2fK6djjWGkMsKBvFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SeoqxUCyZKwT2ZlSe0EV7MkOJLTvYSFPsaGQ3o/Dy29gI5A67jbt6HnSsdf3pTnsu
	 uPMScXXMd1UzSvmXEvazXIEh3HLciN4sTXaBg9cuI8+U6ygSOpPhmGTlIcaxEbTMLV
	 zhZW8GARDec23DEmDUphOFtfax2oxJg5FqX50qM0VibPgOQGp9fqpBYjhqPshYdQsx
	 mUQbsWSlo9dRa/IRoAsgNrZT+ggjNcuHAjZodRYkO+vNpoS6OBfqQ5l3EwjcC7lx+5
	 A9bdlYibFF9TS5ErV8Gjbq8BfNlnbEialpbmlW2VerRanYDMRPyOVrj9q7NCXjncxb
	 sKCWKUmwsDRUQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5298317E36AF;
	Mon,  9 Dec 2024 12:52:18 +0100 (CET)
Message-ID: <dc445076-269e-4600-98f3-52158f73baac@collabora.com>
Date: Mon, 9 Dec 2024 12:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: mediatek: mt7988: add pinctrl support
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-5-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-5-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_035220_597377_822DBE3D 
X-CRM114-Status: UNSURE (   5.56  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add mt7988a pinctrl node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



