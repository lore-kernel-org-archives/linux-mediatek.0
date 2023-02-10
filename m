Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D556C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5kmJYDHtQxV5SlkgE6RzrajXRqgo3I9L5Obrfk7jG4=; b=u2VrhTwOmz6eadwjOpHh1mE6L7
	MX8STXHaxnQbT0SRy0/1bOShClIxOxQAJ6BqeDB7KDMNmIBCCXif0NmMZQAcd33uZdgG2k5H9FxLo
	7TgPInwkTkzVVh60Bq8bjA0exe1kAuBM3Bk7hW1hwp7vBQz5u47pvKbhxEuVDVf9unCC8k2Rb4r5H
	J15ozMJuXciiMerbUBzeCO0dHf3emry/jzOcC2AWAR7yWlsiTT91n5aDSCfXTOMu2qgffJItz9LaB
	QsG5OE58ND+qYkhHU1Jh3w97jOXx4flxYS11U5gX+9inEeYdOMRD5/IKEl2qLRJuCoEIAPhao/eYP
	/yN+cABg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS4K-005a7A-4O; Fri, 10 Feb 2023 11:59:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQS41-005a0j-Gq; Fri, 10 Feb 2023 11:59:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 30C0066020E2;
	Fri, 10 Feb 2023 11:59:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676030375;
	bh=W2w7G0CFz52SMRlmsVCgP3JC3dX/JJaZNMtkuS6CvU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A1sEgloRL5M/48bHPh/GK4wMo5fXBgGN8SJWR5vJr4CNmxXAlL5ywkwML9Pl6ugY9
	 OhPxYBa4sP0XcGnXbZ+8EUMSYb1dJ0Z/AJQXjfPlw+TIkwynL785ya+U7XzX/vnDSl
	 FHyqlp0YkxTt7lYKkhEEGEIqLTlxLcDGPrxs5PjVC5QNShQAiRKoEuYaowBGbCZzHJ
	 ETn8sRp1GYv1xeIZ2ON0Ea1W19MOvGdftYm3QqZSeZnFVKUd9/VsNbCTGPqZxW9QUR
	 ISu/DGSoB+EHsrkpv4nzh1sxy+nYkhrgv99t35Er6ocLeC/jyfF3aB/IPNKScW71t4
	 EZcZPg8g7q2cg==
Message-ID: <2b9471b8-1797-4190-e2ff-641f0e926fa7@collabora.com>
Date: Fri, 10 Feb 2023 12:59:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 3/4] arm64: dts: mt8195: Align vppsys node to dtschema
Content-Language: en-US
To: matthias.bgg@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230209160357.19307-1-matthias.bgg@kernel.org>
 <20230209160357.19307-3-matthias.bgg@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230209160357.19307-3-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_035937_747136_0F16A520 
X-CRM114-Status: UNSURE (   8.58  )
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

Il 09/02/23 17:03, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> As the node is a syscon, this has to be reflected in the compatible and
> the node name.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



