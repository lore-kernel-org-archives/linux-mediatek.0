Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCB6D2505B
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 09:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zd0BPdweYbYZbQyn2qW1okTKg1KegiW0299KXASGYXY=; b=jTzyOUQOWT6v6UhTcVEqTnvNMj
	uVPaqHVQV+n/ly/U8FTB/KPrnlqBWJb0jd3BOkZiludjKu+mUKp+LlDAGZuIAYhNZt4Cdx08r39DQ
	NVczj032wcAFGjBVpfJDFnoSe8AExUm3OrG5ezDWxlFK3ZptjqbpKNUbWO8QOkw4L1Az2nQOK0tnF
	Vk3F/kMkLuSCP028N6m6tFK8g0uGrLrxnXKQbkQDc0aKZRuP/SRqwMm/WgYbbUmWeyXFGpjFBRn8C
	aAos7ifLKBfTCzUiZqqFRXvk1FWCbje6fcxJBvgWEOEc+W966k2rgFkawqzOSicJscw9QLob1wngh
	VgKtQgiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfE2y-00000005431-2S7w;
	Mon, 12 Jan 2026 09:17:12 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfE2w-0000000542E-0UqD
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 09:17:11 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-64b58553449so9591161a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 01:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768209428; x=1768814228; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zd0BPdweYbYZbQyn2qW1okTKg1KegiW0299KXASGYXY=;
        b=lxW2nfRpFNDH75RXzeETd9oGNLqPHBWxuCiGcTp2Wq7omjI+mtg6oPdq6X7A03UxBC
         U79O0d4GrCu5YFT9lv6gomcTad3uFzchkkEh7Ly2OgE2Icu6n2d/cpq+TO1IlpBUW1hE
         3YAN93H+tr7T5MlXy2Os8G0qA2El3N/pE3YCEyWg5GYSmIuacQJd1NTSEtHMjlsYfFlH
         Ad3WFLK1aNHh5ryV4qv1rKR0tm2o5V7HYrRoypM1NAoeNkTAiI30xYJDJLV6BfkYLCr+
         IwkUGTJa+/kblRrs8Xvepsa632nyGLPAIXuWuRzEUGFeeJYCu1GbqRD4IWwZ94SCJPT3
         t4LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209428; x=1768814228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zd0BPdweYbYZbQyn2qW1okTKg1KegiW0299KXASGYXY=;
        b=X/ALD2ESGM5kG4/eNzKlTB0WyfCMWTe8ZbS34DsNLv7Iu71A/1GbLtvd2D72Iw1I3s
         k1fdOXQoLaG91XuP9pehvRd7jfOy/RwxlZHPf5hhPUJ697Z18Ag/eoQYoh3EBbZWCOr7
         iDbuBEEkOmnDYTQc/eqZhu7eMh72aOuwBC2vb1i8+YBg+XN1Xv1Kv16RlH7mHsGgFzkm
         nu2IREEPpvhXV5gcN17VlE9Noija5Oxzs+bDRZdfKOJqhX0KuKQ+4o2f68i3TcM4Sc4s
         jgiHKKsrtw43n1RSo4xDOXvj4LmQbpCq5El8ak9WbuZCj2qKnYgZ6UUfQ0y1Jxh1L/us
         ngAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz1By9T94Bs3bwU/LnaY2Snk3hMaycQb1FYVb0TphCXnwnze1sEvsHhqX6yJO+BQ+ROn4aOGye4TzWZzTYCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ15GdPB+T9bMb9uJhdBU5+w4tV/WEOKysqXndqw4jr9P1gGcw
	q2K78e9Z8cYuCm8HRxvDRYv/8aishjYpRdX61o9cnJOdzJY8gixC7HFH
