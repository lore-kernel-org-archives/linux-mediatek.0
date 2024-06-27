Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC93C30653
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wNOcrZw5+VgKUcdJUjbBh76IBYXXcmn7vIySvshVw98=; b=uvtWwcwGiLcfQa4XSH9urg15X7
	aAX+oJcK5nmzPzoUHAczp+0FTIndgFLsI5aLuE8T46mzl9xHxA+XlkMxo+SrS0TJqt3ke7b+AtSH5
	6HQNiPy02357x0HEEkn9p3PNfD/qbm2HZ1QQO6EF3SCM/sJ+hgVdHymtBU04nEELs6fDIs8CLIrdi
	msdBhUEgIFc82YEyS9wdll0n1InQt3cJVVPGuP36czbL+sfQFXIBENv++BBel1L+gBCb8x1M5t8au
	hmfusd6MTQPEHkY/3tJ12zYJv+RxA7cE9xdFJNaOpMSNATKPceJVgL2vkXKezmMZv6/yoY/LfS1V9
	0tABBTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmYM-0000000A0SA-0nEB;
	Thu, 27 Jun 2024 10:40:34 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmXU-0000000A06l-1pU0;
	Thu, 27 Jun 2024 10:40:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719484778;
	bh=AkpBiq6QZeCkJ2ClHXInJEXgeTHY7jWKyNdh3XWD5TA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cX98TkMGmatIeQULfWhOZfq2FjpRtak7sKXJiJSqbf9dJHSdOAnuGdZM8zQI1noMV
	 tOGMq7ToTvFPMbbJAjPra82svkgAGTgM+/PZxJ5Svl303Ak4/LvURi8NAS5WLiEyOT
	 YKbI9CxpBzEQx+qACcnBs1xWFln19SbOM6r9JNi8mk7oIae3Twu1GIi6SsdVyF9pd2
	 CNLFBADqz0un4ihuzORpLjUHC7YIP7lrjvLZlnYGy/S8HzShuQhFVbXQ5W7kvO+VvT
	 7sqIbTAdIcNSskvyuS7zhZtd8+aM/Ro1R07OWKyQU30o8HwZm1v+x1/bQ81As8lACU
	 4bJPMia6C1Cgw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C3C4F3780029;
	Thu, 27 Jun 2024 10:39:36 +0000 (UTC)
Message-ID: <3d54c64b-e1cd-4034-b0dd-e5d6607c3ef1@collabora.com>
Date: Thu, 27 Jun 2024 12:39:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/7] dt-bindings: mfd: syscon: Split and enforce
 documenting MFD children
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>,
 Lars Povlsen <lars.povlsen@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>, Maxime Ripard <mripard@kernel.org>
References: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
 <20240627-dt-bindings-mfd-syscon-split-v4-6-dc6699a9f3e4@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240627-dt-bindings-mfd-syscon-split-v4-6-dc6699a9f3e4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033954_044650_BEC5346B 
X-CRM114-Status: UNSURE (   8.67  )
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

Il 27/06/24 12:32, Krzysztof Kozlowski ha scritto:
> Simple syscon nodes can be documented in common syscon.yaml, however
> devices with simple-mfd compatible, thus with some children, should have
> their own schema listing these children.  Such listing makes the binding
> specific, allows better validation (so the incorrect child would not
> appear in the simple-mfd node) and actually enforces repeated rule for
> simple-mfd devices:
> 
>    "simple-mfd" is only for simple devices, where the children do not
>    depend on the parent.
> 
> Currently the syscon+simple-mfd binding is quite broad and allows
> any child or property, thus above rule cannot be enforced.
> 
> Split the syscon.yaml binding into:
> 1. Common syscon properties, used potentially by many bindings.
> 2. Simple syscon devices (NO simple-mfd!).
> 
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



