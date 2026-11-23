Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DD260A2605
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YB6JVt4p;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bFm2De2+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+9PCTbh71L1HM3bKlGiIOaVmykcBeQmvpI3vljck9JA=; b=YB6JVt4pA86/Ik
	V22E+zRKhhXdCwEKOFPwZfn3bCBnPlHKUSeGBYnSnCcQqbZ4BJLe3GzKex9jOsyF64Gn9XQXIo+g/
	G4XzqZgwgRhKcSw4x91XNvM4B3UCPY99kEXTbXStRZz9VMKd7ObE0zaRZeP3i+sjI1z8D51pr9FxY
	gWcaqYgbvEa7W5lH3uwRS4o4qDbdne5k2JqCOAMH0jnt6ktd52Y3kUm0vLFpmVUBbUwY48EuHzy+p
	AP2IfffvmCtiAjRINJd/lCKSiz3es3VoLRgP8R++LT6lc0pkpxm9yh0UoRmzbRMJBq6h0nI/0e+6+
	N8lAzs/Uxa7bXEZ9FXlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgT-00000002pJM-2Bez;
	Mon, 23 Nov 2026 09:50:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgO-00000002pE4-3UW7;
	Mon, 23 Nov 2026 09:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427395;
	bh=qDlQ72Vc7Hc/VU08uITBDl9vO+AOoQTLBFQhPb/BZh4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFm2De2+DX6rpDbSTnze1A9rSRSqcnUXretTh32/Cn7I2RwdAEgrER/L4mivzh9xL
	 hRdrV2rdAkTMcCIe4Eo9oyWwOoNQMJX8aG188briw+qLRAVDGfxaqO5ESMYsvncL45
	 xXLiDVaNc0XBiNKBv7R2ruM3/NdVD7h5FTYRVBV+iAmdAAS4y86KMKzTD5LqmJYItx
	 umsbfw6IFNS8mNWp/5iufwz98gKEmde2YZnXUM4cgJg7298j7Qb1vbyljEE0k75wTZ
	 tYd36wNlizoEd6o5rq/jQ3r0MBJjyxl9U7qf9hkmNvkCvzjoBrZ9uaK5HIuAatTDOx
	 781Ab+hMHvKxg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 249EF17E0CD7;
	Mon, 23 Nov 2026 10:49:54 +0100 (CET)
Message-ID: <d367dd8e-d712-49c5-a2ae-30a9b3a41d35@collabora.com>
Date: Mon, 23 Nov 2026 10:49:53 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] watchdog: mediatek: Add support for MT6895
To: Alexander Letuchiy <asalde.le1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner
 <tglx@kernel.org>, Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-input@vger.kernel.org, phone-devel@vger.kernel.org
References: <20261113-initial-mt6895-v2-0-4ab0aa9fa391@gmail.com>
 <20261113-initial-mt6895-v2-4-4ab0aa9fa391@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-initial-mt6895-v2-4-4ab0aa9fa391@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014957_205108_17B90D22 
X-CRM114-Status: GOOD (  10.51  )
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

On 11/13/26 20:05, Alexander Letuchiy wrote:
> Add the compatible for the watchdog of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its watchdog registers are the same as on the other
> supported SoCs.
> 
> The TOPRGU reset layout of MT6895 is not known yet, so the entry has no
> match data and no reset controller is registered.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


