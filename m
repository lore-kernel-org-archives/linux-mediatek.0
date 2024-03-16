Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB199C54E60
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVypSm5WOYQnRTTJtNXMYtpKc/D1ytiRhewAQtyGd5M=; b=gA43dYXfKlGWMvD6bn+8gFHFN/
	sDNLPHhr/bnpTG47CzFhEK7Wi9G2KX1gE6qBWrDes5T4Bn0WrP7Sv3PKSsKDMvddzJlHwM5/w/ALN
	ZOz7TYadLIeorzaYzxqiOEggGG34H8XaXsmMtboMFlflDg+VWwb0mTIIi6v2rRS8ioVez7pQa5AQG
	24UPdoUKZR1XZoX4QFJX/pF3W3JbJS6W5CBsWweRKBk4LUjTLTuAZFE2rkCtHhEDyr2aMlE0B3hvx
	8ec0mkF7TOWED1vmSqFZr9dfJ4WtntkDMFX90lPOSxH5RJcgFIWyCNLVttglqvnbXI7WYsaQkraV9
	7/klrjhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQGd-00000002r1t-28Fu;
	Sat, 16 Mar 2024 09:23:51 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQGY-00000002qys-2c1G;
	Sat, 16 Mar 2024 09:23:48 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 87E28240006;
	Sat, 16 Mar 2024 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710581025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BVypSm5WOYQnRTTJtNXMYtpKc/D1ytiRhewAQtyGd5M=;
	b=LK+pFDDhvH2o+mZc58S2LIvqxpyWDt24PIfP4v0R1NWV9PSM8K7PvNwpYVgAMptWTzlYLN
	xLGFa7g3GGP3caRtaSeWYF1dJxwVTLvIAmSwh9XT0eeuJKGL3bPjCv5hJt5tEBwVqNFk1N
	0JbVcVnaWkiIUPpuuLuiQv/wmxpcRdLBrf6xZWQJVsw1HZy17cdZsZ0qGwb5SzsH69vMz7
	y0/Hn6ck1gD+L+bY2kWt1BoO7mZkvoHPRv97hnyRwc4Dg1ZJRR2HrD0lLidQVP21xjQ1Oi
	63Y6YmHE6bDGHXDQauqbeqPk7LUdFUqvOPg9PwPqgyqCbkaDhIvPI6Pk8cq6IQ==
Message-ID: <36c59748-74d8-4125-9556-d909d884b225@arinc9.com>
Date: Sat, 16 Mar 2024 12:23:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] mips: dts: ralink: mt7621: reorder the attributes
 of the root node
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
 <20240316045442.31469-15-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-15-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022346_812777_6366705A 
X-CRM114-Status: UNSURE (   4.35  )
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
> Move the compatible attribute of the DTS root node to first place.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

