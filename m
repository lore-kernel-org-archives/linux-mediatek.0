Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E4F606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Llxw5+xx;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=jRITqFx8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N7yDg1jS2E8ZCXNtP72vSPpBD2Z2Qt0T19MdanjZIfs=; b=Llxw5+xxnGBrHG
	KIcXKDJcu9rKfcgl3H1Yo+qKVR8JGPnHouqh3ZM7R9gNRHl5LjC+oUbag/GO4z55hTng2Jo9khK+h
	JjlpfzM5eeDw0oCNNymaQEh5Xb88c80AljeTTh/pGx6Hq9G15P5cz+7YsyolTuzof1J/ceNdsrJ8J
	tMlThDgmDM8yjETMVV/OYTbtYBoNqjhGjnmwInTi/WM+yWrkBZVf5dNaWKGZkNhfBHJr+SNo9ZAx2
	S//phNbL0sW1HsubEgNt2M4bW+IeR6qji6UDBkLdiZ881uW/qCRt/MsvizHYl4OBBO3n01tLmn4jC
	OLOmZlE1e6e1z7qSSEPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQhE-00000002psF-0sdS;
	Mon, 23 Nov 2026 09:50:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgW-00000002pM3-1Tkv;
	Mon, 23 Nov 2026 09:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427402;
	bh=CPgJojwzYBCxEhJmvECCQ+W9MCWeNgq7tm1d4lpevIM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jRITqFx8dcuWF5L8ddFKB7RdkiTji2UrVdFR3yRyshOEO0LJyY6mB9jQaDW6HHRE0
	 PWwfXI44nIZiA6T+mpabpGmephLhwESHRQKdBjgEXn0tZYV+Qwl7wb3BjJg6/nuRcM
	 bZ0s4bM6K9oL7jWZfmjVCAbf/cL1/uVsGKUcWqMyXAikqlU1DFk++x114e87SLlU9N
	 6msKMyRuSLvwWducNH5dEDGDpXzWLxYg9oogAwGiq6VwqDzC2zCespXEnP+TX9gmbO
	 o0WGY8I9UuOUQeN/q9Z9JWXyCeQHhLU/MxMw6bQ25ZPRakpHDU0uqAOqEcLmR3Fnkf
	 OR4cH11C15A5A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 870E417E0EB0;
	Mon, 23 Nov 2026 10:50:01 +0100 (CET)
Message-ID: <ec9462da-2e48-4140-8648-e566da305010@collabora.com>
Date: Mon, 23 Nov 2026 10:50:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
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
 <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-initial-mt6895-v2-3-4ab0aa9fa391@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_015004_860428_5262C704 
X-CRM114-Status: UNSURE (   8.60  )
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

On 11/13/26 20:04, Alexander Letuchiy wrote:
> Add a compatible string for the watchdog of the MediaTek MT6895
> (Dimensity 8000/8100) SoC. It does not fall back to mediatek,mt6589-wdt,
> which implies the MT6589 TOPRGU reset layout, as the MT6895 one is not
> known yet.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