X-Gm-Gg: AY/fxX6z4Yk0vKF8/Z+yipGhvifU7kNRDRAXoKAg2ynIDqwJdWbjM7rdJilzVspDm2z
	12wm5djld0YqwsUt+vPmiI+4qK6/SBU+gCYARmQxau6oLaK5ArvButi6sgim8HyzxLPoIi8540d
	Q9dF33+QAZix+hYmUFzDPxUYVFYxC5XoYkTalZoG0HVbTFg/uvQOaZEiPO6UrWXbzatBGosJO+u
	CPoJvDg6sg6em+PV7F+GW/tumOfnRQQHckC/zqV25QX7coZIdy9kZ2OU4RV0Oh89dCg1oTgbm/m
	jyStoUknzNjC4Q6fT+Jr7YE0y+eHj4WvhEmWb/i24R0j5GlT6Ovf+f6GtChp0qXLE64ggssd35r
	H+yQAWCnXRAqXGCBuFm+aIN6+XfNB5BF9Uhd7t+gBHhHRnB0nDz5ypyVHTRf3/BTuq1GivuL9rO
	2Tn2IlXqu/QM0GA9Ax/QZxDD2ISS4lTDL0W1pFM+iAtLA=
X-Google-Smtp-Source: AGHT+IEVkFHwWdARDiOC3T5oubH1b0HSoQYmd/NAnJNXQ0ysw0Xt1Fgn+FqRVmFL8guwSSYOYkTxEQ==
X-Received: by 2002:a17:907:7202:b0:b87:efa:8786 with SMTP id a640c23a62f3a-b870efae612mr369083166b.55.1768209427070;
        Mon, 12 Jan 2026 01:17:07 -0800 (PST)
