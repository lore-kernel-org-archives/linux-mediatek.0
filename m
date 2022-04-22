Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607ACC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 12:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HRofi8EvGiwB5uMDKymBzQ9Efn2S5oUF/wXhB9fhIvY=; b=1Nz9jh7sxrS/J2
	rEHI9SV7TAGegby3QAu+eeyb2nSWiUyfe0R1jV1WU8fLa0dMV25ZVGCtq8J9gpYVv2+T293DOWaSG
	4GpJPLxkw1Y3taka2s9R98JIIfOf0Zto9xfYlsqhWfKrhwt6MhREPkhOHrAPcWy4pHI1UKMtWgmVE
	cFnEuCefT3cJYQs5P9YsmuoTInaPV/3G1RL90uxb9xODevedOY7lhCZ1KsJEgDdTFr7UQZittHNbJ
	fAsKJR2gTMcqYtQvChFOEe7XvBbH4NG0rU4uL6Wqu2QsnTbrnyWDGQJBEnSAeLxRyK3hiPPPi+cM/
	aMPq4Z1YjTRjak6PC8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhsSS-000Pw2-CS; Fri, 22 Apr 2022 12:32:20 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhsRb-000PUf-Mx; Fri, 22 Apr 2022 12:31:29 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 v64-20020a1cac43000000b0038cfd1b3a6dso7851663wme.5; 
 Fri, 22 Apr 2022 05:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CBcYiF6362uk33z6W6pwWYiGiENSgVP0CPFI16Cm26o=;
 b=GxGdiWg1HKUPuzArMV6q7mYMHSw5fVQXbIsdKBZEmY18qLoQ/3od67tJgJavDorpuh
 x3QJ6ZiBT9hn3e+ycWnWXxTP/kzAchfYGmDC2xiXsNoJC7vZ9d7jONp4FlmPsoJgEV19
 1o7JeRo5p2q9xwzmxzTNXU1/RdbHeh9Cpxikpcc8o//YNZJeefFjbx5EKIQhBdHe85se
 MBS5Lo62p93P41R9OSuhcsGmWxq1Xd/+L+p4TD6Iizs8qUvSO5TX7LEiw0V//4Zf9XkV
 +QcE5kkh6m2dTwgVTKdPpJ+L2C3jTZefzjRzV0qPTTv0F9BZ7bL+mxO6V5zXNaxYjlVN
 aKRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CBcYiF6362uk33z6W6pwWYiGiENSgVP0CPFI16Cm26o=;
 b=cI+AtM4jdi0eTCw51CpXJM8NcsMtrs2e53hhRJqUtQRYlM0TtPRSXD1T1KrjJCzsBb
 zlys4r6LBeLb3dStWkI53zw+bxnAbM2t6WqaynVOvP8goSxTAlGyfEGvtZrrx7zxwboG
 rI6m8Nft6TeXuontVY7W/JGnJRQ5gdeKqh7E1+oZVdpKAydbNKUaY/e/BSyqwslihHxy
 SbGclShqCdo5ylSyFEsk3uHhL4ouISZHS90MHEZzYU6ezvuC45ZxnH20/KzAOQYz/15k
 WNOCJH/TckyHyCLrfFKWuRJo2XZwVka0NSSbbvgiTTGmXdYcg/6Pls9VD6rFI3zWmXwS
 LqNg==
X-Gm-Message-State: AOAM530FdG0Fg8AxjRSgk6y+I2Jo/luOeli8pP87B5UbidtolQoVCOqj
 9YYyVO8DqsWD1dy3+EmyoB8ovDOMgiuhpQ==
X-Google-Smtp-Source: ABdhPJxAXSLZr0cbOfuaLrq9lwbUFGLwRJ/KMqDo3dR+G9jBSah8w2G7ldUeCdqYhnSSMDrXLwu2pg==
X-Received: by 2002:a1c:6a02:0:b0:38b:3661:47f1 with SMTP id
 f2-20020a1c6a02000000b0038b366147f1mr3933534wmc.5.1650630684935; 
 Fri, 22 Apr 2022 05:31:24 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a5d588c000000b0020a9e80d2b1sm2041357wrf.107.2022.04.22.05.31.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:31:24 -0700 (PDT)
Message-ID: <074d8c26-3fb7-bee1-d559-7ce96f583fee@gmail.com>
Date: Fri, 22 Apr 2022 14:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v20 2/8] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Nancy Lin <nancy.lin@mediatek.com>, Singo Chang
 <singo.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-3-jason-jh.lin@mediatek.com>
 <82cc5e6900138e13ed9d75c6d2a42c6d7afc1959.camel@mediatek.com>
 <c3de9ccb314316b5296b115dd3e9f8171577489f.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <c3de9ccb314316b5296b115dd3e9f8171577489f.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_053127_800561_2D5880C8 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/04/2022 04:32, Jason-JH Lin wrote:
> Hi CK,
> 
> Thanks for the reviews.
> 
> On Thu, 2022-04-21 at 14:50 +0800, CK Hu wrote:
>> Hi, Jason:
>>
>> On Tue, 2022-04-19 at 17:41 +0800, jason-jh.lin wrote:
>>> Add mtk-mutex support for mt8195 vdosys0.
>>>
>>> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
>>> Acked-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>> Tested-by: Fei Shao <fshao@chromium.org>
>>> ---
>>>   drivers/soc/mediatek/mtk-mutex.c | 87
>>> ++++++++++++++++++++++++++++++--
>>>   1 file changed, 84 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-mutex.c
>>> b/drivers/soc/mediatek/mtk-mutex.c
>>> index aaf8fc1abb43..729ee88035ed 100644
>>> --- a/drivers/soc/mediatek/mtk-mutex.c
>>> +++ b/drivers/soc/mediatek/mtk-mutex.c
>>> @@ -17,6 +17,9 @@
>>>   #define MT8183_MUTEX0_MOD0			0x30
>>>   #define MT8183_MUTEX0_SOF0			0x2c
>>>   
>>> +#define MT8195_DISP_MUTEX0_MOD0			0x30
>>> +#define MT8195_DISP_MUTEX0_SOF			0x2c
>>
>> This is identical to mt8183, so use mt8183 one instead of creating
>> new
>> one.
>>
>> Regards,
>> CK
>>
> I'll fix this in the next version.

Please send this as a follow-up fix on top of:
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.18-next/soc

Regards,
Matthias

> 
> Regards,
> Jason-JH.Lin.
>>>
>>>   
>>> +static const struct mtk_mutex_data mt8195_mutex_driver_data = {
>>> +	.mutex_mod = mt8195_mutex_mod,
>>> +	.mutex_sof = mt8195_mutex_sof,
>>> +	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
>>> +	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
>>> +};
>>> +
>>>   
>>
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
