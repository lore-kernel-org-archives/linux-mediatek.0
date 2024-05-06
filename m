Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F309FC10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 12:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lw9hlez8FGoWetdjKXHD629+HXnOAS2kIxipVPMsVeE=; b=OtybaIHgQ81PJi
	Y+OSh2RCcaZ0vphM6aSenPylZ0pV45kLvA3mVnRXZzg8FRb7l4wMsTmfyS796wvd7a7obftYYkA4E
	5SbUQY8GX/FEcuLNQEZkSPzkoCbA9ppVHWkYDfY4EWHCIfZNqpHEdEKfdrYBt4UplsjdS1tRYwrKY
	TchZ8XLLZGPWuejYbnJVTv2rF4mxEaGoeTDUx22hbQs72Mijhx3nUiOvV+QedKWSlcM4GNcYG0yZM
	DtJEK8kj2JzKZSVolLir4VfJu+d8XRRa2k/H0AoSx/iq0FKQ8JbW8U6ZMTIIociFh5Uys6GoNT4nD
	rj8RVXX6f1gz4VYPLrng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xmM-00000007LLF-2ldd;
	Mon, 06 May 2024 12:49:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xmC-00000007LAc-2FnJ;
	Mon, 06 May 2024 12:49:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714999740;
	bh=Qzp0VDoNytX9UV80RHFas/Xph5A4N+2BH6per0kfMpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=agYswDgv8RoUcmBs2PASjM+v5Rx8nS1ta5opi768m2wTivO2nPRv17vTk47pMUvjA
	 KELQlb90kf7IC8eWBXfs2kdjgpdUnCDndNijDh5qdDkTw0oaOullDWdEFH8HUaDGpO
	 as15Fyfh8txwshR9s07UpKvAbyaessixLCeX5C8P+s8wVBE7vCB7PBqpMVZKMQZcuI
	 5qX0oKvbd1iJD+4kjzn8bsT9voSy3h/PhOEWMOdi608DyAJ60e4gkd00ek60IkIxUq
	 SAk/Y9BxbZjxMsn0UkD/+kBtUYEqQMT9pyDSI0euMhCujgleTky0c7yZV99eKzK2pw
	 Eho4FRIfGuH7g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 196AB37813E3;
	Mon,  6 May 2024 12:48:59 +0000 (UTC)
Message-ID: <a43a076f-7d7e-4c7d-8be1-45569c7b2c16@collabora.com>
Date: Mon, 6 May 2024 14:48:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add address-cells and
 size-cells to ethsys
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240505164549.65644-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_054904_851331_9098FCAD 
X-CRM114-Status: UNSURE (   5.25  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 05/05/24 18:45, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add missing properties already used in mt7986a.dtsi.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Fixes tag? :-)

Cheers,
Angelo

