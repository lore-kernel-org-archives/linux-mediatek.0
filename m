Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C76CC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jiqqD+HJrm5EG4I770vjKlUjnmFFDbpbxUea6nfqRjU=; b=G8dEjCW+UvzoRNCrcrJVokjhRj
	rW9N3tViv7erNrUu5OUWUuw8+9XqEnr/abV8EfztEJL0XFDZR6oilXJ9D2KKQ4gsvI9lga+bXBG2+
	0u3XrPK0WBJTl6w0gXRC60VRqlfvVqwpcYNLbX7vvxmbZZ5JwE/DXYqARMu9f+MzkplQVJUReOczn
	bWN0qoFNTF4gMaQCr6v2MP9/f7Gq+Ep9261T5/bPAY9eKSIloDTIEMCHBT3gn4Z52r5Oo1jC0SbIr
	BBFcNLGDTYtlbqNcJBhDz8yeTk/qf1OvtIXWUDHLVs7p8GfmJbBYxSDEhQxMZYL+VnpjQb05qyiAZ
	ERfovTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYVs-002fMF-GL; Fri, 24 Feb 2023 13:53:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVYVb-002fEA-9i; Fri, 24 Feb 2023 13:53:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C76CC1042;
	Fri, 24 Feb 2023 05:53:49 -0800 (PST)
Received: from [10.1.38.16] (e122027.cambridge.arm.com [10.1.38.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454093F71A;
	Fri, 24 Feb 2023 05:53:04 -0800 (PST)
Message-ID: <8c20f01a-2123-b76d-bf70-bf75aec9efb8@arm.com>
Date: Fri, 24 Feb 2023 13:53:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 08/11] drm/panfrost: Add the MT8192 GPU ID
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, robh@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
 <20230223133440.80941-9-angelogioacchino.delregno@collabora.com>
 <CAGXv+5Hzin_5aTqMRRztWbDR64z6_oFOx2hUVnpJBvk9xDzrfw@mail.gmail.com>
 <61ebdd1a-2737-0516-08fd-3b9aa0ddd4fe@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <61ebdd1a-2737-0516-08fd-3b9aa0ddd4fe@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_055311_482395_519D0C7C 
X-CRM114-Status: GOOD (  20.28  )
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

On 24/02/2023 13:08, AngeloGioacchino Del Regno wrote:
> Il 24/02/23 11:06, Chen-Yu Tsai ha scritto:
>> On Thu, Feb 23, 2023 at 9:35 PM AngeloGioacchino Del Regno
>> <angelogioacchino.delregno@collabora.com> wrote:
>>>
>>> From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>>
>>> MediaTek MT8192 has a Mali-G57 with a special GPU ID. Add its GPU ID,
>>> but treat it as otherwise identical to a standard Mali-G57.
>>>
>>> We do _not_ fix up the GPU ID here -- userspace needs to be aware of the
>>> special GPU ID, in case we find functional differences between
>>> MediaTek's implementation and the standard Mali-G57 down the line.
>>>
>>> Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
>>> Signed-off-by: AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>
>> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>>
>> As previously mentioned, MT8195 Mali G57 has minor revision number 1.
>> Do we need to handle that?
>>
> 
> Maybe something went wrong while sending the reply to the same question
> on v2?
> 
> Anyway, from what I can see on my MT8195 machine, it works fine without
> adding
> any particular handling...
> 
> Alyssa, Steven,
> are you aware of anything that we should consider?

The minor revision means that the set of HW workarounds might be
different. Specifically it appears that "BASE_HW_ISSUE_TTRX_3485"
applies to G57 ('Natt') r0p0 but not r0p1.

That particular workaround is a horrendous "dummy job" in kbase and we
don't have an implementation in Panfrost. However Panfrost also doesn't
(yet[1]) proactively SOFT_STOP jobs so is also unlikely to be affected.

TLDR; Minor revision 1 has a HW bug fixed, Panfrost isn't affected by
the bug anyway.

Steve

[1] It's been on my todo list for a while to look at improving job
scheduling, but to be honest I doubt I'm going to get round to it with
Panfrost, and PanCSF obviously changes the job scheduling anyway.

> Regards,
> Angelo
> 
>>> ---
>>>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> index 6452e4e900dd..d28b99732dde 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>>> @@ -204,6 +204,14 @@ static const struct panfrost_model gpu_models[] = {
>>>
>>>          GPU_MODEL(g57, 0x9001,
>>>                  GPU_REV(g57, 0, 0)),
>>> +
>>> +       /* MediaTek MT8192 has a Mali-G57 with a different GPU ID
>>> from the
>>> +        * standard. Arm's driver does not appear to handle this model.
>>> +        * ChromeOS has a hack downstream for it. Treat it as
>>> equivalent to
>>> +        * standard Mali-G57 for now.
>>> +        */
>>> +       GPU_MODEL(g57, 0x9003,
>>> +               GPU_REV(g57, 0, 0)),
>>>   };
>>>
>>>   static void panfrost_gpu_init_features(struct panfrost_device *pfdev)
>>> -- 
>>> 2.39.2
>>>
> 
> 


