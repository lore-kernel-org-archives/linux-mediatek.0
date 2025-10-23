Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5837CCCD193
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Oct 2025 06:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cfYLHJECru5yKWiwVRB/EPZo/QvW+dt1xe/Pn9UG9Mc=; b=KK0eD8F9c3n3P73x9+QT00Fofj
	3Efy4rtoFt1CyCbJL4MH3PVRyCxEorSF570ARH1icKhlVt7FTLC5zwErnMeuhAZrr1jO0rVzDcamh
	myhbxxku0Zt/F2z9dsFjXe8BBy8nfxT5W9Ic8x2IYX6fc5Ed6tiB3GHA/V5mu5Iha+K8W8uEbJ0q/
	hZSNdEGqDozFao2T2BzW6MyrHWBEgDSHNJZ7/t/y3V9cF4IsQz6MALwS6LJ31cj1REfrfqya/Xqni
	jzAe9BUGX5vkDpZAbDSR9MGnJZnGY0Lcs99EzWbTi2kvha1BdwZi1ny8B8zV7PNs8wy/GjCuEYRua
	N6Bq86Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoZO-00000005Biy-0F8X;
	Thu, 23 Oct 2025 06:13:06 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBoZL-00000005BiJ-2YwQ
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Oct 2025 06:13:04 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so431624b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Oct 2025 23:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1761199983; x=1761804783; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cfYLHJECru5yKWiwVRB/EPZo/QvW+dt1xe/Pn9UG9Mc=;
        b=m+HFWYaqlJy16TQI+h8tsJovWZr/NVFhN0k+kepb9/GZRF5L2lD4Np2Uh31PmsLsFe
         6h2LBPbHbuD3Rx6iExEEQvj7HSyO3wyDZ2nn0SP+6cbaeZnFugUo2pkHIQt4gfCMpt3d
         9clJos1TfGV6JLWliWPV5mIH2Zo3roG4h6pzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761199983; x=1761804783;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cfYLHJECru5yKWiwVRB/EPZo/QvW+dt1xe/Pn9UG9Mc=;
        b=oJEmdr/wUT4wX1O8fjVL6IVwLyN6B7qS8X5+r3PIqbmS78VMNbP+63g7lj7vBr3Pul
         BgCsEEETlLemSEI852CiOI5qhh1Cr86nPxZsdpD3y1YEEflt7c4Xd6d6OJ+LKT9Ve27t
         A61ka11+kiosXBNrU2q/hk+kFgcuL9/H9WpVSMZZDV5JCpLsKSXVKGDmmaqBpR86sOFv
         1J9MoMtC3DM3bF3l9faxsVHQ3MBiPoGg7zewJRfphoipCeWLcWWxzfFBPXLsCHJAN53V
         QqmMaJKAVgDi4/K+Aq0y/CJ4cUwcllBTug6S3/atuTJO5BSPosDg5TLcvKdndYutOAeC
         J7Qg==
X-Forwarded-Encrypted: i=1; AJvYcCWWyk0eFoEvJLKXExuqI8I8s0JhmOAq43JxH9ZK8a6/oPflCMw3Qs0Wof1XneGHNgdVyYCagXQHmDFD2ZGAvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5UKvEwMbC+SlmSZ+mml1Oeua2IcyKOLxIWdtFUXqpUPnahJgk
	6PbRp+m1XM7bDhjuvA8ZLlNQR4yGT2cEjK94R5mEOaYBp+oFC6PLfPxXIeGua7ILwg==
