Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD79CD4F54
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2026 09:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTFW+4fxY8B0UHz/RksdPrUd9hEWGcsZ7LCMbKPBaGc=; b=UFDtVRF2QUxgB2iCCV8T83M1kh
	5fPhWlzHy3G9GpILsTlReEnil9LDWgNG4Ks2fIqccs5iXilN1i0GNQU7i1ZnBORVTdNjtHkd+7Jbp
	jD8tVqRS5J0dE+yTPgb+VW+OWBzIwVByhvyqdPlhuNT7zFczR6BxB+9AFF93ca/IyjvGD2Z15bLBL
	hiEzTy5PNHmTk0k23XcuJLn3Ob+1mHe1pG0ZbnZ4FbpjbkgWUNdXO6GUN5VfBEIZFyfn3ELkhyMiL
	uaBp26R0gxvu5NLZGbiZ4SXls6Hsn53vuchPb8nO4YcLukhLuKcLKlra8YF6qYeDLh95dIl965hVB
	CiQo0aWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5a-000000046ea-3JRU;
	Wed, 20 May 2026 09:19:42 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd5W-000000046ZQ-1uIX
	for linux-mediatek@lists.infradead.org;
	Wed, 20 May 2026 09:19:40 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-65c52bb5dd7so4463993d50.2
        for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2026 02:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779268777; cv=none;
        d=google.com; s=arc-20240605;
        b=eZ29bO4gYR8BWsklFvQOtde1FxWjW6zSe9017Pxt29JcqT0g7VSoC2Il82bzuYQ3BA
         YWRGb9ja1RSm+FjR7+qCSV6mBOxpLJrurVRgn7AcwRgp3aAJqHu4xV6pFvIe5T68VgW6
         NNSR7CKiBugOzTMjP29Dch9Y1d0eBWKIvaCY4edKfiLrv8EGE1gBGJEJeZ5yE0+mI+aG
         /dRNgAQofDzoWVxs8y1oNsLyBU7Sjvz1CmV4/rWHKXpr6n0041U2N9JqyH63s4a/B13L
         h25uxSpstEME8GpZxcbUdLcBNjiNEv4sVbj7ZouA1vUDDpn3F5fqjeA07W/ZQFZZVImF
         oG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=xTFW+4fxY8B0UHz/RksdPrUd9hEWGcsZ7LCMbKPBaGc=;
        fh=7q9slQwJZ94/e6e481MFJgYPeNForZhGYqL2OGSLeAY=;
        b=lxeh8X+nXP1hxItwfkPdsGhg/QO+c7z5UAIUf64bP0W+pFBwtwhx48XHNv8GS3z9OG
         LXIyIGphzXcujrP+1kF5w2yY9lSMEBE+cQzVG+/rrlyE5b69TB61EuS3hijEpcd61OZm
         VQML/rX5q0SpCVXqfz7gVjePtsb9RozJtDwbeRba945HQLHDhL3jkEgCxVegu9wEO1sD
         bOoorf0/o+l4ZSyLgx/wyt3Jw9pos9aq4iCyMtNoZBjHC9P4UGs4nVCRv7jf8p4vLqEP
         3EFILn7ExEjJD0pVxWWXxec2IGOfen8tNGLVLmIahYIo4a8zCrMe3Yj6ykOn+pZkPjY7
         wxlg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268777; x=1779873577; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTFW+4fxY8B0UHz/RksdPrUd9hEWGcsZ7LCMbKPBaGc=;
        b=MXk6w8iPyFRoyp4zJVVf2675GmwJuI8vrZFsg9IOFieUpK8LNIaAl/FPXpCnTRfT2h
         vh405bI+YEvjN6XqZUhvE9/XYt7+NexPUdzMtoxg/RqceMDRB9NGgo8qmU8Xo2YfPq/P
         MRmbnVTQzfcW1OyZRC1198iWawEnzmgB7tinBmwQZTTTAFL+OBbwmD2qjcLnwRFuLMwl
         vLqdtl57qV/im2bns1aPva+HXmmHrAFTz1jHPdgdvXurar4MNhpRN92bkSROvHv87rBE
         VKoIEpO7bg5YT4ygTDynHhjijXJqX7GD8Oj50lgZ/4911THHbn5gXT5gcu4inn8RbgQP
         2cQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268777; x=1779873577;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTFW+4fxY8B0UHz/RksdPrUd9hEWGcsZ7LCMbKPBaGc=;
        b=bXoqAcCGnXoZVHtVTDKWk+QBDvxPmygj1PvioglUKfBUXnNX26RegJTM/vUvufs4Z+
         /2u234X2YNW4O74megCGZTXCGnHZQ6+lb04EDzEIpIU4yQRDe1T6MCwZZpIxUwh7pWS9
         pv5lVC8i7IRHxMRhCI/DtqqcnJseG7AFuMHNlyuPDLfQoUF3oZgUoG2b2q7RWkF6dnDt
         6541LlwID2gOqXeiQJrJb95yyBPbSj3Gm0uw5wbm3xAtKyjIz7WwdSkT9T9/q3mbFig+
         z6PkEHWNDObgQ7AP6aawRwof0fBZ4yWgzWVO1OmYpS1YMNMVQb28Qb+U1GppTmQ342Qd
         kqZg==
