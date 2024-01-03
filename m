Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735FCC47073
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 12:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=obISvGs9I/FiLIUrUT0YRJl1ktPq7CYVC3XVwciU/UI=; b=OzcNvx3USKWMQ/UvalRhO/yl5d
	jgNBXoiJ5RxDxC49MqQXpvhn+JeutoQnBwVnD2j6JljphwhqBmANNLBCxOi2dtYFIAj7Q9/Jy0IV8
	ZbjUEdJghPy+tQsCIiQ8ZEI97+qhJpjLMd+eFw4sLHrhIfmqIQi8S0eUF+VF4q+haZaq5cZ/mrQ+1
	qm2aeXtrLmnc+3LKJ81bqSYMk/UQk/D0N42A8CddTeA1whZ64S5rT7RSuDvOQ0GWnK/0kQfFs0Odp
	JZaX6F8o99h0ScJMmmQ3fN7hoXr9vATkKdrtgKvi5LC4e63c1UI0OA+n53Krwk7VOrJH8ILkFekrQ
	WvcrOzdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0Gc-00Anva-1X;
	Wed, 03 Jan 2024 12:22:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL0GR-00Anp2-0w;
	Wed, 03 Jan 2024 12:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704284546;
	bh=lvVhhUPH6kgSD2hH7kfMwPENfYjI5v43CDGfoYJVRe0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=w6XzCUFgB3H98jqHBnOApHd8s1sjcmHuz8l4aAt+ReNgpa5z+bdnvch81dpvk2PXt
	 hiZqs3c4mY3WXQT/82CTp/rtVjeWnl2+xG19FmqL1EYM1xXbk9i6vXjsysERWc2VWS
	 f7xvsL42YhQonM0utr9I2tmZEq8q8cNH5/cOS0UzntOezYSV7UoOEX4RNRjifzyybF
	 HJhg/dZCr4sx5X50+cHKH5b3wvTq5LlpHrhtpxZRMyzfwfRhoMxPTr3JTPXSvLEEcc
	 iGJdblo5EEXPdQLosoR1gnmgmQDNElNqQ46MiclRCWA/jpbK7loXqD6obQQi9rPltg
	 vnzBP/hW5TLrg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 097A43781433;
	Wed,  3 Jan 2024 12:22:24 +0000 (UTC)
Message-ID: <212b0bd5-0b4a-49fe-bd8f-ac66c93cc98b@collabora.com>
Date: Wed, 3 Jan 2024 13:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/24] arm64: dts: mediatek: mt8183: Enable cros-ec-spi
 as wake source
Content-Language: en-US
To: Mark Hasemeyer <markhas@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Raul Rangel
 <rrangel@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240102210820.2604667-1-markhas@chromium.org>
 <20240102140734.v4.10.Iba4a8b7e908989e57f7838a80013a4062be5e614@changeid>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240102140734.v4.10.Iba4a8b7e908989e57f7838a80013a4062be5e614@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_042231_289645_38D5017B 
X-CRM114-Status: GOOD (  11.63  )
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

Il 02/01/24 22:07, Mark Hasemeyer ha scritto:
> The cros_ec driver currently assumes that cros-ec-spi compatible device
> nodes are a wakeup-source even though the wakeup-source property is not
> defined.
> 
> Some Chromebooks use a separate wake pin, while others overload the
> interrupt for wake and IO. With the current assumption, spurious wakes
> can occur on systems that use a separate wake pin. It is planned to
> update the driver to no longer assume that the EC interrupt pin should
> be enabled for wake.
> 
> Add the wakeup-source property to all cros-ec-spi compatible device
> nodes to signify to the driver that they should still be a valid wakeup
> source.
> 
> Signed-off-by: Mark Hasemeyer <markhas@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



