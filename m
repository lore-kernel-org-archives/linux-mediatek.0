Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34324EE57C5
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Dec 2025 21:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xtR7PK39BaSx2GpuhvAfss4ZTutnP9LImpMPJNr7WtI=; b=uHfaE2rFF9HYjlH0dgCrf/DucF
	IpBl/gRD+v/gkAHliPzJDkgaZ3CIA4SndvPut60nlqd5GsiYF8HK5+SUnoHUknhp8ssU/er/+zHw8
	1xQzgv0eSck4XqYQnp6/MVNqxUEGBRqJE2sLq5zbZ2lGsd8SAhkIcHsLz0gLgU+IzSE3C7tUREB6z
	0pC3sBQqYR0u4KryCegZ8cK62BZkFoVjdhJNgjGOB3lMVMqpP3zHymGYu0kR7hEIMHGGudfoGstoP
	V0Pbc1XSItA8XKVeBM7xwYYfx53ExCq8HVgWJxNN8+Z9sjUjPXlaTquHEan9h3SpELlWX5UvmuMzt
	iwMi/wpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3Qp-00000006Kyu-150p;
	Wed, 31 Dec 2025 21:08:35 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vb3Qm-00000006KyE-3EO0
	for linux-mediatek@lists.infradead.org;
	Wed, 31 Dec 2025 21:08:34 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-44fe903c1d6so2435160b6e.0
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 13:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767215311; x=1767820111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xtR7PK39BaSx2GpuhvAfss4ZTutnP9LImpMPJNr7WtI=;
        b=DY9dY3++3sSfnWRhK7wZMT7b/ybURL64hCQyYlNLg0T65Zdo6khU1zg2GnOaa0CtAb
         P3gRZCr5H3gbnHc6sKeYmX3F8XPYZbQcY/wx5FABgGh0+CLV3x3xv0/j8rvh2qVwkRTN
         7IV9wQ55sQJe2tKxHG4YW2T+l6t8Z7aYlgMZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767215311; x=1767820111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xtR7PK39BaSx2GpuhvAfss4ZTutnP9LImpMPJNr7WtI=;
        b=Q7Slr91IblQmeJRztRpg/Is9p8knr+rxG877xnPzZSSpZEk4oK+0XR36JLOTkBGlai
         OOxaNLitS5bXR3IlSsFoEdo69j43oAcEvm31dB8u1nb1AEHaqtgEWkz3UHtALTlZMU5g
         U3K2sbNBj7te/3zVLT5zxuqCNcLAHUXmbuI3+vYnbmfFehidRXvGUDXWI97tP2IrkbRv
         CQl61Dcco7G0hsgE1s9MBgId+hQc3wWal0w4OHgRKGgeavJmP7p7Kxlkf8PKNvxQ7NV1
         Ye3CUcNdRVqt1nROr8oXzVN3Efgz2IBaWCmsP+cWulEETUaoNGxFPm0H3dOSZfKP3k77
         vt/w==
X-Forwarded-Encrypted: i=1; AJvYcCUMmNPIy+U/xe7vq4lJCT5U+Oe8lkBKdSThNH9OO9EOII1H9RFdYwOFyNNmUt6gBxx26iElWzBLp+wKydSjIw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFl9b8AMFI5hAep5ZFb9bZPwmgwi4Gw9wCRiB/t3I3EDvMBORr
	ts5UGnb0aPZa+PuqpEmBD2qYbEzS+CLDD8p7Q1HAgzIKaLsxbcLmpUa/J9QAQf6IjAs=
X-Gm-Gg: AY/fxX4jn2e4dA5DhyvhO6ZQLUPyqQEtHhV6F3qN80f2csG4w/3aH553MBRyiejTS9+
	jpVotNbHRGVp8X3nxDjY/VSqD8xhivRTIhO7bm5DFFDkrTlOYOFnCbS6wZ98Eet2uc5pp2hmZZR
	v0+9xz9uRFOYpZ9Jlte/WGE79qDTtwsBB59yWSmTtI+hH23cqQuXHUqiBv80KIW3O3825RSsvHO
	ch65A1hFHP/r97ZXHGubil97KBhvOzryWau1+V1SJcANBX5G/dJGVFjy4sMC3XqC9yyXczE9ieW
	hpPSCf0+gNdGDB9RrM5Sm8kFjZLlJakAv3m1zrucG1ot10PPQJDZcGAJ8q6bjA+0M1/JR1UH7dz
	+pIL8AbCGgFL27bBKxd8iK3Ue8ngslI6ZHfmcngZhHbioQGOuHEgmQkyB5YYE1wKe9uePzlr48t
	0kAze7CQjrm/Lrh7mJu7Vo2VE=
X-Google-Smtp-Source: AGHT+IHTwHn1nXDjbjmhskjWx+MgiaHwYI6WYS1jGtnZhB7g8+LiP9lF5g92eNpfucMrdW9R4flOrA==
X-Received: by 2002:a05:6808:1526:b0:450:3ff9:f4dd with SMTP id 5614622812f47-457b20b7730mr18285141b6e.24.1767215311322;
        Wed, 31 Dec 2025 13:08:31 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4598c356623sm12481094b6e.2.2025.12.31.13.08.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 Dec 2025 13:08:30 -0800 (PST)
