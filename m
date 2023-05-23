Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E56B0C7EE26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 23:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MNA57LFsEAjv0YnO7XAE11SZw6Ds4IrSm19nvlVJk98=; b=DXbb0Es8QhiNHFF/djYWuDC6l7
	B0eHwq2oPmBP3NWpVuakcM3FXYblszRFEsVrRlcqQgo/DngKIpxqmJ6kKwgoSCGvn3XE4VORN/RYA
	ReErFIdgaf5bp0fO311zKrsowwvfXo9XyB2wOeWtSKrlaTI/UqrNhghmvgOj4Q9E+TLQ/Czsz71NS
	VHCH8GafzzSRygYr+K43A3znsXx8T3AcG2MsdIVYs2duHxVG+tagYZW3ujiOMTcCPndZBzo7i0OlE
	q4SsvRq/Rnjlx5poJi4y3wQMTZrBGnLDV0zHG86lbRRtORuNS6QtwrYkFxD3s62S48WNkbuigGqiO
	DI5GPeBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1bWD-00Bnbd-0V;
	Tue, 23 May 2023 23:34:17 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1bW9-00BnZw-0w
	for linux-mediatek@lists.infradead.org;
	Tue, 23 May 2023 23:34:15 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2537a79b9acso227343a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 May 2023 16:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684884850; x=1687476850;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MNA57LFsEAjv0YnO7XAE11SZw6Ds4IrSm19nvlVJk98=;
        b=wF+aug1ydohk/cr8Rfez98IIlwqb13f0RxZ6y479XbKidTrvL03zg77sxMin+zGFGx
         l5eXByrl4nPZWQWmqQncYvX9EBJ2jhKSQOmxQvgaHwbuXn34nx47cTnpfrrrJzj+8zQw
         4pNfP+xtaTEDb3tmNzMbZ9lq1FvB1h3Y/9o0b9L7TTlVcKFXDAGLKRDd9xXEgp7O259E
         JEOObHH4XNk6aUQOdhlo/FfoEEjn3MqFmkmu5jjMJ2GV+T7Gsu/kuTOHMZ3neHBb56qU
         VtYRMrOu288bwsGXUhDF1P0SpaYg4k2ai2BHS88fM94NGHU7+411tXSKeuvtY4mY+E9V
         VdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684884850; x=1687476850;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MNA57LFsEAjv0YnO7XAE11SZw6Ds4IrSm19nvlVJk98=;
        b=Xn94Jq3gwxodPVLQ6bEZkq4/0RPb0lHkNIZfPh3Lxa+6y2xwLtM4QfYtugPkw63Nne
         a3ZNLUfOksjlZ8yvEr7ueDD4nzMA01slTdhwU/QbkjWbc6YIHwVRAwxCG1Qbm0tbifTQ
         cz6XgFUdLVXYidcHRfpNCdENxSjiGrQn1nQhJO38f7Oc8sFnj7gzgmRW/j9MbJ97ByO7
         N/vrDqz5mnBPwHm8hzghlbIPHnnEUV1rj1bg1SuLFDwl5woWPTlTQNj52QhdB0cW3Oh+
         0o8wTuIWUBJKOJC3gmXU5fi4WaTEjfK2AOWfjATjckMgyHDMeTfhX4Z5+XZKrb2MINvV
         oH+Q==
X-Gm-Message-State: AC+VfDzfbQuD1UzRa/iJTr1+enXkiDfGzSXu8WpKewD46eS+AGUt+hhj
	S6bdWILGq6kZSPKH4RSVn2HGfg==
X-Google-Smtp-Source: ACHHUZ4/S/KRgTtfzWmFTkvHxw3NShbPiyY6ElSBnhSbSlY2KYV0gjG/Ka+9HzWGVYgXMdo2hQhd0g==
X-Received: by 2002:a17:90b:a45:b0:253:947f:af51 with SMTP id gw5-20020a17090b0a4500b00253947faf51mr13745197pjb.5.1684884849781;
        Tue, 23 May 2023 16:34:09 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id gl21-20020a17090b121500b00253305f36c4sm100944pjb.18.2023.05.23.16.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 16:34:09 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Alexandre Bailon
 <abailon@baylibre.com>, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
In-Reply-To: <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
References: <20230517145237.295461-1-abailon@baylibre.com>
 <d0807fe4-dba2-8244-f655-d04e80973572@quicinc.com>
Date: Tue, 23 May 2023 16:34:08 -0700
Message-ID: <7ha5xud3m7.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_163413_539405_AD099F53 
X-CRM114-Status: GOOD (  17.88  )
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

Jeffrey Hugo <quic_jhugo@quicinc.com> writes:

> On 5/17/2023 8:52 AM, Alexandre Bailon wrote:
>> This adds a DRM driver that implements communication between the CPU and an
>> APU. The driver target embedded device that usually run inference using some
>> prebuilt models. The goal is to provide common infrastructure that could be
>> re-used to support many accelerators. Both kernel, userspace and firmware tries
>> to use standard and existing to leverage the development and maintenance effort.
>> The series implements two platform drivers, one for simulation and another one for
>> the mt8183 (compatible with mt8365).
>
> This looks like the 3 existing Accel drivers.  Why is this in DRM?

Yes, this belongs in accel.  I think Alex had some issues around the
infra in accel with device nodes not appearing/opening properly, but
I'll let him comment there.  But either way, the right approach should
be to fix any issues in accel and move it there.

[...]

>>   .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
>>   drivers/gpu/drm/Kconfig                       |   2 +
>>   drivers/gpu/drm/Makefile                      |   1 +
>>   drivers/gpu/drm/apu/Kconfig                   |  22 +
>>   drivers/gpu/drm/apu/Makefile                  |  10 +
>>   drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
>>   drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
>>   drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
>>   drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++++
>>   drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
>>   include/uapi/drm/apu_drm.h                    |  81 +++
>
> "apu" seems too generic.  We already have 3 "AI processing units" over 
> in drivers/accel already...

Indeed, it is generic, but that's kind of the point for this driver
since it's targetted at generalizing the interface with "AI processing
units" on a growing number of embedded SoCs (ARM, RISC-V, etc.)  In
addition, the generic naming is intentional because the goal is bigger
than the kernel and is working towards a generic, shared "libAPU"
userspace[1], but also common firmware for DSP-style inference engines
(e.g. analgous Sound Open Firmware for audio DSPs.)

As usual, the various SoC vendors use different names (APU, NPU, NN
unit, etc.)  but we'd like a generic name for the class of devices
targetted by this driver.  And unfortunately, it looks like the equally
generic "Versatile processing unit" is already taken Intel's
drivers/accel/ivpu. :)

Maybe since this is more about generalizing the interface between the
CPU running linux and the APU, what about the name apu_if?  But I guess
that applies to the other 3 drivers in drivers/accell also.  Hmmm...

Naming things is hard[2], so we're definitly open to other ideas.  Any
suggestions?

Kevin

[1] https://gitlab.baylibre.com/baylibre/libapu/libapu

[2]
"There are 2 hard problems in computer science: cache invalidation,
 naming things and off-by-1 errors."
 -- https://twitter.com/secretGeek/status/7269997868


