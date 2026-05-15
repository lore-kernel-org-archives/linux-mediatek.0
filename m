Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F09CD343F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mNv/z0lHm1Py+HbWKuNs9hA4DCJmyJqK5J3Y7sfXrjE=; b=gEG3TCzZm8B/8Cj/sGp+DYxWKI
	eA1lMOvAHWkv13aoKH/cBkYQ2PanwqnEFf6eTA7wzJ4t59VgHZ8LoU4RbzP8D5Ix6oyGpGWTsxt4e
	nsKaz3GbydlN2ez+bJ6J1jM78pnwR0C3rAUCSuCv78347Mvs7Me9CXHsJIBzLs/BYFzfl/cRO8S4q
	F5uIz95I/mgTSxm8EteFc3To3pAU+vyYhdY+TZbBfVUBB3GoNwC23H3iZAKmmiBiq0nCr9OTJ46H/
	q79TkWdA8x8p3o1MSnEg45SGPd5/swJi+fJ2h+d/3jFG4BKXlI3PqZCIsBRYjomlseVkJ7ZVg/Ijj
	q4j1mVVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwY1-0000000911K-3DtM;
	Fri, 15 May 2026 17:42:05 +0000
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNwXy-0000000910f-3cX8
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 17:42:03 +0000
Received: by mail-yx1-xb135.google.com with SMTP id 956f58d0204a3-65c37eafcbeso273826d50.1
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 10:42:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778866922; cv=none;
        d=google.com; s=arc-20240605;
        b=EP+qnEugMxv0F5ruex1H6sRO6KRVijDaMsAzitzN9rghWCt1uUB+TSTJX29vnUMBKd
         lO9MVGwJhWozwPZmfi35c7ECr9o+/dnLcZVVDVASeT2sOT2MvMChMFwprlnpIDKc59fw
         2hZhOIKJAfUkbnQis85lBC/VoYvm+nQISg+rrbtFzb03avQ5HKTQeRuTnVfRoU8iOsm7
         p+CJWVgGQf4MT2414TWUO/mhUsYBX89Oh0EFJg8O+qzjhnjV46IsTceRmM5p7Bz69eYL
         0LZ8Cg95UqeNpy/FIZ8khmhTn50O+HJyjRigV7UyfsuouUeSadst8jtAEK9cuiJIqVFr
         jLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mNv/z0lHm1Py+HbWKuNs9hA4DCJmyJqK5J3Y7sfXrjE=;
        fh=7q9slQwJZ94/e6e481MFJgYPeNForZhGYqL2OGSLeAY=;
        b=ZAIFfR1giEqwLwIS9DoxVCVfmSG3u2tayBH+c2MU/XmsTEtBZU9+ZEjSqiiwxcUEBv
         7NbkUaJzh25wVygqhSPvPjAMLt2jc0gzaBWviBP1pySj4eyF3CBfjOuSDlWFbFy3xuYr
         oIo2qaFIng15/HYdzEVq2oPCnepYePjSfAq+7g3lh5ZHKPeN8iBqgwDGdL6fzskDJ3eS
         jMyNca8Y7lZ5OJPMfKzITBNfsOJQrCMvgv0eNZXnBQls/nLGYnDu7G9Y7cgI13nJjX+/
         aWla1pBvvS/V91Jd3I9gQHQT4jJkr6L1NnvEyA6lf3FEHbhb9gCMHQLv6PLJ4erLmaoR
         og/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778866922; x=1779471722; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mNv/z0lHm1Py+HbWKuNs9hA4DCJmyJqK5J3Y7sfXrjE=;
        b=nZReHh0H9Uoi0eE51uqwEadrLZtQ1GuHuzEX5QqCkLLRMohdL6zfwvrbnpSpSJDe2u
         9NjgOnc53wCic2fqB28JAXQIL6H5QMAsYFqRxW8rYB5QKmBdx1UvY3Hm6zc1Nm9iavcm
         D1XfrpYPaKXO72jld9jNRY35D8+0MdJigTSpeo8U/ba0IcWI5YjKIcF2JPJkHDqCVWo5
         vLOdifPSWqED2WsTSTJXoisP1DlaKoTn/a6YfZH8FbmL0TyVZ+Q4WO/EQA/7mhgMPe3k
         jvfcKWXP2l4Ow7NDsuBAvIfpyxLHStyJ7uU1oMZksBATpEEJ96Cu7kAErTobw4Ee08+C
         x/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778866922; x=1779471722;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mNv/z0lHm1Py+HbWKuNs9hA4DCJmyJqK5J3Y7sfXrjE=;
        b=OMujMCJaIoiv9z1JLqrTGvPpo+Mfnf0DDMzpp3d7ppdN7JgEKpqH3gb2E2p1m6lldq
         d76bfQuHrrnRDIFvHGbhKjEuYeWE9T8m/bkz96Sm2Wm/0Bnk3aHXWJ8WLKUSbnQXt20V
         nxBQLV7peKqq3m49HMmNYHgefdDGtTDsCYklxE/BYy6Aml8CVZSaf84hDvFjBJ0uvxau
         fGsOGrjOvzoCW1gt4zgqaIwwnjH4aLNjdh1mHG8PvWMH9ryogtSmdOd5PM9xEO3KyQeh
         LNoFCRHF+Y/iSo+/dUXNYLEnEUAzpOpNycKwnjLe+2XAMWfiiQmkbnIFoMI0l6OPIWJ3
         oDBA==