Received: from MacBookPro ([2a02:8071:2186:3703:6de9:eb98:99c8:7af2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b870b0dba4esm411401466b.17.2026.01.12.01.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 01:17:06 -0800 (PST)
From: Nauman Sabir <officialnaumansabir@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Nauman Sabir <officialnaumansabir@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gao Xiang <xiang@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Yue Hu <zbestahu@gmail.com>,
	Jeffle Xu <jefflexu@linux.alibaba.com>,
	Sandeep Dhavale <dhavale@google.com>,
	Hongbo Li <lihongbo22@huawei.com>,
	Chunhai Guo <guochunhai@vivo.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao shi <jitao.shi@mediatek.com>,
	linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-erofs@lists.ozlabs.org,
	linux-kbuild@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] Documentation: Fix typos and grammatical errors
Date: Mon, 12 Jan 2026 10:16:56 +0100
Message-ID: <20260112091659.12316-1-officialnaumansabir@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_011710_225700_449EDABC 
X-CRM114-Status: GOOD (  26.97  )
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

Fix various typos and grammatical errors across multiple documentation
files to improve clarity and consistency.

Changes include:
- Fix missing preposition 'in' in process/changes.rst
- Correct 'result by' to 'result from' in admin-guide/README.rst
- Fix 'before hand' to 'beforehand' (3 instances) in cgroup-v1/hugetlb.rst
- Correct 'allows to limit' to 'allows limiting' in cgroup-v1/hugetlb.rst,
  cgroup-v2.rst, and kconfig-language.rst
- Fix 'needs precisely know' to 'needs to precisely know' in
  cgroup-v1/hugetlb.rst
- Correct 'overcommited' to 'overcommitted' in cgroup-v1/hugetlb.rst
- Fix subject-verb agreement: 'never causes' to 'never cause' (2 instances)
  in cgroup-v1/hugetlb.rst
- Fix subject-verb agreement: 'there is enough' to 'there are enough' in
  cgroup-v1/hugetlb.rst
- Remove incorrect plural from uncountable nouns: 'metadatas' to 'metadata'
  in filesystems/erofs.rst, and 'hardwares' to 'hardware' in
  devicetree/bindings/.../mediatek,dp.yaml, userspace-api/.../legacy_dvb_audio.rst,
  and scsi/ChangeLog.sym53c8xx

Note: British spelling 'recognised' retained per maintainer feedback.

These corrections improve the overall quality and readability of the
kernel documentation.

Signed-off-by: Nauman Sabir <officialnaumansabir@gmail.com>
---
 Documentation/admin-guide/README.rst           |  2 +-
 .../admin-guide/cgroup-v1/hugetlb.rst          | 18 +++++++++---------
 Documentation/admin-guide/cgroup-v2.rst        |  2 +-
 .../bindings/display/mediatek/mediatek,dp.yaml |  2 +-
 Documentation/filesystems/erofs.rst            |  2 +-
 Documentation/kbuild/kconfig-language.rst      |  2 +-
 Documentation/process/changes.rst              |  2 +-
 Documentation/scsi/ChangeLog.sym53c8xx         |  2 +-
 .../media/dvb/legacy_dvb_audio.rst             |  2 +-
 9 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
index 05301f03b..77fec1de6 100644
--- a/Documentation/admin-guide/README.rst
+++ b/Documentation/admin-guide/README.rst
@@ -53,7 +53,7 @@ Documentation
    these typically contain kernel-specific installation notes for some
    drivers for example. Please read the
    :ref:`Documentation/process/changes.rst <changes>` file, as it
-   contains information about the problems, which may result by upgrading
+   contains information about the problems which may result from upgrading
    your kernel.
 
 Installing the kernel source
diff --git a/Documentation/admin-guide/cgroup-v1/hugetlb.rst b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
index 493a8e386..b5f3873b7 100644
--- a/Documentation/admin-guide/cgroup-v1/hugetlb.rst
+++ b/Documentation/admin-guide/cgroup-v1/hugetlb.rst
@@ -77,7 +77,7 @@ control group and enforces the limit during page fault. Since HugeTLB
 doesn't support page reclaim, enforcing the limit at page fault time implies
 that, the application will get SIGBUS signal if it tries to fault in HugeTLB
 pages beyond its limit. Therefore the application needs to know exactly how many
-HugeTLB pages it uses before hand, and the sysadmin needs to make sure that
+HugeTLB pages it uses beforehand, and the sysadmin needs to make sure that
 there are enough available on the machine for all the users to avoid processes
 getting SIGBUS.
 
@@ -91,23 +91,23 @@ getting SIGBUS.
   hugetlb.<hugepagesize>.rsvd.usage_in_bytes
   hugetlb.<hugepagesize>.rsvd.failcnt
 
-The HugeTLB controller allows to limit the HugeTLB reservations per control
+The HugeTLB controller allows limiting the HugeTLB reservations per control
 group and enforces the controller limit at reservation time and at the fault of
 HugeTLB memory for which no reservation exists. Since reservation limits are
-enforced at reservation time (on mmap or shget), reservation limits never causes
-the application to get SIGBUS signal if the memory was reserved before hand. For
+enforced at reservation time (on mmap or shget), reservation limits never cause
+the application to get SIGBUS signal if the memory was reserved beforehand. For
 MAP_NORESERVE allocations, the reservation limit behaves the same as the fault
 limit, enforcing memory usage at fault time and causing the application to
 receive a SIGBUS if it's crossing its limit.
 
 Reservation limits are superior to page fault limits described above, since
 reservation limits are enforced at reservation time (on mmap or shget), and
-never causes the application to get SIGBUS signal if the memory was reserved
-before hand. This allows for easier fallback to alternatives such as
+never cause the application to get SIGBUS signal if the memory was reserved
+beforehand. This allows for easier fallback to alternatives such as
 non-HugeTLB memory for example. In the case of page fault accounting, it's very
-hard to avoid processes getting SIGBUS since the sysadmin needs precisely know
-the HugeTLB usage of all the tasks in the system and make sure there is enough
-pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommited
+hard to avoid processes getting SIGBUS since the sysadmin needs to precisely know
+the HugeTLB usage of all the tasks in the system and make sure there are enough
+pages to satisfy all requests. Avoiding tasks getting SIGBUS on overcommitted
 systems is practically impossible with page fault accounting.
 
 
diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 7f5b59d95..098d6831b 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2816,7 +2816,7 @@ DMEM Interface Files
 HugeTLB
 -------
 
-The HugeTLB controller allows to limit the HugeTLB usage per control group and
+The HugeTLB controller allows limiting the HugeTLB usage per control group and
 enforces the controller limit during page fault.
 
 HugeTLB Interface Files
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
index 274f59080..8f4bd9fb5 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
@@ -11,7 +11,7 @@ maintainers:
   - Jitao shi <jitao.shi@mediatek.com>
 
 description: |
-  MediaTek DP and eDP are different hardwares and there are some features
+  MediaTek DP and eDP are different hardware and there are some features
   which are not supported for eDP. For example, audio is not supported for
   eDP. Therefore, we need to use two different compatibles to describe them.
   In addition, We just need to enable the power domain of DP, so the clock
diff --git a/Documentation/filesystems/erofs.rst b/Documentation/filesystems/erofs.rst
index 08194f194..e61db115e 100644
--- a/Documentation/filesystems/erofs.rst
+++ b/Documentation/filesystems/erofs.rst
@@ -154,7 +154,7 @@ to be as simple as possible::
   0 +1K
 
 All data areas should be aligned with the block size, but metadata areas
-may not. All metadatas can be now observed in two different spaces (views):
+may not. All metadata can be now observed in two different spaces (views):
 
  1. Inode metadata space
 
diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index abce88f15..7067ec3f0 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -216,7 +216,7 @@ applicable everywhere (see syntax).
 
 - numerical ranges: "range" <symbol> <symbol> ["if" <expr>]
 
-  This allows to limit the range of possible input values for int
+  This allows limiting the range of possible input values for int
   and hex symbols. The user can only input a value which is larger than
   or equal to the first symbol and smaller than or equal to the second
   symbol.
diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 62951cdb1..0cf97dbab 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -218,7 +218,7 @@ DevFS has been obsoleted in favour of udev
 Linux documentation for functions is transitioning to inline
 documentation via specially-formatted comments near their
 definitions in the source.  These comments can be combined with ReST
-files the Documentation/ directory to make enriched documentation, which can
+files in the Documentation/ directory to make enriched documentation, which can
 then be converted to PostScript, HTML, LaTex, ePUB and PDF files.
 In order to convert from ReST format to a format of your choice, you'll need
 Sphinx.
diff --git a/Documentation/scsi/ChangeLog.sym53c8xx b/Documentation/scsi/ChangeLog.sym53c8xx
index 3435227a2..6bca91e03 100644
--- a/Documentation/scsi/ChangeLog.sym53c8xx
+++ b/Documentation/scsi/ChangeLog.sym53c8xx
@@ -3,7 +3,7 @@ Sat May 12 12:00 2001 Gerard Roudier (groudier@club-internet.fr)
 	- Ensure LEDC bit in GPCNTL is cleared when reading the NVRAM.
 	  Fix sent by Stig Telfer <stig@api-networks.com>.
 	- Backport from SYM-2 the work-around that allows to support 
-	  hardwares that fail PCI parity checking.
+	  hardware that fails PCI parity checking.
 	- Check that we received at least 8 bytes of INQUIRY response 
 	  for byte 7, that contains device capabilities, to be valid.
 	- Define scsi_set_pci_device() as nil for kernel < 2.4.4.
diff --git a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
index 81b762ef1..99ffda355 100644
--- a/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
+++ b/Documentation/userspace-api/media/dvb/legacy_dvb_audio.rst
@@ -444,7 +444,7 @@ Description
 ~~~~~~~~~~~
 
 A call to `AUDIO_GET_CAPABILITIES`_ returns an unsigned integer with the
-following bits set according to the hardwares capabilities.
+following bits set according to the hardware's capabilities.
 
 
 -----
-- 
2.52.0


