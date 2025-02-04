Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A857CC02194
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Feb 2025 10:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:from:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lotn/Z+tZKYm39dIV5cgvmfbrqHW1TEx+L7IZyFCKqU=; b=m5VZAfOOj9KA10PqebIJDXgGKn
	iRCvmazJ5OsxnI2yg4dvbbxBPURSyD2/6GfN2lx6e9jCHNGFgQICvfE/whOVkasktmpRaadmU0CLb
	yrXBtp3kwAxToNIdQne2yKGOKIJyFwjcvW3wi6uC2oQws310D6WMQ/18OVq1T4Cid6AjOp5drFltC
	XI6jR0rGyf4zzehnbMpb76/E7fRhHpkUo5QY/AR7S38Iu5Eg3oZv6aWazGV3yUcODSGYplk/WvA8V
	okClbUzeFnL7EKuGyEBpKYTwrGTlkR/KFcl45dcv6uqdEcmPpRsvINeN+9seqgVwDMa6IH72uVbD6
	sIFjL0UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGER-00000000ARs-2kB2;
	Tue, 04 Feb 2025 10:32:39 +0000
Received: from mail-yw1-x1142.google.com ([2607:f8b0:4864:20::1142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfGEP-00000000ARR-0Q5u
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Feb 2025 10:32:38 +0000
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-6f6ca9a3425so36633537b3.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Feb 2025 02:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1738665156; x=1739269956; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lotn/Z+tZKYm39dIV5cgvmfbrqHW1TEx+L7IZyFCKqU=;
        b=b6bhdmzC1Gph1IxvoRvvDI+UMT0o1XildYEjM6iXVA1vJyzwO+YojODAhVdTjLWIXJ
         pGrV1zShZNo6orhO758eRtyIJnYIq/T7yXrGHmpozVfOpmeJeAXvfLROFHEYzzmRENr1
         RGe1Z90xZwoK2EzKwigoniiAFshU4HDkxoGcapVN4Ch9EDG+gxxHWgKM4zkuMNtHYzCe
         fGode+4wow+uFn/zHV31NUogDT3S8+G/MDwgt/dy67dpZq4mISFGAOMjEMaJH6vmoC2H
         Zck4ziSaZbMfrgSgTnCTvEqEc4PAdeGVZorQK02bmjWLwObxLRS3y4XKGKHw/SqjrIdD
         IYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738665156; x=1739269956;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lotn/Z+tZKYm39dIV5cgvmfbrqHW1TEx+L7IZyFCKqU=;
        b=iaOiVliVnutLve5yUMn89ozIlKZOjxns7fh1wYeY8pCWMgTZYz9FIVBvqKwIbFVPNv
         NN/lYaUoN61r/q5k0w5DTGwjZEhAQReijsDXKywiIiTNPsFxtyQ3upOYpKaHOsCnYoud
         OXv0c0PKXpC/1gpnzrjnwiEELeSl+vkIABTS2iO8EhUx/JcZakqKKYKmYEkk+8KsI1Vc
         O8oyMCPbHoVnx86YHxhBGvISZ1+pGU48FQGwrbXkGdiVz6K02WrxTxF6EpU7/IyqTqaA
         fkrGe8MpfH5IYJXm8ZvnaSjRLZyhbMAvsCPp+Gh5RLwVzsTu3hrp/BTrDNhT+3u57/up
         U8MA==
X-Forwarded-Encrypted: i=1; AJvYcCX0KL2o5TsIWoJOXItiC7UyjO7azJmCtfFtH/9+D+TYfzsgbhREx9Snve/vPIDHzPQTrOJ9Ju8jtgvkX48xsA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yznh/jwtKId5sVL+y4uKR24mHG02Shb3DpwKYpuiSCHSo9UCkNt
	x9eI8TjQZm8LA3S7FFHWt5w+JshpuMAQ/+PwVbL0QFXQMFX9guRmfvzPbmoxZE4o4263j10bptw
	XxIk4lwTWnalmHEEi+QaDfHTfx0FW/KnpQD3k+Q==
X-Gm-Gg: ASbGnctq5W2qjQabd/m795HKZQyBzVwUZvk3zmHALIAu2rjhfakP/myHBzDdJGZr/IL
	efodID9BaT/5auHCUD7+BXY3OZ+idJZKPHtULiOQUVJE8JKqvpyOOCboRVgL05tdh4N5k7rvsaj
	2Qwec6xvXRmHQ0MvN6JZEjgF7R/Z8YqA==
X-Google-Smtp-Source: AGHT+IH4wsIgbawr5ZwaHJHRs5m855SEHURgrWDl3dj5SfI948bQWH+QMC5+NTRInBsTl+21FBqAAMefEfAtpvjEVhU=
X-Received: by 2002:a05:690c:60c9:b0:6f9:447d:d1a6 with SMTP id
 00721157ae682-6f9447dd41emr91209777b3.25.1738665154560; Tue, 04 Feb 2025
 02:32:34 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Feb 2025 02:32:33 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 4 Feb 2025 02:32:33 -0800
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Date: Tue, 4 Feb 2025 02:32:33 -0800
X-Gm-Features: AWEUYZk-uRbc2gy8W64EHSdbDfPoTyVyRVduHzbcp2iyNRb1CUjPe7IymHmmx9o
Message-ID: <CACo-S-3_q62Hv_ViTdgB50JwTZr6Z_G=SdK0VoCuJuqszfWT7g@mail.gmail.com>
Subject: stable-rc/linux-6.6.y: new boot regression: WARNING at
 drivers/base/core.c:2515 device_release+0x80/...
To: kernelci-results@groups.io
Cc: gus@collabora.com, linux-mediatek@lists.infradead.org, 
	angelogioacchino.delregno@collabora.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_023237_139417_31410E5F 
X-CRM114-Status: UNSURE (   2.29  )
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

Hello,

New boot regression found on stable-rc/linux-6.6.y:

 WARNING at drivers/base/core.c:2515 device_release+0x80/0x90
[logspec:generic_linux_boot,linux.kernel.warning]

- Dashboard: https://staging.dashboard.kernelci.org:9000/issue/maestro:18a6cd3bd705698b41106eef2a1d7f2e411c7aab
- Grafana: https://grafana.kernelci.org/d/issue/issue?var-id=maestro:18a6cd3bd705698b41106eef2a1d7f2e411c7aab


Log excerpt:
[   10.292722] mtk-wdt 10007000.watchdog: Watchdog enabled (timeout=31
sec, nowayout=0)
[   10.300525] Device 'conn' does not have a release() function, it is
broken and must be fixed. See Documentation/core-api/kobject.rst.
[   10.300855] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.312539] WARNING: CPU: 4 PID: 76 at drivers/base/core.c:2515
device_release+0x80/0x90
[   10.320803] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.328862] Modules linked in: videodev(+)
[   10.337116] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.337122]  ecdh_generic
[   10.344606] videodev: Linux video capture interface: v2.00
[   10.344795] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.344808] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.344813] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.344820] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.344825] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.344829] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.344862] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.344867] OF: graph: no port node found in
/soc/spi@11012000/cros-ec@0/typec/connector@0
[   10.349449]  ecc mtk_mutex cfg80211(+) cros_ec_typec(+) pwm_bl
videobuf2_common mtk_rpmsg mtk_mmsys mc rfkill elan_i2c auxadc_thermal
sbs_battery mtk_pmic_keys mtk_wdt(+) pwm_mediatek mtk_scp_ipi
mt6577_auxadc backlight
[   10.443014] CPU: 4 PID: 76 Comm: kworker/u18:7 Tainted: G        W
        6.6.76-rc1 #1