X-Gm-Message-State: AOJu0Yy67yYSPj53YIVd8OTZFZEI89fkXYIYP8uazfaWEuLSP2Sgzi4x
	WEVwl3cC4T0PwmVg20HSUoOttfu+Ka1H9RtcjhwBTwsK1PCae/quguq8Y7DztWtYyex2UbuCZPs
	P3PSCakN4xJW7/y89KQBze5NanMIb5eZqM/n3
X-Gm-Gg: Acq92OEKvwlJebeH1E+q3qIRDwgMwdpPQagkWdvMq9eObFGRhX0ktxKG/7hHoeDyM3I
	uBENjigT08/RS+lhGElhhlD8OG2G8Vd88r/L5VndKamjNUIDhQ4dbOKgMyS14uGwgP9odpHX8ZQ
	mUIZGYieIuxFLniqednHc5+ymurQY79wUkfJ9v8LmI4QFn9E6d53mX7/UW+RBgyMFLDdxwEJRXX
	4eiSkAtk269KHtgty2lJsdZyGkb+eS09lgC6tFunel4MuUiiifPY9qRqJDZxD7fcWNCT6A7F47u
	x7B0qvqZvpkFv0DSNI/pGtB0/j3CruGIhFMPeVekbH1AqNkV
X-Received: by 2002:a05:690e:484c:b0:651:8944:c0ba with SMTP id
 956f58d0204a3-65e228a1e88mr3907254d50.63.1778866921663; Fri, 15 May 2026
 10:42:01 -0700 (PDT)
MIME-Version: 1.0
From: Adam Hill <sidepipeuk@gmail.com>
Date: Fri, 15 May 2026 18:41:49 +0100
X-Gm-Features: AVHnY4K5jrhQ-NxDZufeoiWLoJ7HTj27oh2hxO65GEY68sNyck3FHGRlkErPi3Y
Message-ID: <CALgbQMy=XduSht_tq7f7WjsFSos8EX6mSS0pZDGhV3n=OJLy=A@mail.gmail.com>
Subject: mt7915e 5GHz/6GHz with multiple cards or dynamic selection - can it
 be done along these lines?
To: linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_104202_916526_54891460 
X-CRM114-Status: GOOD (  18.50  )
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

Firstly I have to preface this with "I don't know what I'm doing". I
have almost no knowledge of how these ( or any ) wireless cards
operate and little knowledge of the inner workings of kernel modules
etc.... so where I'm going with this might not be possible. I do know
that the current situation with the mt7915e module isn't ideal.

