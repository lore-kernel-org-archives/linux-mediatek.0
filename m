Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F96C54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBPA4EVa/HJzRpygIlTKSRICJil351AjIuBMiSIsloY=; b=vxHXRqumsgwoxMVj/YPyqGk+J9
	5CsKHn+Ducyn6oCVXCZIAV560Rmp3CW5r5x9Wgh2gsiDtK2RrhTQd4fxS/GekAC4xyXGcoA5F90U4
	Qk5egnL2rIQ82e8vJmr+upO01Zuf1FdFgiHfER4Y8jiv5kC/xAwmH0yZ4XKgCEF3uUeoOgjpnDPtc
	zQ8RfqyUhznRY94tJO1U0MdFw/qRkxgD0zO0oDR6tYwr2l/zrlekpXt5HdA5/g29feeL52pZKk2sk
	AaX8JVeIDO67zYockLVbBdWwBSC6Uf6AOYT+fISPVDPSaxqXR9b+vNSVOceDBSUoKxFOEEDoAoTG6
	ik6+nJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQDb-00000002q3w-2ay4;
	Sat, 16 Mar 2024 09:20:43 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQDW-00000002q2n-42LK;
	Sat, 16 Mar 2024 09:20:41 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4807B20005;
	Sat, 16 Mar 2024 09:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PBPA4EVa/HJzRpygIlTKSRICJil351AjIuBMiSIsloY=;
	b=DnBrpbD4qlmsmkkcGjPzBuPKmsmsS5vgoaOP1pUvkdYBqlpqTnHiodEQrsxfR9l3adwelP
	xsFr8QLuB89V1Zk2/Mv0kuN4Q1N7+VImT50/iolPSrHW/nFtmhUrhf4LGawl91+fZTIrcl
	e/058UILPk73WCcikKgtCbA65UwmGyMNaKFCyBMG6E8TD6KFpMIGwsGNrD7e2UoU0SElh5
	yXd+rStnTVXJgFVW+Wor5CviJX4APqfr9kcbtIvK05Tq6pKA3njhLMzgtLUC/92yO/bQwL
	WBosVquxmmwBx7TIEQbRgAQ9blm2vCwKaDJzykXoWFJjZD77ZRgJRg04EhMjKQ==
Message-ID: <b30700dd-25d3-4815-8a3d-dd78810fdaa4@arinc9.com>
Date: Sat, 16 Mar 2024 12:20:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] mips: dts: ralink: mt7621: reorder cpu node
 attributes
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
 <20240316045442.31469-2-justin.swartz@risingedge.co.za>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-2-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022039_188725_09CF98BE 
X-CRM114-Status: UNSURE (   3.95  )
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
> Reorder cpu node attributes to fit the DTS Coding Style.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

