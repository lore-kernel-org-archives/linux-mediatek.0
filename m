Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C770C4829F
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 11:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhPBiLJAtXhRRRHzCQWeeO8j655s5ICFl+JAPaUXxsA=; b=dNrWlNI8U2q0igSa00zgm31ZVU
	NQnsZSGwoThAVNrv97WbTN8oUwqEzxTk+oSvrOlAG2rijMl8UyDAfcMxcapxTIOZAtoK5RzcU8HLN
	f9UqkrFafZZQbzPUx5ViRI9ZgIFjRMOQzKgDsgQwvQAa+gKPijr6Ep1vSt+phEi7+qlvtIlwTHMMk
	myExNBBVPHrsfde9qGiPwu9YdqcgcRZgyBYLzyaZaKlnS3pk1PpFEqe9eltq2KiE6RRO5TN2OoDaa
	yFK4ty6atwQb46LGh+fmNf/wmmzoWKeVEMHHGNnNVoOOejFOK+A9fEBCZvPd2Jxak5yYmaRJBwiMh
	8zTZWsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJtb-00000007OTk-1mdA;
	Tue, 06 Feb 2024 11:45:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHgc-00000006gpk-3ES0;
	Tue, 06 Feb 2024 09:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qhPBiLJAtXhRRRHzCQWeeO8j655s5ICFl+JAPaUXxsA=; b=Gr9oQG9OuJ8nwEeKB1XZ7BGqxN
	ZJq/LIETw0VX7wX3BVYTjKQTtNobArSEWAaWf2nZvaSRsgKa+1GL0j3Bf3KIXpeUnvRWNAR9nV/5o
	filvCpXhb2w1AozeUs6WuEekerJUZf7qHJkafB7EksDe4mBpT8NpeMWUYcHH3x1KvG7RaPcjEgGy1
	UvUja1aeUWBLyIM+zJIaURuJhjJ3PRnSkR6bSE4NtVPQR+DfdpipVsIj4Nwzh2Upsffxec04mYmz8
	oXBa92E4EiFfe1V0uLW0V34XvEQvozkT4yubd7YDvWBVSqPfxu0I2K2EuC0CTNxG/wlpGVXRLypO4
	61T7AsPw==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHgZ-0000000CRCV-1IjG;
	Tue, 06 Feb 2024 09:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707211443;
	bh=5YvgUqR61QNjvLXdS55FaX2N2Q7jHdFaH5GUQL62KZg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4NSspz4xXg6LEVrBIlDgheuDmBBoXGi39H8gT9MzESdQR4gzeVP2C0PkXzQTgiM1I
	 9CaTnVrim/1ezdaqUNH3EMRlkWA4YWDh9xmVxaU5QgFLZTtwbF96cOg+3Q1aHhZ5Jp
	 qWpDnh5r/3EsiPM7YG5K1oZOrju9bR2gt5B+P+X+Agxncasic+/kN8p1R6ZJrQ+wJd
	 fIWWDU9mzwthw8JODnUjvoP8odQkQnzKVeerBML3eNEpI7kYEFeMjfPvfvFzzdprTF
	 xTvi6M0o9GkKizt/T/4XP7AkMjR5uQtv+7IAtKuVx6yLcpkS4te0R48mUMMajDg6Z4
	 Cwj63bdYjq3EA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7925E3782051;
	Tue,  6 Feb 2024 09:24:02 +0000 (UTC)
Message-ID: <cb85caec-d2e3-460b-a9ab-90ef9aacc2ce@collabora.com>
Date: Tue, 6 Feb 2024 10:24:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: Use
 devm_platform_get_and_ioremap_resource() in init_scp()
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, LKML <linux-kernel@vger.kernel.org>
References: <da6af483-5ee9-45cd-922e-d9d5364674dc@web.de>
 <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAMuHMdUxn4Ne7kmEfONz8Uk3Why3m9r83GdM5RzTxm_4Gj_a6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092411_718315_48D934AC 
X-CRM114-Status: GOOD (  12.55  )
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

Il 05/02/24 17:31, Geert Uytterhoeven ha scritto:
> Hi Markus,
> 
> On Mon, Feb 5, 2024 at 3:23 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Mon, 5 Feb 2024 15:08:27 +0100
>>
>> A wrapper function is available since the commit 890cc39a879906b63912482dfc41944579df2dc6
>> ("drivers: provide devm_platform_get_and_ioremap_resource()").
>> Thus reuse existing functionality instead of keeping duplicate source code.
>>
>> This issue was detected by using the Coccinelle software.
>>
>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Thanks for your patch!
> 
>> --- a/drivers/pmdomain/mediatek/mtk-scpsys.c
>> +++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
>> @@ -441,8 +441,7 @@ static struct scp *init_scp(struct platform_device *pdev,
>>
>>          scp->dev = &pdev->dev;
>>
>> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -       scp->base = devm_ioremap_resource(&pdev->dev, res);
>> +       scp->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> 
> Given res is further unused, please use devm_platform_ioremap_resource()
> instead, and remove the local variable res.
> 

Agreed: res will never be used.

Cheers,
Angelo



