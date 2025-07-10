Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39309C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVTTUG4ixR64gjOtXwPhydbCj9ebkFof+SdtPH9VgkU=; b=41QaN4VHEBk1XeLD0OeTIdIEqb
	BHc7B/YFAxUQa1vFDsJE4MctpmLXgT927OJX2WnYm/PK4nQJe0KXZ9amiKrNocy7kEhsD5zzN+AAg
	RXRm9mCpBrtYEMS3qZsTac54mA4aXUAAI5FBRqZ4Jv4lOwr1fqmCK0d2Kh+ov3NQPsvWkvHHQ+ycg
	+FVZaQxcLwSZVRGrE5uP1YJpxfL5qI23d07P50cILPtRj3hONzWtZmQoGqVC9A6bG+sGPMdqo4CWf
	wN67W/VgXHRHHTXza5112Y0Eai/u8hbZImjmW8QBwDOPbiLBKJr4VRfJb/FOSfv+8czdQwlUlt+WE
	z+dgfyVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZu6G-0000000COGv-2ktg;
	Thu, 10 Jul 2025 16:26:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZrao-0000000Bzat-49LK
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 13:45:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752155141;
	bh=GuONawvPbvGUx5N5LK6rRWPPmEvqYxfiZR7qhY5tG0E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QZ5+xVfzmp49kaoVrLSHOBTiGvU6+OdAYgm+U0qT7Bd22uED+kTrWnibup4ajNlUR
	 elXL8qC9S3bt2M0RWRlTYKwyYoEQNsowxnxtCG5mnESC2ZmToKthcJE/srbaTb8QOQ
	 +2cRCtUtK0wsJpggE9qTSJn5X8evZcsCNoftAVAohIQYYA0BzkJaFajmQ9CbjQc9SD
	 HIFDSq92ZQBS9CeAj09kcL6oKFCAD7/bLmJzXU30RC2pLJej5vGG/C1SXtd2PcNT+Z
	 wntWiJiUvDHT9yMJjrjaNBwrYqb9ogxAu0zLSm0LLwbqAlKF2Udc/OQ7g3OO+wwtBV
	 Mq5EUmQdpfVCA==
