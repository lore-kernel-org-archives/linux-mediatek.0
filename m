Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45B7C3DA49
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jul 2024 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/Cwh7ScSjvMKvlJMWCFSmzOna/mEmAvLPbWdtox1gE=; b=oX/0Xsr1NbJa5Zrz4lEO9yb+bZ
	94+JqdofrIDb0WymBwiX/PyjvB4706uwLlwZeBC1WfJiaMh6LKl2M5OYyQSzz49eMQyW50Er5uwPA
	5R9JhiyXjaRNzP/K4vnBWSggKnDA8l85dM1cUGV35kvr97xbVqc+wN2UlY0U2/VMCUj1/YFkn+2oS
	SgqnJjQuU9GNGfOON0pqnG5mr84nuI5rjR6XarC3thhr4FUgPI/tPtg/dkMDJTsiqObLjPZtpp2Yu
	+PF/ybUO3Pv6m+pQ3F34YDk4tTngF9ve0mSp/LhU8llrZlgJ4ggWqfuSGXLjymab4sMfE/4DEGbY+
	CKNYFPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXHrH-00000003WkK-0S8l;
	Fri, 26 Jul 2024 10:07:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXHrD-00000003WjW-3z4M;
	Fri, 26 Jul 2024 10:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721988446;
	bh=d6RAV3x+NFkqdpVb86ATPZjPs7X0Voj8XsmWJrljTJQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=2qaNsi32srLc1IjeuNAQNW4FjclHKcJH4eubhhwDHttyzpfCRX3fuKY8K1JZA4wRg
	 qogbBjsOP/IcSAc+mhEhRKEq5yPYhI5Z3DquDZEvgK/meNnW0FWCtEfoSPJtFOXk/6
	 h/FT9qKMqz4eugPJB7gNJcRPdk06dnUPwMrD0YpFH/v/H+Qq+n/oemyeRGS0O/ic71
	 Ws1DmQ0emOCjrewj54u9q7/mOz+4QOBd3uUzpeSZAJq8a3pesHJxh5TyK4Q4k6VG2h
	 B1ydv39K73z/eS+wlRe/+I8/uSBemdxr2Hyw1Qdo4FwO2OM3ircAJ7aeb3LsRj7KDY
	 Rgj+XcRkrX8BQ==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 696E03780BDB;
	Fri, 26 Jul 2024 10:07:23 +0000 (UTC)
Message-ID: <27bd3884-51d8-454f-9ddc-6b5765fd744b@collabora.com>
Date: Fri, 26 Jul 2024 15:37:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] drm/ci: rockchip: add tests for rockchip display
 driver
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 deborah.brouwer@collabora.com, robdclark@gmail.com,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240724101015.523535-1-vignesh.raman@collabora.com>
 <20240724101015.523535-6-vignesh.raman@collabora.com>
 <CAPj87rMJUSRJ9G1uv-w5a_4qqS0R1dDaUEofoJf=ehbMszdfOw@mail.gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CAPj87rMJUSRJ9G1uv-w5a_4qqS0R1dDaUEofoJf=ehbMszdfOw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_030728_159167_352D7C6B 
X-CRM114-Status: GOOD (  25.08  )
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

Hi Daniel,

On 26/07/24 13:06, Daniel Stone wrote:
> Hi Vignesh,
> 
> On Wed, 24 Jul 2024 at 11:12, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>> For rockchip rk3288 and rk3399, the display driver is rockchip
>> and gpu driver is panfrost. Currently, in drm-ci for rockchip
>> rk3288 and rk3399, only the gpu driver is tested. Refactor
>> the existing rockchip jobs to test both display and gpu driver
>> and update xfails.
> 
> Could you also please add RK3588 in a new series (no need to hold this
> one up), with Rockchip KMS and Panthor GPU? You can use the
> rk3588-rock5-b device type in LAVA.

Sure. I Will add and send it in a new series.

