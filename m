Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6124CC76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XpPfEvaJafdQk9OGNwAPeE8oZldMuXTJ1wSplmPTMQ=; b=Qy0s2UWL4NgWo8Xoz9ozy/r+7k
	gRLoWFSLsdxHj+j1GadIyKs5eJrj9cpAbCBsJiU2gMlvNQEAlCaEVvXZ3vtgjazWHFAT+RH34LiXE
	boQcrRVsDShQYcuwy3bGn8Hyi0QklMkSyUm1K+gQTDt3erfW98LrGYx1kK/Hd3HSMK4P5S+YH/LqK
	tSmi2xz3b8JeHD3oI70G7v6CsbMbQ8PFlpRBJiNwA38t5V/+G75BnuWRl/3OFxai6fSiVKVGe626W
	5dQ+P7oOh5adpbbOSEIrR+pT3ocZIsDq46+AAY6N3rdeDmC+v+i7P5RSQ8zkkoQuEb54wuysntmDi
	5DXHhGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9H3-00GqSS-0x;
	Tue, 11 Apr 2023 08:22:45 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9Gz-00GqNu-2s
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 08:22:43 +0000
Received: by mail-wr1-x431.google.com with SMTP id g5so10019187wrb.5
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Apr 2023 01:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681201357; x=1683793357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XpPfEvaJafdQk9OGNwAPeE8oZldMuXTJ1wSplmPTMQ=;
        b=BrlQU45vdQ3zKlNTUPYRt0jjCvKE/qhZBFgXrxg8IvaeN1IXatGdK+c1mjQXum2rtI
         HuWYIEXVTX5PJjX8yZoclDEuajHgGEwbr19Cvfo/0YxNhOD1p77G3a1b6v5NA5YT+ZhG
         Byh9NIRe2/IL3okyYeSEWCm4YxNaaLlsfKSRPHF1GPwLchU+OyDX029JVSiuhK7a/mDZ
         aAOR5nubPGLzdcmiOnfFxaaOK6p/eTLeqQIqenAY8u3vzVWzDYTolO0wtEufUaW9X9KM
         Ir6+APjkrp49qkyuqGNYwhQbQOoJDjMAx5DJwAWctncatfEptMK5dZmcno0szxOseV+i
         py3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681201357; x=1683793357;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+XpPfEvaJafdQk9OGNwAPeE8oZldMuXTJ1wSplmPTMQ=;
        b=rnvbyUpywwhFt3P1yQgzYLZqW0GFJQqC8rxQtHwzWI3WqeDPkoxNYsXcagaa3I65RP
         TTH8BssSYUnynr/HJK+6S2KV9HBk8LSJ0qg159NOeI8WFnzvrs/6XK0DqeDRxPm7AHrM
         y9bj6czdF3up75iQ/yu6ctunZ2tAXs+lkQxLsg5FLFNBaO+/dcImLj38O7uQwGNhtF1L
         WWHABZePHDyF3l6VyqbFfpugfzlrda6XMwjzOdKPYUIk/hIC56jj2JbLXc42itL+v72S
         EOJ3FGnPoLV94ghcDKsFCU9D2a58I6vfkXd+aCIJqrA+vFwtyc2zsPP2OBRJHk+q6o3A
         82rw==
X-Gm-Message-State: AAQBX9cDEmavmPulKhNvkPpIjShvCY1rXG07ICXtDkjI+DN49sxHiT+C
	PJRR+8tlaTSlUY5c1yYy1YaWNg==
X-Google-Smtp-Source: AKy350ZHBb4mMpY/hce0OQzOyb9NHoj+BNj6MWzRcVd9xPaMjVO3DvSEhPf+ox4y2xEJFETu1ti/iQ==
X-Received: by 2002:a5d:6050:0:b0:2ce:9f35:59b9 with SMTP id j16-20020a5d6050000000b002ce9f3559b9mr8166431wrt.17.1681201357286;
        Tue, 11 Apr 2023 01:22:37 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id a16-20020adffad0000000b002efb2d861dasm10588664wrs.77.2023.04.11.01.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 01:22:36 -0700 (PDT)
Message-ID: <9f341ab0-19ec-166f-86da-3bc7711645de@baylibre.com>
Date: Tue, 11 Apr 2023 10:22:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2, 1/2] media: mediatek: vcodec: make sure array index is
 in valid range
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 maoguang.meng@mediatek.com, Yunfei Dong <yunfei.dong@mediatek.com>
References: <20230411055413.539-1-irui.wang@mediatek.com>
 <20230411055413.539-2-irui.wang@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230411055413.539-2-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012242_118729_AC6622BE 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

On 11/04/2023 07:54, Irui Wang wrote:
> CERT-C Characters and Strings:
> dev->reg_base[dev->venc_pdata->core_id] evaluates to an address
> that could be at negative offset of an array, check core id is
> in valid range.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

