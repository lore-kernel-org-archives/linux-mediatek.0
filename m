Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E20E7716A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2024 05:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kb26GGevZ1XkyZmeXDfbXWEhN3xw0FaELMvyRZOwfho=; b=lFvvbQskgQgTXAO4kCCSX58+EE
	yQ59bss17BfEW/nyegS01IWTpT2ZSBQksBRoHKJcIMR5PHe0vjNjnVUM7m8J4V7GGku+mulnhS431
	sLFHdQD3amPPKc/3P/FzDMFe9vaw3n/75WHPKqYzzpL8Mhm2H9pWPxgjBc1IgtMm4pQyhVgz/xjzu
	/l8kjAnWxwvlYaAWOb07FBI+CxGb1z2WH5lnFEgZbiEbqUV0Ib4/OhBK/9waF7KHYDgxdma+yM8Fq
	XOLiaYL2PWbxF7oZVXvcs8YSaZVVorncVIupVXMh5e2n0HLR9pv5HVx0zMBBNCjMrh8CJt5l4973h
	5oheaKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQNM-0000000CKXD-1zhI;
	Tue, 17 Dec 2024 05:44:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNQ51-0000000CGwP-0V2o
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Dec 2024 05:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734413108;
	bh=2f+ZqjAke4iwHTR3GFedpFF4D+O1tQcfClogyNIP9aU=;
	h=Date:To:Cc:From:Subject:From;
	b=UcaPKcwZ4mjOq0DS7zkxVoTCYSjWFRlhFgDOXKO2NhUsKAha1gtstN7nGjdV1KuH6
	 ovnW0hIesyC5coGCFkD4MSbMUhGFTWxJnqml5AJr8q9ycGmL+uX7ZzyVWda/4dbzJ5
	 m3G4uoUiW2Pg0g40cct1EX6Fhh0+rhIR0/HK/gi6L1qUDspw38QH2bbVcTGtAogyS/
	 2RLUE9VKtnkLMoLzNzGsVLZrWkb0Qube6E0FTd2TYW2zsVJzcF3/OSRKD0TE3DcQFq
	 LNw3jtsYdI9bnCG0vGAFkPeQsCxKcQ604a6NZle4f+ic8jXGjHEMp7dwKLeknOqboB
	 8FGUvgn9nuf7w==
Received: from [192.168.50.250] (unknown [171.76.86.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0D2DC17E108D;
	Tue, 17 Dec 2024 06:25:04 +0100 (CET)
Message-ID: <c0b4cded-0971-4abb-9965-2acf4602d7cd@collabora.com>
Date: Tue, 17 Dec 2024 10:54:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 airlied@gmail.com, daniel@ffwll.ch, Daniel Stone <daniels@collabora.com>,
 Helen Mae Koike Fornazier <helen.koike@collabora.com>,
 Sergi Blanch Torne <sergi.blanch.torne@collabora.com>,
 Guilherme Alcarde Gallo <guilherme.gallo@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
Subject: drm-ci: flake test:
 kms_bw@connected-linear-tiling-1-displays-2160x1440p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_212511_324940_66C39398 
X-CRM114-Status: UNSURE (   3.83  )
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

There are some flake tests reported for mediatek driver testing in drm-ci.

# Board Name: mt8173-elm-hana
# Failure Rate: 100
# IGT Version: 1.29-g33adea9eb
# Linux Version: 6.13.0-rc2
kms_bw@connected-linear-tiling-1-displays-2160x1440p

command: cd "/igt/libexec/igt-gpu-tools" && 
"/igt/libexec/igt-gpu-tools/kms_bw" "--run-subtest" 
"connected-linear-tiling-1-displays-2160x1440p"
pid: 329
exit status: exit status: 98
stdout:
-------
IGT-Version: 1.29-g33adea9eb (aarch64) (Linux: 6.13.0-rc2-g1f006005ebf8 
aarch64)
Using IGT_SRANDOM=1734348965 for randomisation
Opened device: /dev/dri/card0
Starting subtest: connected-linear-tiling-1-displays-2160x1440p
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../lib/igt_pipe_crc.c:236 pipe_crc_new()
   #2 ../tests/kms_bw.c:133 run_test_linear_tiling()
   #3 ../tests/kms_bw.c:295 __igt_unique____real_main264()
   #4 ../tests/kms_bw.c:264 main()
   #5 [__libc_init_first+0x80]
   #6 [__libc_start_main+0x98]
   #7 [_start+0x30]
Subtest connected-linear-tiling-1-displays-2160x1440p: FAIL (0.336s)
stderr:
-------
(kms_bw:329) igt_pipe_crc-CRITICAL: Test assertion failure function 
pipe_crc_new, file ../lib/igt_pipe_crc.c:240:
(kms_bw:329) igt_pipe_crc-CRITICAL: Failed assertion: pipe_crc->ctl_fd != -1
(kms_bw:329) igt_pipe_crc-CRITICAL: Last errno: 2, No such file or directory
Subtest connected-linear-tiling-1-displays-2160x1440p failed.
**** DEBUG ****
(kms_bw:329) DEBUG: Test requirement passed: !(pipe >= num_pipes)
(kms_bw:329) igt_kms-DEBUG: Test requirement passed: plane_idx >= 0 && 
plane_idx < pipe->n_planes
(kms_bw:329) igt_pipe_crc-CRITICAL: Test assertion failure function 
pipe_crc_new, file ../lib/igt_pipe_crc.c:240:
(kms_bw:329) igt_pipe_crc-CRITICAL: Failed assertion: pipe_crc->ctl_fd != -1
(kms_bw:329) igt_pipe_crc-CRITICAL: Last errno: 2, No such file or directory
(kms_bw:329) igt_core-INFO: Stack trace:
(kms_bw:329) igt_core-INFO:   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
(kms_bw:329) igt_core-INFO:   #1 ../lib/igt_pipe_crc.c:236 pipe_crc_new()
(kms_bw:329) igt_core-INFO:   #2 ../tests/kms_bw.c:133 
run_test_linear_tiling()
(kms_bw:329) igt_core-INFO:   #3 ../tests/kms_bw.c:295 
__igt_unique____real_main264()
(kms_bw:329) igt_core-INFO:   #4 ../tests/kms_bw.c:264 main()
(kms_bw:329) igt_core-INFO:   #5 [__libc_init_first+0x80]
(kms_bw:329) igt_core-INFO:   #6 [__libc_start_main+0x98]
(kms_bw:329) igt_core-INFO:   #7 [_start+0x30]
****  END  ****

Pipeline link: 
https://gitlab.freedesktop.org/vigneshraman/linux/-/jobs/68249775

Please could you have a look at these test results and let us know if 
you need more information. Thank you.

Regards,
Vignesh

