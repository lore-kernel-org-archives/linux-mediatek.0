Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE83CEBF61
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 23:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bu40LWj131EvrXy4hSGWlLWhDgrzKYj+PB2hYeDUiWQ=; b=SfeZmTs967uPO+
	yethrNk686Zjc+y7jxrQuirI6BgEuwgKZHmVRlpa7TiGu45EvNnHFytu1ytjT1saEIHtr5uisqPZb
	Ah2ePqVv9cDBaRgxGr50phgfyiXRw4MsdGi+FRSU64CaDGzp3whg8WHKg5bXA4gsVNc7+7WzC8CH5
	IMT2s9wyUyahx35L0D2q1kF9HfcE8Cq/8wvvXZciuLo3ltifXe/r7igR+gT3k36ZC5LeQvJZIPJ02
	mOP8/BMfipjxUot8dh26Q9usojJJe8YNR0hZ+dNgmkeeBJJlMi08ydzErnN2+PbDRoP9mu/ey1QRY
	V82NAV7Ch2h78W4wuCAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stxoh-00000009ZIb-20Tu;
	Thu, 26 Sep 2024 23:22:35 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stxnS-00000009Yr5-1x5o;
	Thu, 26 Sep 2024 23:21:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a8d3cde1103so195631766b.2;
        Thu, 26 Sep 2024 16:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727392876; x=1727997676; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bu40LWj131EvrXy4hSGWlLWhDgrzKYj+PB2hYeDUiWQ=;
        b=kdQxVEHOz2vptK67RUlshQ5hRhKAhiIuDEoQl5KT8a5mWnfUZy0tWYJynQMGK7r1wn
         97rYDtdk/FwvNf4Od+873wvbstPyzIg3y66ITsgMy0E+a6WHvsBAO2y1keIs4PYAzyn7
         EQI3KNLtGoDVoRKZj3n/+WCZm7eoIg1kp/Dh5eJadyCb/yhh8o5bXsc2diZHFRHpF1vj
         9GZ065ec7+sKJ6Wb5eFWRBNa1bkGrQLicaJ9MzFx5tDsdUz8+64uy0kRivjMMTrbKZLb
         qsSVhnTZmXuyWVOHO8xMD5sxglRChiAo69bUWeReidtxocI0ARe00m/CDPMEExGdV4Z6
         cx4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727392876; x=1727997676;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bu40LWj131EvrXy4hSGWlLWhDgrzKYj+PB2hYeDUiWQ=;
        b=NPy5+1oO3GHEGaww93mTV5L+0vof7FMQFTtIdtAioiT/ZEVzi1iXZgSxfst0+b86R4
         BgIVHY1UPZ/habqEY7e3sl88Hw0fLXhjwP4nauRRd42jvQUj1MLvXfNGmGqkH7CiWZt8
         HuwCcLWzkNFoH/AvVbkY8IL3Ix4WADWCNek4EL39ruxLNNjGxrO7gf/aru8+HUGBl1Ik
         SvxqHkTY6tvWiBBrR1qbdJvB8QDbxcevMyOY9eaeZ/IOcJRyeQSImLT1Kadam3lkdFfy
         a4VowV8+4om3LbhZDvz/WcFGp8FhowMZVlyFwD2hm1v8DfEeY3ioOp4aQA5rgmJ+SQQK
         Ls9g==
X-Forwarded-Encrypted: i=1; AJvYcCVIPsUBiGHj7kGYyOXePSbtqj3giNR3FeW5VN04RvMFhTotBncjs2648gHNG/9J7yT2xATC6nRtbxuzwcRLyBkE@lists.infradead.org, AJvYcCXZBH3YieP1cD0o6mwbKicFEiJJJBdTuw+LRWcOcJGbsH5JYCgU3lAXNJBCXE63151YufWmYYLWuchMZ+FAKSY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVaCM0vDPy4bRMH6h9zgN6v2KGagKDkrY4x55hUTiIX2eSnKEX
	j21kWJyijeGWP6TpDAU3iK7dm5Vdah/xyMOiMv7OBW91AfgadGg0isgw+YgR
X-Google-Smtp-Source: AGHT+IHhqjy8WeTtGJCjL8APo5icRaeNMZCgJdUWodmCHHiaovrWOaRpdybBZblfcBNu/LZxuuDbbQ==
X-Received: by 2002:a17:907:9488:b0:a8c:d6a3:d038 with SMTP id a640c23a62f3a-a93c492a74emr81977066b.37.1727392875801;
        Thu, 26 Sep 2024 16:21:15 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-3989-b03c-7705-998b.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:3989:b03c:7705:998b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c27773c0sm50368166b.1.2024.09.26.16.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 16:21:15 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Subject: [PATCH 00/18] leds: switch to device_for_each_child_node_scoped()
