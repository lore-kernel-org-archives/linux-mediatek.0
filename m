Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD3C606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 19:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v5lNBu/m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=luettge.info header.i=@luettge.info header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=jXKIjbTf;
	dkim=fail reason="signature verification failed" header.d=luettge.info header.i=@luettge.info header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=HKdzcOdR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nGBIgDKKhrzOzPkOrERoddHzzuuvyGa6BOpHmaod6Y8=; b=v5lNBu/m9+/I7hY2CCw/otnqWK
	TVpR1WOmkd28OADkkasaKCDbvsXd7TFKkOp5Yusa/iRgAeiCVtbSyG6oIupzbfZ9qdqVAIDAMa8on
	AFgA2YCWzI9jhsEVI4cazyYWXpHVtLj6jcmOerb/SV8CNjwjnaDYiZB48LGLJhdGmtWM0ku+gTk7l
	AVyuVwwy/xJDEifilhkzNPz0NaC1VzBIgGmu7ptVxFiGLe3F/uKSvj2QdYxF9nIb+azZuunp78pbd
	bD5sYQhfHyS4UhDaHQDjRqmCGmM0a/NqHfUkfa4Vp+minQ1MUmJfbliB1lOy6ubrImuT6106Ntaku
	ZsSMq95w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8Gf-0000000DIPJ-1GXQ;
	Thu, 19 Nov 2026 19:58:03 +0000
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8Gc-0000000DIOb-2HcM
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Nov 2026 19:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1795118254; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=U1NpDYQB0AWlRP8e6jZu97cHEFnnHtPldl0owiyBaczESw+XPZ4cjZWjRg+Zr+CpLd
    33idBclWFhZJaLw4ROSdKwPH+EbzR0T6HBx42y2J8qHq/L1ycnLiBRVLF/nADI8dJ8jL
    wYG/5Sv8t/iFtlIOmC5KRJFGLnxYsSKfYzbvfGwKO7ZK14SMBP1hCES1KR3BmW3BYnQE
    HVsuXWVRuDokrqkEHWjpKOwyRR6YiYoYXZ5sK2AcWkY+s2IK8eK2ZO475u4S93CLQVt9
    FQyU3jOHrc8n9dig3Tvzj56rQdevbh06SwAUxemn+k/VPaJ4JCR6qB0cTSbuA+OqaMXy
    9Rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1795118254;
    s=strato-dkim-0002; d=strato.com;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=nGBIgDKKhrzOzPkOrERoddHzzuuvyGa6BOpHmaod6Y8=;
    b=ckvHJj2DPEnI81MweSZILp6hMsTLEDaGKlC/+Havdmgywdazdlh4X8QzwbzUpMdxO0
    j46x1dk76psQYQhBsIDTC57ArQn2OJrBbcNICMOJ7Nx3SEmwzyhyv5p4W6DurpEzHMbB
    EXe6oqzcHrg7EwOdt0s+aGuoh382+gC/La1tfXOp8zMYDJFxxXacNO3nWMOAdeDwak1A
    IE4M/3NFqgvLuAhxfbvTXyvTIv+ejWpTuFjJQE/feW42OsjXgJV5Qv6kAiAtOqEttahq
    9zU97bVPkyjZTTop+wwo8mXoqrA4u0joF4bRxTdZVBPkyYLEfTnu2dsAz9EAJUAoCuyl
    20Zg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1795118254;
    s=strato-dkim-0002; d=luettge.info;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=nGBIgDKKhrzOzPkOrERoddHzzuuvyGa6BOpHmaod6Y8=;
    b=jXKIjbTfjjvWgiKmpRLRt42LCL0gRzZdRNPpjDXgufzfSF2gvqxHRAqsubD9lOH43h
    3TAw/Fub4XRw45X2PrWOhqHOXHOJRpV9CJbzY9Vl98iiGjPXVXMHKICSvy2Pw2UtZ2dn
    NTMcM46V4j16tkZ/6QFnLtI1F7Tuzxlxtr32/5Wr+gB0K55Y3rP0EoBEWY/MzDWKS65u
    e7SwAxMPFMp+GB3AJJmY9ze6Lrd2r9vMVrvjkqiuJFaSlqK4TXYpa/YqnANNXxM+85mq
    H+gTq7R6jQZoOdupPi2KX7DVFszZXUKHDCp22F/TZ6LnpmiLAL7JKW1m4KuwiA0SPLFV
    UR3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1795118254;
    s=strato-dkim-0003; d=luettge.info;
    h=Message-ID:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=nGBIgDKKhrzOzPkOrERoddHzzuuvyGa6BOpHmaod6Y8=;
    b=HKdzcOdRy8buVCczAn03W2gvxoZXNKMlVO0noRj46+FE8Jy/da41kwoZSiovc658I4
    QcbVVbvAL9dKraiJ9VAw==
