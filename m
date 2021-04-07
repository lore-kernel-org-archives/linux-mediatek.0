Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D4AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 16:34:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDCAB61205
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 16:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDCAB61205
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8qaZO0pCa/5PIM4bGqrK+Kp7CzbM0HdL1XypFW/bsek=; b=MHybRUATgCi5VBPOQzSp0yjnx
	HyJ1qQSWq+yyCCdX79MHyJYs49k/6zZGqtiVh8AM/JI7Ay7uvBoldE3TZWFcDxib7cEpsUzNaSCE8
	GIRL+YwkoayZXx2+inHDxeXPKLrOPzGtlgvqz6m4fUpOeLHpE5ojVAksCmzsHdXE2j8KVBdhzTWPa
	/VxfntsLJ1nEA9zaD7HspljVR9JE6yASrlT3xtP9pUWyhQ4/cZRsY9LWqVLHoJ1/A5cDifyv/QBvu
	OVGSMfeTbAwZEMqcAtdzbqITffiPK9Wa185uQnTe/UoF4Bljn//FwT2ZKiXgqEs9UNqdHC35e2TPg
	KQ6IRryLg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUB8E-005UAn-7r; Wed, 07 Apr 2021 16:34:19 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUB8A-005UAF-JM; Wed, 07 Apr 2021 16:34:16 +0000
Received: by mail-wr1-x435.google.com with SMTP id a4so1714941wrr.2;
 Wed, 07 Apr 2021 09:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3sa3LQLOBxeCLo4GFb1u0PqEDuUq0YAJuYAYRfsoD8I=;
 b=XGEZEG8EbHfLGhPcqXiItLDJT4EC8MGWqNa55/FxcpuSmGhINWzIW/e9BYzlRfVPpt
 8Chjb6hQDkHVeujT+buj5xf6zermWti0Qa0SXvzuBWMDIif08WUITkDKlht8HjwadRn6
 qg30lmofu72ZRaQjvCbq43VbmbMeVoqpo0Do2QnI7/2YzIZGhJEcH88tECsxLya7eoIy
 Prnh4iCAhphDOTjeJMeBwM1iiaFE3AqZHhZY9w3vseYc7Ue3zzjghADTowGaQ4AXcQvD
 V+FmEBg0xRYYkzZwaRsGjp2wFgVWoSfk0BoGbmG8V8QtodBHue0zrTidePCmDOFr0Z30
 toMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3sa3LQLOBxeCLo4GFb1u0PqEDuUq0YAJuYAYRfsoD8I=;
 b=PYkZBpWQ3igrQbH1deOMjCuqte02k+TSdwHivhVaSE81eDEok00WN0bM+om0hnLVWY
 4lLrJUnf0YcncSQdrfzh3eFExMWv1Dj42R1vCJYPKqcT05Kn/05mPCjHFfOx6e4HHxFn
 Iw4zLjRHpFxSw+ipI6baSNG7TfmFuzgsKxupokxFPFtD44++j8hgvUvT736O5f8Agkts
 aEuFebV3KuipirO+eF1pwUhJfkWkvp5m9UxZ4yme5VbkuxvlFMixpywicwJ6KIQBcYFL
 pDbG5SCPXo9PThRj59ikT2qh0Usxq7rQ6Gb+09HWBjo0rT8awFl0vWv1eEjs5rQSDpB0
 wA6g==
X-Gm-Message-State: AOAM5336H+zFoNllOx6F0kK1r4Gih1ILX8Iu1zMsVvBiDqIRp5ZvpThe
 4ckspfOJ85fS7z3+wktDRU8=
X-Google-Smtp-Source: ABdhPJyZI3anJAkuMlf1PNEYlN4Np6KEOgs1BC7KiD0QDsTVwjdGUHm83p1824PzzaAQM0wcXwG32w==
X-Received: by 2002:a5d:58f2:: with SMTP id f18mr5362228wrd.7.1617813253949;
 Wed, 07 Apr 2021 09:34:13 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
 by smtp.gmail.com with ESMTPSA id e13sm45662866wrg.72.2021.04.07.09.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 09:34:13 -0700 (PDT)
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>,
 Irui Wang <irui.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 DTML <devicetree@vger.kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <22814673-e9fe-f65b-cc0f-b02be4f90d1a@gmail.com>
 <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek: changes for v5.13 (second round)
Message-ID: <01c82108-64a8-33ee-3984-5bd7056a0002@gmail.com>
Date: Wed, 7 Apr 2021 18:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a0bp3CUzOQHSX5KYt44j-Njk_u2P=0q-ZQ0HcTBiVVVSA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_173414_846369_A5A9D004 
X-CRM114-Status: GOOD (  26.31  )
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

Hi Arnd,

On 07/04/2021 18:06, Arnd Bergmann wrote:
> On Wed, Apr 7, 2021 at 1:00 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>>
>> Hi Olof and Arnd,
>>
>> Here comes the second round of arm64 DT patches. Hope I'm not too late.
>> Basically we add several node to MT8167.
>> ----------------------------------------------------------------
>> Fabien Parent (6):
> 
>>       arm64: dts: mediatek: mt8167: add some DRM nodes
> 
> I stumbled over this patch adding a lot of aliases:
> 
> +       aliases {
> +               aal0 = &aal;
> +               ccorr0 = &ccorr;
> +               color0 = &color;
> +               dither0 = &dither;
> +               dsi0 = &dsi;
> +               ovl0 = &ovl0;
> +               pwm0 = &disp_pwm;
> +               rdma0 = &rdma0;
> +               rdma1 = &rdma1;
> +               wdma0 = &wdma;
> +       };
> 
> 
> Something doesn't quite feel right about this, and I checked with Rob,
> who also thinks this looks wrong. I suppose we need to have a set of
> well documented alias types rather than just having drivers make up
> new ones on the spot.

These are needed in the DRM driver, see drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c

I added Chun-Kuang who is the maintainer of the driver. I think it's a good idea
to have this alias described in the binding. Maybe a good excuse to move to yaml
as well :)

> 
> I also noticed that some of the referenced nodes are missing a DT
> binding file, so those need to be added and reviewed as well.

I suppose you are talking about "mediatek,mt8173-vcodec-enc-vp8". The binding
patches are in the media tree [1]. Maybe I supposed wrongly that they will land
in v5.13? Or perhaps I should have mentioned that in the pull request.

If it wasn't about this compatible and you can still remember, please let me
know so that we can fix that :)

I double checked and didn't find any missing binding. Some of them only have the
fallback binding described, maybe that's what you are referring to.

> 
> At this point, I'd prefer to drop the entire branch for v5.13 and have
> you work it out for the next release.
> 

Fair enough, pull request was quite late. I'll queue them for the next round then.

Thanks for having a look,
Matthias

[1]
https://git.linuxtv.org/media_tree.git/commit/?id=dd0008beef0dda915a255691e8b3b0527efaf1d8


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