> 
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>> index cf3a747f7cec..826cca5efbff 100644
>> --- a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
> 
> This is in the wrong patch?

Yes, this needs to be dropped. Thanks for pointing that out.

> 
>> +++ b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
>> @@ -0,0 +1,71 @@
>> +# Suspend to RAM seems to be broken on this machine
>> +.*suspend.*
>> +
>> +# Too unstable, machine ends up hanging after lots of Oopses
>> +kms_cursor_legacy.*
>> +
>> +# Started hanging the machine on Linux 5.19-rc2:
>> +#
>> +# [IGT] kms_plane_lowres: executing
>> +# [IGT] kms_plane_lowres: starting subtest pipe-F-tiling-y
>> +# [IGT] kms_plane_lowres: exiting, ret=77
> 
> ret 77 is a pure skip here, as you'd expect from a pipe F test,
> because Rockchip doesn't have six CRTCs.
> 
>> +# Console: switching to colour frame buffer device 170x48
>> +# rockchip-drm display-subsystem: [drm] *ERROR* flip_done timed out
>> +# rockchip-drm display-subsystem: [drm] *ERROR* [CRTC:35:crtc-0] commit wait timed out
>> +# BUG: spinlock bad magic on CPU#3, kms_plane_lowre/482
>> +# 8<--- cut here ---
>> +# Unable to handle kernel paging request at virtual address 7812078e
>> +# [7812078e] *pgd=00000000
>> +# Internal error: Oops: 5 [#1] SMP ARM
>> +# Modules linked in:
>> +# CPU: 3 PID: 482 Comm: kms_plane_lowre Tainted: G        W         5.19.0-rc2-323596-g00535de92171 #1
>> +# Hardware name: Rockchip (Device Tree)
>> +# Process kms_plane_lowre (pid: 482, stack limit = 0x1193ac2b)
>> +#  spin_dump from do_raw_spin_lock+0xa4/0xe8
>> +#  do_raw_spin_lock from wait_for_completion_timeout+0x2c/0x120
>> +#  wait_for_completion_timeout from drm_crtc_commit_wait+0x18/0x7c
>> +#  drm_crtc_commit_wait from drm_atomic_helper_wait_for_dependencies+0x44/0x168
>> +#  drm_atomic_helper_wait_for_dependencies from commit_tail+0x34/0x180
>> +#  commit_tail from drm_atomic_helper_commit+0x164/0x18c
>> +#  drm_atomic_helper_commit from drm_atomic_commit+0xac/0xe4
>> +#  drm_atomic_commit from drm_client_modeset_commit_atomic+0x23c/0x284
>> +#  drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x60/0x1c8
>> +#  drm_client_modeset_commit_locked from drm_client_modeset_commit+0x24/0x40
>> +#  drm_client_modeset_commit from drm_fbdev_client_restore+0x58/0x94
>> +#  drm_fbdev_client_restore from drm_client_dev_restore+0x70/0xbc
>> +#  drm_client_dev_restore from drm_release+0xf4/0x114
>> +#  drm_release from __fput+0x74/0x240
>> +#  __fput from task_work_run+0x84/0xb4
>> +#  task_work_run from do_exit+0x34c/0xa20
>> +#  do_exit from do_group_exit+0x34/0x98
> 
> So this is pointing to the error being that, when a client exits, the
> kernel attempts to restore fbdev and then it's broken. Pinning
> pipe-F-tiling-y as specifically responsible for this seems quite odd
> to me, given that it doesn't do anything but only skips. Is that maybe
> just because it's the last test running in the kms_plane_lowres group
> before it exits? Or does it occur more wildly on other test groups?

This was skipped for Linux 5.19-rc2. I will remove from skips and will 
check the behavior.

> 
>> +tools_test@tools_test,Fail
> 
> I keep noticing this failing everywhere. What's up with that? Have you
> reported these logs to the igt list?

I will check this issue and report to igt developers.

Thanks.

Regards,
Vignesh

