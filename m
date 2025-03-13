Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85A06C28B2E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Mar 2025 09:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=woIyGXy5LPXv8mj8+Mmg2FmYtY5pGV74aG04xv5+X+U=; b=aGQq+sHLnhfBw2RUIgEJOxDrH1
	n9kCB33WLqtTQLui2QE/K4sxsYBXJ+oeRED3w1tHNd+Hma5tRUUkFkql6FS2VKdAnFlgtDXcdXdWa
	rB12A9y49h/ZZegwQWrszllSITM4lEfMjUD/zgRPjF/t8ebjDfQ8N2VDa8tCJsG8UE+zkp98qmg7v
	fce3Yi2g8IuQU2HjrNjyf+0MMWdzj/hh7AvQgM6wewoWakrAQRrcYgJPd0J53qkg8rNyDuPS4xCC7
	THeOt41RRiZKZDCeEcSV8OY5LWRtQFCBLqmovNcqGxVp6wK22f1zzNiRqtxt1vkudB7Pqj37x1X+3
	LZV1rxyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsf7n-0000000AlOA-2bqA;
	Thu, 13 Mar 2025 09:45:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsf7k-0000000AlNX-3wxX
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Mar 2025 09:45:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741859107;
	bh=eeJj6LLjaF+n03RauCPhH26PXKrw1GrC28xYDvKKI9I=;
	h=Date:To:Cc:From:Subject:From;
	b=Rv4L4ay+GRdBKtSw+dzxAGNDoVVEQHA6igBuG6DJBNLQqHvTWTodqRTw1H5B19z+7
	 SzgoK1VM1ZHsaLq/r9ASZDtNna/9bk1z13fHvKftrNCyFgKzgoZpzdBO1foyjvwU8C
	 xQC8nLgK/baL62LturB3iV9lLa/4A5TjyL1mABUVOabO9PFcF5EQ2GjpHyjllEVt/V
	 ZdxeyXdb37Spyicko6WwRQ3pCgxbHKcdnNMRrGJzYcKPjqs1TscwzBOS/OWjddaLBG
	 ClldSxKoorSfTf+SkGoWnpeKVziHkAKeJf3PVklG6T/e0VkTqkPa2aQhF50TTjMWQg
	 xBYHRpfxLMQ+A==
Received: from [192.168.50.250] (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E727417E0147;
	Thu, 13 Mar 2025 10:45:04 +0100 (CET)
Message-ID: <a520d1d6-95b3-4573-b8f2-689f05bc2230@collabora.com>
Date: Thu, 13 Mar 2025 15:15:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 nfraprado@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 Daniel Stone <daniels@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>,
 Helen Mae Koike Fornazier <helen.fornazier@gmail.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: mediatek: kms_flip@basic-flip-vs-modeset flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_024509_136583_81BDF1EF 
X-CRM114-Status: UNSURE (   2.88  )
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

There are some flake test reported for mediatek driver testing in drm-ci.

# Board Name: mt8183-kukui-jacuzzi-juniper-sku16
# Failure Rate: 20
# IGT Version: 1.30-g04bedb923
# Linux Version: 6.14.0-rc4
kms_flip@basic-flip-vs-modeset

09:59:50.792: DEBUG - Begin test kms_flip@basic-flip-vs-modeset
09:59:50.792: ERROR - Igt error: (kms_flip:1339) CRITICAL: Test 
assertion failure function __run_test_on_crtc_set, file 
../tests/kms_flip.c:1648:
09:59:55.859: ERROR - Igt error: (kms_flip:1339) CRITICAL: Failed 
assertion: do_page_flip(o, o->fb_ids[1], 1) == 0
09:59:55.859: ERROR - Igt error: (kms_flip:1339) CRITICAL: Last errno: 
16, Device or resource busy
09:59:55.859: ERROR - Igt error: (kms_flip:1339) CRITICAL: error: -16 != 0
09:59:55.859: ERROR - Igt error: Dynamic subtest A-eDP1 failed.
09:59:55.859: ERROR - Igt error: **** DEBUG ****
09:59:55.859: ERROR - Igt error: (kms_flip:1339) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
09:59:55.859: ERROR - Igt error: (kms_flip:1339) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=1, pitch=5464)
09:59:55.859: ERROR - Igt error: (kms_flip:1339) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
09:59:55.859: ERROR - Igt error: (kms_flip:1339) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(width=1366, height=768, 
format=XR24(0x34325258), modifier=0x0, size=0)
09:59:55.859: ERROR - Igt error: (kms_flip:1339) igt_fb-DEBUG: 
igt_create_fb_with_bo_size(handle=2, pitch=5464)
09:59:55.859: ERROR - Igt error: (kms_flip:1339) ioctl_wrappers-DEBUG: 
Test requirement passed: igt_has_fb_modifiers(fd)
09:59:55.859: ERROR - Igt error: (kms_flip:1339) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
09:59:55.859: ERROR - Igt error: (kms_flip:1339) igt_fb-DEBUG: Test 
requirement passed: cairo_surface_status(fb->cairo_surface) == 
CAIRO_STATUS_SUCCESS
09:59:55.859: ERROR - Igt error: (kms_flip:1339) igt_kms-INFO: 
1366x768: 60 76300 1366 1414 1446 1600 768 772 778 794 0x48 0xa
09:59:55.859: ERROR - Igt error: (kms_flip:1339) DEBUG: No stale events 
found
09:59:55.859: ERROR - Igt error: (kms_flip:1339) CRITICAL: Test 
assertion failure function __run_test_on_crtc_set, file 
../tests/kms_flip.c:1648:
09:59:55.860: ERROR - Igt error: (kms_flip:1339) CRITICAL: Failed 
assertion: do_page_flip(o, o->fb_ids[1], 1) == 0
09:59:55.860: ERROR - Igt error: (kms_flip:1339) CRITICAL: Last errno: 
16, Device or resource busy
09:59:55.860: ERROR - Igt error: (kms_flip:1339) CRITICAL: error: -16 != 0
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO: Stack trace:
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO:   #0 
../lib/igt_core.c:2055 __igt_fail_assert()
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO:   #1 
../tests/kms_flip.c:428 run_test_on_crtc_set.constprop.0()
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO:   #2 
../tests/kms_flip.c:1829 run_test()
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO:   #3 
../tests/kms_flip.c:2078 __igt_unique____real_main2001()
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO:   #4 
../tests/kms_flip.c:2001 main()
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO:   #5 
[__libc_init_first+0x80]
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO:   #6 
[__libc_start_main+0x98]
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_core-INFO:   #7 
[_start+0x30]
09:59:55.860: ERROR - Igt error: ****  END  ****
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_kms-CRITICAL: Test 
assertion failure function kmstest_set_connector_dpms, file 
../lib/igt_kms.c:2246:
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_kms-CRITICAL: 
Failed assertion: found_it
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_kms-CRITICAL: Last 
errno: 9, Bad file descriptor
09:59:55.860: ERROR - Igt error: (kms_flip:1339) igt_kms-CRITICAL: DPMS 
property not found on 33
09:59:55.860: ERROR - Test kms_flip@basic-flip-vs-modeset: Fail: See 
"/results/igt.kms_flip@basic-flip-vs-modeset.log"
09:59:55.860: DEBUG - End test kms_flip@basic-flip-vs-modeset

Pipeline: https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/72646441

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

