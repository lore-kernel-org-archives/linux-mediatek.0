Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6066CF9C6F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Message-Id:Mime-Version:Content-Type:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZjnPgL7g8lcLzG4ed+ALXG6xF5bu1z5iVcDoUde3q/I=; b=ZR/SAlgcgmMHHST+pF1NcR2pMs
	ClnvOOz7ULSsvtO1OY68FudmU56z7Tx00JiDUndObtlOKKrAtoVh3UBkiTDSt1VrwH7UBTgo1fZJx
	unIdtbDfo241ES1QTUcsf/1YDimZNJp0vuZ+7ew5SLcWLWN2YRwZ27EWyAJgOxcbrWgna+4I52gMq
	FyLMJMr0WlVXuYy5RBqVohuAanWqGBP3jaQJoLcOAJ0BhmX5L+EzRSd5/sMSWSvEXCG7Rcm7OteCa
	pWWFAhlzLAjCHXGjJG68ihVat1N5E6IGx9iVt8ua3y5Mvjtp3KRxM3TSzqw2cJMzO9KlgTIS8v+2L
	dta8AK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssoXJ-00000000M8J-2Tni;
	Mon, 23 Sep 2024 19:15:53 +0000
Received: from venus.kuhnchris.eu ([37.114.34.195] helo=kuhnchris.eu)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssoX8-00000000M6x-2Sqd
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 19:15:45 +0000
Received: from localhost ([10.99.0.7]) by kuhnchris.eu (envelope-sender
 <mailinglists@kuhnchris.eu>) with ESMTP id 87cbae7f; Mon, 23 Sep 2024
 19:15:39 +0000
Content-Type: multipart/mixed;
 boundary=76ed4e64e09a5b9e9c3921a23300522470b4e9639b71b59065fedb77dc28
Mime-Version: 1.0
Message-Id: <D4DWJAHZPHZW.17PDZNBT0R6SG@services>
Subject: mt8186_mt6366 rt1015p/speaker-codec issue
To: <linux-mediatek@lists.infradead.org>
From: <mailinglists@kuhnchris.eu>
Date: Mon, 23 Sep 2024 19:14:51 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_121542_813756_786B1324 
X-CRM114-Status: GOOD (  17.57  )
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

--76ed4e64e09a5b9e9c3921a23300522470b4e9639b71b59065fedb77dc28
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Content-Type: text/plain; charset=utf-8

Dear linux-mediatek community!

First of all, if this is the wrong channel or way to ask question(s) like t=
his, please let me know where to go/redirect me as required, this was the c=
losest to a mediatek-arm based community I could find after a cursory googl=
e search - thanks in advance!

To the issue on hand: this is an audio related issue with the mt8186-audio =
/ mt8186_mt6366 via the rt1015p driver.

In kernel 5.15 the sound card driver load via rt1015p as rt1019p seems to s=
ucceed just fine:
[    0.202316] mt6358-sound mt6358-sound: mt6358_platform_driver_probe(), d=
ev name mt6358-sound
[    0.202486] rt1015p rt1019p: GPIO lookup for consumer sdb
[    0.202489] rt1015p rt1019p: using device tree for GPIO lookup
[    0.202497] of_get_named_gpiod_flags: parsed 'sdb-gpios' property of nod=
e '/rt1019p[0]' - status (0)
...
[    5.503843] mt8186_mt6366_rt1019_rt5682s sound: there is not valid maps =
for state aud_gpio_tdm_off
[    5.503876] mt8186_mt6366_rt1019_rt5682s sound: there is not valid maps =
for state aud_gpio_tdm_on
[    5.505701] mt8186_mt6366_rt1019_rt5682s sound: GPIO lookup for consumer=
 dmic
[    5.505710] mt8186_mt6366_rt1019_rt5682s sound: using device tree for GP=
IO lookup
[    5.505716] of_get_named_gpiod_flags: can't parse 'dmic-gpios' property =
of node '/sound[0]'
[    5.505725] of_get_named_gpiod_flags: can't parse 'dmic-gpio' property o=
f node '/sound[0]'
[    5.505730] mt8186_mt6366_rt1019_rt5682s sound: using lookup tables for =
GPIO lookup
[    5.505732] mt8186_mt6366_rt1019_rt5682s sound: No GPIO consumer dmic fo=
und
[    5.612768] mt8186_mt6366_rt1019_rt5682s sound: there is not valid maps =
for state aud_gpio_tdm_off
[    5.612783] mt8186_mt6366_rt1019_rt5682s sound: there is not valid maps =
for state aud_gpio_tdm_on
[    5.614221] mt8186_mt6366_rt1019_rt5682s sound: GPIO lookup for consumer=
 dmic
