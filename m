Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C442F606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 11:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U9WTPTjg;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=GFLdkHCT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=HuszLLEjXpkORq58yz0GcNo/iqkBHOAIX91Mb3TYLQE=; b=U9WTPTjgU64p7+
	cwaNyOdSR6KoKQlDCJn+eOjm/tU8NbVTgJpLM0dfZh7Jsi8hjjrH+gvZie5nIZNVU7VAUTl4ncMDh
	jQVlLXZszOivr9J5GEKhI66ht9yHgnT52ZwpDzoo/sr8T0qYZeFWK38vYaYabOTirHWKV0RJ+X12S
	gHCvGS2t6Ug3ADL92eG/9sDoAOIJQvn5N0CGlryeARGlxNlBUKT/IJy4MxiQCbEPWujvul+tUfgoD
	GngzMzSfoo4QJ5+qERDN2ErpdSws5mB0l7XMLTGLGV/JE1L4m0gKYH+R05NELyrO/y/FtYSLoN8Kh
	i4tl54/7s8DSfKc7DlLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHA7-00000005PfN-1vHu;
	Tue, 17 Nov 2026 11:15:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHA2-00000005Ped-1ylN;
	Tue, 17 Nov 2026 11:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794914136;
	bh=Yowmv05lbR40wQjKJ7RKOMQYkspttaK5HaDL4dRGMBw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GFLdkHCTqu2t1UmYxAlJ/UbqwGp0LcB8XoKMVuhFze4BN8fUNBw4bYVnpLaCThZ1P
	 k8CjQEWp16KmKRxPuYRQIWp0XPuCwIm/AAL40vNZL3TbhkaPixjfq+nIUgEspqfLOR
	 iRal+NIhfjZDoMANrXVsVzhAz5YBQUNB+AsS7Us5akG8St/Q0Yc9cTPrdud0BYYy7O
	 v6yBalOCHkfnsW6a1ntehyf6z4Zo8nfvNkWR1501mtTsvqz55USmt9rPUXEYtjKfuw
	 oQssNpmvbn6L/zpYZemKD0J32XAV1yvimGRj9ZWAr0+jbbdveLiOgjD5M6WxdaoWGd
	 wHvDFVFjRrz3w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE2A817E0060;
	Tue, 17 Nov 2026 12:15:35 +0100 (CET)
Message-ID: <843a1fba-f74c-41c0-90be-f97b8dbffc09@collabora.com>
Date: Tue, 17 Nov 2026 12:15:35 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 MT6833
To: i@udp0.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org,
 phone-devel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
 <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261117-mt6833-base-v2-2-058a0685c40c@udp0.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_031538_667347_194CC113 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/17/26 10:11, Rui Cao via B4 Relay wrote:
> From: Rui Cao <i@udp0.com>
> 
> Add MediaTek's MT6833 (Dimensity 700) as a compatible of its own.
> 
> It can't fall back to mediatek,mt6589-wdt, which also describes
> MT6589's twelve TOPRGU reset lines: MediaTek's kernel for MT6833 resets
> the connectivity CPU through bit 12 of WDT_SWSYSRST, past them, and has
> no full reset table for the SoC to take one from.
> 
> Signed-off-by: Rui Cao <i@udp0.com>

Reviewed-by: AngeloGioacchino Del Regtno <angelogioacchino.delregno@collabora.com>