X-Gm-Message-State: AOJu0Yx6GkuVP8aoZ/Oi8V0N05eLV3Mp0jfw+09BflGtbsVvRQGvZmhb
	9s4ZEoz8qOJBF18r8GNDq0OCOpDp5Ck7Fu8XW/aRDOOFwlUmFOCSGdJJG4anumblVyhdhv7i7Ai
	Xjcpa9L4gJgkV248MY0ZCCqJiZ29tDZH/kRJG
X-Gm-Gg: Acq92OEzCjp0aHy+XP7EA/7rVSFLzq5sZKK2O4VrH83JnsPmlq+fE+sVDn56TBPXBQR
	zeqO4NSSIcM8qDAioP6StNNP3pWgoAYHpOuCpihyo0G85kErI/zqlk2IvJ+6dv6qmfu8U+JhSEu
	TiyY+4Zo2urobzMiolr9GrCxsmqa5nFNFbaf+X87SybC11GBIWttwKYUPf/h6etHbsX5yUHlqSN
	6uV65QkshFp0QR13aiinQ/Lnv9bs3Q0NCPxhYQ0VGUEkOof7vE2OjH/2uO+av9Z4KUh/HiTcKU3
	JGDl8IHw3sycXVwtzWY+RL/5p0kAVlr1yjqlRg==
X-Received: by 2002:a05:690e:1482:b0:651:d047:caf5 with SMTP id
 956f58d0204a3-65e223e318emr23639048d50.0.1779268776668; Wed, 20 May 2026
 02:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <CALgbQMy=XduSht_tq7f7WjsFSos8EX6mSS0pZDGhV3n=OJLy=A@mail.gmail.com>
In-Reply-To: <CALgbQMy=XduSht_tq7f7WjsFSos8EX6mSS0pZDGhV3n=OJLy=A@mail.gmail.com>
From: Adam Hill <sidepipeuk@gmail.com>
Date: Wed, 20 May 2026 10:19:25 +0100
X-Gm-Features: AVHnY4KmBukwi3JecYf-Er8Dun4LvP5qY9CAMC_mmZLrFDNPdRSMwHBK9Idx2ic
Message-ID: <CALgbQMzpY=mh3Uq6xcj4BeBfk5AcZu0h8Q2nGPgUeOd=hEE6-g@mail.gmail.com>
Subject: Re: mt7915e 5GHz/6GHz with multiple cards or dynamic selection - can
 it be done along these lines?
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_021938_524603_959A176F 
X-CRM114-Status: GOOD (  50.43  )
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

Since there's been no feedback on this I've created a patch which
allows dynamic switching per card between the 5GHz and 6GHz bands.
This adds a control in sysfs under
/sys/class/ieee80211/phy<x>/controls/use_6ghz if the feature is
supported, set to Y to use 6GHz or N for 5GHz. If the value is
changed, the eeprom capability is re-read using the alternate band and
a full card reset is performed. There are almost certainly better ways
to do this - it would be nice to avoid the reset for example, but it
"works for me" and even seems to work if you switch bands whilst the
radio is active ( if the card is configured for one band and the
channel set is in the other, everything looks ok but the radio won't
be active - switching to the correct band using sysfs causes the card
to reset and the newap appears ). I'm posting this here in case it
helps anyone else - certainly not proposing it goes into the kernel
but I do think someone should look at this and implement it the
"correct" way. One final point is that I added "bool use_6ghz" at line
227 in mt7915.h - it should probably be a bitfield with sku_limit_en
et al but this way the patch applies back to ( at least ) 6.18
kernels. Here's the patch:

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index eb92cbf1a284..30814469ed5a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -166,6 +166,9 @@ static void mt7915_eeprom_parse_band_config(struct
mt7915_phy *phy)
  val = eeprom[MT_EE_WIFI_CONF + band];
  val = FIELD_GET(MT_EE_WIFI_CONF0_BAND_SEL, val);

