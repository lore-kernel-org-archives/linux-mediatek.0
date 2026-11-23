Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B71606A6B3
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 09:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K5whaYqm;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=g5N90EsV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=P2zIkU1n+ita+RQHERTvlRIt6fwGcjgFl4MCMyC3UWg=; b=K5whaYqmgrPWGy
	YxjA9p/VOZePdGV4JGLFF8F7zXV/RCwmMvAFuLLG9usknY835aSpE0umVSZSw0HQPPhx2lrRx7WfA
	yFoRlejqsdPnjC2Ndh0OIxCKLnhCDL5tuoRuHbNC2r2T+f4z6IXNf+sv8EMzWtc3ifiph1AxuHmgV
	Uq3yVM1dE1Vd7VM4nYMsg+UPgD0r5i64hDKAhoNQ4vx4KQZCF/BtFYmzBlZwgjVYDo5tfVLqp4zww
	e8bSqYRrHuAxHTFZBnw/Dqq3/GEM8wrThvwhwrpavlP894nsAj3hgVIplicEZol7IeaTZkQUEjjhb
	LesJ/LlrcQAUUwgrR2bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgS-00000002pHA-07aS;
	Mon, 23 Nov 2026 09:50:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVQgM-00000002pCg-33Mp;
	Mon, 23 Nov 2026 09:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795427392;
	bh=WXScrJpd1VjqcBYjrIdUvV1HdNJY+7in8XAjuH3YRSw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g5N90EsVCPTZzWR0NPIPT7fBHsvfVDWyhuTrZMo7RhSyElWQMOmtjdzhgd8lPn5rl
	 FeP1BcC1QSVA/V8VNaxwyRZCEenCYOFzcgHDckyyoyK0welKFuEOr/2Ik+ppy4DDYH
	 MGtc6kEjCIPbcy7igwxPTSFgj/io9GbElUS6Ok+shiKK6Qn/8dPUaxgIQaQcIYeuWg
	 zR5QpgBcfkTFcEdfWuA8mV0hEIpiRGMPtBzcFGRlgCdze/mqxCZRqCRY7y85NzLQh7
	 4oL+k4wYnkDjF1eCxV2SbUs6B0hZLxEYK6lW6AbQQCNVUdy3BZkmBMoZ/GjgV2kir+
	 QgIGDES/Sw7GQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4226B17E031C;
	Mon, 23 Nov 2026 10:49:51 +0100 (CET)
Message-ID: <32462cca-ea45-4af2-8c59-4e8a6d8ea0a5@collabora.com>
Date: Mon, 23 Nov 2026 10:49:50 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/9] dt-bindings: input: mediatek,mt6779-keypad: Add
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
 <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261113-initial-mt6895-v2-6-4ab0aa9fa391@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_014954_953858_E38A0B9B 
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

On 11/13/26 20:05, Alexander Letuchiy wrote:
> Add a compatible string for the keypad of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. Its registers are the same as on MT6779, so it works
> with the existing driver through the mediatek,mt6779-keypad fallback.
> 
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


