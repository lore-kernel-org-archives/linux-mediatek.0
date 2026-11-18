Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E684606A32A
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 12:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BOb9qoXr;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=J6xF+Kr0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m6c/qR56253imWhk36Gac7berOasezUTnHhNbfxYNQs=; b=BOb9qoXr1iJWI8
	/dsWZ1/hBXFSPTOSIoCI3A9b4zCLx6hOcraLYgtzcD9CBNIqxtECAN51nUC/YKPc/uaar3J7Wc1JM
	2H6KbGQtjXH0a1wX5TpWfrW9najE7hqm+B95TUc5ZlyGV3IoxFIWE0UqpHa9Z8XxqBuftH13RJ8zW
	RXz/AAe5ReVxgIZFBcwedZ6kegBL0r2oPpibRfRvfifZTaU2kWSy9xpWnMMeF2YRuwCqOyrcxVSBa
	ZGTHxlZI3jQW3u1DNi96ZZcIIVUOmLcvXdLtWHsJPFX7RwY2z1CeBAMkGbcAV0K5K9El1k0eDfue2
	tBZZMk9TN16GlFey/PhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeoK-00000008rBo-3JKu;
	Wed, 18 Nov 2026 12:30:48 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTeoH-00000008rB3-2Zdi;
	Wed, 18 Nov 2026 12:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795005043;
	bh=OrEqqezQnIfFeKtDs9yFRb0TBIDDG9P+MV5KTuORKgA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=J6xF+Kr0e06RAg6AcR/bhID/hpKlAsFDZ3vGBMYsF1DG5vepCedI4aFuAGOxfK1TK
	 z8rtXYQuMimFfItjbiBz3XpHDwND6lj3um2VekcpWy59DG7Bb5aVeXTJuGfURRgZQw
	 tyxn/wJfMzaypwoG1xRi/mr+sGWDVqxVptc2XAES6Nn7GqXMm+eJtjGpPip4IvChLQ
	 yqda27wlsuZpe4DRGIK7UF32JDAZGjjFph5YFtmF5fzZbpaSq3iPPWg8CfgM7ZNnbb
	 i8uEXKd3z1SGE+V3/ejDI9dfBiG3EHvrCTHcbUhkxWzVrRwhiXR4QIqns5o+4ZE2fx
	 JG6r0/f8W3Nsg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B43F917E052F;
	Wed, 18 Nov 2026 13:30:42 +0100 (CET)
Message-ID: <68df102e-66e0-4049-9ffd-8e2746db8403@collabora.com>
Date: Wed, 18 Nov 2026 13:30:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: Remove undocumented, unapproved
 aliases
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261117130556.234785-2-krzysztof.kozlowski@oss.qualcomm.com>
 <3882ec4d-9f99-4419-8914-19c3a2a3cc46@collabora.com>
 <96e3cc39-d10b-4743-bd9a-d683a91fdf34@oss.qualcomm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <96e3cc39-d10b-4743-bd9a-d683a91fdf34@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_043045_845538_5A355F19 
X-CRM114-Status: GOOD (  23.99  )
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

On 11/18/26 13:09, Krzysztof Kozlowski wrote:
> On 17/11/2026 15:06, AngeloGioacchino Del Regno wrote:
>> On 11/17/26 14:05, Krzysztof Kozlowski wrote:
>>> The ovl, aal, color, dsi, gce, rdma, split and other aliases were never
>>> approved by Devicetree maintainers, because they were never documented
>>> as actual ABI.  Drop them, because no new custom aliases are allowed for
>>> years now.
>>>
>>> This might break users of this undocumented ABI, so these should be
>>> updated to use only documented and approved ABI.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> That'll just break everything.
> 
> True, almost everything. I suppose few aliases are not used, but rest are.
> 

Would still create regressions, and that's not acceptable - the cleanup can be
done only - and exclusively - after addressing the situation elsewhere so that
no regressions are seen.

Still, a question mark remains on "new DT on old kernel" compatibility which would
miserably break - that may not be something to care about in this case, and I don't
think that it's time to start thinking about that.

> Well, it's a start of a discussion. :)

Yes, I like this spirit.

> 
>>
>> I do have a mediatek-drm restructuring series that is partially resolving this
>> situation, at least for some SoCs it's getting 0 and 1 hw instance id dynamically
>> recognized, but with some caveats that could be unacceptable (as in, if 0 is
>> disabled and 1 is enabled, 1 becomes 0, so it's not actually resolving anything
>> for real, it's just making it tick right when stars in the sky align in the
>> right way, which for some SoCs is reliably possible without side effects).
>>
>> In any case, all of the ones that have only instance 0 (and all of the instance
>> 0s) can be removed even right now already (still needs some testing to make sure
>> that there's no regression), but everything else can't, at least not until the
>> whole restructuring thing is merged as that'd break things.
>>
>> Worst part is we have two new SoCs (MT8196, MT8189) ready to be upstreamed here,
>> which took almost a year of development... and it also does rely on the aliases.
>> I was in the process of slowly cleaning up those (as I said, there's already a
>> restructuring that makes things a little better in this regard), but at this point
>> that'll need to be done with the highest possible priority.
> 
> That's unfortunate and still new DTS/DTSI should not come with these
> aliases.
> 

Indeed.

Since conversations went on in the other thread, though, if we have to spend any
other word on this topic, I think it's a better idea to continue on the other one
( 94ed1340-94bd-49ee-ba31-9bb63164c89a@kernel.org ) and let this one go.

Cheers!
Angelo

