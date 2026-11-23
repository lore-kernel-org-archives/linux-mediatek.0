Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6049C606A334
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tTHiKNno;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=PFnXvkWr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8mm6ghS/5heaQ3seGTi4gkBOyGvV6wg8F6jmPQ4Tsr8=; b=tTHiKNnoqjIS8e
	Myz5NFm2DvDCl9w/GSVKLhovWV3KMTLF7Fx5h8sgTObRzNKDx8jyDRNPkmm307G2xpPb6vwmMPKVj
	8ZXDUew/rCqy+ndAtWpb+R15ovei/G+E54eHAoF7eZalqotVT14Ycoy0UOvZOzMTK7UWNJkgHmveu
	Vz2tEc7MfWUzSt7ysiK+7gngNGUvo4E4PpLO4p7/vnUt2Q1f/bDtw7YgILmb0ocVOAA2VUH1hH3a0
	8VfYOEVv6Tg4wc/J253ft2jtSxuGZlh0U7+Tgl56MugZs7iCRjfDzgI/2guktQ87BMTaxGPWJU+2o
	mt/zOjtBacqPb6q8SUSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgo-00000002pcd-2ztd;
	Mon, 23 Nov 2026 09:50:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgS-00000002pGf-1quc;
	Mon, 23 Nov 2026 09:50:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427398;
	bh=aBXD7WRadjQY3kmCtOad9Br+DZb0kXU4DK8pHVdVc4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PFnXvkWrn9xqgolcrZ4YAiuDXdVVKWcNAlRPyE5ge/wpQgiQ0tMyGApsdLbbnvsiD
	 RlHrINKFeEev0uK+okjVDn8OqRacKiJSAcP5A/5OMJITEltIM1acDkjcoM9d/nodK8
	 FmUHHuHSxfZ79T05ZWh8NoN44J5tBY+9v/bbHBGpoH9fnLmpcSqAr/Nl3g9khIgeEA
	 pRo5N4OY48DLV68AmLKPkxBhIrfPLRD6RCJT63++hCPTFQav8UaPsAY43j48o3M6eq
	 og2hq58txOuZ2yj4TxCkKvpHXIW7j6nOLqUNlT/h7jJZkJ01kGyx6R1wc6nyX5ldeW
	 2JWWoWa3veZ1w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA2DB17E0DCD;
	Mon, 23 Nov 2026 10:49:57 +0100 (CET)
Message-ID: <1ee347bc-6db9-4a80-9f37-72ace1c1b6de@collabora.com>
Date: Mon, 23 Nov 2026 10:49:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] dt-bindings: timer: mediatek,timer: Add compatible
 for MT6895
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
 <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-initial-mt6895-v2-5-4ab0aa9fa391@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_015001_219990_D2ADB789 
X-CRM114-Status: UNSURE (   8.37  )
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

On 11/13/26 20:05, Alexander Letuchiy wrote:
> Add a compatible string for the system timer (SYST) of the MediaTek
> MT6895 (Dimensity 8000/8100) SoC. It works with the existing driver
> through the mediatek,mt6765-timer fallback.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