X-RZG-AUTH: ":ImUBeVOId+pOILSccbq5ALmheyGcr8lFeaRcD5zyRilB8L88+U77HCjw5pzwRZGaqiACruARGosmlo0cOphz9Iqm/dM9tdnaLGA="
Received: from Prime
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Lfda502AJJvYakN
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 19 Nov 2026 20:57:34 +0100 (CET)
From: =?iso-8859-1?Q?Niels_L=FCttge?= <niels@luettge.info>
To: <nbd@nbd.name>,
	<lorenzo@kernel.org>,
	<sean.wang@mediatek.com>
Cc: <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] wifi: mt76: mt7921: handle BSS_CHANGED_TXPOWER and update txpower_cur
Date: Thu, 19 Nov 2026 20:57:33 +0100
Message-ID: <006901dd7860$37a75690$a6f603b0$@luettge.info>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_006A_01DD7868.996C81E0"
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad14X9B/QmKsIe4cQBWC8T7FvdeTiw==
Content-Language: de
X-Antivirus: Norton (VPS 261119-2, 19.11.2026), Outbound message
X-Antivirus-Status: Clean
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_115758_841325_F0DE7413 
X-CRM114-Status: UNSURE (   5.88  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This is a multipart message in MIME format.

------=_NextPart_000_006A_01DD7868.996C81E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi!

Currently, mt7921 ignores BSS_CHANGED_TXPOWER in =
mt7921_bss_info_changed(),
so runtime TX power limits configured via nl80211/iw (e.g. "iw dev <if>
set txpower limit <mbm>") have no effect in AP or STA mode.

On hardware like MT7922, running at the full regulatory limit (e.g. 23 =
dBm)
pushes tmac values above the EEPROM calibration limits visible in
txpower_sku. This causes PA overdrive/saturation, severe throughput
degradation, and thermal overheating=97which eventually wedges the =
firmware
and driver (MCU timeouts) so badly that only a hard reboot / power cycle
can recover the device, with no way for users or hostapd to reduce TX
power at runtime.

Furthermore, mt76_connac_mcu_rate_txpower_band() never updates
phy->txpower_cur, causing mt76_get_txpower() ("iw dev <if> info") to
always report a static 3.00 dBm regardless of the actual configured
TX power.

Fix both issues by:
1. Handling BSS_CHANGED_TXPOWER in mt7921_bss_info_changed(), refreshing
=A0=A0 the CLC country power table via mt7921_mcu_set_clc() before =
calling
=A0=A0 mt76_connac_mcu_set_rate_txpower() so both downward and upward =
runtime
=A0=A0 TX power adjustments take effect immediately on MT7921/MT7922 =
firmware.
2. Updating phy->txpower_cur in mt76_connac_mcu_rate_txpower_band().

Tested on:
- Hardware: Compulab fitlet2 with MediaTek MT7922 (RZ616, PCIe =
14c3:0616)
- Mode: 5 GHz 80 MHz AP mode (hostapd, regdom DE)
- Kernel: Linux 7.0.0 (also verified on 6.8.0)
- Firmware: WM Firmware Build 20250523103234 (and 20231120)
- OS: Linux Mint 22.3

Analyzed and fixed with AI support.=20

Tested on MT7922 (PCIe) in 5 GHz 80 MHz AP mode.

Best regards,

Niels

---------------------------------------------
Niels Luettge
mailto:niels@luettge.info
---------------------------------------------



------=_NextPart_000_006A_01DD7868.996C81E0
Content-Type: application/octet-stream;
	name="mt7921-txpower-fix-upstream.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="mt7921-txpower-fix-upstream.patch"

--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c=0A=
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c=0A=
@@ -719,6 +719,12 @@=0A=
 	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))=0A=
 		mt7921_mcu_set_tx(dev, vif);=0A=
 =0A=
+	if (changed & BSS_CHANGED_TXPOWER) {=0A=
+		hw->conf.power_level =3D info->txpower > 0 ? info->txpower : 0;=0A=
+		mt7921_mcu_set_clc(dev, dev->mt76.alpha2, dev->country_ie_env);=0A=
+		mt76_connac_mcu_set_rate_txpower(&dev->mphy);=0A=
+	}=0A=
+=0A=
 	if (changed & BSS_CHANGED_PS)=0A=
 		mt7921_mcu_uni_bss_ps(dev, vif);=0A=
 =0A=
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c=0A=
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c=0A=
@@ -2179,6 +2179,7 @@=0A=
 	tx_power =3D 2 * phy->hw->conf.power_level;=0A=
 	if (!tx_power)=0A=
 		tx_power =3D 127;=0A=
+	phy->txpower_cur =3D tx_power;=0A=
 =0A=
 	if (band =3D=3D NL80211_BAND_2GHZ) {=0A=
 		n_chan =3D ARRAY_SIZE(chan_list_2ghz);=0A=

------=_NextPart_000_006A_01DD7868.996C81E0--


