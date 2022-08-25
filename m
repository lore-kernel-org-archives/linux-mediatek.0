Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36934C32774
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FjzfQgvp9Pt54PbuI+NrL+4+IIsBmjAlu5P//Rcqxr8=; b=Mo4W30rO09V7hyyjbUJswds9wg
	JUL5VlcWqtuM66gYfwTBD1I27glPcWprFJ/iHXcvGlEAoB9D0H34Ty6VGQtA+LjYyqjYDBHvJ2MlN
	TnCnrmbZjnZYKf5Z6uTJCW2TAokcTTRQx16vsasfDUN1xE7/OuDR4NGNUncWznYyC2Sh7jPsr4WMk
	+CCO/C/rbfkbH7m1PipH5A3KwG2YJVUim0vxPrnAOQ1xQN3jynD0ZcZFzKUSWP/qfjiJKp7ilzt2k
	lmI9t5g2oxYPfsnvKY8rL8T7s1noGlH7mQnzV373rvFZQiTu2UelFc1iFrCtaG1fPSPSYWAbNR8qZ
	+6tSY3IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREQA-00FWgN-Pq; Thu, 25 Aug 2022 15:05:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oREPL-00FW3J-MT; Thu, 25 Aug 2022 15:04:37 +0000
Received: by mail-wm1-x330.google.com with SMTP id s23so10384856wmj.4;
        Thu, 25 Aug 2022 08:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=FjzfQgvp9Pt54PbuI+NrL+4+IIsBmjAlu5P//Rcqxr8=;
        b=W4RDP8KJqP48Z9qNlOeWmiPifiTsPzHAXkdP8Vn/obNsP5WU6TNCdwSnvxRiLesm6I
         uDrF/FAzWwGpvJJ4z6O31VFowRZY0oet/yZmZi0Qd1G8OPLQXyb6u6Yz+aZky7HWaxGa
         lwEyF666GErBM0pHd6T3diDRC+HSpHE4e0UJUkuQn2Udi9FubkZGO4dgeHrRieK5X7B5
         1ziTsch3E9h9GSIsP5Bjd9ivSDzeBkXv6Rq6AleqOc8I2EwwyBiXK4njSyfazrMm/qzi
         Y14lAYpYQraYdnrgaEYKX39AhQfaPGHe59qiCVbd74sld9MkkqeXZjjtJUk/776np0Ea
         /URQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=FjzfQgvp9Pt54PbuI+NrL+4+IIsBmjAlu5P//Rcqxr8=;
        b=cjMs6nD8O7qkMRXiDt4LTb32uvFQo1Gj4zADciviu2lJmcbIMwJMglWgGdZ8KSnz1N
         fqx/5Wr0LFENy2LGIZLCDtrBf0yeTgAqeMRkbDLGE/NiB9WHXSgYJfjZZi4Ces0Fj8oY
         UoNT0pa7z8uKhczK/0phlCe+0zv92RFFllzQSypbNq6FsZx4lORIqaqQFM5vchccbcSL
         qR4h89eIsI6OOpEzhCO1dWf8eMd0RvrMtf22B4aJe+5RmjT2PAAks/libLhAnXQuJjEW
         LxKRYGSj4ffR2M+yhM3PsXbWVHXb72MIHGJmxXyP0MbV4Zq7tAOn4x8WO2vxHImjOTmO
         vPnQ==
X-Gm-Message-State: ACgBeo3cCr+KSi2uXWjKTyMeQPhbU5q8KMAKQHLqjqp0nN4I+s8OpeuS
	LLvC89ETJiiR3rIHeUGIZzg=
X-Google-Smtp-Source: AA6agR6g4f+/nbB5a2H60OA7LKWWU9LDI4eXIcuSltTLoDctj9q1XvjqBYoYfQIjU7evtlSeCAWh7g==
X-Received: by 2002:a05:600c:1c9a:b0:3a6:1c85:7a0c with SMTP id k26-20020a05600c1c9a00b003a61c857a0cmr2539978wms.155.1661439873552;
        Thu, 25 Aug 2022 08:04:33 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q11-20020a5d61cb000000b00223b8168b15sm19831396wrv.66.2022.08.25.08.04.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 08:04:32 -0700 (PDT)
Message-ID: <b0f6a3c6-8fef-8983-fb69-6157a9859afd@gmail.com>
Date: Thu, 25 Aug 2022 17:04:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
 daniel@ffwll.ch, rex-bc.chen@mediatek.com,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 yongqiang.niu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
 <20220823201758.ffbgb5t5odoicgir@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220823201758.ffbgb5t5odoicgir@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_080435_800044_A3373110 
X-CRM114-Status: GOOD (  10.53  )
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



On 23/08/2022 22:17, Nícolas F. R. A. Prado wrote:
> On Tue, Aug 23, 2022 at 02:38:22PM +0800, xinlei.lee@mediatek.com wrote:
>> From: Xinlei Lee <xinlei.lee@mediatek.com>
>>
>> Add mmsys function to manipulate dpi output format configuration for MT8186.
>>
>> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
>> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
>> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> 

Patch looks fine, I'll wait for v4 as there is still some discussion on the DRM 
part. Please try to fix the threading problem you had in sending this series.

Thanks,
Matthias

