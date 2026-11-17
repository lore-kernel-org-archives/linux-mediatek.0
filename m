Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD80606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Voiq6cKw;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=ZzqHuuPs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K1Zvfa99sLuK1DLzK+ZnNXjcPb2OGlPh4oAuZqkwtkw=; b=Voiq6cKwD4lVBo
	jMdc1e0ATeFCDJ5rmmdWH16T3dCZX6IoIYX7sVI9CA5OGkRrdbdqO28ZRmeIWR6CLSGhO1/pwGgaG
	+1DyEaw35LGnIUZ/QbOfB3T3OsOgdyfT7alqnujnXDBdtoJH0FYqIQcS0DQv7C7cMi72jafHp6upn
	6SX5otn92g3cIZwkkzFgLm+fkZVphXqW3Epyli2TT+UfjL3y5JgBtlds3BOs+EseQSnVU3k+CpTCW
	HtJ738uDVVBiWglzhCtYUguQBBuOmW3YC1ju/q123h50GB4LjLUdxYu2+gq+fnoL0vlU0oOcD8UOB
	VIPp5hDFGRePtUomPLYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHvl-00000005WmA-2onI;
	Tue, 17 Nov 2026 12:04:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTHtN-00000005WRv-2s2y;
	Tue, 17 Nov 2026 12:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794916946;
	bh=Pn/vfILlPgBup/CmDpdpki2EarwYCJXJtgx9MsaRfYs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZzqHuuPsdun6H5EzYeowjGgBvsG48E5Bx+DLK1RB6P2I/WTSewjunAKXg2InEfkoJ
	 08F/RwnoWzx8i+NGNHI3dgpg5mDAgAhmCnEZdt8OS0GxC5AXnxXwfy5fX7PPpTfGT5
	 d9g0yQHw3DHBmI4IAKJEAz3Td2PlizoaxiLCDbEGDekOi5C4TYKBEadkvYcVdiO0RK
	 8ozohV/+jpWxUWTKQGlpvuGtbyzQtS+FYYqf2rnSAYSx8nJw/WdE1qLOF3EIrTJh+J
	 ua3XZP6yIiaBRxkMqjPTpSAh2MWlpbiNcoyg7mjKUx5BOudQ+6jO4OjO0gPdpB2qjm
	 Nxc9QIUDR2IaA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B26E17E0406;
	Tue, 17 Nov 2026 13:02:26 +0100 (CET)
Message-ID: <fb428deb-9408-4129-89d1-1c2a3da1b75b@collabora.com>
Date: Tue, 17 Nov 2026 13:02:25 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: Initial support for MediaTek MT8163 SoC
To: bengris32@protonmail.ch, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261105-arm64-initial-support-for-mediatek-mt8163-soc-v2-0-e68d7d428f99@protonmail.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_040247_395502_D76E6124 
X-CRM114-Status: GOOD (  13.94  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/5/26 15:28, Ben Grisdale via B4 Relay wrote:
> This series adds basic support for the MediaTek MT8163 SoC.
> 
> The MT8163 is a 64-bit SoC featuring four ARM Cortex-A53 cores,
> typically found in entry-level tablets and smart displays, such as
> the Amazon Echo and Fire HD devices.
> 
> The bindings and SoC dtsi added here, together with the already applied
> watchdog support, are enough to boot the 2016 Amazon Echo Dot (biscuit)
> to a shell over UART0.
> 
> This series requires custom TF-A, U-Boot and OP-TEE ports for MT8163.
> The stock vendor firmware does not provide a usable PSCI implementation
> (the vendor kernel brings up secondary CPUs with a custom "mt-boot"
> enable-method instead), and these ports also define the reserved memory
> layout used by the board dts:
>   - TF-A: https://github.com/iara-linux/arm-trusted-firmware
>   - U-Boot: https://github.com/iara-linux/u-boot
>   - OP-TEE: https://github.com/iara-linux/optee_os
> 
> This is the first of several series. Support for the remaining
> peripherals will follow, starting with the clock controllers, pinctrl
> and power domains.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Whole series is

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


