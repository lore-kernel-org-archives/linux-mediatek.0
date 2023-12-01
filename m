Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26ED9C4167B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Dec 2023 09:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xYvQ2+XhfJX1xRKys3ca86ak+dF9P2wojSRaaFhaV0g=; b=CtAIlMSRwJxgWULHbTO9quIl6B
	KD/D+T5D5CCXW8fx3V3M1BjuxMvHmds3UTEFCt+URPiuuiB68U0lX85GRoElw6Zjlbh/MKcKR60t3
	v+6UTH0wlT75CI7KRwrsd+yjkwl66aZOp7UNc5E5JJust9ZgyQg10ebQQ9txFQusqc/Mm7r/GK31+
	oLbJm70W3PsKc1ewywFeTbnU/0IdANA4jiNY0mEN2eYgBZnwkmOght3r3I/JUFVbVAS89Mw/BIki7
	EN+suwVoBffzi/4gsIulKq9y15uV9dRqLiDV5he5wvv1Qhdpw7lHFnYMQr7kXJPt8OkvtV/Hn5/ae
	HFWJ4pgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zRd-00D3As-0i;
	Fri, 01 Dec 2023 09:04:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8zRa-00D39m-0Z;
	Fri, 01 Dec 2023 09:04:19 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 525386607355;
	Fri,  1 Dec 2023 09:04:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701421457;
	bh=0kTgGEFrtxmALDxuSPD6o0PLxYETkKdh7nPJkhHPcNs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZHyFuCVnw5FXu3RVfPY4oOVdtFuk2vNmxRgw3PQ9Ro7TVV4A3jhGNTY6DwbzIoYnr
	 co/Bv0eEApPWkxTkZyCsawZ4ZWADLUeck2FtkVbIL5AuED1SsWZWe5Y2EE9/Cof1RE
	 eVQqB5uayS5FmyvznPNMFmxOvX4UcUuJ8MHM4V7ODN/wVUgEc4USt0FKmav7QS+dmg
	 A2gzIytwhIWiPUt3osopudPbEuspmmpVXUhAOX26rNl/C8Vwi5LjXTLWVXDRC8gwF5
	 rwVoEDwlm62VS5d3GBo5X0u6AvuykwyU5WV7733S40aquizZIZGDE/by8dCsRfUBHN
	 EHIpX/0GVyniA==
Message-ID: <6a8b3f78-a7f0-47f1-af9b-671ca900ab8e@collabora.com>
Date: Fri, 1 Dec 2023 10:04:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8186: Fix alias prefix for
 ovl_2l0
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231130074032.913511-1-wenst@chromium.org>
 <20231130074032.913511-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231130074032.913511-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_010418_347020_3DDD1400 
X-CRM114-Status: UNSURE (   6.01  )
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

Il 30/11/23 08:40, Chen-Yu Tsai ha scritto:
> The alias prefix for ovl_2l (2 layer overlay) is "ovl-2l", not "ovl_2l".
> 
> Fix this.
> 
> Fixes: 7e07d3322de2 ("arm64: dts: mediatek: mt8186: Add display nodes")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



