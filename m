Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAFFC761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 12:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZWnxp0bmfhUOl9W6PR6jXsq2ZiL2l8XmKiI0uwrGKI=; b=eEZ+mS0dpv25N0ACej4hiLe3vd
	P36769Rn1C33LBIjwV13H8V5Nc9Qvpd15DO/mF7bFR6OCgG65BUXpgXZmWsrAPabyq6lCjfv6zli2
	wyAQpLwCoHwXWChXIwoysEqAIf2027UZcOTIiapZbiPlgmoCvCnIQKceiPHPbDIKrE0m9oA/murMb
	4+i2FAtes8OQm0oKup4k+X9AQTlvuTT//FiiBfPyHLcvYQfaS9m6s3K6RWyLcuLCXlIiNyuGyySjX
	kl2rVPJc+wZj3KbeVHH9ORhbdE2mSkgOxEScPX4dMu9D6gRsuf6viVPa0fHGdjW8heOdsDO67YJ6h
	dKPIflaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJOC-00FI9o-0g;
	Mon, 03 Apr 2023 12:34:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJO7-00FI8A-1K;
	Mon, 03 Apr 2023 12:34:22 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4C5F866016BD;
	Mon,  3 Apr 2023 13:34:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680525258;
	bh=bZWnxp0bmfhUOl9W6PR6jXsq2ZiL2l8XmKiI0uwrGKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mNDoX1UIjO7KohkWNTn7UmYVG5AY8Wfd1h3EYaQpO0uflyzTgx1SkPK5BxDvy1N3S
	 bOLKt/OO31eXcfTHoDzqBU4ia7eg8UtapJ6N7d2MofX0vhxgW6YrV/Y2Y628G41hdX
	 lDcnQsuOXdGhKBFx7dxA8nkXgPPvRTRBsF4VrPk9YceVtG9cFnPGkcdhR4/g7/Huas
	 GykxQURTzOFo4QDtHd0RFL9HpRFBHrwz8te/Tahs7SOxpzLpmrvyi3/oocRLMOk4Vp
	 wCJ8N9ukrUI0eSSi51IhIgNIRLMHwuRndt+05oLM7RvwtIFRhGknUQmZvgnhUkks+D
	 Lex+Dki7uvDVQ==
Message-ID: <8e7584d6-92a1-e948-302e-489af8cf6394@collabora.com>
Date: Mon, 3 Apr 2023 14:34:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 7/7] usb: mtu3: add optional clock xhci_ck and frmcnt_ck
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
 <20230403025230.25035-7-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230403025230.25035-7-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_053419_584565_7429DF3F 
X-CRM114-Status: UNSURE (   9.70  )
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

Il 03/04/23 04:52, Chunfeng Yun ha scritto:
> Add optional clock 'xhci_ck' which is usually the same as sys_ck, but
> some SoC use two separated clocks when the controller supports dual
> role mode;
> Add optional clock 'frmcnt_ck' used on 4nm or advanced process SoC.

This needs more details, because from what it seems, `xhci_ck` could be
a children of `sys_ck`, in which case there would be no need to add that
to this driver, as it'd be handled by the clock API instead.

What SoC is this for?

Regards,
Angelo