Date: Fri, 27 Sep 2024 01:20:51 +0200
Message-Id: <20240927-leds_device_for_each_child_node_scoped-v1-0-95c0614b38c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPs9WYC/x2N0QqDMAwAf0XyvIJ2duB+ZYxQktQGpJUGhiD++
 4qPB8fdCSZNxeA9nNDkp6a1dJgeA1COZRWn3Bn86Odx8S+3CRtyN0kw1YYSKSNl3RhLZUGjugu
 7EJfgQ5inZ4rQY3uTpMc9+nyv6w9hSLI6eAAAAA==
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Gene Chen <gene_chen@richtek.com>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727392874; l=3800;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=ls6STftDXgqEjSON3lpk60MstLtR+0wj4jS0gZeSDb0=;
 b=TYJknx8sMFUvP50SESSmj7bX6NpKm2bRxPVZmfQ4I0CTAI78hmnfsvCgYNyfMfsr3Zzok4S+j
 J2NN3jjMDyzDfwjCYYydsp8LC3zBAjJbrjq41NeJcSn3DU93waqFbfe
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_162118_546259_1EA31850 
X-CRM114-Status: GOOD (  12.78  )
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

This series switches from the device_for_each_child_node() macro to its
scoped variant, which in general makes the code more robust if new early
exits are added to the loops, because there is no need for explicit
calls to fwnode_handle_put(). Depending on the complexity of the loop
and its error handling, the code gets simplified and it gets easier to
follow.

The non-scoped variant of the macro is error-prone, and it has been the
source of multiple bugs where the child node refcount was not
decremented accordingly in error paths within the loops. The first patch
of this series is a good example, which fixes that kind of bug that is
regularly found in node iterators.

The uses of device_for_each_child_node() with no early exits have been
left untouched because their simpilicty justifies the non-scoped
variant.

Note that the child node is now declared in the macro, and therefore the
explicit declaration is no longer required.

The general functionality should not be affected by this modification.
If functional changes are found, please report them back as errors.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
Javier Carrasco (18):
      leds: flash: mt6360: fix device_for_each_child_node() refcounting in error paths
      leds: flash: mt6370: switch to device_for_each_child_node_scoped()
      leds: flash: leds-qcom-flash: switch to device_for_each_child_node_scoped()
      leds: aw200xx: switch to device_for_each_child_node_scoped()
      leds: cr0014114: switch to device_for_each_child_node_scoped()
      leds: el15203000: switch to device_for_each_child_node_scoped()
      leds: gpio: switch to device_for_each_child_node_scoped()
      leds: lm3532: switch to device_for_each_child_node_scoped()
      leds: lm3697: switch to device_for_each_child_node_scoped()
      leds: lp50xx: switch to device_for_each_child_node_scoped()
      leds: max77650: switch to device_for_each_child_node_scoped()
      leds: ns2: switch to device_for_each_child_node_scoped()
      leds: pca963x: switch to device_for_each_child_node_scoped()
      leds: pwm: switch to device_for_each_child_node_scoped()
      leds: sun50i-a100: switch to device_for_each_child_node_scoped()
      leds: tca6507: switch to device_for_each_child_node_scoped()
      leds: rgb: ktd202x: switch to device_for_each_child_node_scoped()
      leds: rgb: mt6370: switch to device_for_each_child_node_scoped()

 drivers/leds/flash/leds-mt6360.c       |  3 +--
 drivers/leds/flash/leds-mt6370-flash.c | 11 +++-------
 drivers/leds/flash/leds-qcom-flash.c   |  4 +---
 drivers/leds/leds-aw200xx.c            |  7 ++-----
 drivers/leds/leds-cr0014114.c          |  4 +---
 drivers/leds/leds-el15203000.c         | 14 ++++---------
 drivers/leds/leds-gpio.c               |  9 +++------
 drivers/leds/leds-lm3532.c             | 18 +++++++----------
 drivers/leds/leds-lm3697.c             | 18 ++++++-----------
 drivers/leds/leds-lp50xx.c             | 21 +++++++------------
 drivers/leds/leds-max77650.c           | 18 ++++++-----------
 drivers/leds/leds-ns2.c                |  7 ++-----
 drivers/leds/leds-pca963x.c            | 11 +++-------
 drivers/leds/leds-pwm.c                | 15 ++++----------
 drivers/leds/leds-sun50i-a100.c        | 27 +++++++++----------------
 drivers/leds/leds-tca6507.c            |  7 ++-----
 drivers/leds/rgb/leds-ktd202x.c        |  8 +++-----
 drivers/leds/rgb/leds-mt6370-rgb.c     | 37 ++++++++++------------------------
 18 files changed, 75 insertions(+), 164 deletions(-)
---
base-commit: 92fc9636d1471b7f68bfee70c776f7f77e747b97
change-id: 20240926-leds_device_for_each_child_node_scoped-5a95255413fa

Best regards,
-- 
Javier Carrasco <javier.carrasco.cruz@gmail.com>


