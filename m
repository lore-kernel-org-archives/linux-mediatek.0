Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A457F606A32F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oMYDSwhc;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=fA3iYOXk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OGkkwpJSIV9JuodiKgIqIixCIYC6eRR5jxC6vkeLTsI=; b=oMYDSwhcGQ/AU3
	VTNGIxY1VsJ56RCJ+kvL2mrz7d9VcUgsC6BbivWyyAh1cyY83YmanFkhTquffiVLbnTJdlRjE2NTO
	49diawsx7fLJI9tdqMkjdnpQydgx7naz6x13s3PFZQiF27XcHtf+PnDINafqEd2v8NcIUB/ea4ePu
	oUIKOsmhKu5ifu5B5u2ZtPAQOwVgs/qCiJKYFAL2EmtENTaSCsL+enk6Jykk067p2qSBXVZTPZSVu
	IgyJcnyx5i+v+iGw1ICL++woafuhBbrg4kFJYn1j3m9L9XGQFxkWYwvTOkJ3Mw+Q4zQ8maAcXRfEI
	g5BMFxnMm4AYgnwOxYOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGtx-00000005MrL-1c38;
	Tue, 17 Nov 2026 10:59:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGtt-00000005MpX-3KqI;
	Tue, 17 Nov 2026 10:59:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794913136;
	bh=AWiCLlaXwkS9O/yDPdbP2rIQCE4NPNdDIe+oTb7DwIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fA3iYOXk/D4kjKxt/cE1G75LccaMVAyweIYIheFvJ/kngEoAOKj64VYs+lHoAxF6s
	 fa2ngDRMnHkHo2/UEELtoigkHnDmV6YmKdhrTtqJlrfpTNZ99ZVZggH0UMdHhgwazv
	 z9LB4CFofk43b37Ylv3MSSMmesQ39rYOO5BZAMqMkulShQumxa1QHoxzWzYUjVCetu
	 wJo2G/MHpQQvXGgqkfSXlTlDmFmxmp6cyUvdPCHil8ogF0zNg+e1usSKM+VbeDlrro
	 zZyvmseABgdUKdZERBDU//TMddGwPkoha2MhBHyIHRO2QFegCP7zaB3r6C11zEyEgK
	 TmCJbA/gOUoDQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C894C17E00E8;
	Tue, 17 Nov 2026 11:58:55 +0100 (CET)
Message-ID: <df9dd11b-02bb-4cf9-93f1-6e79868bf4d4@collabora.com>
Date: Tue, 17 Nov 2026 11:58:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: mt8173-elm: Clean up unused
 MT6397 regulators
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20261109141233.983830-1-wenst@chromium.org>
 <20261109141233.983830-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261109141233.983830-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_025857_989852_0B13E036 
X-CRM114-Status: GOOD (  13.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/9/26 15:12, Chen-Yu Tsai wrote:
> Several MT6397 (MT6391) PMIC regulator nodes in mt8173-elm.dtsi are
> not actually used on either Elm or Hana according to the board
> schematics. They may have been copied from the EVB dts.
> 
> - buck_vgpu: Output pins are unconnected; GPU power is supplied by an
>    external DA9212 buck regulator instead.
> - ldo_va28: Only connected to a decoupling capacitor for the PMIC's
>    internal audio codec and fuel gauge ADC blocks, both of which are
>    unused as both boards use an external ALC5650 codec and EC-managed
>    smart battery.
> - ldo_vgp4: Only routed to a test point on Elm and an unpopulated
>    resistor on Hana.
> - ldo_vibr: Output pins are unconnected.
> 
> Keep these regulator nodes in place so that the regulator core still
> considers them constrained and can disable any unused rails left on at
> power-up (such as ldo_va28), but drop all their properties and unused
> labels. This is meant to preserve prior behavior.
> 
> Checking the regulator nodes against the schematics, drafting the change
> and reviewing it were done by an agent. Manually tested on a Hana
> (Telesu) device.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


....but this patch does not apply cleanly, so I couldn't pick it - please resend.

Cheers,
Angelo

