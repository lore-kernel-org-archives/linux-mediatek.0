Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B44606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 15:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uCpp+WMM;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=oxpUA6gT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TUoXyOddWAz9fDDOvSA9MQNAlA1i/4mOf8DBtcxzgh8=; b=uCpp+WMMayrUNY
	442RYyciZkA2xseH/rMdiVcak21kDqz3RymmstK5rA4gw5oozjET8m7NcT5kJnQbz70UW3Y4Cfp3u
	FCn74XHtfIqXEQpoYRFw+ri3iknCcaeodwat9TI5m6PffJXAGiEFYp/XN6yIDLbT75o0AetDedo60
	ZXyIiGNYIw+BNYUnlwj8fPDigLPthvgyz3tPf+/4pOhA/UuVrS7KOAJ4BgQ7xqg6idj4766KJCQYj
	cSUALG46YPX+GFS2PFprHcOCe2LXMEAi/Vg7irn5dFej5+lDGCtmWNXSZGoXOlJq1snwBYLiru6HQ
	yEYYlL8+3Eupfv3dMjig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW25-00000004084-2qPL;
	Mon, 23 Nov 2026 15:32:41 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVW21-0000000405G-1MMo;
	Mon, 23 Nov 2026 15:32:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795447955;
	bh=Xnfpy4WZddREfPMFIPPX8OEnArv8MmFD/FqHyNhM8A4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oxpUA6gTTlQ1KCGpEDK20y7rEzaVPpHuOF9j38OC1nadLKfNvr6/E0GsI+E4D9XWa
	 pWpbQl77q8I2HMLzwpeyX1gN4yJVZrBTy1pImc0YfrRIE+ftdOplZBCCjmSNbBCyio
	 YjrkTPxcrab8wN2YD68HFmOZsNw5881nZAlKZvJAqzeEiWHmd0GK2wN3TUsKZ58EUb
	 c5/YGgpB6ClcDmH2zfNBRRcJM8zCBOjcTcxGwkSR8DzpfyUwEscAZXyDCZXJwMPZRb
	 JGYF5QkiRbUK2b5CZVa53+1LnzNlhqZJIt5l5mOl5KtxxaopvCowxOdaqWW4XI7Vcu
	 WS4z6Fg5M/4ug==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3640F17E031C;
	Mon, 23 Nov 2026 16:32:34 +0100 (CET)
Message-ID: <cc4675f9-0923-4918-9867-05db05b5ceb2@collabora.com>
Date: Mon, 23 Nov 2026 16:32:33 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] dt-bindings: serial: mediatek,uart: Add compatible
 for MT6895
To: Alexander Letuchiy <asalde.le1@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Daniel Lezcano
 <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-input@vger.kernel.org,
 phone-devel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-2-95c46597e63d@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261123-initial-mt6895-v3-2-95c46597e63d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_073237_539626_94B83EBE 
X-CRM114-Status: UNSURE (   7.81  )
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

On 11/23/26 12:18, Alexander Letuchiy wrote:
> Add a compatible string for the UART of the MediaTek MT6895 (Dimensity
> 8000/8100) SoC. It works with the existing driver through the
> mediatek,mt6577-uart fallback.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


