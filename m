Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481CCC25B4F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 May 2024 13:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb3COXjaLZ3LKhLfel7MrZiwEb2kOrxewyyn8qZZmH0=; b=H0G4FpTKmIBGHU1c5rEDyWrcmD
	H+Lma1PK2JPChEbJ5RyEUEUwDSrcD03kGkVLlZ/f1/NiQ6UPT3/YH0Z026kvD6a5Xer5cw4eVjIIV
	Cnlalo8Lbfmh9LimFmh3Mx96zaB7/M6VrTvVA39uBmfSa+c0VWLrFpDA+ySSNAhFR4QK57AYUJkHB
	zpfOl0EUbmXkexRpqgjx5ngYwfnxBh+1ncMqPenlPbOtIQlHy5jcd+aiB+k/st/PRlK8Sr/iyyxoS
	BhQ1m/49ZVoKEr4/3tb7iPwf8MuCO59wjBqKlWshA69+rt+OvYfun16jMOCk2QsNfxfcwszFOHy1Z
	E8zHhpcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4L09-0000000BH9N-47wN;
	Tue, 07 May 2024 13:37:01 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4L06-0000000BH43-29kb;
	Tue, 07 May 2024 13:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715089010;
	bh=8ZdZRvPpy8p9haCHUSb79/UqGYMNQOBxy8T7ffZURpE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NBtj+wwZR7gCX8gtvs1KtnlHA68KoPewfcROdg5rJqCgBsf2HvCPBW8Thc0+bH/4n
	 qMIM5KrOVjQU0hSrMhYjJW+Vg+cgO6MO8c98CtB719/xPpWorW+tS0MDtIPnJXCo+c
	 ycLA6T25yEsb7hCnkSmspVOmYI407EJ0jGGXRP/Y7ILPR/dJ/c3f/usSJOT8dnsNz3
	 bp70G4RDz58I6ZasmnjL86CzdOni+U/kmtqUgAe1SAZij6racJllxMlilhEsUDT/cg
	 r00etxpcA+3kxKPAOImfmZBNuPGmr3dxZfOMcvVM4GbuvsctAFWznLwLXgZSdX3/P0
	 pspjXnisVPe1g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C67A637820FC;
	Tue,  7 May 2024 13:36:48 +0000 (UTC)
Message-ID: <5397474a-7ef1-4005-83a9-854f77056ecb@collabora.com>
Date: Tue, 7 May 2024 15:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add address-cells and
 size-cells to ethsys
To: frank-w@public-files.de, Frank Wunderlich <linux@fw-web.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Eric Woudstra <ericwouds@gmail.com>,
 Tianling Shen <cnsztl@immortalwrt.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
 <a43a076f-7d7e-4c7d-8be1-45569c7b2c16@collabora.com>
 <6A98D99E-C64E-441F-9496-EBF39141C4BA@public-files.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <6A98D99E-C64E-441F-9496-EBF39141C4BA@public-files.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_063658_821032_C659F1F4 
X-CRM114-Status: UNSURE (   5.70  )
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

Il 06/05/24 18:01, Frank Wunderlich ha scritto:
> Am 6. Mai 2024 14:48:58 MESZ schrieb AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>:
>> Il 05/05/24 18:45, Frank Wunderlich ha scritto:
>>> From: Frank Wunderlich <frank-w@public-files.de>
>>>
>>> Add missing properties already used in mt7986a.dtsi.
>>>
>>> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
>>
>> Fixes tag? :-)
>>
>> Cheers,
>> Angelo
> 
> Should i use fixes tag of binding commit or where dts (-part) was added?
> regards Frank

You're fixing the binding, so, the binding one :-)

Cheers,
Angelo

