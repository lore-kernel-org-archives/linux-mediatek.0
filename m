Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E62DC3DA64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hCJih/CXWpDjaOxDp/PsThEXnkiMVnmo5tPOCzOaqSY=; b=HnzW48q+DpccuN+CHJAe7wvN4O
	pbPoAXgJZt1psa5yWbPnDpRw9tgw3oZDV4e7KtTVp46Go0RQAzUfMSbeuTRO3g+UC8HUN9lPJQuqc
	btEjSVGeQB34Qf0o1MPoPHNIyLJwobip8H/F5Tg0p/1o53wPS1bMKO8gbZEUkV5vpboqZpd/Y5QD9
	sBv/1mtg+Xhd2d+5SXEoB2U6bL/RGY2mexCf2ETVF37ZVgeMIaatfkCX+Wv5Wv5ffDGc02Qil4KKN
	gXCyb4z8YZDTSislJjO+95hO3kLyFUugBbigs1U/i3IxZL/KaYRdUrs6tsvp2t6j1yDMdQMQXyjYQ
	Hz+ee3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR0d-00000004JLB-3dKh;
	Thu, 01 Aug 2024 08:18:03 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR01-00000004JDQ-2bNa;
	Thu, 01 Aug 2024 08:17:27 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFBB7FF806;
	Thu,  1 Aug 2024 08:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1722500240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hCJih/CXWpDjaOxDp/PsThEXnkiMVnmo5tPOCzOaqSY=;
	b=es24NWfRSi6ySnzlmCw0Ll9C/NaYLOHOV3+3vfBwZKskgf+5cpSsxcuh3lQX7os2rlUcgB
	Yzc+djhXoiP2lPh2PNraFzPP+nV3OorzFOzpk1MmZPE1sn5TrBsotLzQCZlsHOmej1bgbR
	S297KK73Q4v7Gzjfw+CHtqE+UZ376IyjIa11ipFT3iW1VNpoFUuYQS15LrBaQUA7cjsziL
	SCHHmk1K7ZvJv+wuuU9xH2j7H9Wn5rzpjZPUGrdzsXJW1qrEVAbZ/wfZCwb/V435N+TLvB
	MJhUwoFeag8EV+OOvmCIRj8y1vM2OgdDLB/xhtB9rQdXTDu49ZUyGFDMZE/eWg==
Message-ID: <09f80df8-07be-47e4-b224-cb1e0a7910ce@arinc9.com>
Date: Thu, 1 Aug 2024 11:17:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 1/2] dt-bindings: net: dsa: mediatek,mt7530:
 Add airoha,en7581-switch
To: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org
Cc: daniel@makrotopia.org, dqfext@gmail.com, sean.wang@mediatek.com,
 andrew@lunn.ch, f.fainelli@gmail.com, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, upstream@airoha.com
References: <cover.1722496682.git.lorenzo@kernel.org>
 <f149c437e530da4f1848030ff9cec635d3f3c977.1722496682.git.lorenzo@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <f149c437e530da4f1848030ff9cec635d3f3c977.1722496682.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_011726_012455_40B1993B 
X-CRM114-Status: UNSURE (   5.19  )
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

On 01/08/2024 10:35, Lorenzo Bianconi wrote:
> Add documentation for the built-in switch which can be found in the
> Airoha EN7581 SoC.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

