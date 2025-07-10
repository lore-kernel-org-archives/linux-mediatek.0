Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447F3C83F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 14:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OY27VDksql42he31hdOKA317WgKmZ7SB8/FFUsD5oh8=; b=T0i1f46F7FzC18ddSDwI9y19ax
	dtR04VhJHJB36QLI2kuWXn+HD2t+pU0dYEUkpEROIk1cwbXLzywcNYq1P8O+H5DFlRKoNoqEKvMMa
	fTHMu3FbX8BZv3CyFyi+s8Jn1Ttmge1/XrvoSI0Z8b6jMQ+91pIdyTU7hNv31o5muB8TA31IBXTn2
	FLYWH3DV918EcDEpS8mWk6ItPWqRdavtNxPKkV7Q7uHl1gJFmnO9UXdEEBquvD2/SoIdC9pUkAsQw
	fWWJwUCyC/CcTsQtd+WS0vO+nfV+nmDuOJMfm3XwA7/NiTlTzrSvvt/LZRO/MvNeu9xNlUPxldUE/
	oZ8JqbtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsVE-0000000C9fB-305l;
	Thu, 10 Jul 2025 14:44:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZqoM-0000000BqSB-0Gyb
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 12:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752152136;
	bh=evfgw5LpQpEUNf1kUbEZOZi+g5HwXlEuIcDYlkmqUXY=;
	h=Date:To:Cc:From:Subject:From;
	b=DwWFa+9ZrpCSD4qhGo4LqbnBh0QdDR1gyqgvXItqzPVuEmEOHZX+OsAPMQ/S/XuN1
	 upvEM/5fF0DperROz8cYlcPCJ4VJg+RufHtiEqsqZnPa/A1J1305EXZbkC5PzHKX4F
	 muEkxfoxqljuhOmgt9xcVE+XZbWYwmPPpM8VyZlWGabFOVkwBUQvry6lJ1RJtCaEtA
	 gRQDszbOuo8C2L7Yokqjk3DnxGNtdINtTdJthhZtnDHSRhWqqW84qnJFkgQHxGlKQy
	 OkMfA5cTwgjYbcxMlpZjlgjVkKi+oPwJcewZIiro1f7x9PbbBAF8WWWCcsH+Yooe/2
	 RGg94CfbP+8WA==
Received: from [192.168.50.250] (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 00ADD17E0FD3;
	Thu, 10 Jul 2025 14:55:33 +0200 (CEST)
Message-ID: <953ab66e-9dda-4003-9b98-9e0d81e18a1f@collabora.com>
Date: Thu, 10 Jul 2025 18:25:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 nfraprado@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: mt8173-elm-hana: kms_flip@busy-flip flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_055538_286711_39160259 
X-CRM114-Status: UNSURE (   3.36  )
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

There is a flake test reported for the mediatek driver in drm-ci.

# Board Name: mt8173-elm-hana
# Failure Rate: 40
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_flip@busy-flip

02:13:29.480: DEBUG - Begin test kms_flip@busy-flip
02:13:29.480: ERROR - Igt error: (kms_flip:222) CRITICAL: Test assertion 
failure function __run_test_on_crtc_set, file ../tests/kms_flip.c:1666:
02:13:29.480: ERROR - Igt error: (kms_flip:222) CRITICAL: Failed 
assertion: do_page_flip(o, o->fb_ids[1], 1) == 0
02:13:29.480: ERROR - Igt error: (kms_flip:222) CRITICAL: Last errno: 
16, Device or resource busy
02:13:29.480: ERROR - Igt error: (kms_flip:222) CRITICAL: error: -16 != 0
02:13:29.480: ERROR - Igt error: Dynamic subtest A-eDP1 failed.
02:13:29.480: ERROR - Igt error: **** DEBUG ****
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=5464)
02:13:29.480: ERROR - Igt error: (kms_flip:222) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=2, pitch=5464)
02:13:29.480: ERROR - Igt error: (kms_flip:222) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_kms-INFO: 
1366x768: 60 76420 1366 1502 1532 1592 768 776 788 800 0x48 0xa
02:13:29.480: ERROR - Igt error: (kms_flip:222) DEBUG: No stale events found
02:13:29.480: ERROR - Igt error: (kms_flip:222) CRITICAL: Test assertion 
failure function __run_test_on_crtc_set, file ../tests/kms_flip.c:1666:
02:13:29.480: ERROR - Igt error: (kms_flip:222) CRITICAL: Failed 
assertion: do_page_flip(o, o->fb_ids[1], 1) == 0
02:13:29.480: ERROR - Igt error: (kms_flip:222) CRITICAL: Last errno: 
16, Device or resource busy
02:13:29.480: ERROR - Igt error: (kms_flip:222) CRITICAL: error: -16 != 0
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_core-INFO: Stack trace:
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_core-INFO:   #0 
../lib/igt_core.c:2075 __igt_fail_assert()
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_core-INFO:   #1 
../tests/kms_flip.c:1643 run_test_on_crtc_set.constprop.0()
02:13:29.480: ERROR - Igt error: (kms_flip:222) igt_core-INFO:   #2 
../tests/kms_flip.c:1856 run_test()
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_core-INFO:   #3 
../tests/kms_flip.c:2105 __igt_unique____real_main2028()
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_core-INFO:   #4 
../tests/kms_flip.c:2028 main()
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_core-INFO:   #5 
[__libc_init_first+0x80]
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_core-INFO:   #6 
[__libc_start_main+0x98]
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_core-INFO:   #7 
[_start+0x30]
02:13:29.481: ERROR - Igt error: ****  END  ****
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_kms-CRITICAL: Test 
assertion failure function kmstest_set_connector_dpms, file 
../lib/igt_kms.c:2247:
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_kms-CRITICAL: Failed 
assertion: found_it
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_kms-CRITICAL: Last 
errno: 9, Bad file descriptor
02:13:29.481: ERROR - Igt error: (kms_flip:222) igt_kms-CRITICAL: DPMS 
property not found on 34
02:13:29.481: ERROR - Test kms_flip@busy-flip: Fail: See 
"/results/igt.kms_flip@busy-flip.log"
02:13:29.481: DEBUG - End test kms_flip@busy-flip

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79872311

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

