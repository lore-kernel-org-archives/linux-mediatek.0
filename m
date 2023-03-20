Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C16C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VqIe9JP7MMsFDRKTtkEcTMWWGJdOjSG91Zz6R5fKPis=; b=PEX7oKDOwZat13
	HLtui+DGv2zNhFJkxJItFc5ZPkLpwivDK1GJbv7SbXw3HZKYhf2huuSwQXJWI1wXL/miGsAFV6bdT
	deAX4DxJFhcNpVtyA9n3t0bZb+zsBHLXA+mmN5nnDzEkjmvXOggXmY8qgrTkEr8pgbOnXCVv77iEK
	VYe2H5AZyrnQhZ74HfdNNT4XcCetzeZhX0N2YRFu2b2nSJMYATpQZloUHVd2eOI6eUhYCrKzQn0G0
	54uoQu0tpHvr/Aplpq3rT64takBxxzRdRA5lXfHaS3vTkrOJW01WIAxHwXWd+AIjsTQwmuf6uLguC
	CIE5V1NSyvZfWJq6hAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peGto-009OnO-2S;
	Mon, 20 Mar 2023 14:54:12 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peGtY-009Og2-1E;
	Mon, 20 Mar 2023 14:53:57 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 32BB0660304F;
	Mon, 20 Mar 2023 14:53:53 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679324035;
	bh=O2dMrpMIpslbJIDrE/0R13XXJi0iXcJgQYHnEH3rvEE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dzHtJolOt4DsPk2gv1flPEC3qtgrgbsVfW+UBo3RQMiwFRwi/bPlXGB9RYuoU2Y4r
	 0iVDoNuyLeQWhliXZVzCP6viEHCQwNWjFdDmHZYIQhWhOZcgbTIxYg0P51TIJLJoA+
	 k1mpv+sPNwCsbRt5k6S3tAkXWgwq49AM/F4qyf/kZxm7KvPHTYpNZ8UOWdpWC1vxVo
	 Ev+UEbhYHRcfAuufMRFizO7R608ep13GsQPMnXXsPH5eb1B3aIUMb8fb97EHaiMjGl
	 N3hkYFlwmvN6omrOisLdy+CO9yGOhaYZI9ymRibN+Ud7brUHst8MEkZZL18kY0GIHG
	 ELVwsB7fFkqdQ==
Message-ID: <5fd64981-be0f-b4a8-2479-035311403285@collabora.com>
Date: Mon, 20 Mar 2023 15:53:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 05/21] pinctrl: mediatek: remove OF_GPIO as reverse
 dependency
Content-Language: en-US
To: arinc9.unal@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
 <20230317213011.13656-6-arinc.unal@arinc9.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317213011.13656-6-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_075356_560248_6CD1BE0F 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 17/03/23 22:29, arinc9.unal@gmail.com ha scritto:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The OF_GPIO option is enabled by default when GPIOLIB is enabled, and
> cannot be disabled. Remove it as a reverse dependency where GPIOLIB is also
> set as a reverse dependency.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


