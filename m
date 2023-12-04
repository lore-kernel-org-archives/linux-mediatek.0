Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A29C10F05
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 14:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDvJQ9vCHRUEJlME7rGQrgyR2PT77CSNA1gmATKci4c=; b=Ln6RuoKcaaTOgEvmuFJ4QoC0gY
	j/zwcDAQyL+hJpKBSCZ3KZr1+NFESxpt+z4HQ/fQt9U0M+yfQ2t0hmEofLpvZ45uSZaxyHFs+NLbO
	Aw0VDkSI8T8cWji8XjG/DcZMHITKxJAa4YBmUAAaQAQ0pgJyGmBzBd9SnqvheilOSyySWJ7eDcVX3
	VnMGTkbWNpafdY+keAjzBiWPNIUnBVO1YqMrRJ1a2oB84QSVfdp5JvaGgcZf6rp4o9bcOd2gShXJJ
	3gtaL5fVK73jspdZxBSGOfCFejClf38CcuHh3/3C7P8feaMofpMPmdSO7d2o7bxcaFY9ZNWUA5MJY
	DqOrjkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9ve-004lg7-0Q;
	Mon, 04 Dec 2023 14:28:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA9vU-004lWh-2w;
	Mon, 04 Dec 2023 14:28:02 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E13986602F41;
	Mon,  4 Dec 2023 14:27:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701700079;
	bh=bfapwJdkzqPcsfip/eT91Kiy3Iw24DAJc9myhfYq34E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ortWT5peN4C0KFlle0eQcfnlGt93ncNSnIwtkvAW9hooItu6jrq0qzIUqksvzOdV2
	 jCnCK5qLUwCEgoi/7hSH2pNKZklDjrdG2xWOTc4GnSw1wdsiT9xqe5oc6kDU7blspZ
	 bLhltJl/yw/AJZ4B0WGYaah7tj0XDTqbun7kve3T+Gml7qz2QXKbH957LCCtSIR/5e
	 F+hQdMUvYZG9o3CHI0JAztgWCegj/DiWoKZ57R8fnDt0q9MXifIl777KW5Zx7OnotP
	 NcODeOFmoprmcsGwDp1Dvfuhmcby+YkfuclO2y1wdvhhN3CCk3MjlYqN65EIuCOMth
	 T5xhr26MJUl+Q==
Message-ID: <3f97b10d-6def-4c77-8382-e1c56e8f16a2@collabora.com>
Date: Mon, 4 Dec 2023 15:27:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/9] dt-bindings: arm: mediatek: Add MT8186 Tentacruel
 / Tentacool Chromebooks
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20231204084012.2281292-1-wenst@chromium.org>
 <20231204084012.2281292-3-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231204084012.2281292-3-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_062801_095872_3051771F 
X-CRM114-Status: GOOD (  10.73  )
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

Il 04/12/23 09:40, Chen-Yu Tsai ha scritto:
> Add entries for MT8186 based Tentacruel / Tentacool Chromebooks. The two
> are based on the same board design: the former is a convertible device
> with a touchscreen, stylus, and some extra buttons; the latter is a
> clamshell device and lacks these additional features.
> 
> The two devices both have two variants. The difference is a second
> source touchpad controller that shares the same address as the original,
> but is incompatible.
> 
> The extra SKU IDs for the Tentacruel devices map to different sensor
> components attached to the Embedded Controller. These are not visible
> to the main processor.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


