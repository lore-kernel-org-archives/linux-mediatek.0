Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC5FC41535
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7pUSzqnp59AKRRbeN0Gow4KM84WiVeeZUDkAwTexxxA=; b=c5ura0A3eZaJU9jVqod3QuVBiW
	1POWGbjaGHLDrpYUXCYzJehYV9AdgM1xef2CSkGHdk4st87yz+9ivXhL8ryNKPsD8J8xgSIPcnV2B
	gYLidVKFHR1iRUAGxIvVWvgsNDd5c8Jo0T5JbcEOvnXcrKmNkvZdpnryH7FiJW5weCn1TIxf+C0rX
	L0voxY8fKACx54VkCiiCuqmx9OV8usfSPuJik+dmmzozHfxBpImNTcbod0aLdkecES84q+B9BnpP9
	/WBKDKmA0ORuYTcn8lj01t5/cneVfEogItORlnD+EdHVOIV8/wX7lh5GWYQd9Li3gVUz0tHBtVu/e
	PUTbfqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFX4A-00DXce-2I;
	Tue, 19 Dec 2023 10:11:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFX47-00DXaK-1G
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Dec 2023 10:11:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702980661;
	bh=pj0lIA9Q31kjFuIIwauPHWLe6dxO8mUSAxs/Y/O05fE=;
	h=Date:From:Subject:To:Cc:From;
	b=EuVUp0u4zuytOE5fNxYB3j0yd1OVnJEE6GLKgLjmx/aFplW/WyN4tgOgknfIe9b0A
	 v3/EpqhI1xCdZzEwMeldks2pNcvohMiMagZdm8DuZVu1R5QORuji7KLb/mJEqouiZ5
	 KUKUnQncTevvLo/cjNka/c3mYE31RndhdxL4nbHSmVgNZ+tY9sSaRlBx1mGOCIKOlz
	 cr0dyM3Wr73Gt/YJDejfTmUzKmnFpnBBPKmEIZ28cdf23z1XevP16lXWYT2Vwp5NuZ
	 PsFhC6bxYFAagBQJKem62asn0n3vgqyZAWOaroajRPoqWBEmwCMlYDOmvSWU39TIPT
	 MMJRHPrGfxbgw==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1C37D37813F2;
	Tue, 19 Dec 2023 10:10:57 +0000 (UTC)
Message-ID: <931e3f9a-9c5c-fc42-16fc-abaac4e0c0ff@collabora.com>
Date: Tue, 19 Dec 2023 15:40:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: Flaky tests for mediatek mt8173/mt8183
Content-Language: en-US
To: chunkuang.hu@kernel.org, p.zabel@pengutronix.de
Cc: Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Daniel Stone <daniels@collabora.com>,
 David Heidelberg <david.heidelberg@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_021107_615357_19EDCD8F 
X-CRM114-Status: UNSURE (   5.74  )
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

Hi Maintainers,

There are some flaky tests reported for mediatek mt8173 and mt8183 
display driver testing in drm-ci.

=== mediatek mt8173 ===
# Board Name: mt8173-elm-hana.dtb
# Linux Version: 6.7.0-rc3
# IGT Version: 1.28-gd2af13d9f
# Failure Rate: 50

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52857571
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52923475

Below test shows inconsistency across multiple runs, giving
results of Pass and Timeout/Fail alternately

kms_cursor_legacy@cursor-vs-flip-atomic-transitions: Timeout and also 
reported as flaky by deqp-runner:
Starting subtest: cursor-vs-flip-atomic-transitions
Using pipe A & eDP-1
Using a target of 128 cursor updates per quarter-vblank
page flip 8 was delayed, missed 6 frames
page flip 25 was delayed, missed 6 frames
page flip 1 was delayed, missed 15 frames

kms_prop_blob@invalid-set-prop (Fail):
CRITICAL: Test assertion failure function prop_tests, file ../tests 
/kms_prop_blob.c:342:
CRITICAL: Failed assertion: drmIoctl(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, 
&set_prop) == -1 && errno == EINVAL
CRITICAL: Last errno: 13, Permission denied
igt_core-INFO: Stack trace:
igt_core-INFO:   #0 ../lib/igt_core.c:1988 __igt_fail_assert()
igt_core-INFO:   #1 ../tests/kms_prop_blob.c:312 prop_tests()
igt_core-INFO:   #2 ../tests/kms_prop_blob.c:382 
__igt_unique____real_main350()
igt_core-INFO:   #3 ../tests/kms_prop_blob.c:350 main()
igt_core-INFO:   #4 [__libc_init_first+0x80]
igt_core-INFO:   #5 [__libc_start_main+0x98]
igt_core-INFO:   #6 [_start+0x30]

kms_prop_blob@invalid-set-prop-any (Fail):
CRITICAL: Test assertion failure function prop_tests, file 
../tests/kms_prop_blob.c:334:
CRITICAL: Failed assertion: drmIoctl(fd, DRM_IOCTL_MODE_OBJ_SETPROPERTY, 
&set_prop) == -1 && errno == EINVAL
CRITICAL: Last errno: 13, Permission denied
igt_core-INFO: Stack trace:
igt_core-INFO:   #0 ../lib/igt_core.c:1988 __igt_fail_assert()
igt_core-INFO:   #1 ../tests/kms_prop_blob.c:321 prop_tests()
igt_core-INFO:   #2 ../tests/kms_prop_blob.c:382 
__igt_unique____real_main350()
igt_core-INFO:   #3 ../tests/kms_prop_blob.c:350 main()
igt_core-INFO:   #4 [__libc_init_first+0x80]
igt_core-INFO:   #5 [__libc_start_main+0x98]
igt_core-INFO:   #6 [_start+0x30]

=== mediatek mt8183 ===
# Board Name: mt8183-kukui-jacuzzi-juniper-sku16.dtb
# Linux Version: 6.7.0-rc3
# IGT Version: 1.28-gd2af13d9f
# Failure Rate: 100

Pipeline url:
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/52925486

# Reported as flaky by deqp-runner
kms_cursor_legacy@cursor-vs-flip-atomic-transitions:

Starting subtest: cursor-vs-flip-atomic-transitions
Using pipe A & eDP-1
Using a target of 128 cursor updates per quarter-vblank
page flip 1 was delayed, missed 2 frames
page flip 2 was delayed, missed 9 frames
page flip 7 was delayed, missed 1 frames
page flip 8 was delayed, missed 2 frames

I will add these tests in 
drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-flakes.txt and 
drivers/gpu/drm/ci/xfails/mediatek-mt8183-display-flakes.txt 
(https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/Documentation/gpu/automated_testing.rst#n70)

Please could you have a look at these failures and let us know if you 
need more information. Thank you.

Regards,
Vignesh

