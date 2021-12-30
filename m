Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED6BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 15:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1Hmk/fCDj6n+4ap1czMIn9SACGQ0UbWAV0SqUDnUXw=; b=N5Msc83cfL2Gpx
	gcsiMMLIdvSYZtD1CYbDbuJAN+kR4KH0a4etfLEsTh1bA/Mv7AJatmW8FhDi4X6Fx522hv0gCj0Nn
	Hgavh9m0JASI9AV9NdMgSN45DyY6h7OTe3nILd0oo/D52Burt1CZJFstiuWdvFdhpPctpsPFK/Y/t
	9lmKBZqaX1rV1HFBBmUSgWOsqd7BiU1aX5XZUoV9eZQzCLZCq6VL3W9s2XKDaNC/0xGhJjSY8gkpo
	xsAVv5SHGvbhAg34j73q9b8X4gFY+m/+p0DvZQ/YJQbxj8zOt1JFl3S31ljH5EQ06jFuZ9QS1qa93
	/Dufk91Gg+a41Te1vqog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2x7P-004cLR-Nm; Thu, 30 Dec 2021 15:13:27 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2x7C-004cJ1-Dp; Thu, 30 Dec 2021 15:13:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 k66-20020a1ca145000000b00345fa984108so7770472wme.2; 
 Thu, 30 Dec 2021 07:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BrOBt56bIUGwhax4+hkiSfB9eBwZpxmU8jWPncxv4xY=;
 b=mdcO0u7q512tAOfsTZd7cVP+9FoqU2UTTHPO+Yo/IGSV0jpo3V6ocoJcpfqVC+FqVq
 Y/R2IMnisigM9OZSRq5m8cMI7UyxCzpEuwJlZjzD5I47qKBijMd0cTgW8YdmGvwqGIgG
 LwR00rdl+w0+6VoEoFxks9NrghoH8gzJl2c9Dh3417RDCUfH9BARG/IJnJfzaTAntEg/
 CYUuZhMWbhoQqgpxKCsVWyAdkttIQD7uzWMV74baJmOu3o7+kEPwlbuTYOZNTQcs/XG3
 ICfmjodf46LaSnfOU3e9lZLYnTXzYhDprLDPs755K6R3tRfUNrteJoBN+1Tea/4Qukih
 upXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BrOBt56bIUGwhax4+hkiSfB9eBwZpxmU8jWPncxv4xY=;
 b=F4k6KB/ax2UvSoQkpRyjrshZxSf7y3wSYSGTaOK3rd0iEheietvDNpOivq+HQ261UW
 b6+0xhXxP6BEYUqm3Rt9aK3KOL8PGsPhAYtLVkHApXUKng628uqFXZiGIVYV2zrWkRte
 T+cL3QplhfmuJLwx0bDzXJd3WKsB8qez0bnphckrFOcnY8GwOCF7KBOEb5qXziR6aiv8
 FexyuGHUV2yhP7RxddCRp6wqQIdiy16qBOtMe2OaKvBL2P1fnACjFGRDVwxEi2FPPtEI
 rowS9VRL8K4WigYUoSN5S1LWSnKLrhY5U7/UdJTiHNmbh6AJ2ULyZMbSy0yQ4xXaZPk1
 lk4Q==
X-Gm-Message-State: AOAM531Ds1V70wXxXC6jKYwZ+M1DCSAWA+m5eG1AgTiLQ2NrhX02epUO
 eTDfhiXmCmd96coFKj4VIHY=
X-Google-Smtp-Source: ABdhPJz6Ivr54shp46pcRY+QQqmJl5qUd/LY3TzF+V+pjZDP3U8afmIJ+avvhxp005UdEO/5axkTJw==
X-Received: by 2002:a1c:20c2:: with SMTP id
 g185mr26301905wmg.115.1640877192898; 
 Thu, 30 Dec 2021 07:13:12 -0800 (PST)
Received: from [192.168.1.145] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id bg19sm2589127wmb.47.2021.12.30.07.13.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Dec 2021 07:13:12 -0800 (PST)
Message-ID: <fff75b65-51ab-cafd-a55f-137c0b7c2dc6@gmail.com>
Date: Thu, 30 Dec 2021 16:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v20 0/7] soc: mediatek: SVS: introduce MTK SVS engine
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>
References: <20210721070904.15636-1-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210721070904.15636-1-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_071314_497699_C1AFD0A2 
X-CRM114-Status: UNSURE (   8.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Roger,

On 21/07/2021 09:08, Roger Lu wrote:
> 1. SVS driver uses OPP adjust event in [1] to update OPP table voltage part.
> 2. SVS driver gets thermal/GPU device by node [2][3] and CPU device by get_cpu_device().
> After retrieving subsys device, SVS driver calls device_link_add() to make sure probe/suspend callback priority.
> 3. SVS dts refers to reset controller [4] to help reset SVS HW.
> 
> #mt8183 SVS related patches
> [1] https://patchwork.kernel.org/patch/11193513/
> [2] https://patchwork.kernel.org/project/linux-mediatek/patch/20201013102358.22588-2-michael.kao@mediatek.com/
> [3] https://patchwork.kernel.org/project/linux-mediatek/patch/20200306041345.259332-3-drinkcat@chromium.org/
> 

Comments made in v16 actually also hold for v20, so please take them into account :)

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
