Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0044FC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IeeGNQZSe/Hv9z2T28GLK34dZgRfIrnqTzrs3QFpFFE=; b=LO/6TpjZBGsPRUx758GZuiVqOM
	2u1auy7ka7HqJ+vTl1FX5DLb+lVGmJ9dx8mrAJO2OYR/4SbiTedTjdyjCX1IoDBsU2X+gbLodSBYQ
	zxE8Ru9iDjd04R/VYKgClI697/ItOm9h1j89q3S6PasX5yDgBVXPeaI3Wk83yvDoYbecTEmCfK6Lz
	q9hm4P/GgMAI3Sl+okwJPGb4JiDP5ePrbgHc3Vw9T+G6RsD1JA0TTPTXSb/cjAiO/UNV8ytWa8t/3
	CBcdXEeKa+CbvXJ5ZRAJa50QZU8yXhMXFwpdJhr+GcqCIR293VijHTK2ayehnZvEf4MnihUzfkmCU
	1gaGrw9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBEN-00000008O7j-16qm;
	Mon, 18 Mar 2024 11:32:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6V-000000087Rm-3wBA;
	Mon, 18 Mar 2024 10:20:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=IeeGNQZSe/Hv9z2T28GLK34dZgRfIrnqTzrs3QFpFFE=; b=VzY4VVOzwTwntN9OJkmtLoBvD0
	MReQlO5G2AY6Zm1UMY5TcyP8jxoyaokpqrsVO48K27+NbligrGuoMFNuGjlYOgqGJQwnfLF145VCI
	MWB5XkL8FchFNGTy/yGm7Cy4bQ6scq1nQ5TBA6H0+FB63szURh3mWziLcBGoUbIIKj6qsxOZqh1OR
	aPwEJvGecCotoBXeQb/fwWVu8O8U+FQSVg/LPkdhtKWbD+faD3H+9qIYK1cHI82rUywlImyFHcj1L
	5BVyLkll5ORoXuY7E8vUmedMtCR9wsdiAAFazEWq8FDx61Rx6t48eEzAxDNNG3DLmdRGiUEgzSsdG
	yN/zsiFA==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6S-0000000CZv6-2Bqx;
	Mon, 18 Mar 2024 10:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757223;
	bh=L/WfCJ3Ym1EZIlVCoH5faw6c2cIYZNMg5UKCSUNlgxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SMt5Q6b6BgxBqCcjVwEpEKsVWurV8xPDgI/UjkHzGIcRsZ5ZqhyYhUiX82XIaQ3gv
	 5Apec943xO3wQt7enmPwUxyNmNJJiI2qXvDKhXz15gZQPbEjEUcitn5L1h9dUF8P65
	 w1utNyoPa8jMZgGRLLUHXZ1EGv3l0qucWEFtx0hHHJGXQ2mTtWXmFMhYkPS6zx9N3b
	 GdzTGLD/yWQrHfEr4G+22ugkGC0GpsvEh37DHePzkIWjlvGMVNcIzu6e1IdrZbWA/I
	 GRvCubfznY9fW+c4x9pY1QXV2XYRTLjavts+OvNI0C4/PRZf2y9C99+4vo2d/u7CB4
	 D2W8QRuPpx9NQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AD41D378209D;
	Mon, 18 Mar 2024 10:20:22 +0000 (UTC)
Message-ID: <75c5ba56-57a7-482c-8d83-2cde08e30b94@collabora.com>
Date: Mon, 18 Mar 2024 11:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/14] mips: dts: ralink: mt7621: reorder mmc regulator
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-4-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-4-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102024_849269_15AE9D50 
X-CRM114-Status: UNSURE (   5.67  )
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

Il 16/03/24 05:54, Justin Swartz ha scritto:
> Reorder the attributes of MMC fixed voltage regulator nodes
> for the sake of compliance with the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



