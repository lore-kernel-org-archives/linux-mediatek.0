Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B647DC7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 09:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGTjcdHaCk+Cz3+rwZvQWzXjlMNMHcsr2xUn8AitwAw=; b=DqySm9QdeK/VSDa65s9QRUPApZ
	TUIiMd1/fKH3Cj51/1um2Ry+9KS8w6rua47YxaBsJ32NXiycw1Vy4w2LXMSEqd7sqQj/nCAGvWDiu
	SgpZqKnSbhYjD80oMgSXQMnpRyrCr4Fg3HHpS9vspvZHubTx/lGTa2PBxBZ1cs9rtGQNfO+4KNnUV
	YIgPFQd9u9Rejxgtolwenm1ld5ZYD6AveP/V+C23ow7+bPLA5TXJpuJDYkDPOSVDv/QQxsjn6G8v8
	5mBqkb5gjeNTsyUbFihSQurdz1czqY6hrNxUee+OBzhnXjvaqhgREIRhCn5NYqNmFwzeakVQGHqYF
	0wvpKQpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmAKV-00H2TE-0g;
	Tue, 11 Apr 2023 09:30:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Gq-00GqKE-2q;
	Tue, 11 Apr 2023 08:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=cGTjcdHaCk+Cz3+rwZvQWzXjlMNMHcsr2xUn8AitwAw=; b=ZAYWXHQ+dAVeQSwaJmTzirEq06
	Ak472z9HowP6260iv5shZRSTZFe1dCy18nVDnB7456tHmKIuHABYLPj/GzzU9ALXLlpr9EArM9cQB
	P+lIvKfSZ5dIQtwCP+3uNlLkDIIvNG/+8V37JBA5IPcIHiffzRhVfEFjtTtQfUquMGujW21iY4fUn
	osiFVK6nwvT63327KiScRmH40cfGbuqvjReDHmovAjM4Aaqh4Af3aCrqAJ49T1TYSyuDnTYib4IcP
	hb7oexPZ/gA49aFhrOwcKmi+Wvh0fgjLXjXZnSm3e6num+xgGY/DIiOM5HywnQU5RBX7cFCslcrf5
	kXrTgWNw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Gf-00DHZD-2x;
	Tue, 11 Apr 2023 08:22:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B677466031E8;
	Tue, 11 Apr 2023 09:21:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201311;
	bh=cGTjcdHaCk+Cz3+rwZvQWzXjlMNMHcsr2xUn8AitwAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AxXC+x+rSXSCMVoGcWUPKsXDJZjyWHRTEc5mmJY1DnD10gofdzPwGN9GPPMXwYAwp
	 +et2mzF3ZA0archXSj1DNDQPm1HD4ysPGa0xmrrNoqC+Jv/VH4Id1kLb0RucbWTJG4
	 r7uP7RgjYkHvFVRaOkBZy4XmsGyiPoTeVCbbTddwZkSSeI7+vi0npuJU6JM3MiQT2t
	 cNXyEu6EhaSvu86z2qs6tsL8MnLtwLtHEeQdsyF5Bbh2xJlGvfrZgI8Lr1va/rVFsr
	 obKOcEJ8EvQa19HilSCuCGKP/PWKSfQ74Iu+4qL+ytaD64a8p9nu2ruSLYEWsIvzpQ
	 h9bcAkIXifx1g==
Message-ID: <8c51efb7-544d-33eb-8a02-0b3f92ad34de@collabora.com>
Date: Tue, 11 Apr 2023 10:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 01/12] arm64: defconfig: enable MT6357 regulator
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-1-1883c1b405ad@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v5-1-1883c1b405ad@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_092222_202412_3075D57B 
X-CRM114-Status: UNSURE (   7.49  )
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

Il 07/04/23 14:59, Alexandre Mergnat ha scritto:
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Commit description please.

Regards,
Angelo

