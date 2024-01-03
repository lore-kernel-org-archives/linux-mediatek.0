Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BFCC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jan 2024 13:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fmHRbPo1dllvYNT7ooY9IRjhHwOdNcyByB7pqqrT40k=; b=dA73hpJx/CmSng
	9shwnHiUevUwdfeeGWYEm/rPh+E+mYW/xO5gTr+lShHacLnwPFBMGX8jDOrRuk4W+F3dvL2E5o3Qz
	ft4Odw/8Cdi+cKUQc9CMuNEh2qjmd32BwxA95/VE4TU55Pq51DcsSxsdqQ93m/QSbhcz4x3/Ramr7
	LFit1NFiZpi/8TREAExAGUPx7T43gb5DZT22xYXml+cHRuFUg/yvnwoy24yjN1Rc2GrVjwEn5vwEk
	1TxQchAFkk15An+X+ZWPi0Lo1nIE/NhDyZpsCC6x/pwDcd7DtUm5EB3kYnGzTa/HNx7O9PqOFQJfu
	U0VuiKxhFkY+Mn/FQ2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1k8-00B2Fn-1P;
	Wed, 03 Jan 2024 13:57:12 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL1k4-00B2EM-2j;
	Wed, 03 Jan 2024 13:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704290227;
	bh=FohiWpenjn0vNGDbcZBW38SoHVuZ1OGSbUJggTsLqgs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZzXXQBJdzykjsCrcUgA/LCSJlank+anufH/9fkiT4ma+PPsQm2Z8GYP49qHimnrbt
	 2KaILFMhLcnuq9/wUGWRr4M38omHKX9i6StJSfxdH89NVlV9iBFW57BuKEjvzVXrHF
	 8eA58Q7gM0tpRJTCn5rMpyVm4aukN033cLiY+RmI88xwWXIrJdDpIEdC5qOraIPNIP
	 1OMDasSgG+1IWkdWxribDlqtnRgVyjF9413jJciIMhuGZX3SUPpv4rYA5WSLzy6z3y
	 GWOfxiuWYJOQApqAJLIYmtda3vUX7HLIhIcqw0RQjeQoOMrw0KKn3+66zncd3ko3JB
	 kpp2SXI9dbQkQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA58E37813CB;
	Wed,  3 Jan 2024 13:57:06 +0000 (UTC)
Message-ID: <4a1121da-6b6a-4970-9da2-ebc4f2cb9629@collabora.com>
Date: Wed, 3 Jan 2024 14:57:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7986: drop crypto's
 unneeded/invalid clock name
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20231116132411.7665-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231116132411.7665-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_055709_012676_F42AC994 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 16/11/23 14:24, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> According to the "inside-secure,safexcel-eip97" binding "clock-names" is
> required only if there are two clocks specified. If present the first
> name must by "core".
> 
> Name "infra_eip97_ck" is invalid and was probably just a typo. Drop it.
> 
> Fixes: ecc5287cfe53 ("arm64: dts: mt7986: add crypto related device nodes")
> Cc: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