+ if (phy->mt76->cap.has_6ghz && phy->mt76->cap.has_6ghz)
+ val = MT_EE_V2_BAND_SEL_5GHZ_6GHZ;
+
  if (!is_mt7915(&dev->mt76)) {
  switch (val) {
  case MT_EE_V2_BAND_SEL_5GHZ:
@@ -175,13 +178,15 @@ static void
mt7915_eeprom_parse_band_config(struct mt7915_phy *phy)
  phy->mt76->cap.has_6ghz = true;
  return;
  case MT_EE_V2_BAND_SEL_5GHZ_6GHZ:
- if (enable_6ghz) {
- phy->mt76->cap.has_6ghz = true;
+ phy->mt76->cap.has_6ghz = true;
+ phy->mt76->cap.has_5ghz = true;
+ if (enable_6ghz || phy->use_6ghz) {
+ dev_info(phy->mt76->dev->dev, "Selecting 6GHz band.\n");
  u8p_replace_bits(&eeprom[MT_EE_WIFI_CONF + band],
  MT_EE_V2_BAND_SEL_6GHZ,
  MT_EE_WIFI_CONF0_BAND_SEL);
  } else {
- phy->mt76->cap.has_5ghz = true;
+ dev_info(phy->mt76->dev->dev, "Selecting 5GHz band.\n");
  u8p_replace_bits(&eeprom[MT_EE_WIFI_CONF + band],
  MT_EE_V2_BAND_SEL_5GHZ,
  MT_EE_WIFI_CONF0_BAND_SEL);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
index 250c2d2479b0..d5f5018478d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/init.c
@@ -4,6 +4,7 @@
 #include <linux/etherdevice.h>
 #include <linux/hwmon.h>
 #include <linux/hwmon-sysfs.h>
+#include <linux/sysfs.h>
 #include <linux/of.h>
 #include <linux/thermal.h>
 #include "mt7915.h"
@@ -221,6 +222,70 @@ static int mt7915_thermal_init(struct mt7915_phy *phy)
  return PTR_ERR_OR_ZERO(hwmon);
 }

+static ssize_t mt7915_sysfs_6ghz_get(struct kobject *kobj, struct
attribute *attr, char *buf)
+{
+ int ret;
+ struct mt7915_phy *phy = container_of(kobj, struct mt7915_phy,
sysfs_controls);
+
+ ret = sysfs_emit(buf, "%c\n", phy->use_6ghz?'Y':'N');
+ return ret;
+}
+
+static ssize_t mt7915_sysfs_6ghz_set(struct kobject *kobj, struct
attribute *attr, const char *buf, size_t count)
+{
+ struct mt7915_phy *phy = container_of(kobj, struct mt7915_phy,
sysfs_controls);
+ bool prev = phy->use_6ghz;
+
+ if (toupper(buf[0]) == 'Y')
+ phy->use_6ghz = true;
+ else
+ phy->use_6ghz = false;
+
+ if (prev != phy->use_6ghz) {
+ mt7915_eeprom_parse_hw_cap(phy->dev, phy);
+ phy->dev->recovery.restart = true;
+ mt7915_reset(phy->dev);
+ //ieee80211_restart_hw(phy->mt76->hw);
+ }
+
+ return count;
+}
+
+static struct sysfs_ops mt7915_sysfs_ops = {
+ .show = mt7915_sysfs_6ghz_get,
+ .store = mt7915_sysfs_6ghz_set
+};
+
+static struct attribute mt7915_sysfs_6ghz = {
+ .name = "use_6ghz",
+ .mode = 0664
+};
+
+static struct attribute *mt7915_sysfs_attrs[] = {
+ &mt7915_sysfs_6ghz,
+ NULL
+};
+
+ATTRIBUTE_GROUPS(mt7915_sysfs);
+
+static const struct kobj_type mt7915_sysfs_ktype = {
+ .sysfs_ops = &mt7915_sysfs_ops,
+ .default_groups = mt7915_sysfs_groups
+};
+
+static int mt7915_sysfs_control_init(struct mt7915_phy *phy)
+{
+ int ret;
+ struct wiphy *wiphy = phy->mt76->hw->wiphy;
+
+ ret = kobject_init_and_add(&phy->sysfs_controls,
&mt7915_sysfs_ktype, &wiphy->dev.kobj, "%s", "controls");
+
+ if (ret)
+ return -ENOMEM;
+
+ return 0;
+}
+
 static void mt7915_led_set_config(struct led_classdev *led_cdev,
    u8 delay_on, u8 delay_off)
 {
@@ -725,6 +790,10 @@ mt7915_register_ext_phy(struct mt7915_dev *dev,
struct mt7915_phy *phy)
  if (ret)
  goto unreg;

+ ret = mt7915_sysfs_control_init(phy);
+ if (ret)
+ goto unreg;
+
  mt7915_init_debugfs(phy);

  return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index bf1d915a3ca2..913f8a9d1d30 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -206,6 +206,7 @@ struct mt7915_phy {
  struct ieee80211_vif *monitor_vif;

  struct thermal_cooling_device *cdev;
+ struct kobject sysfs_controls;
  u8 cdev_state;
  u8 throttle_state;
  u32 throttle_temp[2]; /* 0: critical high, 1: maximum */
@@ -223,6 +224,8 @@ struct mt7915_phy {
  u32 rx_ampdu_ts;
  u32 ampdu_ref;

+ bool use_6ghz;
+
  struct mt76_mib_stats mib;
  struct mt76_channel_state state_ts;




On Fri, 15 May 2026 at 18:41, Adam Hill <sidepipeuk@gmail.com> wrote:
>
> Firstly I have to preface this with "I don't know what I'm doing". I
> have almost no knowledge of how these ( or any ) wireless cards
> operate and little knowledge of the inner workings of kernel modules
> etc.... so where I'm going with this might not be possible. I do know
> that the current situation with the mt7915e module isn't ideal.
>
> There are two serious-ish concerns as far as I can see:
>
> 1) It's currently impossible to have multiple 6GHz capable cards in a
> system unless they all operate on either 5GHz or 6GHz, i.e. the same
> band for all cards. This removes the very realistic possibility that
> you might want two cards, one on 5GHz and one on 6GHz.
>
> 2) The band selection is at module load time, and anything looking at
> netlink would be unaware that it's even possible to use the other
> band.
>
> I've been experimenting, and with the patch below ( simply a proof of
> concept ) netlink is supplied with both bands regardless of the one
> selected, and changing /sys/module/mt7915e/parameters/enable_6ghz from
> Y to N or vice versa, followed by assering /sys.../phy<x>/device/reset
> *seems* to allow dynamic switching between bands. However, given my
> aforementioned lack of knowledge, I'm unsure whether what I've done is
> even valid, and if it gets around the original reason for the single
> band selection in the first place ( the original commit, 57af267,
> mentions that memory limitations prevent both bands being configured
> correctly - and I'm not sure if calling  mt7915_eeprom_parse_hw_cap is
> sufficient to replace one with theother ). In any case, I can
> successfully switch between bands using this technique ( and also,
> coincidentally, use multiple cards on different bands, but that needs
> a proper solution ).
>
> Ideally, what I *think* should happen, is that rather than a module
> parameter, if a request to set up the band that isn't loaded happens,
> the appropriate steps are taken to reconfigure the hardware to the
> other band. Probably simpler, but also less desirable, would be a
> second module parameter allowing selection on a per-card basis, with a
> callback that performs the reset if it's changed.
>
> My current POC is simply:
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> index eb92cbf1a284..87113459fe30 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
> @@ -166,6 +166,9 @@ static void mt7915_eeprom_parse_band_config(struct
> mt7915_phy *phy)
>         val = eeprom[MT_EE_WIFI_CONF + band];
>         val = FIELD_GET(MT_EE_WIFI_CONF0_BAND_SEL, val);
>
> +       if (phy->mt76->cap.has_6ghz && phy->mt76->cap.has_6ghz)
> +               val = MT_EE_V2_BAND_SEL_5GHZ_6GHZ;
> +
>         if (!is_mt7915(&dev->mt76)) {
>                 switch (val) {
>                 case MT_EE_V2_BAND_SEL_5GHZ:
> @@ -175,13 +178,13 @@ static void
> mt7915_eeprom_parse_band_config(struct mt7915_phy *phy)
>                         phy->mt76->cap.has_6ghz = true;
>                         return;
>                 case MT_EE_V2_BAND_SEL_5GHZ_6GHZ:
> +                       phy->mt76->cap.has_6ghz = true;
> +                       phy->mt76->cap.has_5ghz = true;
>                         if (enable_6ghz) {
> -                               phy->mt76->cap.has_6ghz = true;
>
> u8p_replace_bits(&eeprom[MT_EE_WIFI_CONF + band],
>                                                  MT_EE_V2_BAND_SEL_6GHZ,
>                                                  MT_EE_WIFI_CONF0_BAND_SEL);
>                         } else {
> -                               phy->mt76->cap.has_5ghz = true;
>
> u8p_replace_bits(&eeprom[MT_EE_WIFI_CONF + band],
>                                                  MT_EE_V2_BAND_SEL_5GHZ,
>                                                  MT_EE_WIFI_CONF0_BAND_SEL);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> index cec2c4208255..56a8ba648b46 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
> @@ -1297,6 +1297,9 @@ mt7915_mac_restart(struct mt7915_dev *dev)
>         ext_phy = dev->mt76.phys[MT_BAND1];
>         phy2 = ext_phy ? ext_phy->priv : NULL;
>
> +       if (phy2)
> +               mt7915_eeprom_parse_hw_cap(dev, phy2);
> +
>         if (dev->hif2) {
>                 mt76_wr(dev, MT_INT1_MASK_CSR, 0x0);
>                 mt76_wr(dev, MT_INT1_SOURCE_CSR, ~0);

