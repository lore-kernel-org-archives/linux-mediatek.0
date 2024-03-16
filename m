Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 521B1C54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcMIm27QOoVv2JlfVOePM6RaPAoVbu8M3ggV/C6vyxA=; b=OFFU0+ZuOSxfGsy9e6jFvc+JVY
	Iqg/263sLwqBu8iMIL1RHNPoSBVskoBYf6m4dKKaialfU8V93bRit+JLIR5yUFTvqoP0DpcG8wOSN
	57zpDq8hyVY4wBBPLKHZbrx8WQrI7LtW6c9GIG1m+Q/uYR+mz/RqbudaSk9ILomEYpN3zdvGRvyKh
	APDoO9kMCSlKlmTm0vxEztTojQ60h9fR+yCow9WGnohg6HiQOlyObmuxGm/8MXN4DuiRaRtOrUOnv
	UgWnOiaSY5gDX7V89uGMbOytvfeEpf/RmoC1czw/yviHjxp/ZfRcjiAhC4oGRdQSY7TlYSiZr14Bt
	7SEjTmVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFi-00000002qiS-06Re;
	Sat, 16 Mar 2024 09:22:54 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFd-00000002qfp-2rDL;
	Sat, 16 Mar 2024 09:22:51 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 91390240005;
	Sat, 16 Mar 2024 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vcMIm27QOoVv2JlfVOePM6RaPAoVbu8M3ggV/C6vyxA=;
	b=Ay7AQUhTpRiXSQsyeHMwMdnG7HK5moMK1RiXDNA7NUdhES91qTAy9jrB2tK8fYHtF9pt35
	oC0Fil3ZejFQTLYz1CMu2iDgcJD5mjHGnI9hEiQEXrNmpXEID1b4dJ/7mqufhCaGypuzEL
	chBnkU0+AbBmaSOu8MGkm3ayYpf7mx1eYwruqrCNWwIbd/nk8F0O4PXzG+EHqeUkf6K3ig
	uqsi3KPZolnGBBaA6HtlHbPpGSE5/CBqWOIXclYG6kdxbAXQabjbLU8qSdZvSkdeL8ZZOR
	sNQGYFl+ifiHAuyQ42nT6qGhK0AnlcIGS1ImHKrGoW7ThDBWhe5jYNlVYk6YXA==
Message-ID: <75527305-d158-46e2-a51c-1f122acce183@arinc9.com>
Date: Sat, 16 Mar 2024 12:22:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] mips: dts: ralink: mt7621: reorder mmc node
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
 <20240316045442.31469-10-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-10-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022249_891436_2D9EB763 
X-CRM114-Status: UNSURE (   5.00  )
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
> Shuffle the attributes of the MMC node to meet the guidelines
> provided by the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

