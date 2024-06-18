Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1991C2BB85
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 14:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOudxu/mCyns+fCshQmTLpsGS3IgTs9JvVVrQldBxIQ=; b=C2DSBFYetBj+f5iKIbCRS/QzvZ
	6McQSJbfT8wkOIRAkjZlrYCalJpYhW0ioXRYAaMglj+OsPkV2zVS2A9K89NiSJqHmkKwOXst3tG0g
	IhXx/LVNIOUUoXWncxgX4TK4pzLRNSff+LATGdXnJBroolNM6nm5GTJlXWgwJSrnMxQKCh3osKwVe
	OcGdzRtg4E3bmMmcLKdU/2sWXO+O5JJnzCKbX+mFTd9ESGwpiwgBCTojdSZonNBGqfyzCz8xZevHJ
	ANADLvx/4b363SLy5xdt9XaOBhUx72lu1Z02FIRTpQtfEP7sI8xjK5hRkB29oIzELrcDu20+iNjkl
	Pk9UvGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJa3v-0000000FRq1-26KU;
	Tue, 18 Jun 2024 14:43:55 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJa3e-0000000FRhI-3kBL;
	Tue, 18 Jun 2024 14:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718721816;
	bh=AZX3jLOJVEnToDsGXuWNi9vG2dyKEdoxx4/ojvn22zA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jmCoO3SIi6oHxg0EKZjZGZyaCG7LiZU6f1I3SGvaglMFAtJQ7Mwcjjve669cWFx/C
	 bhMWSEfjyebzfgV7SXQ/bklAWdZneVHuDoJci07mY9ZUdgakx25wPRZ/ofUntv/j9W
	 +KatqSgywWZGJwHqZuA5A8Gq/DeDC7JRzIgJvaNwdjHIuohBgyVQYPF2nVRx/yhOLz
	 4x+8CXrg5xhaQkMpoyPOzuMapk2yQJjH24+i93HjAFIexsHpY8ABnw/k7y4njovqdy
	 vuHn983rA/cEnzda4SrkmT3P0Hz9812PJdx6RTU3zPSFUTTCHIoF0MroWxwjXOPoPk
	 YoD1wvA/DtKTg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A25873780629;
	Tue, 18 Jun 2024 14:43:34 +0000 (UTC)
Message-ID: <03662a3e-6a66-4541-9435-98f809f1c617@collabora.com>
Date: Tue, 18 Jun 2024 16:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
To: Alexandre Mergnat <amergnat@baylibre.com>, Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
 <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_074339_097479_E04B0FEE 
X-CRM114-Status: GOOD (  11.22  )
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

Il 17/06/24 10:05, Alexandre Mergnat ha scritto:
> 
> 
> On 14/06/2024 11:31, Mark Brown wrote:
>> On Fri, Jun 14, 2024 at 09:27:43AM +0200, Alexandre Mergnat wrote:
>>> This serie aim to add the following audio support for the Genio 350-evk:
>>> - Playback
>>>    - 2ch Headset Jack (Earphone)
>>>    - 1ch Line-out Jack (Speaker)
>>>    - 8ch HDMI Tx
>>
>> I seem to remember you had review comments that needed addressing from
>> AngeloGioacchino, why resend without addressing those?
> 
> I don't see any comment:
> https://lore.kernel.org/lkml/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com/
> 

Mark, the review comments were on the v4 of this series :-)

I'll review this version probably tomorrow, or anyway this week.

Cheers,
Angelo

