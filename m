Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D68D15D98
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YRXQynawwV5ujmdxZIhdCj4prCmGXwM3kvGJAF9SkCA=; b=LYgweq9he30J5HQpXtdXyFs1yi
	Q8etG6Rvw4e7H8Xn7zm/8wgkRzGkB7/6Lq4qaspC/Pv2X+Z2s/HV5q/2H3KxDO8rAzapcB1CicWnr
	dT35AmTC437Cv1wcJhum+ydeH2Rf22+mvBIHqrzC1i1bsvdWBzXJ9I5N55fgcBU4uSpkJ5BI5Hq1K
	HvyBxMRd2gVTQINkbltVy6pKpcxJn5vtP2VRbAr4Mbzf5ry1ts32I7gaxoDs3W2F07yX6zaY8ya8O
	Wthz64oRDPMGqB/mrniJzCR1Ahg1Jqvi8Pcj4xyEv+moi7SMk2UolOFbs2sciSIQT+2nbTU1KEQuw
	S+L//yJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2t35-00000007YUa-2ReB;
	Mon, 21 Oct 2024 14:06:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sgA-00000007ShF-2jIn;
	Mon, 21 Oct 2024 13:42:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1729518157;
	bh=oviwJ80cczN0pYVEPAgAh5XYy0VrED3BDuautf43roQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qVYjBjMascFiv0kUZLFjGRXEKOfiXXfTYeQV72wncmk91HLekVJWdOFaeWxIOwDL5
	 +2aDOMVrOHdzBmYa6h2dR37EyaQHtpttVk86yacLWLocUJ4wj6sXn+a4taKVJYG8+C
	 VFDRwbp0iUFhZ5omUWmgq4VuGFb1qofos5J3cjn1ny2lus55PZysyQ4OQai8iMpEKD
	 NmzoPtJtw3Q2vE/P3Ti/6ROx+jPdB494rpVoO04GSnkb6VeslmYFf66TNN92YnqkCw
	 E5srjufWuvTyYfXujudfAg4AkNGRGJNRtbFq97/hB3Q8lfMQmuv/6bg6KCBF25z9+5
	 l1gFkKDhcqbMQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 894ED17E361B;
	Mon, 21 Oct 2024 15:42:36 +0200 (CEST)
Message-ID: <b1d528f8-9af5-4a42-be4c-47c70af52540@collabora.com>
Date: Mon, 21 Oct 2024 15:42:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/6] pwm: airoha: Add support for EN7581 SoC
To: Lorenzo Bianconi <lorenzo@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com,
 linux-pwm@vger.kernel.org
References: <20241018-en7581-pinctrl-v8-0-b676b966a1d1@kernel.org>
 <20241018-en7581-pinctrl-v8-6-b676b966a1d1@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241018-en7581-pinctrl-v8-6-b676b966a1d1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_064238_946996_7F560B91 
X-CRM114-Status: UNSURE (   6.76  )
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

Il 18/10/24 15:19, Lorenzo Bianconi ha scritto:
> From: Benjamin Larsson <benjamin.larsson@genexis.eu>
> 
> Introduce driver for PWM module available on EN7581 SoC.
> 
> Signed-off-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



