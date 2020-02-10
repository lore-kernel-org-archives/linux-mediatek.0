Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3096C35254
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 03:40:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83651214DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 03:40:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LImWTklB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="S9eLP5gd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83651214DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J83vM3rpdgb2jqH1goDmRjFX+hJasIHbV5HB76OW5Jc=; b=LImWTklB5N98bY
	3LUNUHfDYUFnAVtQUgtVn3T+HYcjI5/SEQiePh2QIF9WI2I0nfqZJ8w8H57bWhbnhXfIrmmys95XR
	Y/spSb/euva0cEF2Wxk1nBIAWVwFk6wyM/hObHdVLmRwVest1CTK0wC+wV0xh9uy1Kgoimi4PI/sM
	7QGsI1QJd+JRzCCD34nbU/RobezXa8BCksoYlh6Eb35i7kHB5niajUnz1CBFjynGIT4rY0aH8/kdG
	ylW867Y432UE+W7RzZG7BfGI6RrfpIP2XSaFis7RNzJeHnJjcZ6qVDHMhL1PPtPo/Tjn0xD2x/02G
	/bIw1S6BqFXQBAHhDVwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j0zvn-0004UO-8N; Mon, 10 Feb 2020 03:40:19 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j0zva-0003BM-Up
 for linux-mediatek@lists.infradead.org; Mon, 10 Feb 2020 03:40:09 +0000
Received: by mail-qt1-x841.google.com with SMTP id d18so4129804qtj.10
 for <linux-mediatek@lists.infradead.org>; Sun, 09 Feb 2020 19:40:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XboG0iK7GqoQRLczFWQdphkEeLioL/kipjtAa1M1LsY=;
 b=S9eLP5gdMgbocUEmd0v0eluLux599RiHqlUQcnPcwg1s2dnQO9l3gpaEh4BGZeyV+z
 aqL0BOAIJKRMWqW2x4j0jIrP5nmkKgsLxBVMVEI7rpxTyplkU9L/5xFYJ08uOX+ySMYn
 wxPdSIfqvzNvMmhJnx/14ZbDVlXmOqsrx3X40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XboG0iK7GqoQRLczFWQdphkEeLioL/kipjtAa1M1LsY=;
 b=buWcAbJGgmhVZjQZfJpEJjYE6aQuuEnKv8Qm6773fGFbZa6JqA69eHUEAdWHSuDqZm
 qp3RKM8XPCOabxlCDglY/2g/0svYbe/09ULxalksn0jYd34R/yTEQs2CerCIzRoUYPNc
 kbOjfnVRRKKFp3GDydngH+l7IlCXc/TvCF2rGnYctOswxfzZlfrfZyZ6NbPi0p7nn9WY
 SDBV8Ai6tshXXQ/0qeX791qvdFCzptj3LguaeMeZkACHfl2AayOdz+KuRuKi7Ou4ho65
 4FXjQrINU6Dy00SadPP7TsqEgXB+JLV44GywXg0ioEYq38Dy3XmxiJuBVpKJrtT3Y2lM
 Tokg==
X-Gm-Message-State: APjAAAVS+3xKslbz6hGMXS2bH854TtwuewrdUVc+a686OyaO4tQizrLS
 0uEdeTxV+7qIxF0JHFw+Y3MmtZAzLAIQsPzP9hAx6Q==
X-Google-Smtp-Source: APXvYqyXZPq2eK4gfSW4qCTcA8tVKmaBqHZuSe1kg54WZjcEK6H7JEWtY6WZl9WubSwHbINPKhKpAC3WUgPM1fC6YRE=
X-Received: by 2002:ac8:3946:: with SMTP id t6mr8396284qtb.278.1581306001942; 
 Sun, 09 Feb 2020 19:40:01 -0800 (PST)
MIME-Version: 1.0
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <5237381b-c232-7087-a3d6-78d6358d80bf@collabora.com>
 <CANMq1KCD1U7iym_fFWAd-Xa6ipxHmF_FAYxDL5WqGzDnA0KKLw@mail.gmail.com>
 <93aec9ae-00fc-bf55-1d6c-9bd715b78344@collabora.com>
