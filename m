Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A89C77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 11:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVO0qM8iny3pLIi5PHimH7o1JPiN4k7sgb3Ms5ETmWM=; b=ahdDS2SVUvRNBehZOKe/05HSxV
	VJqBiNLXeMkauAVNuOsff1V6jgkslkAq7VIC+8aNFJP3QMyNN09qV8z7d+++y5UMEnw2YWUibdDmp
	Ez2XXKTh46651BmZduQDaiA28+8IZWGdIvTGf2G9fhg3F7miZlAF9CLgl9Mab9Dz6LGpi3J+2MT5B
	A1vr5TLMZPeKMaaTDvYJraWoQwSOE/BzCAVEt4trylphJ2kUskbIOctbmzb9bechJTI6dnNxwQAtn
	HM0FU2lvV1uwwDDNBHinFn6zVVkuM4Eds4tXlfBU5b8un0HnmvWbU4Dr5URKwEuFfIjjLmnB/6u4G
	vcNYGVRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmvAw-0064zO-12;
	Thu, 13 Apr 2023 11:31:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmvAs-0064y3-1V;
	Thu, 13 Apr 2023 11:31:35 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1DB3A6603212;
	Thu, 13 Apr 2023 12:31:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681385493;
	bh=KFjJyN/GRcVUyM9+MD0q8eBTa213wPHOvUrosvi9KxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ikY8B1YFvFqMNo5q9NG4TZ2rG1qvlPBJlAHeyu8lM2Ptd51JGYJq+66Jt85CHSgfs
	 epp6jgYMRQVsn/apQLHRYEf8DkVcWeNL9UqSKfndnNXUXhUQlWI0Axcmjk+Kx/s7WH
	 yGdT7V47aLpVcWEnYoPX/5M19y3rsLE+DhbxNU1ng4og2zAIQhWspXZjlVgvnYyUt4
	 Oj8DtNwyWm5KIRbJVRORpGnqLX42Z8j8K6PgUi+a9uHCNtz1XyQzB2gkkZwiNvU3iV
	 bTufsRZhpRzYgznf7PlP7ypF0x8CR4pf/MPlEhgzmCHHLMxrHYjBYnQyWRpLySsaB/
	 eSWkFQpyaC7GQ==
Message-ID: <dee54623-9065-98e7-0505-bdb08ec1e643@collabora.com>
Date: Thu, 13 Apr 2023 13:31:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 0/7] Add support for MT6331 and MT6332 LEDs
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <ZDfeKhUvo5a9jd9E@duo.ucw.cz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZDfeKhUvo5a9jd9E@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_043134_630913_B389DC5A 
X-CRM114-Status: GOOD (  18.24  )
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

Il 13/04/23 12:49, Pavel Machek ha scritto:
> Hi!
> 
>> Changes in v2:
>>   - Rebase over next-20230412
>>
>> NOTE: Since v1 of this series was sent in Semptember 2022 and got
>> ignored for *7 months* with no feedback, I'm retrying the upstreaming
>> of this same series.
>> There are no changes, if not just a simple rebase and another test
>> run on the same hardware.
>>
>>
>> MT6323 is not the only PMIC that has a LEDs controller IP and it was
>> found that the others do have a compatible register layout, except
>> for some register offsets.
>> The logic contained in this driver can be totally reused for other
>> PMICs as well, so I can't see any reason to keep this specific to
>> the MT6323 part.
>>
>> This series brings meaningful platform data to this driver, giving
>> it flexibility and adding support for LED controllers found in the
>> MT6331 and MT6332 PMICs.
>>
>> Tested on MT6795 Sony Xperia M5 smartphone.
> 
> Please cc phone-devel with phone related stuff.

Sorry, I completely forgot to :-(

> 
> Can I get ls /sys/class/leds on that machine?

Yes you can, but that will require some time, as I'm on other tasks.
I should be able to provide that next week, sorry for the delay!

Regards,
Angelo

