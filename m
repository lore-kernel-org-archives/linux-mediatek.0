Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DE1D59F5C
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Dec 2025 02:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C/9LmM89OueAhGVtIcZiWG2cmzx3LX/l4bbSpFTUUDE=; b=gQQyaBJKIpdkL8u4w7fADQE/y6
	zQ1TWU055kmmbn2ERY8medAksd33/wMbT6y38Ge4A5RSxNOJX1PH91MQ737pJqEqyDiFK9FLxbHlQ
	dk1SVg/PJAKVnVzSQDrFmq9I18r/kDLo4aBqsZf1N9L/8VdkWoapiUTj2KQHWBQS8b+NwOh70LaA+
	0qzhoh0pLTcjupSvG0jqouSaBGHZxTKBrCa8Q0cHszx4gU8OrGMTBTp7knEs+Vj9qhLMy7olT7wYt
	bwiIPAbVY5Kl9ILwm/Vntsd3hOL00gdJ3zOSVB3psWxJfrJZMzSLmoL4VellYUIJYxWxd/x8M1GxH
	rChlF7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFhx-00000001Jpq-3j5o;
	Sat, 13 Dec 2025 02:50:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFhv-00000001JpP-2IZ0
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Dec 2025 02:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D13E400EC;
	Sat, 13 Dec 2025 02:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B0AC4CEF1;
	Sat, 13 Dec 2025 02:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765594204;
	bh=3jOIG/uBAXX9Tf3utTWvIsFwIK6BnzDTtVJEWQ5Bevk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e9iT+SGlfCdBnQIerC3vz9B0Sl55FVpjjAxSdcy2rX9+AMzAmMSdsXXALHVqhJvC1
	 xQqWit5Cuc83HWVa7TWyiM+vctaBtUhhs+rxg/DVnR4e1iesIl/OEZo9L473jwaxzD
	 UqHvownywFDvBuqxP6zI7ArnCiVfVgpiucvDJn6Nr6d92AA7iIb0gCm6fHyqbTRfKy
	 GYaaKNnZAKMBrpI0d/IlFqLJqTFznqHxF7R5BvpJrYon4HimFw9oy2KporchywxMvf
	 p9S6b/xoTKI5oaYOazYl9IR8ieD1Yd18SNz2vMVk8aqLzQ14z30+ch0+fnfK5hDVYv
	 19qDYUIZnm1bA==
Message-ID: <191da5b6-209f-4615-b111-40b98687c705@kernel.org>
Date: Fri, 12 Dec 2025 20:50:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: mt76: Fix strscpy buffer overflow in
 mt76_connac2_load_patch
To: Eric Biggers <ebiggers@kernel.org>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <CABXGCsMeAZyNJ-Axt_CUCXgyieWPV3rrcLpWsveMPT8R0YPGnQ@mail.gmail.com>
 <20251205161202.48409-1-mikhail.v.gavrilov@gmail.com>
 <20251213023539.GC71695@sol>
Content-Language: en-US
From: "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
In-Reply-To: <20251213023539.GC71695@sol>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_185007_633194_B4E7DFA8 
X-CRM114-Status: GOOD (  14.07  )
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



On 12/12/2025 8:35 PM, Eric Biggers wrote:
> On Fri, Dec 05, 2025 at 09:12:02PM +0500, Mikhail Gavrilov wrote:
>> Commit f804a5895eba ("wifi: mt76: Strip whitespace from build ddate") introduced
>> a kernel panic/WARN on systems using MediaTek MT7921e (and potentially others
>> using mt76_connac_lib) due to an incorrect buffer size calculation.
>>
>> The error logged is:
>> "strnlen: detected buffer overflow: 17 byte read of buffer size 16"
>>
>> This occurs because the field 'hdr->build_date' is a fixed-size array of 16 bytes.
>> The patch allocated a 17-byte local buffer 'build_date' but used 'sizeof(build_date)'
>> (17) as the read limit for strscpy, causing Fortify Source to correctly detect
>> an attempt to read 17 bytes from the 16-byte source field.
>>
>> To fix this, replace strscpy with memcpy, which is appropriate for raw data
>> copying, and explicitly use the size of the source field (sizeof(hdr->build_date) = 16)
>> to limit the read, followed by manual null termination.
>>
>> Fixes: f804a5895eba ("wifi: mt76: Strip whitespace from build ddate")
>> Signed-off-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>> ---
>>   drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> index ea99167765b0..d2c4c65ec464 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
>> @@ -3125,8 +3125,11 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
>>   	}
>>   
>>   	hdr = (const void *)fw->data;
>> -	strscpy(build_date, hdr->build_date, sizeof(build_date));
>> -	build_date[16] = '\0';
>> +	/* hdr->build_date is 16 bytes. Copy exactly 16 bytes to the 17-byte buffer,
>> +	 * and then add the null terminator at index 16.
>> +	 */
>> +	memcpy(build_date, hdr->build_date, sizeof(hdr->build_date));
>> +	build_date[sizeof(hdr->build_date)] = '\0';
>>   	strim(build_date);
>>   	dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
>>   		 be32_to_cpu(hdr->hw_sw_ver), build_date);
> 
> Tested-by: Eric Biggers <ebiggers@kernel.org>
> 
> Can this be sent upstream soon?
> 
> - Eric

Tested-by: Mario Limonciello (AMD) <superm1@kernel.org>

