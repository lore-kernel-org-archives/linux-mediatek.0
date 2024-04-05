Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FBACD11C2
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Apr 2024 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dRuq0ATEuVwxcVTQiiYBkmHPzZ3Ey4T93dsrVtp1yPY=; b=agkXsijOwpp30ZcD0g5VmrVPlI
	Uqq+qsjX2oaLHehz4vTqjt/aUEY7lXriJHFc56kH1zBApEE8l2CL1Qij+VHfcd0KGeszieFyx+zLt
	2wvAaaIATDbXKlCexh25hz1g1uoeLdxcR8/Soj1IskPLghXLcqPl51tuhPwCge3Ve9a6PLhDwxuzk
	YNkjodvigXowproCQNAbCgdtLyz5TEXoftw3Yc9wr+TkJ4w21SRO1SGbxrWwwkrckLizid1KJz0xW
	ZL+FxrxDwbNF+e1b47suezL3hrlNPoPF5ACuWQfRH+lCEuTz6BzeZFEJAXP22eCfZf0ftM8ndA49y
	NskCKYTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseQg-00000005mvT-0jkg;
	Fri, 05 Apr 2024 07:56:06 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rseQb-00000005mtO-3kic;
	Fri, 05 Apr 2024 07:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712303760;
	bh=U9rsSCKUC8gz8UhuXMZOZpgixEY0N/42jL63zZvlBFs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=otI2Il1xKBK5K6CsaVm+OjgcJetPiMo0TCuhgrusOEd0CGHzwt4g7SsvLjEzh3V34
	 2lRa38NX50t1f8lNldeauIalI4ESg8RGceQA0TzFWV/6bEmOLIDLUwJK6ZsXftxOfG
	 HGBWB00m2oqeJvdM5RyPCLoFo/Wt31ZgFUcmXvkH9QvVTB/oMiZo1K4+V0bYhbevXv
	 KAMxaBnMsVBG8pW/8Gu/EqAxNIHAPpWhK3YaK6PCGnTqsBw6tHDG1fDcUz7GUgl5al
	 lFy3F2AzBF/i+dFTpOVUZfuRsW/tgzEN7wzYjA+/toHuYeo4p0Vl+1shuTQ5FtV7Fv
	 0MJOHeunxPNbw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4E72B378212D;
	Fri,  5 Apr 2024 07:55:59 +0000 (UTC)
Message-ID: <ddff4cb1-5529-4293-97f4-97afb7db48b8@collabora.com>
Date: Fri, 5 Apr 2024 09:55:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: usb: mtk-xhci: add compatible for MT7988
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Golle <daniel@makrotopia.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240213130044.1976-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240213130044.1976-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_005602_091315_C62C9AB7 
X-CRM114-Status: UNSURE (   5.22  )
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

Il 13/02/24 14:00, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7988 SoC contains two on-SoC XHCI controllers. Add proper binding.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