[    5.614239] mt8186_mt6366_rt1019_rt5682s sound: using device tree for GP=
IO lookup
[    5.614251] of_get_named_gpiod_flags: can't parse 'dmic-gpios' property =
of node '/sound[0]'
[    5.614268] of_get_named_gpiod_flags: can't parse 'dmic-gpio' property o=
f node '/sound[0]'
[    5.614277] mt8186_mt6366_rt1019_rt5682s sound: using lookup tables for =
GPIO lookup
[    5.614281] mt8186_mt6366_rt1019_rt5682s sound: No GPIO consumer dmic fo=
und
[    5.614565] mt8186_mt6366_rt1019_rt5682s sound: there is not valid maps =
for state aud_gpio_tdm_off
[    5.614589] mt8186_mt6366_rt1019_rt5682s sound: there is not valid maps =
for state aud_gpio_tdm_on
[    5.721382] mt8186-audio 11210000.audio-controller: ASoC: error at soc_c=
omponent_read_no_lock on 11210000.audio-controller for register: [0x00000e4=
0] -16
[    5.726771] dmic-codec dmic-codec: GPIO lookup for consumer dmicen
[    5.726788] dmic-codec dmic-codec: using device tree for GPIO lookup
[    5.726799] of_get_named_gpiod_flags: can't parse 'dmicen-gpios' propert=
y of node '/dmic-codec[0]'
[    5.726815] of_get_named_gpiod_flags: can't parse 'dmicen-gpio' property=
 of node '/dmic-codec[0]'
[    5.726824] dmic-codec dmic-codec: using lookup tables for GPIO lookup
[    5.726828] dmic-codec dmic-codec: No GPIO consumer dmicen found
[    5.727188] rt1015p rt1019p: ASoC: sink widget SDB overwritten
[    5.773576] debugfs: File 'Mt8186 bt Playback' in directory 'dapm' alrea=
dy present!
[    5.773605] debugfs: File 'Mt8186 bt Capture' in directory 'dapm' alread=
y present!
[    5.778985] cros-ec-dev cros-ec-dev.14.auto: CrOS System Control Process=
or MCU detected
[    5.797209] input: sof-mt8186_rt1019_rt5682s HDMI Jack as /devices/platf=
orm/sound/sound/card0/input5
[    5.797563] input: sof-mt8186_rt1019_rt5682s Headset Jack as /devices/pl=
atform/sound/sound/card0/input6


But with kernel 6.11-rc7, the sof loads properly like in 5.15, but the I2S3=
 which links to speaker-codecs, which links to the rt1015p seems to... not =
work? I sadly have no idea how I could help cooperate trying to get this fi=
xed, I tried disabling the I2S3, but that made the driver very upset that i=
t's missing - trying to re-alias the headphone codec (the rt5682s one) fail=
ed due to not getting a lock (makes sense since it's using the same i2s i a=
ssume). Also I do not really know if there is any difference between rt1015=
p and rt1019p, both seem to use the same driver and have a alias/compatible=
 with, so I assume those should be fine... (the rt1019p in the output of th=
e 5.15 kernel is due to the node in the DT being called 'rt1019p', so maybe=
 this is just a fluke)

(Just one thing i noticed, right before sending: comparing the rt1015p outp=
ut it looks like the 5.15 kernel parses the sdb-gpio but the 6.11 doesn't p=
rovide any additional output for rt1015p in the logs... )


[   13.424741] rt1015p speaker-codec: no init pinctrl state
[   13.424760] rt1015p speaker-codec: no sleep pinctrl state
[   13.424765] rt1015p speaker-codec: no idle pinctrl state
[   13.424835] rt1015p speaker-codec: driver: 'rt1015p': driver_bound: boun=
d to device
[   13.424901] rt1015p speaker-codec: bus: 'platform': really_probe: bound =
device to driver rt1015p
[   13.815913] mt8186-audio 11210000.audio-controller: no pinctrl handle
[   13.816975] mt8186-audio 11210000.audio-controller: mtk_afe_combine_sub_=
dai(), num of dai 41
[   13.825542] mt8186-audio 11210000.audio-controller: No cache defaults, r=
eading back from HW
[   13.834376] mt8186-audio 11210000.audio-controller: driver: 'mt8186-audi=
o': driver_bound: bound to device
[   13.834417] mt8186-audio 11210000.audio-controller: bus: 'platform': rea=
lly_probe: bound device to driver mt8186-audio
[   14.545104] mt8186_mt6366 sound: no default pinctrl state
[   14.545186] mt8186_mt6366 sound: error -ENOENT: I2S3: codec dai not foun=
d
[   14.551998] mt8186_mt6366 sound: probe with driver mt8186_mt6366 failed =
with error -2

The device in question is a Asus Chromebook CM1402CM2a/CL1402CM2A - a Media=
tek Kompanio 520 (MT8186) using the mt8186-corosla-tentacruel-sku262144 dev=
ice tree from the kernel - everything is working just fine (after patching =
out the DP-USBC port mux thing via [PATCH] arm64: dts: mediatek: mt8186-cor=
sola: Disable DPI display interface ) - just the audio refusing to work is =
bothering me - I would even ignore the on-board speaker and just use headph=
ones, but apparently both run via the same driver? Not really sure what the=
 function of the rt5682s would be then (maybe HDMI audio?) - but sadly I ca=
nnot debug this any further as I am pretty much with the back to the wall -=
 the rt1015p seems to load, so I am not even sure if this is a mediatek or =
a realtek (assuming the rt in rt1015p stands for realtek of course...) issu=
e to begin with.

If there are any more infos I should provide (full dmesg logs, some other c=
ommands?) please let me know.


Sorry for all the rant and thanks for reading!


Chris

--76ed4e64e09a5b9e9c3921a23300522470b4e9639b71b59065fedb77dc28--