Message-ID: <8b3d207c-76a2-4312-a149-724e55fbd0cb@linuxfoundation.org>
Date: Wed, 31 Dec 2025 14:08:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Linux 6.19-rc1 mediatek mt7921e broke badly
To: Eric Biggers <ebiggers@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: Matthew Schwartz <matthew.schwartz@linux.dev>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 Mario Limonciello <superm1@kernel.org>,
 Johannes Berg <johannes@sipsolutions.net>, quan.zhou@mediatek.com,
 Felix Fietkau <nbd@nbd.name>, lorenzo@kernel.org, ryder.lee@mediatek.com,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, shuah <shuah@kernel.org>
References: <d7f3b00d-beec-41f0-b157-7cfb871f9a46@linuxfoundation.org>
 <756e3f65-b2f2-4da3-985a-17754a7a872d@t-8ch.de>
 <CAHk-=wjO-7uR5HBi-MFnkxAxjhpgfbAQ+HCMKPiXFVwM+AJ7tA@mail.gmail.com>
 <6fc04df5-b753-4b2d-b978-0e59a7f48ff7@linux.dev>
 <c1304430-dd7d-437b-8744-70af9ca85c0d@linuxfoundation.org>
 <CAHk-=wh6WP0Wq=rbC2Md6vsFrV-+nvDjxgfx9NpMzUmVFNkJ9A@mail.gmail.com>
 <20251231015712.GA2299@sol>
 <fdebed60-264d-4f05-9423-618bc3ec6d6d@linuxfoundation.org>
 <30d14c51-3325-49be-9510-43f4661ff6c4@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <30d14c51-3325-49be-9510-43f4661ff6c4@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_130833_069839_79217E4E 
X-CRM114-Status: GOOD (  18.95  )
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

On 12/30/25 21:07, Shuah Khan wrote:
> On 12/30/25 21:00, Shuah Khan wrote:
>> On 12/30/25 18:57, Eric Biggers wrote:
>>> On Tue, Dec 30, 2025 at 05:27:13PM -0800, Linus Torvalds wrote:
>>>> On Tue, 30 Dec 2025 at 15:57, Shuah Khan <skhan@linuxfoundation.org> wrote:
>>>>>
>>>>> I would recommend reverting f804a5895eba instead of trying
>>>>> fix it. Then find a better way to eliminate extra newline that
>>>>> shows up in dmesg when firmware build date happens to have
>>>>> a newline.
>>>>
>>>> Yeah. Let's revert it.
>>>>
>>>> And the way to fix the extra newline is trivial: just remove it from
>>>> the "dev_info()" format string.
>>>>
>>>> Our kernel printing logic will add a newline for the next line anyway
>>>> if it is missing (unless somebody explicitly uses PR_CONT).
>>>>
>>>> Can whoever saw the problem confirm that just a revert and a "remove
>>>> \n from that dev_info()" fixes the output for them?
>>>
>>> That works for me.  The revert by itself makes the FORTIFY_SOURCE crash
>>> go away and reintroduces a blank line in the log.  Removing the \n from
>>> the string passed to dev_info as well makes the blank line go away.
>>>
>>
>> I just sent the revert. I will try removing \n from dev_info()
>> later on tomorrow.
>>
>> My quick trial still showed extra line which didn't make sense
>> to me. More trials have to wait for tomorrow.
>>
> 
> Hmm - there are 3 places that print build_date in  mt76_connac2_load_ram()
> 
> 3022         dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s\n     ",
> 3023                  hdr->fw_ver, hdr->build_date);
> 
> 
> 3051         dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s\n     ",
> 3052                  hdr->fw_ver, hdr->build_date);
> 
> 3127         dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
> 3128                  be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
> 
> The last one prints %.16s and other two do %.15s - is the fix simply
> changing last one on line 3127 to print %.15s - this avoids printing
> the extra \n?
> 

The following change fixed the blank line problem on my system.

Mario, if you want to send this patch after testing on your system,
let me know. Otherwise I will send it.

==============================================

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index fba7025ffd3f..0457712286d5 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -3019,7 +3019,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
         }
  
         hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
-       dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s\n",
+       dev_info(dev->dev, "WM Firmware Version: %.10s, Build Time: %.15s",
                  hdr->fw_ver, hdr->build_date);
  
         ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, false);
@@ -3048,7 +3048,7 @@ int mt76_connac2_load_ram(struct mt76_dev *dev, const char *fw_wm,
         }
  
         hdr = (const void *)(fw->data + fw->size - sizeof(*hdr));
-       dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s\n",
+       dev_info(dev->dev, "WA Firmware Version: %.10s, Build Time: %.15s",
                  hdr->fw_ver, hdr->build_date);
  
         ret = mt76_connac_mcu_send_ram_firmware(dev, hdr, fw->data, true);
@@ -3124,7 +3124,7 @@ int mt76_connac2_load_patch(struct mt76_dev *dev, const char *fw_name)
         }
  
         hdr = (const void *)fw->data;
-       dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s\n",
+       dev_info(dev->dev, "HW/SW Version: 0x%x, Build Time: %.16s",
                  be32_to_cpu(hdr->hw_sw_ver), hdr->build_date);
  
         for (i = 0; i < be32_to_cpu(hdr->desc.n_region); i++) {

========================================

thanks,
-- Shuah


