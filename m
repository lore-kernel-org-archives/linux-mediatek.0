Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B00606A31C
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 14:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C3Gu7j+g;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=qD6dL8zB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Qr2nUABmn5h/YBOq4rfdc5mzXb4rIjc5Q4wwfmjeF/o=; b=C3Gu7j+gy7nq+W
	RIrEH7Fy2puUFI10mU2Ii7m07AAE2D4nw512Em9MVjy21vRQaaeQ+cpzw6GYyDxXXl5VuK/Apr+cL
	cPzK7DoBEtyv+FNqEEG4Sd2oBcCOnKoGOhZiB6oOwpAcx688p0ptLLvEj2SGmn9rwEw1Bdna9orvb
	Hgf6F8EsDiaOwcO7zYzXQnvW7j4WTmMNutdE1fTx0Gook4cZVyPPWGojQXI8eugXVGYNa/I7KOLqR
	/8ylUToKxQMvQKNCFK8k3ZHFhkxKgKQAa7FLdlL2dsAVaJlqY1FXR5FxUcWEVQFv9qFQ9wha3CZ7X
	lm46h6TO7ClluWg9ciUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK8Y-000000067sH-0KBD;
	Tue, 17 Nov 2026 14:26:18 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTK8U-000000067qn-1qNp;
	Tue, 17 Nov 2026 14:26:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794925572;
	bh=Y8zZspvVCHyV544/HTl+z4+atP6mcZ4w51n6InGt6FA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qD6dL8zBJa/8aKYElbLg/C0j/T6uzmQiUwv9Iy/FwdtkoZMnRPA0tR1Tr7NkEtQZF
	 3qPsvf3dTZ87+6HVFrpI8vn/0ROgE3DUG9o44xFLzzvIUsXLdaKAt7NbHToKtZezCu
	 tnMvXEVNW2MH4VsnJwiUqmyU5r4moZO028h//j0nFVzNAS5I0JI9xRPvcd1GkeY9xM
	 /7KM2ZGjVl7TPs+O1tfBdO8F10XELQ6cjiChADQHpvvyTip+UZBQboIH7PMUuJ7TFN
	 Y3XZzLSqBQheTb1R7G1KW9Kl4f9t6QMQMhGeKXie8onu/6g6ftQ++Zds96uukdP2Ce
	 LPwvM1iRzmA1g==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D90C117E0069;
	Tue, 17 Nov 2026 15:26:11 +0100 (CET)
Message-ID: <a7d13845-5f9e-4337-a7d5-f01988c03f87@collabora.com>
Date: Tue, 17 Nov 2026 15:26:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: Akari Tsuyukusa <akkun11.open@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <avxXNp5xEbczbb1y@buffalo-ssd>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <avxXNp5xEbczbb1y@buffalo-ssd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_062615_146252_0CC26026 
X-CRM114-Status: GOOD (  15.10  )
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

On 11/17/26 15:16, Akari Tsuyukusa wrote:
> Hi Krzysztof,
> 
> On Tue, Nov 17, 2026 at 02:05:57PM +0100, Krzysztof Kozlowski wrote:
>> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
>> approved by Devicetree maintainers, because they were never documented
>> as actual ABI.  Drop them, because no new custom aliases are allowed for
>> years now.
>>
>> This might break users of this undocumented ABI, so these should be
>> updated to use only documented and approved ABI.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> You mentioned 64-bit MediaTek SoCs, but the same class of issues also
> exists in 32-bit MediaTek SoCs under arch/arm/boot/dts/mediatek/.
> For example, mt7623n.dtsi has rdma0/rdma1 aliases, while mt6589.dtsi,
> mt8127.dtsi and mt8135.dtsi misuse "simple-bus" for the "clocks" node.
> 
> I hope this push for correctness doesn't lead to any regressions.
> 

As I said, picking this right now would break all MediaTek SoCs, but that patch is
just a way to get a discussion started - don't worry, noone is crazy here, this
will not get merged until a decent solution that avoids regressions is found.

Cheers,
Angelo

> Best regards,
> Akari


