Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E09C6C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 08:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmRlGO8idNqxxmh1WLAAmWaebbze/ElXq1dVMdRtIxA=; b=sMvmR30k1kjj6JyVlpImTJNE2h
	K4shSEYtJq9Ti1immHpqyFmx+prGWqIB9WbFmABS/WsssZnuXQ7TKXFp4Jv9a9UrlTxV6rG8oOvgJ
	vR3MYtmAwWwlMNH4cLADoyeTSU7Rk65TyrtFahIxTLNCUlj2OvJQWJG/H4N9p80PQO7UCKfJ5k6+G
	pG65iAuEZN6RKjkOn3INGVMUJvCEO5m9p1C8jzTQEVpXP3wXRnFqqW2Qgf2C8iCyk4U1h1rN5f7NE
	JeqowpRr3RSLRJTfeAzHLZzm2H4oNltxReXxAkm61XDuo5AUwqhEf3rnRYL2S4sTnd83dw/nbFuOD
	ocAgVU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln3V-006CEM-Kb; Fri, 21 Oct 2022 08:07:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oln3H-006C6Q-1p; Fri, 21 Oct 2022 08:06:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E74BB660252D;
	Fri, 21 Oct 2022 09:06:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666339603;
	bh=JOzVQSWbOar0QWC89gDB7DxKIGXkAbTdcppYKPGwHlI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZLks2CCtqDoIKItBujkDcMzhOd4ITkNmXyDjKYMSUxjEqX1mqfBac2QAO/xmKEKBM
	 UTrTEdMcAKmFHlM8+LnXlFirzS+irIsKg1KEOSBZ5CSBjk4alsiH4szV6PJLYmmVSA
	 7CHv6Nd4qplQlKDpWoSI3wdZdvsyYQCGep9auZWvyfJsjPin2VtX5ECmKLfFobCy04
	 I5WrEFc/OcddwmMNglmMITivnmGB7e3IwsYn0RS+xAES+zRsgNuml+SzfnIhG1qA3J
	 9UK+iRTLF+t2Ia/rSB4ANSr66dqJqByJA0+w2Gsbg7Oc6vmEzIUcs2ejAdjfI4ssIq
	 fpR0IeVqeVLQg==
Message-ID: <c32186a9-5a4b-e3ad-b955-164070bf893e@collabora.com>
Date: Fri, 21 Oct 2022 10:06:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] clk: mediatek: fix dependency of MT7986 ADC clocks
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Sam Shih <sam.shih@mediatek.com>, Miles Chen <miles.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <Y1GnFEjOWpplFjqI@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y1GnFEjOWpplFjqI@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_010647_249294_937CF373 
X-CRM114-Status: UNSURE (   9.58  )
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

Il 20/10/22 21:52, Daniel Golle ha scritto:
> It seems like CLK_INFRA_ADC_FRC_CK always need to be enabled for
> CLK_INFRA_ADC_26M_CK to work. Instead of adding this dependency to the
> mtk-thermal and mt6577_auxadc drivers, add dependency to the clock
> driver clk-mt7986-infracfg.c.
> 
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



