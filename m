Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D18CC54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv3X1pivQQmEQc8jCyjDQOZ9uDlhTMOmx8v4Kc5Zhm8=; b=QG4NuS46BcsnanhxNkJ7PdcT1v
	WOubIQfrQ+sWjHZz3XCo1cd3golw+Y34lx5Hj2FV+Mp5ki3vY17Rqr4Ayj2P3y48w9SfYvVamRCsv
	iaFFGABgKJFC+GFD0Pe5IsRTOwt35Uy4VhldVqW3UB6Hno+fdC4k9+TUqBrCOvdVntvL3sTRMUkFG
	7M7vJIvoJjRWclNMAQl88Z/K+2hc+9MMGTjP+c1YMyKWK+r3uYBaWTxvgE6mLn9RhvRbRHxdcgmNC
	adUcW/gey4wJIgJHdSvdYkw3TQOLMPbTW+CAuSwZscNA4gChlkt0/bzW0bX0w+Ld45gFKIhozkOcp
	tWavU3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQGT-00000002qwr-0aTC;
	Sat, 16 Mar 2024 09:23:41 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQGO-00000002qvC-3mo7;
	Sat, 16 Mar 2024 09:23:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6A309240004;
	Sat, 16 Mar 2024 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710581014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vv3X1pivQQmEQc8jCyjDQOZ9uDlhTMOmx8v4Kc5Zhm8=;
	b=SfkpFga/aSCMm3InCemlprl4fls7jcb9m8//f67v3uzxoZn4miKGEbbBxTOABsZUI45g/b
	yoDo6QMoScWj5Ipb2Th+ZaGGkoisesShpaaevrGxSVTBAehCq+vkNhYBltn8WDsBZPN75S
	cZIGg2J/2mvoA4U02HH1eRroi68tcHOincmjnH9OXbfzMlAX88k1vVwUf9XW1LMHVuY3vb
	HAEV6Lx7eQ21Qgcd9tQFk+h+qqt2R97P1uKcfjYo9mWoyltWJpV5glsNFkFliUJADVTDm+
	cZ5aHLPRHJV73P9Xf+9P5k13xrV2Lo1xFafmVnrf35w2x0VcnUNOrEueK8Kwvg==
Message-ID: <268abd30-d3d2-46e0-a7c8-6f6d763ae304@arinc9.com>
Date: Sat, 16 Mar 2024 12:23:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] mips: dts: ralink: mt7621: reorder pci?_phy
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-14-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-14-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022337_126875_EF56BC03 
X-CRM114-Status: UNSURE (   4.74  )
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

On 16.03.2024 07:54, Justin Swartz wrote:
> Reorder the attributes of the PCIe PHY nodes node to match
> what the DTS style guide recommends.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

