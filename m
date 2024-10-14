Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A57BCFC53F
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 10:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1R9n3TbQHSkbUL6qBqoTNT9/yixVK143/fZ208Npa0k=; b=WHum4LyazLUzeuWUS59bNSjD3z
	6htT1QkPcVuBsQdGVxRpLLkgbS9JwWpY+mSnYyNYD+HwdEYMEmDBW9x2yjNy1LOg1e64wouel5ful
	aQaspZjWAt0xEkJ89bx56OQ23O2Iw1MLZ5lshAGJSGBMX2ZYs6JLi2OTWwPF6YFHmYBgNuvWsE4nm
	IaE0hb4cq6xrUO/dn43Na0wYCRimS/FiYjCQH/eI71xjpaMG54PtzTcHWXfT0C9wPRxMBAVvwtyyD
	dzN6Y8JvYZX4SN0hZIhN0IFo4lXYu4J+Zm7Fiiezv5KkAfKWd9LamtEAkKcQl86evbql4aCDfA0EZ
	IwESVqSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IQc-00000004i8q-2hka;
	Mon, 14 Oct 2024 10:35:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0IP6-00000004hyi-0a5Q;
	Mon, 14 Oct 2024 10:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728902057;
	bh=hUsE9hl97X46HzaTn28zYZcdr8OeQ9jFpPk9E9c0/DU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MUNDtMkGtJlW+PgABff4bQy2NZEAHaXLlQh6LS1KSru0RYe7NsQPs/E9b8dpqGHWj
	 uQrOmcWSAzOgSNG9TdHPtD9bGLaM8l8cCTR8PIGI5zXnmvvFesvOLR6MW3RAe0k+DJ
	 +ND6qnDFgZzjki45mn2VJBnOoP5ukMrhSN/30I1D1BpmRAi4+ha4lf6Igrw54SnnVk
	 /B27T5T6K6b1+lN8zShcVT9zPiCJhOv8DnrsEIYzkVbN65D14uQsUR6Wd/2H317bcX
	 jDPF9MdXo4bNcb9qdzzGsU+PivSIpBF/MD4uaTLXAKvqON0YVtOB/4o5ppNHhoMQEx
	 fHIcFiN16MkFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9740117E137F;
	Mon, 14 Oct 2024 12:34:17 +0200 (CEST)
Message-ID: <40ce7287-7fed-4670-b16b-695c36535661@collabora.com>
Date: Mon, 14 Oct 2024 12:34:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188: Fix MERGE's alias IDs
To: Fei Shao <fshao@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241014094622.1720289-1-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241014094622.1720289-1-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_033421_078062_4D0A18DF 
X-CRM114-Status: UNSURE (   8.96  )
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

Il 14/10/24 11:45, Fei Shao ha scritto:
> MediaTek's ovl_adaptor driver requires the alias IDs of the MERGE
> components to be indexed from 1 to 5 to construct the MT8188 vdosys1
> routing path, since merge0 is particularly reserved for vdosys0
> according to the mmsys routing tables.
> 
> Update the alias IDs to ensure that ovl_adaptor can find the correct
> MERGE components, allowing DRM to initialize without issues.
> 
> Fixes: b13ecb7c6f67 ("arm64: dts: mediatek: mt8188: Add display nodes for vdosys1")
> Signed-off-by: Fei Shao <fshao@chromium.org>

I prefer that you resend the original series with this fix squashed into
the right commit instead, as I can still replace the series that I picked.

That makes things cleaner, so please do that.

Thanks,
Angelo



