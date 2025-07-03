Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F39C77B7C
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qk25W//DoN3N2kJhDx7gSca0ArJfdFr/tOUyBtKxhDU=; b=kBePVH9oxtkX5q+2u8cmNiF9ko
	uqod8tkjrVU+g6q30XkRcA22MAnM8ebxU1L615YK/j1qfEdDYFLF7Q4yA93jARu6NjdcUlLMF9SIH
	rAo69oRZ3KnUgQZKhku+zFaJE+zN5N74B3qeV24sSavIX8MAnIk39Kx2BU3M89jP10VwRc2RJOf34
	h84GCXyHjQqA0fO7qAPW4ZWZ6XlfBR7eoV6Q55TcO58pd3/N2cq2BmYpdQYxOAUKoBriQQAF+2Yex
	e+TfoWqjwwJYR4x18hTWhwMG2+QJDGpRNYAF9kKetJMV8qeYxPgy3OsDu6gjG0eq+dmgTkB0ndTXW
	CxZvo+xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNY8-0000000C6bC-3JvP;
	Thu, 03 Jul 2025 17:16:40 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXL7B-0000000Bhbq-2OVx;
	Thu, 03 Jul 2025 14:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751553639;
	bh=pge19sZrf0PUvRXmEe9xEQSZDWyU6lnUwOcQUIu4hQA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WGwT7TQMUCYTum1QY1ogt/jyEc0WTdGqMnWxcE7uq45SwYmTgRjqhwa6lBd+S/fOp
	 FFJx495wQGsH10vrUJb/k2uZhIbsvcE21Oi4vPRHgjCHilVNND8vqo2vKsQP5U1wl3
	 Mj3XwG1dieAd2Dc+3n6K5zTEwCiM2CbOBvyNXYmCgs0CBBsiGP0jeu9S9Dz4k1aQkC
	 Iv+RoSPp93uQPi5wYl0nhCsPEyHYXlEEoEHspOsnXIxM6u8B3OkfKXVDQL9KW9x6Fy
	 WeZYklF7A1JPCqmzErZNUUbpYGWx/TZu02f+yuKzo2wKUXHZ3sle1VyQko66pMQP3J
	 DCtgk3I1XjsgQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C65117E0636;
	Thu,  3 Jul 2025 16:40:39 +0200 (CEST)
Message-ID: <cbd79481-474e-4c9f-bbe8-367917115ccd@collabora.com>
Date: Thu, 3 Jul 2025 16:40:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] iio: adc: mt6359: Move reference voltage to
 platform data
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250703141146.171431-1-angelogioacchino.delregno@collabora.com>
 <20250703141146.171431-5-angelogioacchino.delregno@collabora.com>
 <aGaThTSAriz46D7T@smile.fi.intel.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aGaThTSAriz46D7T@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_074041_768924_9EF5B135 
X-CRM114-Status: UNSURE (   9.43  )
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

Il 03/07/25 16:28, Andy Shevchenko ha scritto:
> On Thu, Jul 03, 2025 at 04:11:44PM +0200, AngeloGioacchino Del Regno wrote:
>> In preparation to add support for new PMICs, add a `vref_mv`
> 
> I still think that the vref_mV is a better naming.
> 

Ouch, I think I missed that comment; if there's nothing else to change,
I wonder if the capital V can be fixed while applying?

Otherwise I can send a v3...

Cheers,
Angelo

>> the AUXADC_VOLT_FULL definition.
>>
>> As a consequence, the definition was also removed.
> 