[   10.451183] Hardware name: Google juniper sku16 board (DT)
[   10.456659] Workqueue: events_unbound deferred_probe_work_func
[   10.462491] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   10.469443] pc : device_release+0x80/0x90
[   10.473443] lr : device_release+0x80/0x90
[   10.477441] sp : ffff8000806a3a80
[   10.480744] x29: ffff8000806a3a80 x28: 0000000000000000 x27: 0000000000000000
[   10.487871] x26: 0000000000000000 x25: 0000000000000000 x24: ffffb3a8b7360500
[   10.494998] x23: 0000000000000000 x22: 0000000000000000 x21: ffffb3a8b735db90
[   10.502124] x20: 0000000000000000 x19: ffff514146120880 x18: 0000000000000006
[   10.509250] x17: 61206e656b6f7262 x16: 207369207469202c x15: 6e6f6974636e7566
[   10.516376] x14: 202928657361656c x13: 2e7473722e746365 x12: 6a626f6b2f697061
[   10.523502] x11: 2d65726f632f6e6f x10: 697461746e656d75 x9 : 6572206120657661
[   10.530628] x8 : 6820746f6e207365 x7 : 205d353235303033 x6 : 332e30312020205b
[   10.537754] x5 : 0000000000000000 x4 : 0000000000000000 x3 : 00000000ffffffff
[   10.544880] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff514140e28f00
[   10.552007] Call trace:
[   10.554442]  device_release+0x80/0x90
[   10.558095]  kobject_put+0xa4/0x120
[   10.561577]  put_device+0x14/0x24
[   10.564881]  genpd_remove+0x118/0x1bc
[   10.568534]  pm_genpd_remove+0x2c/0x50
[   10.572274]  scpsys_probe+0x13c/0x218
[   10.575927]  platform_probe+0x68/0xc4
[   10.579579]  really_probe+0x148/0x2ac
[   10.583232]  __driver_probe_device+0x78/0x12c
[   10.587579]  driver_probe_device+0xd8/0x15c
[   10.591754]  __device_attach_driver+0xb8/0x134
[   10.596188]  bus_for_each_drv+0x84/0xe0
[   10.600015]  __device_attach+0x9c/0x188
[   10.603841]  device_initial_probe+0x14/0x20
[   10.608015]  bus_probe_device+0xac/0xb0
[   10.611841]  deferred_probe_work_func+0x88/0xc0
[   10.616361]  process_one_work+0x148/0x2a0
[   10.620364]  worker_thread+0x324/0x43c
[   10.624104]  kthread+0x114/0x118
[   10.627323]  ret_from_fork+0x10/0x20



# Hardware platforms affected:

## mt8183-kukui-jacuzzi-juniper-sku16
- Compatibles: google,juniper-sku16 | google,juniper | mediatek,mt8183
- Dashboard: https://staging.dashboard.kernelci.org:9000/test/maestro:67a173d8661a7bc8748b7e53


#kernelci issue maestro:18a6cd3bd705698b41106eef2a1d7f2e411c7aab

Reported-by: kernelci.org bot <bot@kernelci.org>


--
This is an experimental report format. Please send feedback in!
Talk to us at kerneci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

