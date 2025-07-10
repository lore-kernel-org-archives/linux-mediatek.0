Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85B4C83F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=R1Uf/oC5OjosJUpQCvqOv7eUPQhORhwQccvgWJN0uDo=; b=EbvF3OtZiUdF+/srdjZ68h9/Wr
	X3R2Cp7OCyW+74u8l/4+N/TYGCYQC6P/S9fNTsEdSKxRw+j4vqoApoBs2TxZC5L0dZ4KatEempW7W
	HYrOjOT8eMCnOGKLMJ8p3Ce5OhQen3Zwsuqumnb3focGrRp3iuSAGwnjTtCaJl+dzmFkLOdmYqC9d
	Ku30Xi83u750RZdVsViVKUCBTLGd21n2MK0BrIggdRzwAyU+oInqxsE3zJde1n4QonOGk2jsCKHQE
	AzC/g8DF9koT+JvRlzOr7yWibeduwnYryz7hNtK/gkB0ic24g9W1aEIkk5VdBubpc4Pbf4At0KxkI
	y4Omzf3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZscB-0000000CAzz-3LSb;
	Thu, 10 Jul 2025 14:51:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZr8U-0000000BttN-0trK
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 13:16:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752153384;
	bh=EPc+tZ1ozq5uCigJRh2UyBKKKKtf8aYrTug5gBogqBs=;
	h=Date:To:Cc:From:Subject:From;
	b=FvE2fIkcElyy6m+NVkrexvlXoWfkUhzuHFX0r3R0X/mXKXf9MVafAzEVDMisYTTfe
	 B4EyYCLVqe8DrRM1Oq8mubYwg3/wZxtS+Lx24o5HGbLUQ4iYOmhk5O6FD1gnaPEBuW
	 8J98R23vetrI/+U8Qdu7NGbRxiGC8F+bkaLzwLl3q5zi+OvuOaWHLsSs67QzLyNbZL
	 mHpBWOuFIU1AbdjVM0HfhyHW007parGEx6BT7DVaFRyK2NG9gOQoVTHO9G+boFCQZP
	 r9MkPNBESK7o1YqjieKENw1GyddfnHp/rNCalsJfMZX1p+KT1zuD9NJ35xEe4hDuLE
	 5lROYKkVjprYw==
Received: from [192.168.50.250] (unknown [171.76.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F07517E0EBD;
	Thu, 10 Jul 2025 15:16:22 +0200 (CEST)
Message-ID: <30b3f8b0-3409-4329-bb60-b6287e1a439d@collabora.com>
Date: Thu, 10 Jul 2025 18:46:20 +0530
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
Subject: drm-ci: mt8173-elm-hana:
 kms_atomic_transition@plane-all-modeset-transition-internal-panels flake
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_061626_552941_E2AFDC3C 
X-CRM114-Status: UNSURE (   3.04  )
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
# Failure Rate: 60
# IGT Version: 2.1-g26ddb59c1
# Linux Version: 6.16.0-rc2
kms_atomic_transition@plane-all-modeset-transition-internal-panels

07:35:22.411: DEBUG - Begin test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
Test assertion failure function wait_for_transition, file 
../tests/kms_atomic_transition.c:539:
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
Failed assertion: fd_completed(data->drm_fd)
07:35:22.411: ERROR - Igt error: Dynamic subtest pipe-A-eDP-1 failed.
07:35:22.411: ERROR - Igt error: **** DEBUG ****
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: }
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: commit {
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.0, fb 82
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x52/82
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: }
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: eDP-1: set_pipe(A)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: eDP-1: Selecting pipe A
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_fb(0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_size (0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_size(0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_fb(0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_size (0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_size(0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_fb(0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_size (0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_size(0x0)
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: commit {
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x55/85
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: Pipe A: Setting property "ACTIVE" to 0x1/1
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x0/0
07:35:22.411: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     eDP-1: preparing atomic, pipe: A
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: eDP-1: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: }
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) DEBUG: 
Retrieved vblank seq: 4302 on unk
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: plane_set_fb(82)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: fb_set_position(0,0)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: fb_set_size(1366x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.0: plane_set_size (1366x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_fb(84)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_position(0,0)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: fb_set_size(1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.1: plane_set_size (1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_fb(84)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_position(0,0)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: fb_set_size(1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.2: plane_set_size (1024x768)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_fb(83)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_size (512x512)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_position(0,0)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_size(512x512)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: fb_set_size(512x512)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: A.3: plane_set_size (512x512)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: commit {
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: Pipe A: Setting property "MODE_ID" to 0x51/81
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.0, fb 82
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_W" to 0x5560000/89522176
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_W" to 0x556/1366
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_H" to 0x300/768
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "FB_ID" to 0x52/82
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.0: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.1, fb 84
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_W" to 0x400/1024
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_H" to 0x300/768
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "FB_ID" to 0x54/84
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.1: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.2, fb 84
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_W" to 0x4000000/67108864
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "SRC_H" to 0x3000000/50331648
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_W" to 0x400/1024
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_H" to 0x300/768
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "FB_ID" to 0x54/84
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.2: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display:     populating plane data: A.3, fb 83
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_X" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_Y" to 0x0/0
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_W" to 0x2000000/33554432
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "SRC_H" to 0x2000000/33554432
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_W" to 0x200/512
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_H" to 0x200/512
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "FB_ID" to 0x53/83
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: plane A.3: Setting property "CRTC_ID" to 0x39/57
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_kms-DEBUG: display: }
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
Test assertion failure function wait_for_transition, file 
../tests/kms_atomic_transition.c:539:
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) CRITICAL: 
Failed assertion: fd_completed(data->drm_fd)
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO: Stack trace:
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #0 ../lib/igt_core.c:2075 __igt_fail_assert()
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #1 ../tests/kms_atomic_transition.c:536 
wait_for_transition.constprop.0()
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #2 ../tests/kms_atomic_transition.c:715 
__igt_unique____real_main1122()
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #3 ../tests/kms_atomic_transition.c:1122 main()
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #4 [__libc_init_first+0x80]
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #5 [__libc_start_main+0x98]
07:35:22.412: ERROR - Igt error: (kms_atomic_transition:403) 
igt_core-INFO:   #6 [_start+0x30]
07:35:22.412: ERROR - Igt error: ****  END  ****
07:35:22.412: ERROR - Test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels: 
Fail: See 
"/results/igt.kms_atomic_transition@plane-all-modeset-transition-internal-panels.log"
07:35:22.412: DEBUG - End test 
kms_atomic_transition@plane-all-modeset-transition-internal-panels

Pipeline: https://gitlab.freedesktop.org/vigneshraman/msm/-/jobs/79879662

Please could you have a look at these test results and let us know if 
you need more information to debug. Thank you.

Regards,
Vignesh

