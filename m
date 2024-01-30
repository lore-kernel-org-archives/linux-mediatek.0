Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B99C2C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C52TfC7ty6loqa2hXJHf5HkE3Kf8Ix2zQGYy3/Svy+4=; b=f4Fjm5VDw4rC4noIW3D3XxUKo9
	H9OncXLgGB86q8UzRdShBHixDGSSl6enLgbwEykShUy7hnPhQGNjb20FFCW3wOO+xHBB6j7vb63Om
	tDyf5YEjCGSrE/2ixtp8iyb1kkNIhgYjJkZSZCcjyOrHEkRzUB/E49E1ie8eIZH/kxYeXRq0J6hw/
	bQCXXr0m9ZMvtCAyX3dWiCFtVewae0Zf3ZHQV3Gw1bxASxsTfQJCkgPqD2xoZoa3k3D+d6x4r5zka
	66HiWaIXv1zfS5MDcDqLB0pO8D/KAhvb0xPJ5hThDqQdcpRVbd+yGTdnfbwKFnPKWYZ7H7uaugMpW
	ZDqljcEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjaG-0000000Fioa-1GA3;
	Tue, 30 Jan 2024 08:35:08 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUjaD-0000000Fimc-0VjB;
	Tue, 30 Jan 2024 08:35:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706603701;
	bh=ipSQZFRis56pggEB+mlu51XG4bdnhA2PgLn++wV8MzI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Elw8/dTCiBK6tty1acjgrWaZ2rIZZW7BW8zKxbcM1J91nyz7izwXaKaFacPdD1KdH
	 Vu5D1uxLKbB4pjtPJcxy5XcoMgtxFIPm0fwy/Az6SjbD1swppW4J6DzK1+43e5M2yK
	 a9Hkg3K4r2EWmEgNet2ha6Ma1nlA5KQTSsYmFwM6cYES9AMCx39Ef7u+4cAFaCKdd8
	 fS/uAZZ94Oxy1cyppzAerYSUW++15B8fURFxS6kXUPlHRRyt0Hdva0OcK8S2gVWS0Y
	 Y12Gy62x8cKWywo9z3fupNx313PfLhwiwW6LVrMRsuxszJ8lN6i8sghhX7Rgl6dM94
	 Q+ArkV8ouIVKQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D33A23782076;
	Tue, 30 Jan 2024 08:35:00 +0000 (UTC)
Message-ID: <2a918b33-eb95-40d2-9a96-8799e86c66bc@collabora.com>
Date: Tue, 30 Jan 2024 09:35:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: media: mediatek-jpeg-encoder: change
 max iommus count
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, linux-mediatek@lists.infradead.org,
 Eugen Hristev <eugen.hristev@collabora.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, bin.liu@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kernel@collabora.com
References: <20240127084258.68302-1-eugen.hristev@collabora.com>
 <170652472373.127352.5854831299483160743.b4-ty@collabora.com>
 <bf79f44f-5fa7-4341-8deb-605503d33c7c@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <bf79f44f-5fa7-4341-8deb-605503d33c7c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_003505_329822_5C4A73ED 
X-CRM114-Status: GOOD (  10.74  )
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

Il 29/01/24 16:46, Matthias Brugger ha scritto:
> 
> 
> On 29/01/2024 11:41, AngeloGioacchino Del Regno wrote:
>>
>> On Sat, 27 Jan 2024 10:42:57 +0200, Eugen Hristev wrote:
>>> MT8186 has 4 iommus in the list, to cope with this situation, adjust
>>> the maxItems to 4 (instead of previous 2).
>>> Add also minItems as 2 to keep compatibility with current devices.
>>>
>>>
>>
>> Applied to v6.4-next/dts64, thanks!
>>
>> [1/2] dt-bindings: media: mediatek-jpeg-encoder: change max iommus count
>>        commit: b824b32dd5e98221cbe2e8bcccc6fb4134e35fc1
> 
> Hm, not sure why you took this one, as DT-Bindings normally go through the 
> subsystem maintainer trees. Otherwise merge conflicts can occur. Just saying.
> 

That was done so that we don't get devicetree validation issues on our branch;
eventually, there were no driver changes to support that binding change, and
it's there just to validate commit 2/2.

Of course the media maintainers do know about this so there will be no merge
conflict - but yes next time I'll let them pick these instead, it's probably
easier for everyone, besides simply being the proper thing to do.

Angelo

> Matthias
> 
> 
>> [2/2] arm64: dts: mediatek: mt8186: Add jpgenc node
>>        commit: 4c5b46fbf52d52b0f392f0fc3913560bad438e49
>>
>> Best regards,


