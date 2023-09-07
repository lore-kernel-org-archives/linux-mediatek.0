Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA75AEB8FB0
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 11:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqU4zZFyI8Fu4cMAQK02RJW7NMCBzTU6z1iNLZZunv8=; b=u7M6snbAXVUzkX
	oEPOR2BOAprTy8sdP3xseNY15VoHeaxoIwygIMl6EDe5LDQJmjAMwQpBWbu52leSQQlvc+dY0pdUL
	0bmV1FCv039JfVb5UuE+2V9W+7vDyw+avLAwiELY8EhRp6GUMXV3cGQCvArK+eSRxd3PVt6T3ZWhn
	H+D32hmyd2BDpiI2kztKZc3FFpz1daN5f73jBqgEgjJ9kEgeM1Q8gzoKqMJ1d9+RlnpgTH0NBLQ5g
	wr3IaMWj1gHe+4fO2R3rA+4dadBj6sdTUpKvepkC5JO/kiT9WwJ/uRQeS6PMNLynw35TR6brOZHfO
	NZmA5rCgB7Amu4QRhd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDJP-00C0ZB-1z;
	Thu, 07 Sep 2023 11:36:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeDJM-00C0Yh-0d;
	Thu, 07 Sep 2023 11:36:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 187F366072FF;
	Thu,  7 Sep 2023 12:36:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694086594;
	bh=Vhc77ifX7M3g+lCWDsu/+wMkglBynYFDlJsEf7eaeo0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B8QYA3uZMulnxcm3a7jBXxbDn0D5I077mcoANx7R4rdo6NU6XKHmMtGawG9Hmhltu
	 ISSvZUUpQyd1jwCA2Z6psUES1HsTbsorsGGS5Ak0P7ZIaiRRn3OATiquZzXWRr8CgW
	 4e/VNJdBf46Aw6bewdBCb2fzvth1+ByvPYHXZPoYDRDvthWD2AI+WViSgQPj7jEjTC
	 5F0flJ78pRAG6lOta/sziXQ8u/TPnBg9jEYugz1Rokifx8RNpBpvMtgiUGZHbqu299
	 u5LdEPe5HkK0ceAmVckpm52ive1ZLhbf2GwGx+PGUwl7ZfMwlxCsMPLCWZBVHK5iQf
	 AyPbEDKS8HYJw==
Message-ID: <f033e528-28da-9bbf-1112-9c0e9dd10a5b@collabora.com>
Date: Thu, 7 Sep 2023 13:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] thermal/drivers/mediatek: Fix control buffer enablement
 on MT7896
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20230907112018.52811-1-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230907112018.52811-1-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_043636_432190_3EABB570 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Daniel Golle <daniel@makrotopia.org>, stable@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 07/09/23 13:20, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Reading thermal sensor on mt7986 devices returns invalid temperature:
> 
> bpi-r3 ~ # cat /sys/class/thermal/thermal_zone0/temp
>   -274000
> 
> Fix this by adding missing members in mtk_thermal_data struct which were
> used in mtk_thermal_turn_on_buffer after commit 33140e668b10.
> 
> Cc: stable@vger.kernel.org
> Fixes: 33140e668b10 ("thermal/drivers/mediatek: Control buffer enablement tweaks")
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



