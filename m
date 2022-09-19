Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBB3ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=acfZNlSk6UDSUFER86iU5/oC+tWnJPYzNY85ToWvplI=; b=jqBIwDlxCQAW1PMTAaR1sHrZjN
	PX60dhpy+jiq+zQcaoRBNOduXVHgqjt2UWIOxxIMyWkZXC4bW7yDWAk113gfZPONfnPWQwJJgmFoL
	6pPQIHlpN6licqqEQ67jTsF8kfu5y8fz7E+Xto8eq3vmNgcR/RclblmVmXsO5RgZactnJh9oVdvFM
	gDHJHpNleBhgyB5DamWMAnqUdt9zoTyLP5NieNLvUrMheAbVxe0ieZoNa/p7375wqOYI1C2GqKfMO
	aqP0U594dyCMvZQBUc0wLbdW3daGe2pHPrpjjLRCB71CYAEr9aSKTvqnI3JBOQIRt1Nvie+waEWLr
	0VwBeJ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDUA-00B0yJ-EG; Mon, 19 Sep 2022 09:54:42 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaDU5-00B0rd-Cf; Mon, 19 Sep 2022 09:54:40 +0000
Received: by mail-lj1-x22b.google.com with SMTP id q17so19301343lji.11;
        Mon, 19 Sep 2022 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=acfZNlSk6UDSUFER86iU5/oC+tWnJPYzNY85ToWvplI=;
        b=qfjkJOzXVYyBbWBcP7ScnhEr3K4rRvVk5rRFs1OF/IhXIcCx6uLOkHA2R32bWSNb52
         5caWhhw2LYFoBao51d6Yo0KY2AIBTSHg+QnKa7HxvTNoOshJ/tHBsHX38mjzLh0+H6Ee
         4fsyaEhlpXl1wpJC3pjQYWXzowXLs+gWWaVzVzDBYTxZ+nP41WOqMcEipwrL1zpuGxND
         p1m8qpVVRXkoNMN8xLi/+m7PY3PqdbA1YgMysj/KPnvPX5xxBZ9c2bxmGfWfnuNGf08t
         1n73JgcdGa+B9fnnGY1IKwJN1dgH675rZsofUMF2WwtMQ1f8K5lM9wlUgkjt0f1tKhrV
         6rwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=acfZNlSk6UDSUFER86iU5/oC+tWnJPYzNY85ToWvplI=;
        b=e/pbmMxGll3MOU7Gc21AHZoiG4kEEXc+G0gA/wp5J2pIZ7w+67iMnTcVJWfkh3Jq7N
         mLoYz9wKmIa0wB46Osio0ib3gxeZYTEAwXYGbBpCcHoIu0dnslaEp/z+YPNcss8ofn5p
         zjBQ1sd9JeQB0zCzZzBDmOWhjLDa/F8kZgFl0GmVe7fDdNyxMlQBvnMS0WIUnnoqc8f8
         CbG8OKQuaOLYhufUW3bwT5AgSJoEXZPPLbfAgnXsrCWrtb+4nH4m0MvCoP4gipSMzmim
         t61JjtwSkJ07j1Ff8jL7Eybj0SGeCJBFyffqezPd2Z5jIIpiu/xAxgkX0rUQnUmiyjXH
         5Bpw==
X-Gm-Message-State: ACrzQf3Vt1l5jZNlR15gMdBXjZnNoCZO4Or0Tl/d++nAp7zAPvDlqetQ
	Wza6OX0HJMY37iZmchoWE9U=
X-Google-Smtp-Source: AMsMyM5s1lURiFkaTiES2Do+Gp85hVbFMOUBWEtYF1ETax19T1vejZL/sH5OF3FW8EhMfG9KBBZ7oQ==
X-Received: by 2002:a2e:b893:0:b0:26c:22e0:716d with SMTP id r19-20020a2eb893000000b0026c22e0716dmr5260362ljp.48.1663581273645;
        Mon, 19 Sep 2022 02:54:33 -0700 (PDT)
Received: from [192.168.2.145] ([109.252.122.187])
        by smtp.googlemail.com with ESMTPSA id y11-20020a05651c106b00b0026c3e350682sm1347948ljm.14.2022.09.19.02.54.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 02:54:33 -0700 (PDT)
Message-ID: <7fe977b9-8e54-96cf-91da-49f0861ff945@gmail.com>
Date: Mon, 19 Sep 2022 12:54:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 0/3] Refactor MediaTek DP drivers
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Bo-Chen Chen <rex-bc.chen@mediatek.com>
Cc: Guillaume Ranquet <granquet@baylibre.com>,
 Jitao Shi <jitao.shi@mediatek.com>, David Airlie <airlied@linux.ie>,
 liangxu.xu@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220916133821.27980-1-rex-bc.chen@mediatek.com>
 <CAAOTY__g=s_ACd+zTJZT1HBbrLo-JpHbrwLsy1zKjxbM5c21uA@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <CAAOTY__g=s_ACd+zTJZT1HBbrLo-JpHbrwLsy1zKjxbM5c21uA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_025437_946888_C66E363F 
X-CRM114-Status: GOOD (  11.30  )
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

Hello Chun-Kuang,

18.09.2022 06:17, Chun-Kuang Hu пишет:
> Hi, Dmitry:
> 
> My tree has no mtk-dp driver yet. Would you like to pick this series?
> 
> Regards,
> Chun-Kuang.
> 
> Bo-Chen Chen <rex-bc.chen@mediatek.com> 於 2022年9月16日 週五 晚上9:38寫道：
>>
>> For this series, we do some clean-up and fix a build warning.
>> This series is based on linux-next-20220915.
>>
>> Changes for v2:
>> 1. Update commit message in "drm/mediatek: dp: Reduce indentation in mtk_dp_bdg_detect()".
>> 2. Add fix tag for "drm/mediatek: dp: Fix warning in mtk_dp_video_mute()".

I changed commit message of the "Fix warning in mtk_dp_video_mute()"
patch to make it less noisy and applied all the patches to drm-misc-next.

