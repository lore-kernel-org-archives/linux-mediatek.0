Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73EF9C48BE0
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 10:09:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3601C611CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 10:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3601C611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C8DHgTCkSCpsHs4Mfs2LpidIkeaTNSMNXerZ/K0qarQ=; b=rLNVi2Gwt8SNQchScwgq2/HVUd
	QV+YPpzkiGQfBtP2vGrN+oHQJgC1AShIelGhjxxk8wc5XMPGmWBH29UQKTj7BoWgdnDo7fSh0I0YC
	xPKVvXhfZOnwNRoAlXrb1MnIgMtTpDdXz0NlB5mteDk4zcMvbjOJsN+w9qD/hE3v5wB45S/jRMGnl
	X9CrOlAR0Wtw10PW4/jry2e0waxWyP08KIp/7G3zueVRzF3MiizM/KgQse2wZmd0vF76f5/tyaZmn
	9WlTVGylTzqDv8xL27tZi0D0rMu/neeoSgGgR19mMPQpvkRoBemQ4+KczaMswGZCBdXFuTeD5iRuu
	Wfg8D/hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lre5k-004egh-SU; Fri, 11 Jun 2021 10:08:44 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lre5W-004edd-VF; Fri, 11 Jun 2021 10:08:32 +0000
Received: by mail-wr1-f42.google.com with SMTP id r9so5412557wrz.10;
 Fri, 11 Jun 2021 03:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gFhqPqOGSTJJX3dT27efQ5zQlrIM3h1f2aA9XZu0Vc8=;
 b=Fb53nvxjK0BcaL7BNdeGiZtFhAi6nR4cLzDs/h/OmS32FIVcPer0MefjbMscy6hQXG
 WMiJm90n3CUAcReVU4u3av59Vc6dEzxTd5D9bEFg8lJZiE210pmWEqeBDMBs1DQSL6dF
 MAF21gvl2Xq08HRmFab1/k4A/kSdoqnLrq33ukkcjDTHatq70Lv4U25FLv0FcqxhfNGO
 U7kVBzy5cS5yKtji5+YZARfpqSNYRHSw9oXO8shNn3E318Ag1KiTRFhxtfzd1EAkPoBy
 TJet10s2y8zWQ5CY/FGR9VQUKRpBUjE6b9Fwdn4A48fsQpWlWMUN14UbhJda6vp5o1s4
 TeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gFhqPqOGSTJJX3dT27efQ5zQlrIM3h1f2aA9XZu0Vc8=;
 b=FcMu2M3GSLvd8AyiYAB0QKg0y+ZJp1wOTg64QwnwsUgDQBY0bnLVzNgGq+O7iYgQ0u
 sIvqUPmgsH8aUJeqsIi/XhhJTzrJ6E1hgEa5niWLOYgV7b0XsYv2B5ftz64qYQXWtRqA
 wcnll4dSYVHCggmu1+c8JzRnIQkWSqSRCiV6T99QaktMPOOtGGTNV1dowo0J+cM3mOZ0
 LjOLsTa5oovEt1Gb89ltjwtWtg+qB0hK6AQU0fETs8GA4P2yTWfBV3EOCp/GJdxEADs+
 auBBBopLxywE+q4YY9X00BfH8gBPwIyULZHtP+CBCbgselLU9tPPLCRX4NaFltCh5xXg
 YIQQ==
X-Gm-Message-State: AOAM533GxVTlw6BiW36j4wNtGieSf0XCUcGjcCd+dybmWGNiI/63u5cM
 4u2wr5UdEI2ZCa9zvlZdkZY=
X-Google-Smtp-Source: ABdhPJyXEm705FvtfJsTKJDMlqkddRVeBGjayOW/x5R9yipKm4VX2Cwnxm40M9p06MvhSKM1KAZsQg==
X-Received: by 2002:adf:ea4c:: with SMTP id j12mr3166775wrn.64.1623406047349; 
 Fri, 11 Jun 2021 03:07:27 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id r6sm6437738wrz.91.2021.06.11.03.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Jun 2021 03:07:26 -0700 (PDT)