In-Reply-To: <93aec9ae-00fc-bf55-1d6c-9bd715b78344@collabora.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 10 Feb 2020 11:39:50 +0800
Message-ID: <CANMq1KC_nN4MQ8LKPCCNGPPeHRP18n3USXg6DRPousivn_J3aw@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_194007_005436_30D5077F 
X-CRM114-Status: GOOD (  16.70  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Feb 7, 2020 at 4:13 PM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
>
> On 2/7/20 8:42 AM, Nicolas Boichat wrote:
> > On Fri, Feb 7, 2020 at 2:18 PM Tomeu Vizoso <tomeu.vizoso@collabora.com> wrote:
> >>
> >>> Some more changes are still required to get devfreq working, and of course
> >>> I do not have a userspace driver to test this with.
> >>
> >> Have you tried the Panfrost tests in IGT? They are atm quite basic, but
> >> could be interesting to check that the different HW units are correctly
> >> powered on.
> >
> > I haven't, you mean this right?
> > https://gitlab.freedesktop.org/tomeu/igt-gpu-tools/tree/panfrost
>
> Yes, though may be better to use the upstream repo:
>
> https://gitlab.freedesktop.org/drm/igt-gpu-tools
>
> > Any specific test you have in mind?
>
> All the panfrost ones, but looks like panfrost_prime:gem-prime-import is
> failing atm:
>
> https://lava.collabora.co.uk/scheduler/job/2214987

(I first removed opp table from device tree to avoid constant spew
about devfreq not supporting 2 regulators, I should get around to fix
that...)

# /usr/libexec/igt-gpu-tools/panfrost_gem_new
IGT-Version: 1.24-gd4d574a4 (arm) (Linux: 4.19.99 aarch64)
Starting subtest: gem-new-4096
Subtest gem-new-4096: SUCCESS (0.000s)
Starting subtest: gem-new-0
Subtest gem-new-0: SUCCESS (0.000s)
Starting subtest: gem-new-zeroed
Subtest gem-new-zeroed: SUCCESS (0.001s)
# /usr/libexec/igt-gpu-tools/panfrost_get_param
IGT-Version: 1.24-gd4d574a4 (arm) (Linux: 4.19.99 aarch64)
Starting subtest: base-params
Subtest base-params: SUCCESS (0.000s)
Starting subtest: get-bad-param
Subtest get-bad-param: SUCCESS (0.000s)
Starting subtest: get-bad-padding
Subtest get-bad-padding: SUCCESS (0.000s)
# /usr/libexec/igt-gpu-tools/panfrost_prime
IGT-Version: 1.24-gd4d574a4 (arm) (Linux: 4.19.99 aarch64)
Starting subtest: gem-prime-import
(panfrost_prime:1527) ioctl_wrappers-CRITICAL: Test assertion failure
function prime_fd_to_handle, file
../igt-gpu-tools-9999/lib/ioctl_wrappers.c:1336:
(panfrost_prime:1527) ioctl_wrappers-CRITICAL: Failed assertion:
igt_ioctl((fd), ((((2U|1U) << (((0+8)+8)+14)) | ((('d')) << (0+8)) |
(((0x2e)) << 0) | ((((sizeof(struct drm_prime_handle)))) <<
((0+8)+8)))), (&args)) == 0
(panfrost_prime:1527) ioctl_wrappers-CRITICAL: Last errno: 95,
Operation not supported
(panfrost_prime:1527) ioctl_wrappers-CRITICAL: error: -1 != 0
Stack trace:
Subtest gem-prime-import failed.
Subtest gem-prime-import: FAIL (0.004s)
(but that looks expected?)

Now the trickier ones, I guess we're either missing something, or my
dirty 4.19 backport is very broken:
# /usr/libexec/igt-gpu-tools/panfrost_submit
IGT-Version: 1.24-gd4d574a4 (arm) (Linux: 4.19.99 aarch64)
Starting subtest: pan-submit
(panfrost_submit:1643) CRITICAL: Test assertion failure function
__real_main86, file ../igt-gpu-tools-9999/tests/panfrost_submit.c:103:
(panfrost_submit:1643) CRITICAL: Failed assertion: syncobj_wait(fd,
&submit->args->out_sync, 1, abs_timeout(SHORT_TIME_NSEC), 0, NULL)
Stack trace:
Subtest pan-submit failed.
**** DEBUG ****
(panfrost_submit:1643) CRITICAL: Test assertion failure function
__real_main86, file ../igt-gpu-tools-9999/tests/panfrost_submit.c:103:
(panfrost_submit:1643) CRITICAL: Failed assertion: syncobj_wait(fd,
&submit->args->out_sync, 1, abs_timeout(SHORT_TIME_NSEC), 0, NULL)
(panfrost_submit:1643) igt_core-INFO: Stack trace:
****  END  ****
Subtest pan-submit: FAIL (0.119s)
Starting subtest: pan-submit-error-no-jc
Subtest pan-submit-error-no-jc: SUCCESS (0.000s)
Starting subtest: pan-submit-error-bad-in-syncs
Subtest pan-submit-error-bad-in-syncs: SUCCESS (0.012s)
Starting subtest: pan-submit-error-bad-bo-handles
Subtest pan-submit-error-bad-bo-handles: SUCCESS (0.012s)
Starting subtest: pan-submit-error-bad-requirements
Subtest pan-submit-error-bad-requirements: SUCCESS (0.012s)
Starting subtest: pan-submit-error-bad-out-sync
Subtest pan-submit-error-bad-out-sync: SUCCESS (0.012s)
Starting subtest: pan-reset
(panfrost_submit:1643) CRITICAL: Test assertion failure function
__real_main86, file ../igt-gpu-tools-9999/tests/panfrost_submit.c:173:
(panfrost_submit:1643) CRITICAL: Failed assertion: syncobj_wait(fd,
&submit->args->out_sync, 1, abs_timeout(BAD_JOB_TIME_NSEC), 0, NULL)
Stack trace:
Subtest pan-reset failed.
**** DEBUG ****
(panfrost_submit:1643) CRITICAL: Test assertion failure function
__real_main86, file ../igt-gpu-tools-9999/tests/panfrost_submit.c:173:
(panfrost_submit:1643) CRITICAL: Failed assertion: syncobj_wait(fd,
&submit->args->out_sync, 1, abs_timeout(BAD_JOB_TIME_NSEC), 0, NULL)
(panfrost_submit:1643) igt_core-INFO: Stack trace:
****  END  ****
Subtest pan-reset: FAIL (0.840s)

The pan-submit case causes an MMU fault:
(full log: https://gist.github.com/drinkcat/1ae36cb1b1b71f30cc4fc29759612d76)

[ 1215.234937] [IGT] panfrost_submit: executing
[ 1215.318446] [IGT] panfrost_submit: starting subtest pan-submit
...
[ 1215.338644] panfrost 13040000.gpu: Unhandled Page fault in AS0 at
VA 0x000000FF00000000
               Reason: TODO
               raw fault status: 0xA002C0
               decoded fault status: SLAVE FAULT
               exception type 0xC0: UNKNOWN
               access type 0x2: READ
               source id 0xA0
[ 1215.444504] [IGT] panfrost_submit: exiting, ret=98
...
[ 1215.446902] panfrost 13040000.gpu: js fault, js=0,
status=JOB_BUS_FAULT, head=0x300b000, tail=0x300b000
[ 1215.446935] panfrost 13040000.gpu: Unhandled Page fault in AS0 at
VA 0x000000FF00000000
Reason: TODO
raw fault status: 0xA002C0
decoded fault status: SLAVE FAULT
exception type 0xC0: UNKNOWN
access type 0x2: READ
source id 0xA0

pan-reset failure looks similar:
https://gist.github.com/drinkcat/2d336d57e6b95262d83e7a28a409bc5b

Thanks,

> Cheers,
>
> Tomeu
>
> > Thanks,
> >
> >> Regards,
> >>
> >> Tomeu
> >>
> >>> I believe at least patches 1, 2, and 3 can be merged. 4 and 5 are mostly
> >>> useful in conjunction with 6 and 7 (which are not ready yet), so I'll let
> >>> maintainers decide.
> >>>
> >>> Thanks!
> >>>
> >>> Nicolas Boichat (7):
> >>>     dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
> >>>     arm64: dts: mt8183: Add node for the Mali GPU
> >>>     drm/panfrost: Improve error reporting in panfrost_gpu_power_on
> >>>     drm/panfrost: Add support for multiple regulators
> >>>     drm/panfrost: Add support for multiple power domains
> >>>     RFC: drm/panfrost: Add mt8183-mali compatible string
> >>>     RFC: drm/panfrost: devfreq: Add support for 2 regulators
> >>>
> >>>    .../bindings/gpu/arm,mali-bifrost.yaml        |  25 ++++
> >>>    arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 +
> >>>    arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 +++++++++++++++
> >>>    drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
> >>>    drivers/gpu/drm/panfrost/panfrost_device.c    | 123 +++++++++++++++---
> >>>    drivers/gpu/drm/panfrost/panfrost_device.h    |  27 +++-
> >>>    drivers/gpu/drm/panfrost/panfrost_drv.c       |  41 ++++--
> >>>    drivers/gpu/drm/panfrost/panfrost_gpu.c       |  11 +-
> >>>    8 files changed, 326 insertions(+), 30 deletions(-)
> >>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
