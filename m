Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37875C48297
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Feb 2024 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhnWiHGkbSh1RAC8AnTR+qBL7sLZ4Nr4xe4tXE94DAM=; b=R6h352L0nxEK4Dn0dDL0hS2ud6
	7ZgY2rCzYcoesz/lAhUltMrFMyyRKNUap2Vkwz962Tmf8gkBVcJJC5xFCjKg09UlnK+uNsBCuqWkJ
	YNS6RIV3g/zHpgnEaKjrD4HwT+spRjM4eYFDw5iEuu1AEwHZxXqT+T0uDspqNO60nGtBiOX4acMe9
	nJS3h4cVkaJa8luMfTGamL/4xfaw6p/9oVZV9i8YVljzkibyb4cNnyXLrJeGWlIiyvHB/8fJwO7PP
	hNlSpNlI/vHOJF4ciPgYgxHXaqssyDepYnfeYgHK3mAqEHxdXYZYX3TJPotN2sBYsjkVjAweTvjhA
	5hGpvxgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZS4f-00000004fsB-3ntB;
	Mon, 12 Feb 2024 08:54:01 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZS4b-00000004frj-3NoY;
	Mon, 12 Feb 2024 08:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707728036;
	bh=7piWbCGcMV8jXNFfjDe8eSN9IgwzXBxHsFlz7ti4esk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1178iJRLXbbYR8AYKbv5sFIihYAc/ahj51fIrhXgT3ft6izjDupE9LvnKlJxm4Bfp
	 0VbEIFSQRHHqNZalSc7Vb5i+ezl17azKyJGxU3umGhSgPCi2ELmcmjxUUy+nW91CJ1
	 H346mHIjZrGLmQRur2D3DuotorEFq31G43LCRFlwQ5mCjlted4dJrqMv8yfNDRu9/Z
	 7036VddkvHloZF6ysL8jnJklrsPLJUbl8k2gmzpj6nXd8BQHDVVrLX2Q6FsJRdwxsi
	 7yjn/kmQdhpbIDymTnafGQ25UGYQsoJPoZ1r8oyaP67oHkiAm7HTVGLQBmPr1NevEG
	 IawYeZ/SLVXJA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 66A5D378203F;
	Mon, 12 Feb 2024 08:53:55 +0000 (UTC)
Message-ID: <cd1350d0-6333-4519-a811-8413080ac92d@collabora.com>
Date: Mon, 12 Feb 2024 09:53:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] dt-bindings: thermal: mediatek,thermal: document
 AUXADC 32k clock
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Daniel Golle <daniel@makrotopia.org>,
 Sam Shih <sam.shih@mediatek.com>
References: <20240209055203.17144-1-zajec5@gmail.com>
 <17d143aa-576e-4d67-a0ea-b79f3518b81c@collabora.com>
 <ddec28a5-8d65-4e52-bb3c-9587acf7bca1@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ddec28a5-8d65-4e52-bb3c-9587acf7bca1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_005357_994372_0F8511F3 
X-CRM114-Status: UNSURE (   9.86  )
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

Il 12/02/24 07:11, Rafał Miłecki ha scritto:
> On 9.02.2024 10:13, AngeloGioacchino Del Regno wrote:
>> Il 09/02/24 06:52, Rafał Miłecki ha scritto:
>>> From: Rafał Miłecki <rafal@milecki.pl>
>>>
>>> SoCs MT7981 and MT7986 include a newer thermal block (V3) that requires
>>> enabling one more clock called AUXADC 32k. Require it in binding.
>>>
>>> Cc: Daniel Golle <daniel@makrotopia.org>
>>> Cc: Sam Shih <sam.shih@mediatek.com>
>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>>
>> So, I've made some research on this matter.. and this is a NACK.
> 
> Well, I can only thank you for the research.
> 
> Let's drop this patch. I'll sort out the rest later.

Thank you for bringing that up - this was necessary to clarify this and
to actually make both of us aware of the mistake in the device trees that
we have for those SoCs.

Take your time, btw, you're doing a great job.

Cheers,
Angelo

