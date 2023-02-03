Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C8D8C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XPCAamLDW14ZRUba5aApMHxDyPGWoL0BG7d7nfVVdVI=; b=M/COIYF/tRIgL5iyEUVUgFEGDR
	/BZ4XDKFfFsMMq36EM4zQowI+WN6jqhMc98nOjTeEYD5xpZSEgE5JtHamnj+3IvCM84ZmbbgRsYLW
	P4oe/dTwr4iAA9ngQ1CLALBNDfb/GqfSGvN75qi0CjTxuucJJTADprpxYf/pBu3am/rXBAH3XpuUy
	9ftluNeA1yU1l+jaR3hyL2x8zQHWAZQkUOQYbPr0pHC2lHWoQyO/lQOkQGY/jKK6XGZ8eeT4uyn53
	dTS7remZaaEY+BETAc17xOKmEs729GiM7PGt+SbZbKpJhMQUnjSdjZ7la0QYslkY4wI/XhUy/qooG
	ziXEHYtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqW6-000ndC-F5; Fri, 03 Feb 2023 07:29:50 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNqW4-000nc2-Md
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 07:29:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o36so3177026wms.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 23:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XPCAamLDW14ZRUba5aApMHxDyPGWoL0BG7d7nfVVdVI=;
        b=nibuXOj4XhsASSAT6iW7FumPVbV6S78B3v4QBVcq2CVqh2t5ra/J5D+BbE5wWvFkbD
         BCfVeNDXek9dO3Avey5gmi/cANE7IOTeV4yiz8x9Fv8DoVJT4dZzsLC207GZby6adlwJ
         R2/ADMZAGyRGGXX3lkOwn00+Wvc1+qqYSn6KgnA7C+IfEmFO8bTMS+G24QkVaC/e5990
         gWGMLTBxK6ItS74LbAGsRdIvXf5y98YVZ8l9fhg3j3C9SP3aALyRJeJB8EuteBNkD/+k
         rPSJraslpD/0Yl8VyerdmnfU2E+Ka8O0joKGSIg9mS/JWjTsgyP5U6rLiQux5Fps3cIR
         APLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XPCAamLDW14ZRUba5aApMHxDyPGWoL0BG7d7nfVVdVI=;
        b=I7S8ISNMIhvPQwFfArvJ8PK5nUvVFOwhvamgt/2v4e5rXkwxwGP7vIXrmHKeLoWxCe
         4b1PfIv5n7ptKoCvgCQ2pqZVOhQSyJV+xDEDDO6566yaMuK9UWqobdBfg3LXbwS5HVNS
         rMXTDiYQcVC6KZp0uYK2zThOccVCSwJv6Oatr7+g48lln2kiUuVUNfgtChFZRMMYZ+ws
         q/Dy2sMao2V3+H/ZO1jrIC0UaiG9cifg2hbKRCaJ5Aa2q7qRZv1oZkv94oAsvtXMVYM5
         s0u0bEhE1ci8MN4fSihjRlaxAdYTkO7nLJrRfIAPZbMoLOLPQFTiA6H30ecKfEeCJOCl
         c7Wg==
X-Gm-Message-State: AO0yUKWkM7NOFQOowhT0qoxwSbHj+o+EZtmIri4Qn7a+t5sErE/5M0TE
	5Zq9A7nePGsdWLxxFKltXSU=
X-Google-Smtp-Source: AK7set9+6X74jJU5dqFQiTDNGdAJCRuzikYVWJWZv+rzJ/GLhz3i5aVaUM2cM1+615NfXK+JUmVonQ==
X-Received: by 2002:a05:600c:1d05:b0:3dc:58db:7c2 with SMTP id l5-20020a05600c1d0500b003dc58db07c2mr9397412wms.8.1675409384042;
        Thu, 02 Feb 2023 23:29:44 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l10-20020a5d6d8a000000b002bfb5bda59asm1356600wrs.25.2023.02.02.23.29.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 23:29:43 -0800 (PST)
Message-ID: <fe8743be-4a37-84cd-747f-e33901a23eb3@gmail.com>
Date: Fri, 3 Feb 2023 08:29:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 daniel@fooishbar.org
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org>
 <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
 <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
 <15711c23-43c4-86c4-0f56-4a76b5ffea46@gmail.com>
 <CAHC42Rff5Xj_5bJNVozAYnG+ujjZ+R1DjDfWZn4GvsyQV+do_Q@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAHC42Rff5Xj_5bJNVozAYnG+ujjZ+R1DjDfWZn4GvsyQV+do_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_232948_771084_1C34C0D0 
X-CRM114-Status: GOOD (  13.72  )
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



On 02/02/2023 21:41, Justin Green wrote:
>> Yes, I had a comment on the naming in that patch. Never the less, I think if we
>> don't need to "overwrite" the value, we should use just one struct for the
>> values instead of copying them to the different .c files and give them SoC
>> specific names.
> I don't have a very strong opinion about this, and in fact that is how
> v1 of the patch worked, but Chun-Kuang specifically suggested moving
> that struct into the .c files a few versions back. I think it makes
> sense if we expect additional skew between the different components
> and what pixel formats they support.

Ok, if Chun-Kuang asked to do it this way, then I won't object. In the end he is 
the maintainer of the driver.

Regards,
Matthias