X-Gm-Gg: ASbGncv31Lhhz2Bl+KMKvu+R+CYW1pBzVSDWnUDLmCB0OvH8q0demZ2Nzb3jAIQRF3w
	vxAKGCY9DQR7fa78KnPul8CLEjuaje02GZac294UWdh6judsEJcaqUTPXdyPni5TWBVoheLm84R
	pSnz/wWtCwnSji5RNci/nnnesJo+CmBnZSMhz8HVj0hwivr6rtxd4DXitCo6sS4qm4bcATIGvsT
	qYQDagNS3aFK7DFV9eCmNT6k0g4upVPha+zb7Zop15ijkb4e43TFgSs2evbbH/NHlMiJHwKVv1W
	vCq4Cqzkg+foLc4fSA/ZhcblYgXT3LeWP3C8dqIhXrp3vcTPgcyqGrqfm81C5gmfGkETeITpMEZ
	clsi0Yip4aSjujJVsGJIiH3h6DkNsbYLtq+HQYp2ED/snXB4B7YUapUlzRtVFhHUeGtUFlrsP7b
	abJDHxUCqtToVTFn4Chbco6IsUzIaOzWu9W7FQfb9Genf/yt/RG2RtST8=
X-Google-Smtp-Source: AGHT+IFzzK4Jax0Ss6/pV/yJrywiuEK8413jdinEbd3nP6IJYuh1YVPYCUBIwSddX/cP8cDYcweEog==
X-Received: by 2002:a05:6a20:e713:b0:33b:5563:d6e with SMTP id adf61e73a8af0-33b684d0c51mr5253718637.5.1761199982790;
        Wed, 22 Oct 2025 23:13:02 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:adb:6017:6b6b:ea1a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6cf4e2d81dsm1021648a12.30.2025.10.22.23.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:13:02 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: SOF: Fix function topology name check in profile info output
Date: Thu, 23 Oct 2025 14:12:24 +0800
Message-ID: <20251023061226.1127345-1-wenst@chromium.org>
X-Mailer: git-send-email 2.51.1.814.gb8fa24458f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_231303_674936_9A3D5CA6 
X-CRM114-Status: GOOD (  11.69  )
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

The function topology feature, and the plat_data->machine field that
specifies this feature, is ACPI specific. The check didn't take this
into consideration, which causes a NULL pointer dereference splat on
OF platforms:

    BUG: KASAN: null-ptr-deref in sof_create_ipc_file_profile (sound/soc/sof/fw-file-profile.c:291 sound/soc/sof/fw-file-profile.c:340) snd_sof
    Read of size 8 at addr 00000000000000c8 by task (udev-worker)/247

    CPU: 7 UID: 0 PID: 247 Comm: (udev-worker) Not tainted 6.18.0-rc2-next-20251023-03804-g93b191bc0c26-dirty #747 PREEMPT  ba3c303a11d89508de4087cb5b4f8985b6d87b6f
    Hardware name: Google Ciri sku2 board (DT)
    Call trace:
    [KASAN stuff]
    sof_create_ipc_file_profile (sound/soc/sof/fw-file-profile.c:291 sound/soc/sof/fw-file-profile.c:340) snd_sof
    snd_sof_device_probe (sound/soc/sof/core.c:304 sound/soc/sof/core.c:388 sound/soc/sof/core.c:460 sound/soc/sof/core.c:719) snd_sof
    sof_of_probe (sound/soc/sof/sof-of-dev.c:84) snd_sof_of
     platform_probe (drivers/base/platform.c:1405)
    [...]

Check that the ACPI specific field is actually valid before accessing
it.

This was seen on a MediaTek based Chromebook.

Fixes: 2b92b98cc476 ("ASoC: SOF: Don't print the monolithic topology name if function topology may be used")
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 sound/soc/sof/fw-file-profile.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index 4a2afc04f338..76bde2e0be1d 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -288,7 +288,8 @@ static void sof_print_profile_info(struct snd_sof_dev *sdev,
 	if (profile->fw_lib_path)
 		dev_info(dev, " Firmware lib path: %s\n", profile->fw_lib_path);
 
-	if (plat_data->machine->get_function_tplg_files && !plat_data->disable_function_topology)
+	if (plat_data->machine && plat_data->machine->get_function_tplg_files &&
+	    !plat_data->disable_function_topology)
 		dev_info(dev, " Topology file:     function topologies\n");
 	else
 		dev_info(dev, " Topology file:     %s/%s\n",
-- 
2.51.1.814.gb8fa24458f-goog


