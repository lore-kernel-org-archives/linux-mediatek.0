Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D60C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g63gvfrNSM5Rc2RoomCwqaQ8kdbcY6aqPlytYjhxnEA=; b=BnLjJUBXQ1/GFBBI4oD9TZ/psp
	XvORoDaWG32jhgHhwvovjqHJ69TtWZFbmpZuR+jfRY/KejXgBV1kerwKXbm720DyQX+51l5MzdaRs
	H22MxOC6whCous5sfF86ieqtHv8EhKno2HD0iH2ZjKt3YiaswEh9arS6cuvb0QrlcAzjFrSgEalrY
	hWGnGZhC5hnZINMzgjwhPGZxgH9M4Dcm3nozT3bG6UQyo+bGldo1REpsbf+FM+nKx0B7Ijk/b56C1
	CGE2qbAHPDXTBDmcGuI2A2LOp5ks0mKLn1FsYQ5EJ+DgnH3PiTh8SzaKGX4N4pe7JLn+HJGdSR2lJ
	xxN0cnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR2c-00000004JoZ-0JkM;
	Thu, 01 Aug 2024 08:20:06 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR27-00000004Jgo-0Ytj;
	Thu, 01 Aug 2024 08:19:36 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E42940002;
	Thu,  1 Aug 2024 08:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1722500371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g63gvfrNSM5Rc2RoomCwqaQ8kdbcY6aqPlytYjhxnEA=;
	b=UYAD+Rfcd2PT+JMTAGD6pNejaNbbXLvdY5StscXUUYP4mXCYyq3aTggC+ADIqToCvbmkXc
	/VzcFRLEc8Ua+q8okLGU0LRgnUG9RUGMk1oTAOCkdPpBkLRUYNmDpIITVkJp9PnSpE28ve
	g1xlYybtLh16qa/89uInPOHwOuYjJxOQQFXPQrY7yxsplukLOILWozzrE5XlLekkAfJ0SQ
	rNIHU1A6R2W1XisZUPFv7zvvziVQh89p2pqTELvolBr35FOljvnItiyeNMCT3t4zwFYbYG
	YBHHxFjkkGsyP04Z5t2F07viCEo/LPdnu5SoLyR5YsXcIPSIs127YKWKL3fy7g==
Message-ID: <4c1a5881-ad73-4cde-81be-e2b809bffb2e@arinc9.com>
Date: Thu, 1 Aug 2024 11:19:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 net-next 2/2] net: dsa: mt7530: Add EN7581 support
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
 <a34c8e7f58927ac09f08d781e23edc06380a63a2.1722496682.git.lorenzo@kernel.org>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <a34c8e7f58927ac09f08d781e23edc06380a63a2.1722496682.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_011935_345494_700E2DF2 
X-CRM114-Status: UNSURE (   5.83  )
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
> Introduce support for the DSA built-in switch available on the EN7581
> development board. EN7581 support is similar to MT7988 one except
> it requires to set MT7530_FORCE_MODE bit in MT753X_PMCR_P register
> for on cpu port.
> 
> Tested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

I'm interested in getting my hands on this development board.

Arınç

