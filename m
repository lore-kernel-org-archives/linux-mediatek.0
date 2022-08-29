Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC37FECAAD2
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CpaB3ddJEDe584NFMiOKZhHWMRiirLWO36hNiUSRyEA=; b=F/st4/TlRkh9w3XAChEW5g3TaS
	DU0xXKMTwxcZ261u/sNWtUJFNqtCVJVrWtbw7G4IpBJyr5dnFf1pnEuokNmE6qRs6IPhKDx//x+B3
	9J4WK0fvdaaV84Gd6l5x/RgoEutlCP2o6m/QbkuPyayxMqgTWaWXNg9MGdBIxOwOnt6cIjGu3xtIB
	6JAKqIFVpQRh16HPQKF8AF1dWo+Q310rE+MV6WrS0ikFlMwdQbcHitbsr1a1C5Sf7dAYkAFQn4a1f
	RmkKq13gH1B6jqzFyEVNqCywPEG1NpLI9koS/QynVV1Zf2aGPQXram+VQ6LooU1+SZIJ16u6WVouU
	AXwPlgAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScXy-007nNn-1V; Mon, 29 Aug 2022 11:03:14 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oScXi-007n6k-Dc; Mon, 29 Aug 2022 11:02:59 +0000
Received: by mail-wr1-x434.google.com with SMTP id c7so3019799wrp.11;
        Mon, 29 Aug 2022 04:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=CpaB3ddJEDe584NFMiOKZhHWMRiirLWO36hNiUSRyEA=;
        b=MtFVRnlqvFCDp/2JPEM0WuYX9z4sAWXEySwkIEslskyWcWEwk7GwF7mPD8fnNCuka5
         iZsdTIYsIIz0dJ8SR8H3+W0Q6U7aWML84pUi/t1/GkczgGtm/ASEyvZ2GqlwN6IemqCg
         MEjwVu9pVjKpjdvaJBfkTI7vFEwtZe2OI9fpO0fPVHxlBbX6Ddw149ocyNxFAAYF+FEz
         PBuog2YOfo9a95u4PxujzJ1yrwRpOqEXasge7p1iHCzFhINUeq8JLdF9iyBrK5/GboTo
         +tKXTmep6l6NiakYLuT6k6P7ypdoPHTjvVyi6ADq0r6CGPvaUmuemFRpTkivQXXe2ksn
         M2fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=CpaB3ddJEDe584NFMiOKZhHWMRiirLWO36hNiUSRyEA=;
        b=K0Sn8FbIlRiNanEuXi9uDpSJauRXD3CkVdM3GqQ2rsHj32yd/BxQmCmXkCyngCUf6B
         yj5uLJvri0pLgSxZpO5Aaoxvk4ktNQBujoMPQvJKpvB15Zg4tin3M6ymWSwen+Eo7sbh
         GoyBLZgWAsnQS2uAnZTK1Ov3MIiYBH19m0fDqptpExiIAPK3A7d0cWLlx+KrQ3v4Tbpd
         ZJbDLv8j3xBetb5GrV9pUd9EJ7EHPGDOaNkliqbP7RApd7Gu0VJ19eUZ+GWNkrh5NdfE
         dfj3gr61OKy/hXk4wksfq31MpuQcnjx+Jmc3aHxq7IoH93f/xJyzErnFXpmijLkv7sic
         KcBQ==
X-Gm-Message-State: ACgBeo3I3VWUXqp6Q15aVXQO3ndZuK/E0xWaS70aP0kNKReI8TkMrYEo
	BifRi3SLlHUfPcbilDOHf1E=
X-Google-Smtp-Source: AA6agR6JDbKTJ7JqVUrNRRhnLjrcMSZrxoyQmDSWVWy3eJl6CWzFTpZag8RsDca0Ng4LaNIvdXqZhA==
X-Received: by 2002:a05:6000:2cc:b0:225:6e25:a9f4 with SMTP id o12-20020a05600002cc00b002256e25a9f4mr6255619wry.330.1661770973922;
        Mon, 29 Aug 2022 04:02:53 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id a11-20020a5d456b000000b0021f15514e7fsm8078909wrc.0.2022.08.29.04.02.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 04:02:52 -0700 (PDT)
Message-ID: <2629f8ed-9ca5-3b37-3025-85262e5fe848@gmail.com>
Date: Mon, 29 Aug 2022 13:02:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 6/6] soc: mediatek: mtk-svs: Use bitfield access macros
 where possible
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-7-angelogioacchino.delregno@collabora.com>
 <fa5f9bc8-f087-02c6-dd31-efa33244bf1b@gmail.com>
 <5ef83611-1649-c86b-abd8-dff617993580@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <5ef83611-1649-c86b-abd8-dff617993580@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_040258_672717_700D701C 
X-CRM114-Status: GOOD (  11.51  )
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

Hi Angelo,

On 29/08/2022 11:33, AngeloGioacchino Del Regno wrote:
> Il 25/08/22 15:29, Matthias Brugger ha scritto:
>>
>>
>> On 26/07/2022 16:16, AngeloGioacchino Del Regno wrote:
>>> In order to enhance readability and safety during registers setup
>>> and value retrieval, redefine a few register related macros and
>>> convert all open-coded instances of bitfield setting/retrieval
>>> to use the FIELD_PREP() and FIELD_GET() macros.
>>> While at it, some macros were renamed to further enhance readability.
>>>
>>> This commit brings no functional changes.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@collabora.com>
>>
>> Does not apply, would you mind to resend together with 1/6? Thanks!
>>
> 
> Hey Matthias,
> 
> thanks for picking the ones that applied cleanly in the meanwhile.
> 
> I'll rebase this and 1/6 as soon as I can!
> 

Nicolas did it already and both of them should be part of Linux next. Let me 
know if there is anything missing.

Regards,
Matthias

