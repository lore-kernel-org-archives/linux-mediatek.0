Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B1CC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 11:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yVfcpsRQhZ+K1eDUGm/hT79865gqKPGqp1NWWMzmywA=; b=3YZIABybncY8l6KfA9oCKo3bks
	myKkKDaHRxPw5SoN+xQ3hDHHsNTRvTfK97/c2imQtMC15eTaC482wzH1v1lyJxZTTMQnO4lhMbCWr
	EBJU44JfTJlq0+r95i57PlojfoLfMd8YLl7XXTbnFgPWBn/H9kAMsA7FepBQUXFDUMBVMnkN1gl98
	GSJA2/mjNRT7//LxIIup9oLgRZrDFmbxfghJIV9oQkTqAsgYlQPL2U+1M/hekkUELI7uwumCQ2/p2
	NpQCyV2BmlR8zvvDw1JbDefoSEM0F3bmI64vpZNYMhcDw9Pjpr2lUULtj6hR2Apj0K62CTlhNsGWv
	1exbgcsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjDP-00D0HN-1C; Wed, 09 Nov 2022 11:25:55 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osjD4-00D06z-CS; Wed, 09 Nov 2022 11:25:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id w14so25267070wru.8;
        Wed, 09 Nov 2022 03:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yVfcpsRQhZ+K1eDUGm/hT79865gqKPGqp1NWWMzmywA=;
        b=QYl+yjjJGwob7l4O1fw3+oiBMl/GAN8a/Tzrcirxu+K51wcXU1Tk02WMEgePKIKx2x
         CRzaFVSCpQYyr4Jr9nO+rr9BltzAyt4y3PhHd3qwidEqPikm8OZGzn+alPWjkYV/Sacz
         /5/1+eyo4xMg/gr7O/PoXrfZu/DW1a82+xYgZAxBpZ83Y/uG6dLLriPz/Mp28FGuLKpz
         vhUFGpWrQbxGGa7T9Bk/iD1N2h/QsgMJNEoUrsxioP9kxLQv5WSWMXvvKgSWpbKCkQjz
         j72DKYn1Zytrw9JrSiS+QdeUQNi16sX8VGrRaX71sCZuaB24lT8gGAGChEOq6FohMZTS
         qepg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVfcpsRQhZ+K1eDUGm/hT79865gqKPGqp1NWWMzmywA=;
        b=P30AJGq5ohRJYQ+67OQI9J+am/LIk8IEZrcETQpa8bj9LDFEllzSeQKkRqmIQw+L1U
         Q7+Yk20CFVO4Cf6aR4YKO9EOfzpXBj+CZY7F+xZifYgI8Z0LGwRs6DDPjBVRTS3ah3Xz
         KYUwsT+rV5nN41CEGchKK9sSkyAJOF8mL+kbnIbEYiJcab+V79f+/ssh6a8Ja/JF6yKs
         Ct/LLx5Cx7QnQREDrwobH8rh7J0MYAHUFVulxItyCa3j0O4mCPLGLyN3EqxMIuAbHw8u
         gHjSX8RJcc6LgE7Wloa7KHEN/55T/F845pw+YWCrtNnIRs/8OHnVoTNPdQiwueYWmBvB
         amhA==
X-Gm-Message-State: ACrzQf1P4gAVv/iKyGtkie/zk48D+FJKzDodvHxthe2ox2uEUBL8jU/b
	Vbj8k2IvD2K3CY5W3L1rt4Y=
X-Google-Smtp-Source: AMsMyM4iaCUXPelD5JPs3GwdxrrcdP1EVcbyNAKOCSt0mIJomogbed+Y7iZa1JRJyZ3hoqj23+CxWw==
X-Received: by 2002:a05:6000:1566:b0:236:6a6f:6c27 with SMTP id 6-20020a056000156600b002366a6f6c27mr38530858wrz.553.1667993133963;
        Wed, 09 Nov 2022 03:25:33 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id u2-20020a5d4342000000b0022eafed36ebsm12791671wrr.73.2022.11.09.03.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 03:25:32 -0800 (PST)
Message-ID: <a0b61872-12bb-0ed2-a1b4-75cb5609c1c3@gmail.com>
Date: Wed, 9 Nov 2022 12:25:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 3/6] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-4-jason-jh.lin@mediatek.com>
 <0e67041f-a61d-1e34-2ce4-6a199c2c9f8e@collabora.com>
 <ac0a8cadf18291575d5fc798f0d6b99f5c3a4258.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ac0a8cadf18291575d5fc798f0d6b99f5c3a4258.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_032534_457013_379DEE18 
X-CRM114-Status: GOOD (  11.85  )
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



On 05/10/2022 09:08, Jason-JH.Lin wrote:
> Hi Matthias,
> 
> Do you have any comment for this binding?
> 
> Can you help us review the soc/mediatek related patches?
> 

Patches 1-3 applied now. Sorry for the late answer.

Matthias

> Regards,
> Jason-JH.Lin
> 
> On Wed, 2022-09-28 at 10:14 +0200, AngeloGioacchino Del Regno wrote:
>> Il 27/09/22 17:27, Jason-JH.Lin ha scritto:
>>> 1. Add mt8195 driver data with compatible "mediatek-mt8195-
>>> vdosys0".
>>> 2. Add mt8195 routing table settings of vdosys0.
>>>
>>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <
>> angelogioacchino.delregno@collabora.com>
>>
>>
>>

