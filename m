Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC54C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7POnChWWNfj1JuMYjOv7pJ6CXDSIUZTDJCjNLOyw6tw=; b=BA0UKyG0cZp3654Stu0h+3eT3f
	4tCoTAdECQW5Bszcq9UMIctk2/X1T6E9pMoIzVafPrF+yhV2g1a05vQ5mg8aDvCMQDeUK3rvhrMHZ
	tnMoxe5EVFkEztt52znKj9Ry2kwce+UpxiOMZbXxOhqcg8X4NCKBzpuzJIA9lyDzEj+EXe6w2RBkT
	l+wOHd3P8N5bTh+JFm4VcJNpi+wXsmtvgvwMOOPsivS3pvzlko8GzD93p5/ZZxAoVzYmOViLkps70
	8gM7Upw+tPIDyXa1dR7KRRSwrBSrEEQaNdnGhBI+mKAydC25T8GXZUOAd8+/J404eQOPUrC9hi0m4
	hkG2OZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVnw-00000008NP3-2KnO;
	Fri, 08 Mar 2024 08:42:12 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riVns-00000008NNA-031D;
	Fri, 08 Mar 2024 08:42:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709887326;
	bh=aSDQoDL8eQHMCL+EPyMT7iv12cCuougp3ULYiz+WB5o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ycj46DCLf3aJ8WPPc72qUc/RYJsoQMPIXudTGC3JsHzUWzONBYjCX1sD3gSjw6SXX
	 9aGOu3aktbdVjixjOTndyUIbXeGh3EROmWG/oM00efvH0sbZ32lKvaDkK5CyKCSAxw
	 7V3/7HqL4XYgNr7LSnEzCWdd2MsBPJOj6rAtBZAvz5ck9fOjk1F4zpOL3/xGYAYmQe
	 ZFsHuZdRMjQkamRhwYLFkTGEH6MRiSmUDAF54wQNme2vBBetNdXHFs++8pnUF3zqip
	 9NsCONNnzEtXQ/LJ2j9CYRW4R9MGD6dHEhclx/CLHW/DdpBbG2oePel5ZHjJ9sn5XD
	 oWn9ecemGdQew==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 16CC737813CA;
	Fri,  8 Mar 2024 08:42:06 +0000 (UTC)
Message-ID: <a011de50-3a67-49ae-a0eb-14dfb768efe7@collabora.com>
Date: Fri, 8 Mar 2024 09:42:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mips: dts: ralink: mt7621: reorder serial0
 properties
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <CAMhs-H_eUKm7C40oCzuKwwEMZAcOJ-g4MghAfkGAmxRM0AXPUw@mail.gmail.com>
 <20240307190408.23443-1-justin.swartz@risingedge.co.za>
 <20240307190408.23443-2-justin.swartz@risingedge.co.za>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240307190408.23443-2-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_004208_287100_94C4159D 
X-CRM114-Status: UNSURE (   6.13  )
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

Il 07/03/24 20:04, Justin Swartz ha scritto:
> Reorder serial0 properties according to the guidelines laid
> out in Documentation/devicetree/bindings/dts-coding-style.rst
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



