Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 732DCC54E58
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 11:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=USKezyE4b+A/IfhAI2Q/VKDF9wDd2a1nSmuhlM4tI8c=; b=OqrSg1PZE4wzI7UqFX+ifaQDMt
	qh3wcyydmbrDAx8AcQUX9vN3A7K6+dKHta9TtuqIkZcLFogk05JQBrDbyaQnhycPXWuv45Ax/Ht0i
	SX30FNl41WC3gf2nKLqcV6Dwcfuskj5zuuX3MInzVkm8u7xLz8+PWAEH5YPv5E8rlb+EFFNBEtYIr
	52iADgSjOfrodCdWZ+cXLt+KqsZhFOISLju7C0pBbgpyK8Lq8J4EuCXpdCyX9Ugiy/szbRgSJRPMt
	kfIETCjb3ogcWfp83Qwp5173nwkQZkky53xcGblS8EPOwl7OeRdAxGsddAY/eXeHdvIFIQADGQ/38
	hHWx0How==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmBDj-00000008NeA-2cdJ;
	Mon, 18 Mar 2024 11:31:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6T-000000087R0-3p4R;
	Mon, 18 Mar 2024 10:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=USKezyE4b+A/IfhAI2Q/VKDF9wDd2a1nSmuhlM4tI8c=; b=fqLRG4m+KGpRac4iOMaDekPzdi
	75U9RlYNkn5g33+ImRc+UG8SlpSqJsYcDALHvZajMYUMBfpae0qo68czmGG58seE0N6XXQ08ryraO
	8kuapxvQQJ1myHirLPCsfdjvcuJJHcL3KEBCZeLO+CSryAjMJvOwhBxLSkn95Xr7FIFLssFBRDCXG
	9Vaz9dt20ukYZlCz4TdHfaA5GzOyKNd3Jj9sA8lpS5ce9F7ecTzq/+NR1Nrf0FZebUCXQBExGIEbe
	p/l0y3oisKu4vbbBZyI3Nyp4+uHm825dC9M598mMyLMA8Skfbl4VIZ6LE1LWoH3sLy67p7NmJx4o+
	ASBzPIKw==;
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmA6N-0000000CZtO-3lKm;
	Mon, 18 Mar 2024 10:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710757218;
	bh=8Xw6moakbo9EA/7rPM6NZSwkws8780u6vH4gEDzGTZ0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CX9y+yxDZ761CLddzxlBlBCvIsXgVSAo+z0ZTyyvMq/yiCv8xPQXoXKvfkbIFwUWG
	 Ir0kITFTf/9xSL8xI4Y6nDLojV07A/6zmuJf6XFEk0MGB/Q0wf6zDDjgi3kgt7weFv
	 E8YAvCT1PX4W3tjgLADHrffJADFQFf8fMrrLp3x5p9qmFMNyLyam0d385ul4H20gIJ
	 FPxB4hbdpDwnXg/wzG7cYPUD3qIjL4BPsoG5938wOy7pj2mmqDPM1u/4hS2xxCunt2
	 lEtYLj7DtwTD4d7Zt68KfS9jE7SfgrIcCVsetxkuJoUEOFWk/OT+Aqm3dSAhUKjmoF
	 4ptpJ0kGGWGeg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 12D933782087;
	Mon, 18 Mar 2024 10:20:18 +0000 (UTC)
Message-ID: <858c09f0-60a8-46e6-90c3-6e20494faf4e@collabora.com>
Date: Mon, 18 Mar 2024 11:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/14] mips: dts: ralink: mt7621: reorder mmc node
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
 <20240316045442.31469-10-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240316045442.31469-10-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_102023_010740_2EF4368F 
X-CRM114-Status: UNSURE (   6.31  )
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
> Shuffle the attributes of the MMC node to meet the guidelines
> provided by the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



