Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74623C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 12:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dmbM1Qy6O3VP8JNoHwNoRaV5SzbpRE5WRsZhiU2waYk=; b=f5Ljdywosar0GfdVbvsdMySB/3
	Khq0OrpkPhItRWYDMa8dUTyJfY+H1F3wGllEU5OB2skNDoI0YdQFSC1r3w9xECobq/aCn5SBZEIUR
	sSoY/Mgoo7XXKgZrPCTtT2EpT4tLQ+0PDcigi1kRfLtS1LtI0dJF7qWsaC290VsuGMY1U3LfyWqiE
	UuQPJd+w09T3yiAbUoMuEMusiGzzXG8fjsFprBjq1ptjh/XyPKVWTjrM+v++/YoWLGdu/yAuI5sc9
	916Q7EmMtV9KTm+ZhXzx+SQAH/Uk+ERQtS2BGf9sESjzx4XDn2tz26+rH/cRkRfKlNB40tmWo4v86
	hKYlmWxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69iJ-00Eric-6b; Fri, 16 Dec 2022 12:21:19 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p69iG-00Erhf-CQ; Fri, 16 Dec 2022 12:21:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id o5-20020a05600c510500b003d21f02fbaaso3970348wms.4;
        Fri, 16 Dec 2022 04:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmbM1Qy6O3VP8JNoHwNoRaV5SzbpRE5WRsZhiU2waYk=;
        b=nobdV8gwYafyOUn6CMSU+wcUOeAeHygRPpwdEARuYDAknr6usDVtaO8kUOV5d2kMa3
         pbB7VcXCUpTt6fd6FxRbu8zzTQGSH76klhjcBsUQCSQO8P/lPBgsnOmxUshj5KJjv4UY
         VltuS/4iLRVDsvWp+jLOwEw6sZgIYxZ8Wh86fKNVig30b9OjQF5gWLPwCEI+Wopbugu9
         p/j1Co4AuL7tcZVJuF3MbwHTAgyOggUVsLhq540VTQUiup57dUCaExwp7+ImzkEWebuc
         tciszF7f7uJqqXWz/n5orV9XtAeAFF2EyI+ztr182dE97h6kXE/jJ1AAgsg3cmzm5EB/
         RbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dmbM1Qy6O3VP8JNoHwNoRaV5SzbpRE5WRsZhiU2waYk=;
        b=3av9hZ0GdjN8lYKVKyOmdaAr+icCV22ghFNk8SX0Q3FKUOdpK5OYI1LXmdHSYP29I0
         uUOT66LwqOoU0imEEVam7cCtBa27zPCkk7sgPUBbzScNhj9+MbSKjAit900imIqN0W2S
         sGAjOdNn0z6TreupZFeWbuiKAP9WDHa8+mdQsv/nUhpDSQjU2rmAzpgaSANPkGvY+7OV
         YmAasBzn2i8Ia0UlSErSW9N2VjzMzfD3hRsTAWXSWrabTUv3rje08XYLSiKCeWymLavk
         y8Iff0QyTIrJbLsn9La/Q3pTfXEPoKALesAYsP0a+UFrOaZJxUr4H/FKBS+JSpWuZyEb
         0INA==
X-Gm-Message-State: ANoB5pkCx8OPmwjnE+MDtEcNX8S26YTuq3+YMqAGTc5e7p4rBRKsz4dM
	Arys1gwp99p/WI5AMO16qrI=
X-Google-Smtp-Source: AA0mqf7kO/8QPwI2ecjT2wkkigajfkPpKiHrbj96BPqbcRqMO+sIDop9EbqtGYe+j19jk/BXqNAXNw==
X-Received: by 2002:a05:600c:3ac8:b0:3c6:e63e:89c5 with SMTP id d8-20020a05600c3ac800b003c6e63e89c5mr25474904wms.33.1671193274039;
        Fri, 16 Dec 2022 04:21:14 -0800 (PST)
Received: from [192.168.1.132] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bj19-20020a0560001e1300b002238ea5750csm2476490wrb.72.2022.12.16.04.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 04:21:12 -0800 (PST)
Message-ID: <1614dc0c-dadf-a092-05d4-bdec1b2c2ae9@gmail.com>
Date: Fri, 16 Dec 2022 13:21:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: next/master bisection: baseline.login on mt8173-elm-hana
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Mark Brown <broonie@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 kernelci-results@groups.io, bot@kernelci.org
Cc: gtucker@collabora.com, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 mingyuan.ma@mediatek.com, libo.kang@mediatek.com, chengci.xu@mediatek.com,
 yf.wang@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>
References: <6391e1c4.170a0220.b562d.3c9c@mx.google.com>
 <Y5HrIhEfuEgGKuMB@sirena.org.uk>
 <ff000931-ce9e-f413-1540-ca2edf393362@gmail.com>
 <64296af0-e2b9-6f39-7dbc-6e0120f96fe2@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <64296af0-e2b9-6f39-7dbc-6e0120f96fe2@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_042116_472718_B6A4E45E 
X-CRM114-Status: GOOD (  11.01  )
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



On 16/12/2022 12:44, AngeloGioacchino Del Regno wrote:
> Il 16/12/22 12:42, Matthias Brugger ha scritto:
>> Yong, Angelo, can you have a look?
>>
>> If not I'd propose to drop the series for now until we understand what is 
>> going wrong.
>>
>> Regards,
>> Matthias
>>
> 
> It's fixed already, and picked upstream [1]... that was happening on more than
> just MT8173! :-)
> 
> [1]: 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/iommu/mtk_iommu.c?h=next-20221216&id=462e768b55a2331324ff72e74706261134369826
> 

Ah saw that patch today and marked to look into it later. Perfect, one thing 
less to care about :)

