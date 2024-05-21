Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D02C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 07:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hQl9ca9x9Gt/s85I+qoZtIArF89HUSbPwf7SXujmzI=; b=zaG6RxKFligws+ctVap5Y77tmx
	rZHNzZBwWoy4ZH9QKCOgIiAqzFUtCDrQi0+nejiLqXRY6EoPf3sNTAZv4FUdBJWWkFjFNts7oY7sl
	Zt4ps+6x8MryyPZUcnlbGJ6CNsBqTpEl6nT+Ic5luTkp4OvgYGZvrB0mBOoVvKcfXJ/8GQByu34pB
	0/v6kOd5BEw0CrIjkrHF5n8Axujgcz9qeA3+J7h44HnBmK+8rIN1GDr8r5mAFS493zDzmGhnXUYrk
	eE0lA3oivDuPRBRKSR6p634afTO0DQuf9BUb8ClMei72xcP4vaoQh46eUxlbqyYxS8ljXg7mDNqVu
	JjPWytZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JZ8-0000000GXvu-1suN;
	Tue, 21 May 2024 07:05:42 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9JZ5-0000000GXtz-0Hsx;
	Tue, 21 May 2024 07:05:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716275137;
	bh=nS/Dr2W3vGanwW9ifFd+bOFrHEwvBrs3b1sW5lLV82U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qm0vO6hSCRlLszYJes6vtZsP0qVLDOWOlMVSXIEkovjNeL4Dq+Cc+8MXdXP7o9Ngt
	 dEgAlzV+KObOGcAdS/6I44aVkdi+dzENzBC+C8438w5ZDIY3qhWEdam1o+AodVwzjv
	 LXMakGJRGQchKxC8P/1xweTSAiUSv5m/wIebY9OQ7ZoehiIA9kMjvWzZlPc043uEtL
	 I9WPKXT+MUL2ESyAvmJo630D/7kottF1JQB7ihruCKvj6sjbQnA/ZmNcTgV2aj4M44
	 yBEOL1WXeyBsLFdR4/W1aZOQopqDRLXK/J8L1Xq3XC3FW2nsXiT1XtAj/HU/gghFaX
	 X7t22RCH7dZsQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0B0A378202E;
	Tue, 21 May 2024 07:05:33 +0000 (UTC)
Message-ID: <9ab7eb04-d4c6-4a79-87cb-2d21e4bfa9c4@collabora.com>
Date: Tue, 21 May 2024 12:35:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] drm/ci: generate testlist from build
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-3-vignesh.raman@collabora.com>
 <c7e0a8b1-5be6-460b-b489-2ab5a8248d32@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <c7e0a8b1-5be6-460b-b489-2ab5a8248d32@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_000539_269833_D7790EF8 
X-CRM114-Status: GOOD (  14.47  )
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

Hi Helen,

On 21/05/24 01:54, Helen Koike wrote:
> 
> 
> On 17/05/2024 06:24, Vignesh Raman wrote:
>> Stop vendoring the testlist into the kernel. Instead, use the
>> testlist from the IGT build to ensure we do not miss renamed
>> or newly added tests.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>
>> v2:
>>    - Fix testlist generation for arm and arm64 builds.
>>
>> ---
>>   drivers/gpu/drm/ci/build-igt.sh  |   34 +
>>   drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>>   drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>>   3 files changed, 39 insertions(+), 2765 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/ci/testlist.txt
>>
>> diff --git a/drivers/gpu/drm/ci/build-igt.sh 
>> b/drivers/gpu/drm/ci/build-igt.sh
>> index 7859554756c4..e62244728613 100644
>> --- a/drivers/gpu/drm/ci/build-igt.sh
>> +++ b/drivers/gpu/drm/ci/build-igt.sh
>> @@ -3,6 +3,30 @@
>>   set -ex
>> +function generate_testlist {
>> +    set +x
>> +    while read -r line; do
>> +        if [ "$line" = "TESTLIST" ] || [ "$line" = "END TESTLIST" ]; 
>> then
>> +            continue
>> +        fi
>> +
>> +        tests=$(echo "$line" | tr ' ' '\n')
>> +
>> +        for test in $tests; do
>> +            output=$(/igt/libexec/igt-gpu-tools/"$test" 
>> --list-subtests || true)
>> +
>> +            if [ -z "$output" ]; then
>> +                echo "$test"
>> +            else
>> +                echo "$output" | while read -r subtest; do
>> +                    echo "$test@$subtest"
>> +                done
>> +            fi
>> +        done
>> +    done < /igt/libexec/igt-gpu-tools/test-list.txt > 
>> /igt/libexec/igt-gpu-tools/testlist.txt
> 
> Just a nit, could you rename the file to ci-testlist.txt ? Since 
> test-list.txt and testlist.txt can be easily confused.

Sure, will rename it. I missed to add the generating testlist print also.

Regards,
Vignesh

> 
> Regards,
> Helen
> 

