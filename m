Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F6CCF31B7
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 13:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMdIpPEQdZo5IDWuNHv072UJTqokJz4+ex0Kj+irrgo=; b=HwtdhTSTTIs0MMR+HgltMeRuFj
	GdwLUxG8vz/Inia65caXVPVN3U39PWVwJK0gnqS8Qou/EgGD40fbNaOr5p1aEnjX67i5+zmYOFVtl
	BMgHRZBdW1Cxj9f9gTWlWn1yj6cWxiSPp5v0LMeWFLPbF7QgXDbA/ud5MV97HuW9hmftsBSuvx/+O
	gSOfgXkWplB6yc+sFcBvDrbZDbILhZmKNt2WhjJnZx5q5IsqZu7mOmA3URBJLJXVAG6LfP1a3+Rgd
	q/g56uN0vvknn8+Rn94Oa2Z+2KoEJjDGV4TxSt1AA07gCLejd/DBy2MSInGfZZY3c8gfrxb+Fqr4B
	gQfH1WAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svyyY-000000061SA-29HK;
	Wed, 02 Oct 2024 13:01:06 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svyxq-000000061Hl-464d;
	Wed, 02 Oct 2024 13:00:24 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-37cd26c6dd1so5166953f8f.3;
        Wed, 02 Oct 2024 06:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727874021; x=1728478821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NMdIpPEQdZo5IDWuNHv072UJTqokJz4+ex0Kj+irrgo=;
        b=a7UbTZotT88HnCYXtTa3n3CP+a2jcC7lLDmzAQHxSRIEFKzXafgrLnjPukk4kvh/tT
         aKzRZgWSCNjBR4Z/Djgj4/nit8nFoFDOmc2mGR3z8ZLJWd3tr5WTRUnosTkdq8uaN/GV
         phPgPWGK7klBreDXwPxAV5xyk7FQimnGJOVx37zrVDCZXPFhNnJ1ZGlpYAvJsdZ5V186
         HoQdUI7Be6PZcXBA72g2VetcpF+/HiBgDqHeQyAwE9A33ow+yIj8MoRQanmVvfqhru1H
         7YkXJUYrtxJXhpDkJh8za0IG8zHRUYQr455AnGrVsS2y49xRPds9dZwY/3ndcTHOA5KM
         rxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874021; x=1728478821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMdIpPEQdZo5IDWuNHv072UJTqokJz4+ex0Kj+irrgo=;
        b=GlKOd1xV8o8YTWykavDSo2SSSHLWAr/GJKcZPbxxzvS/b3txCBwUODttD2PMAkXCSS
         +ZJ22TBvuPR8R/XSRMHpncUDJWLlCvdqzT2HSmHERCzeGfM+jzU0PQVZx76MIFp3EF99
         bqQGkaKS+mwDbU9eZUCoKRNEV0QliQtNAkyi8pbd8PiiVDcvcrBJv1NOR2W6/xVBUSfN
         Qc/6lx/TxiZQ+I/a5IxGf515nbKtSYwZe+k9CcbK8eH5lXmRt29E8sINCgC8eAOz78Hr
         v/n8duOi6lFTzALfywQKZD/DkpXB5/+uFLvMcrYjYf81FcKVJ69LDeAICKw2dlu/Y7tF
         kySA==
X-Forwarded-Encrypted: i=1; AJvYcCWHjMf79+pUBKesybNgprz/K7UR/vYLTY31ls9EmtCRZKTWAr2/0Ny7Bpq49OhfETK1Z3hcYMg+ogmTN8qmkbg=@lists.infradead.org, AJvYcCWl3Rbp0NRUUTpYgb2lq6ZitrouK/34SfWd8Ee6sSd2Tz1/6CLJWU2dc8IQmxFPNBtyF055fimZ1ZTLD0ZwuH8K@lists.infradead.org
X-Gm-Message-State: AOJu0YwCtN0NNQG0yBvzM3RH4FtCWkdE3SVOcnjLCmdA8u1yOz98udM3
	boWwUWbg+OkpPCWuL+iDOsVApAeFVqZcyjH+ApgCrFa1aPbt7HlpP/YbDQ==
X-Google-Smtp-Source: AGHT+IGVTfSIiYdjttST9gFTbzi69OdywRKKgdj+2TUzb6nIhogriwCeves4Qq7PWVI35rJcmC6+bA==
X-Received: by 2002:adf:f04e:0:b0:37c:cdbf:2cc0 with SMTP id ffacd0b85a97d-37cfba19c49mr3010871f8f.53.1727874020720;
        Wed, 02 Oct 2024 06:00:20 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.162.240])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27c5ad4sm865258166b.68.2024.10.02.06.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 06:00:19 -0700 (PDT)
Message-ID: <3e0c8b18-81ce-4c9b-886f-d7c50fdf4c3d@gmail.com>
Date: Wed, 2 Oct 2024 15:00:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/3] soc: mediatek: mtk-cmdq-helper: Various cleanups
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20240918100620.103536-1-angelogioacchino.delregno@collabora.com>
 <172786008674.33539.15432336067797076322.b4-ty@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <172786008674.33539.15432336067797076322.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_060023_056187_43637EC2 
X-CRM114-Status: GOOD (  11.16  )
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



On 02/10/2024 11:08, AngeloGioacchino Del Regno wrote:
> On Wed, 18 Sep 2024 12:06:17 +0200, AngeloGioacchino Del Regno wrote:
>> This series performs various cleanups to the MediaTek CMDQ Helper lib,
>> reducing code duplication and enhancing human readability.
>>
>> This also avoids double initialization struct cmdq_instruction as,
>> in some cases, it was stack-initialized to zero and then overwritten
>> completely anyway a bit later.
>> I'd expect compilers to be somehow smart about that, but still, while
>> at it ... why not :-)
>>
>> [...]
> 
> Applied to v6.12-next/soc, thanks!
> 
> [1/3] soc: mediatek: mtk-cmdq: Move mask build and append to function
>        https://git.kernel.org/mediatek/c/2400e830
> [2/3] soc: mediatek: mtk-cmdq: Mark very unlikely branches as such
>        https://git.kernel.org/mediatek/c/21ab3dae
> [3/3] soc: mediatek: mtk-cmdq: Move cmdq_instruction init to declaration
>        https://git.kernel.org/mediatek/c/66705b89
> 

You probably oversaw the sparse warning email on 3/3?

As I oversaw that you already merged this.

Regards,
Matthias