Received: from [192.168.50.250] (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E89717E0FB8;
	Thu, 10 Jul 2025 15:45:39 +0200 (CEST)
Message-ID: <cc12da37-d937-442e-88d3-cb946b683728@collabora.com>
Date: Thu, 10 Jul 2025 19:15:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm-ci: mt8173-elm-hana:
 kms_atomic_transition@plane-all-modeset-transition-internal-panels flake
To: Thomas Zimmermann <tzimmermann@suse.de>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 nfraprado@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
References: <30b3f8b0-3409-4329-bb60-b6287e1a439d@collabora.com>
 <ab591252-120c-4740-9e89-7efd31dc00a0@suse.de>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <ab591252-120c-4740-9e89-7efd31dc00a0@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_064543_332542_9F263815 
X-CRM114-Status: UNSURE (   9.36  )
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

Hi Thomas,

On 10/07/25 18:56, Thomas Zimmermann wrote:
> Hi,
> 
> spamming the mailing lists with copy-paste mails is not going to help 
> with these problems.

Sorry, the intention was not to spam, but to ensure flake reports are 
tracked.

The link to the email will be added to drivers/gpu/drm/ci/xfails/.
For example:
https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt?ref_type=heads#L51

This is based on what is suggested in 
Documentation/gpu/automated_testing.rst for flakes.

For amdgpu, i915 and msm, a gitlab issue is created instead.

Apologies for not mentioning this earlier in the email.

Regards,
Vignesh

> 
> Best regards
> Thomas
> 
> Am 10.07.25 um 15:16 schrieb Vignesh Raman:
>> Hi Maintainers,
>>
>> There is a flake test reported for the mediatek driver in drm-ci.
>>
>> # Board Name: mt8173-elm-hana
>> # Failure Rate: 60
>> # IGT Version: 2.1-g26ddb59c1
>> # Linux Version: 6.16.0-rc2
>> kms_atomic_transition@plane-all-modeset-transition-internal-panels
>>
>> 07:35:22.411: DEBUG - Begin test kms_atomic_transition@plane-all- 
>> modeset-transition-internal-panels
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
>> Test assertion failure function wait_for_transition, file ../tests/ 
>> kms_atomic_transition.c:539:
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
>> Failed assertion: fd_completed(data->drm_fd)
>> 07:35:22.411: ERROR - Igt error: Dynamic subtest pipe-A-eDP-1 failed.
>> 07:35:22.411: ERROR - Igt error: **** DEBUG ****
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.2, fb 84
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.3, fb 83
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: }
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: commit {
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.0, fb 82
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "FB_ID" to 0x52/82
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.1, fb 84
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.2, fb 84
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.3, fb 83
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: }
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: eDP-1: set_pipe(A)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: eDP-1: Selecting pipe A
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: plane_set_fb(0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: plane_set_size (0x0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: fb_set_position(0,0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: fb_set_size(0x0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: plane_set_fb(0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: plane_set_size (0x0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: fb_set_position(0,0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: fb_set_size(0x0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: plane_set_fb(0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: plane_set_size (0x0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: fb_set_position(0,0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: fb_set_size(0x0)
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: commit {
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: Pipe A: Setting property "MODE_ID" to 0x55/85
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.1, fb 0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_W" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_H" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_W" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_H" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "FB_ID" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_ID" to 0x0/0
>> 07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.2, fb 0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_W" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_H" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_W" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_H" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "FB_ID" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_ID" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.3, fb 0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_W" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_H" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_W" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_H" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "FB_ID" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_ID" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     eDP-1: preparing atomic, pipe: A
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: eDP-1: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: }
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) DEBUG: 
>> Retrieved vblank seq: 4302 on unk
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.0: plane_set_fb(82)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.0: plane_set_size (1366x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.0: fb_set_position(0,0)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.0: fb_set_size(1366x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.0: fb_set_size(1366x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.0: plane_set_size (1366x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: plane_set_fb(84)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: plane_set_size (1024x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: fb_set_position(0,0)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: fb_set_size(1024x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: fb_set_size(1024x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.1: plane_set_size (1024x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: plane_set_fb(84)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: plane_set_size (1024x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: fb_set_position(0,0)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: fb_set_size(1024x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: fb_set_size(1024x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.2: plane_set_size (1024x768)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: plane_set_fb(83)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: plane_set_size (512x512)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: fb_set_position(0,0)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: fb_set_size(512x512)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: fb_set_size(512x512)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: A.3: plane_set_size (512x512)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: commit {
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: Pipe A: Setting property "MODE_ID" to 0x51/81
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.0, fb 82
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "FB_ID" to 0x52/82
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.0: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.1, fb 84
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.2, fb 84
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display:     populating plane data: A.3, fb 83
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_kms- 
>> DEBUG: display: }
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
>> Test assertion failure function wait_for_transition, file ../tests/ 
>> kms_atomic_transition.c:539:
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
>> Failed assertion: fd_completed(data->drm_fd)
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_core- 
>> INFO: Stack trace:
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_core- 
>> INFO:   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_core- 
>> INFO:   #1 ../tests/kms_atomic_transition.c:536 
>> wait_for_transition.constprop.0()
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_core- 
>> INFO:   #2 ../tests/kms_atomic_transition.c:715 
>> __igt_unique____real_main1122()
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_core- 
>> INFO:   #3 ../tests/kms_atomic_transition.c:1122 main()
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_core- 
>> INFO:   #4 [__libc_init_first+0x80]
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_core- 
>> INFO:   #5 [__libc_start_main+0x98]
>> 07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) igt_core- 
>> INFO:   #6 [_start+0x30]
>> 07:35:22.412: ERROR - Igt error: ****  END  ****
>> 07:35:22.412: ERROR - Test kms_atomic_transition@plane-all-modeset- 
>> transition-internal-panels: Fail: See "/results/ 
>> igt.kms_atomic_transition@plane-all-modeset-transition-internal- 
>> panels.log"
>> 07:35:22.412: DEBUG - End test kms_atomic_transition@plane-all- 
>> modeset-transition-internal-panels
>>
>> Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79879662
>>
>> Please could you have a look at these test results and let us know if 
>> you need more information to debug. Thank you.
>>
>> Regards,
>> Vignesh
> 


