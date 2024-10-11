Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFC4D0D791
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 13:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvLMHXo3BfNUkLw9ytw5UuEB+h5y/vEG9NYRyEiEEL4=; b=R8uOOB6IpDXob7x2eMjmJIW9/O
	PC5hLtrKQdQivjAty5Yku9NAwriV3YfVjknD4DhLriYCFxvY5W2zfzhPbAGb1nQyvjsH2if5jJA2J
	N2mimZ2wq0/FqKdCt55z8o1TmYmXLjByU+Em14SGrnA/Ab/xEWl66XjBUn2HuKjhzpSrCDP7uoeJo
	9jWJ/Whoc620aT1mn1RMcT5eumEXEkoFxsg46a9iU68h7jfaZwC42nFsvIxTgHab6b4RFqIZSzKgN
	iy1RhoZRTe8fEmfon3ZnaLB3s2/tRpEbRFNQaZXfCi3AvO6ul8OdJOPvgQ90/t4xthFFh/dyx8Z6+
	7iCHTU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFsg-0000000GTrO-0oWb;
	Fri, 11 Oct 2024 13:40:34 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFb9-0000000GR3v-06y8;
	Fri, 11 Oct 2024 13:22:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-20c7ee8fe6bso15603175ad.2;
        Fri, 11 Oct 2024 06:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728652946; x=1729257746; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvLMHXo3BfNUkLw9ytw5UuEB+h5y/vEG9NYRyEiEEL4=;
        b=hXp0C4PwfdvnFkg9kjLt6EkT7Aoct4En79anKx3uOrwCIOVfMh39/Q4MGozasQJnPk
         clZqYz9lHiVqbj8YXPbfb/QW0QbiHP+wlIyreu1ZELb3SfRVd+8Txh81QAmVSzz2W82H
         DTL6CPFHl2ku4nnj/VT0KzzgezHLvlZ5GU6OOGCBmnEHtDwu8TUbMldTapjV0HCBzTAl
         QiHxYC3oy+DvC97HC6HgzvsT4jUjlaIfrzzi1IYPQijJp+AfcTxhc1KfIVJ9gfzGY8TW
         JKMzYbVjlWX/njhFmoh3x9gPTH8iZl008GyH6aGSn+xMiO4IMIvaJxisT1HGIGkoW4W/
         u2jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652946; x=1729257746;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvLMHXo3BfNUkLw9ytw5UuEB+h5y/vEG9NYRyEiEEL4=;
        b=L3tQgkFBqTx1x6ANLR0d1EbUSo7J8ZSMJKzEoDKs6bj3rbMhwovzPBfCl69rOD9IyO
         ZkCBNt5ARqQhgisInRfR6guFOAP7xjrpkiXIdJkKebDs3jBYx+YOaQsMqtZKNrjX/CTl
         oqsnpuy1xrXuha6b7NhrZODuEyKd2uRJTUYlw50O+i7zkjZ5pCbTvbxFLjVhTNnZqT0X
         15+L9BkSGTPGTgypOP4GDsWCra6DuPg8Jus4S5vFamtDmv+e+V5TzEHNuqskpnIrTuME
         fnaV5VRIiiJFT54LdRmebV4Z9X+x2Ha69oERKVry9NtQIpEJWeb3O2luxBa1HQF0A7+Z
         BycA==
X-Forwarded-Encrypted: i=1; AJvYcCVMx4T7om5MHjEbu88rpqXc7Mtfu4uB6M6wm8dYppyBpzdVeKNOoLMTmWZcIS/zruJaHeoPS5iCWexKOxu8Mn8=@lists.infradead.org, AJvYcCVodAgQ6NMR/ZV+2KgLV2u7tF/43k5I7TQFgxfosDsw6CjQVZwbJfaAks2V255ajH8Td6DRlaDUXm1S3gAI62QM@lists.infradead.org
X-Gm-Message-State: AOJu0YyTiH9DuOtdvmKnCp0hGdYqqCxDauZp2Y0YQqIs/g9YsGG0Q7ov
	y2w5nNyybIWJvTS3tsARAft/UfkaBMsrpWRuffp8bCsaw639nWdxavGvBPUYNRA=
X-Google-Smtp-Source: AGHT+IHVe8IOBQZmu+MX/aAlR434no8yh5BEm3aOGISvPCP+fwJlanDcT/2aukoQplmi0ob1+Zo46g==
X-Received: by 2002:a17:902:ce89:b0:20c:8fd4:eda0 with SMTP id d9443c01a7336-20ca147b16fmr36891675ad.24.1728652945767;
        Fri, 11 Oct 2024 06:22:25 -0700 (PDT)
Received: from ?IPV6:2409:40c0:11a4:8d8a:687:fb0b:3c04:c809? ([2409:40c0:11a4:8d8a:687:fb0b:3c04:c809])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c348986sm23257035ad.258.2024.10.11.06.22.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 06:22:25 -0700 (PDT)
Message-ID: <7274be28-aefe-49b1-b8e1-dd1c2bad96d0@gmail.com>
Date: Fri, 11 Oct 2024 18:52:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH] leds: Fix uninitialized variable 'ret' in
 mt6370_mc_pattern_clear
To: Lee Jones <lee@kernel.org>, pavel@ucw.cz
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241006131337.48442-1-surajsonawane0215@gmail.com>
 <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <172863776565.3130628.18378710932238203204.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_062227_084674_BFC015BC 
X-CRM114-Status: UNSURE (   8.23  )
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

On 11/10/24 14:39, Lee Jones wrote:
> On Sun, 06 Oct 2024 18:43:37 +0530, SurajSonawane2415 wrote:
>> Fix the uninitialized symbol 'ret' in the function mt6370_mc_pattern_clear
>> to resolve the following warning:
>> drivers/leds/rgb/leds-mt6370-rgb.c:604 mt6370_mc_pattern_clear()
>> error: uninitialized symbol 'ret'.
>> Initialize 'ret' to 0 to prevent undefined behavior from uninitialized
>> access.
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/1] leds: Fix uninitialized variable 'ret' in mt6370_mc_pattern_clear
>        commit: b5a5659aebfffbcddb81abafe042fb4044b6ff9e
> 
> --
> Lee Jones [李琼斯]
> 
Thank you! I'm glad the patch was applied. I'll ensure future patches 
follow the necessary guidelines.

Best regards,
Suraj Sonawane