There are two serious-ish concerns as far as I can see:

1) It's currently impossible to have multiple 6GHz capable cards in a
system unless they all operate on either 5GHz or 6GHz, i.e. the same
band for all cards. This removes the very realistic possibility that
you might want two cards, one on 5GHz and one on 6GHz.

2) The band selection is at module load time, and anything looking at
netlink would be unaware that it's even possible to use the other
band.

I've been experimenting, and with the patch below ( simply a proof of
concept ) netlink is supplied with both bands regardless of the one
selected, and changing /sys/module/mt7915e/parameters/enable_6ghz from
Y to N or vice versa, followed by assering /sys.../phy<x>/device/reset
*seems* to allow dynamic switching between bands. However, given my
aforementioned lack of knowledge, I'm unsure whether what I've done is
even valid, and if it gets around the original reason for the single
band selection in the first place ( the original commit, 57af267,
mentions that memory limitations prevent both bands being configured
correctly - and I'm not sure if calling  mt7915_eeprom_parse_hw_cap is
sufficient to replace one with theother ). In any case, I can
successfully switch between bands using this technique ( and also,
coincidentally, use multiple cards on different bands, but that needs
a proper solution ).

Ideally, what I *think* should happen, is that rather than a module
parameter, if a request to set up the band that isn't loaded happens,
the appropriate steps are taken to reconfigure the hardware to the
other band. Probably simpler, but also less desirable, would be a
second module parameter allowing selection on a per-card basis, with a
callback that performs the reset if it's changed.

My current POC is simply:

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
index eb92cbf1a284..87113459fe30 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/eeprom.c
@@ -166,6 +166,9 @@ static void mt7915_eeprom_parse_band_config(struct
mt7915_phy *phy)
        val = eeprom[MT_EE_WIFI_CONF + band];
        val = FIELD_GET(MT_EE_WIFI_CONF0_BAND_SEL, val);

+       if (phy->mt76->cap.has_6ghz && phy->mt76->cap.has_6ghz)
+               val = MT_EE_V2_BAND_SEL_5GHZ_6GHZ;
+
        if (!is_mt7915(&dev->mt76)) {
                switch (val) {
                case MT_EE_V2_BAND_SEL_5GHZ:
@@ -175,13 +178,13 @@ static void
mt7915_eeprom_parse_band_config(struct mt7915_phy *phy)
                        phy->mt76->cap.has_6ghz = true;
                        return;
                case MT_EE_V2_BAND_SEL_5GHZ_6GHZ:
+                       phy->mt76->cap.has_6ghz = true;
+                       phy->mt76->cap.has_5ghz = true;
                        if (enable_6ghz) {
-                               phy->mt76->cap.has_6ghz = true;

u8p_replace_bits(&eeprom[MT_EE_WIFI_CONF + band],
                                                 MT_EE_V2_BAND_SEL_6GHZ,
                                                 MT_EE_WIFI_CONF0_BAND_SEL);
                        } else {
-                               phy->mt76->cap.has_5ghz = true;

u8p_replace_bits(&eeprom[MT_EE_WIFI_CONF + band],
                                                 MT_EE_V2_BAND_SEL_5GHZ,
                                                 MT_EE_WIFI_CONF0_BAND_SEL);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index cec2c4208255..56a8ba648b46 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -1297,6 +1297,9 @@ mt7915_mac_restart(struct mt7915_dev *dev)
        ext_phy = dev->mt76.phys[MT_BAND1];
        phy2 = ext_phy ? ext_phy->priv : NULL;

+       if (phy2)
+               mt7915_eeprom_parse_hw_cap(dev, phy2);
+
        if (dev->hif2) {
                mt76_wr(dev, MT_INT1_MASK_CSR, 0x0);
                mt76_wr(dev, MT_INT1_SOURCE_CSR, ~0);