Subject: Re: [PATCH v5 13/16] media: mtk-vcodec: Get rid of
 mtk_smi_larb_get/put
To: Yong Wu <yong.wu@mediatek.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, srv_heupstream@mediatek.com,
 Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, Nicolas Boichat <drinkcat@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>, anan.sun@mediatek.com,
 chao.hao@mediatek.com, ming-fan.chen@mediatek.com, yi.kuo@mediatek.com,
 eizan@chromium.org, Alexandre Courbot <acourbot@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 linux-media@vger.kernel.org
References: <20210410091128.31823-1-yong.wu@mediatek.com>
 <20210410091128.31823-14-yong.wu@mediatek.com>
 <CAJMQK-iTrQRDDm_=LNqSpvXFd431LYRxXMasJHUpN+K8rJ=Qpg@mail.gmail.com>
 <1620822547.2983.8.camel@mhfsdcap03>
 <c1422242-8d8c-9592-c22d-288c503cd8b1@gmail.com>
 <1623326528.23717.20.camel@mhfsdcap03>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e7269c80-5437-6ab9-c1db-df0b94eb97d8@gmail.com>
Date: Fri, 11 Jun 2021 12:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1623326528.23717.20.camel@mhfsdcap03>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_030831_049671_6B6ED871 
X-CRM114-Status: GOOD (  23.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/06/2021 14:02, Yong Wu wrote:
> On Thu, 2021-06-10 at 09:53 +0200, Matthias Brugger wrote:
>> Hi Yong,
>>
>> On 12/05/2021 14:29, Yong Wu wrote:
>>> On Wed, 2021-05-12 at 17:20 +0800, Hsin-Yi Wang wrote:
>>>> On Sat, Apr 10, 2021 at 5:14 PM Yong Wu <yong.wu@mediatek.com> wrote:
>>>>>
>>>>> MediaTek IOMMU has already added the device_link between the consumer
>>>>> and smi-larb device. If the vcodec device call the pm_runtime_get_sync,
>>>>> the smi-larb's pm_runtime_get_sync also be called automatically.
>>>>>
>>>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>>>> CC: Irui Wang <irui.wang@mediatek.com>
>>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>>> Reviewed-by: Evan Green <evgreen@chromium.org>
>>>>> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
>>>>> ---
>>>>>  .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 37 ++-------------
>>>>>  .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 --
>>>>>  .../platform/mtk-vcodec/mtk_vcodec_enc.c      |  1 -
>>>>>  .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   | 46 ++-----------------
>>>>>  4 files changed, 10 insertions(+), 77 deletions(-)
>>>
>>> [...]
>>>
>>>>> @@ -108,13 +80,6 @@ void mtk_vcodec_enc_clock_on(struct mtk_vcodec_pm *pm)
>>>>>                 }
>>>>>         }
>>>>>
>>>>> -       ret = mtk_smi_larb_get(pm->larbvenc);
>>>>> -       if (ret) {
>>>>> -               mtk_v4l2_err("mtk_smi_larb_get larb3 fail %d", ret);
>>>>> -               goto clkerr;
>>>>> -       }
>>>>> -       return;
>>>>
>>>> You can't delete the return; here, otherwise vcodec_clk will be turned
>>>> off immediately after they are turned on.
>>>
>>> Thanks very much for your review.
>>>
>>> Sorry for this. You are quite right.
>>>
>>> I checked this, it was introduced in v4 when I rebase the code. I will
>>> fix it in next time.
>>>
>>
>> Please also make sure that you add all maintainers. I realized that at least for
>> the media/platform drivers we miss the maintainer and the corresponding mailing
>> list.
>> This is especially important in this series, as it spans several subsystems.
> 
> Thanks for hint. I only added the file maintainer here. I will add
> linux-media in next version.
> 
> By the way, this patchset cross several trees, then which tree should it
> go through. Do you have some suggestion?
> 

That's a good question. I think the media tree would be a good candidate, as it
has the biggest bunch of patches. But that would mean that Joerg is fine that.
The DTS part could still go through my tree.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
