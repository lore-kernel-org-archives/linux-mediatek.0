Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F95CC54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QaPc7n4hfgNrI9j78DPYDOh1dbNuzEEoPXl/wR9kJtY=; b=yeZbD3gseJL0JjJd9micNy8L+4
	49D7c+qYBwOTkHYLMhNRUZ6jY9COlV55VemkNbLYelPiE5wvImbfboKfT4FR9knMUa85krD5OkIOs
	zBqSSWA2K+7+sQg8qL0hTrNd8dj0WDeH9P7Da6VhysCWSIFKBv041jYI/Oj7RaYUFFwPvF+CSsDnP
	RUxV0mjG44xF/ex7cw0ALuPZQIEUjdMVbkGtSqvzz/f3a4PX2nkonbd4Nk3f0t6IYv/10LUfLA6KC
	L/NrofyxVCO+LVh/VT10xfl+aGgQT0LCz2/fEeIN18A/4i6KDDs9dbWLyC7i+xR2poIH0rSaH66Jd
	AEwcQf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFT-00000002qcp-09lW;
	Sat, 16 Mar 2024 09:22:39 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQFN-00000002qZP-2t9o;
	Sat, 16 Mar 2024 09:22:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 79D7720003;
	Sat, 16 Mar 2024 09:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaPc7n4hfgNrI9j78DPYDOh1dbNuzEEoPXl/wR9kJtY=;
	b=TOJSetxS7n1FQgLixlQdx2MGkuaTr2y1nt/E0sii2LJeR/ToGWQnfZlqNYS27AnKb8fb4C
	HCuOMV1uxUCWcB9qcNhlyboUMb5RJA7uKnK0NHCnrXvYkt5clpz/FokmwAnPdwMOk8Q38I
	V4vrwN9Ii3cVcwBs7PHFnxcWYGSy+WdpSdiUzOdq+3YjlwXzw4z0Z3PUDFvMupeO0oJq/h
	oLPrbKkHJTQMuFyjGrXVnLD27GK/jHmvkTAWTsFDWnly89KUBzChuVDRwO4FaA50nCtVgd
	L4FeLnfLpS5u2cw8TaHJ0Wdgi35MFr3mVMQc3Y4X4VcjJqYkPiPu6NPVRYcVJw==
Message-ID: <b02f1d1f-6a40-46b9-848e-35a9c758c8b9@arinc9.com>
Date: Sat, 16 Mar 2024 12:22:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] mips: dts: ralink: mt7621: move pinctrl and sort
 its children
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
 <20240316045442.31469-9-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-9-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022233_923453_C6F924EF 
X-CRM114-Status: UNSURE (   4.57  )
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
> Move the pinctrl node prior to the nodes that feature unit
> addresses.
> 
> Sort pinctrl's child nodes into alphabetical order.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

