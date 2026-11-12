Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DBC7606A8BA
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 13:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Om0H3d2L;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=3dI5pojd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=; b=Om0H3d2LSOpkPCBDKcJXXw6BDJ
	8+lW56cdayeocCNvlgLKu5Q/Ipl11dQ8ouDTd56YlBDyO7CpK51d6gXF/Obpuy5Yf+syTra99OljK
	tjWlFGUbaAWp9QhzAJ6CVozfPSGoCSCnUPQhmqhtK0Jwxwl20jLwMlohkiM6DQypq0KyAnxWXllpA
	kcH7S6hIBu0jtAJa7KN/ffpVcN0Pz1B3Myb1jnqieE1crk3StY/VfQx7W737+PGHn9KQwPJAmBrGm
	kAO6pJSGnCGT1HOivubmcYF0rITHdSZ/36D2GTdYgu9vAfz+Tw0h9/iIu2NVNpiyBZ4hnUjX2z+F7
	eXN4+WWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV20-0000000A7O1-3hNX;
	Thu, 12 Nov 2026 13:40:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRV1w-0000000A7MP-0IwW
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 13:39:59 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so32404135e9.2
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2026 05:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1794490794; x=1795095594; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=;
        b=3dI5pojd99tEyDFC72siguKxwH/Us8YaTa2NAPHpVWW+FzKcSRJylu5fvNDk10gkWK
         OJqylRihez5Jsm4k4HDRPseiQvyXMwWlyDY7AKT22MEArkAc2naXToqj/JqstzdrcC/q
         UGHm3Lp+aZ6TZFJS6A2pGGm118neQWM0yxBbmhzOZbPYlW+diH38CJEvGE0UxCIs+6e1
         D8aX4TRqrsQKMAefIy+JzRP1ekK2BawMI6ZpjAF98B1zNhCyCrKvxA2kym8GvOXoIR/I
         vywEyI5nA4IfzZNhWga6M6lYNvsYQEgfyhQdXXX3pQiWdV13YQhGo42SfGVn4OO2eY+x
         lFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490794; x=1795095594;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=seWLHQeXZyZ8tmRvofieMn9RmSQ51of6+PAgiTZQrds=;
        b=wybG3lS6Txv2R2RE9q9JJkqJ1zFowWTu5AXoAf08iRwC6CEVNJDT24JuhZNzYdvEZH
         8y/270MhfQiblHgF/rdshRgy+J8j1Q+CY5sytFs07AqSTjKbY/jevkRLonSRWHsdVkVo
         hMvJ+ge7blXmffRJnR6DJ+DxREu4lx07PbuFLi539OeewRcrNhGz0zpXZcX2OjSnQXWM
         8p3K7YZrMAO42aTL5jJVjnTwpUgRDpcW9esl9gKyaV6voMnbILoZZAef/mpCXg4m6c6D
         8vefsPFcjtwAr8ItY9HLsVLN9AG2fxL+ysqGqZOjlh3H29V2IzW4A22kTUZ0N7bqgil5
         4vfg==
X-Forwarded-Encrypted: i=1; AL+hErEObNh8IMFe6140JXH0gBLeFBd+0TeCrb1HgmTmseC2T/tzJped1f7uJte0LT9sBvKMxwo0XfyjSuqhvk7C1Q==@lists.infradead.org
X-Gm-Message-State: APuU4Z+bzZ8p/y8wLKa8tmw+5z+2/aFYZT75KYqn0JEmwZRtO9IxioZa
	wrOXyBNrAdurRP4D8GfQ7d4rmT9SsmhnuaKyZ2fJH1ea0gIbVrkPSUqr9BaFx30QSEzeFoaX63H
	gNzF/rVc40w==
X-Gm-Gg: AYBFou2jrkcg5G46jkVU7BCEZdlDEy05Rm9ezmtroipDmFa5Hx1p+FsUrpaENu4Bdat
	OUnaGc5xNLDgbbUIL2iVsRCX1u/72BUnYW5xAesYx5AhcaxTIdXCK8C8Ejl3GeIZV1EWl48Yg0s
	xNzBG1VKEO1CkcSoIyz9IxiBctuAju08k75hMdiXBJnOWE0NVRSVOnsc6dQjWcFoAxOMYdijdSO
	L2vTkU9yz+Jk0UXS2fHTxWQWnxWgJL+Mwymq1VWPZk47PVqzgWRGHKZjQANcythjzN2ZT9LoSYG
	SXLGxXrO7rjMne5h6w0BFIhXJA4phJoqbc7dta4hcGUneKMAGV0FlF4ylo+2O5/jQd4IxH6uUv+
	WKIEEbES07A4Rsg5G6BSDCWtIPqDV7mkgcrHMOH080s84h3nLfP76RJOFk1E7zHLRHXGsf0VoxG
	jUuC/iWJ5EigNQII39CGZWuJWBwAmShTEqiGIP7JL9ySX6pvkjA9KCHQ9UgN8OCWJdFnm+2kqlI
	kdVrOpQQMqk1tGr1nuNv6IvWjQK9Eld7Cljr50OCL82t6kOixhtvgBYpNYrPPALbphYYrQheL5X
	0/IZPKucE/TsUIqDK4zsHRRgd9Z2GjLAno//lkJKUXpRAjVTWqF9WYAfFQ0bpAtdn9zirCeGr0P
	Zy9yw2/fhYQ==
X-Received: by 2002:a05:600c:350b:b0:4a1:dda8:eb73 with SMTP id 5b1f17b1804b1-4ba09381815mr103259415e9.27.1794490794383;
        Thu, 12 Nov 2026 05:39:54 -0800 (PST)
Received: from alchark-surface.localdomain (bba-86-98-194-229.alshamil.net.ae. [86.98.194.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498366c30b1sm16920643f8f.46.2026.11.12.05.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:39:54 -0800 (PST)
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 12 Nov 2026 17:39:33 +0400
Subject: [PATCH] wifi: mt76: mt7921u: Don't reset the USB device on probe
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-mt7921u-bt-reset-v1-1-65587a4d7b81@flipper.net>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdPElkyHr0I4uFG0JoBZhzEhv
 LtTjt/h/zcwSSoG12qDJG81XeYCqiuIj9t8F9ShGPjEZyJinPKlZVoxZExikrFp2PuR2+idg5K
 9koz6+S+7/rCt4Skx/z6w719iTb5JdAAAAA==
X-Change-ID: 20261112-mt7921u-bt-reset-33288f29c855
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245; i=alchark@flipper.net;
 h=from:subject:message-id; bh=bL8RpPYoSxUEiC5G0bR5mu2gXixb1LSpx/iep6yWC+k=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWR9Pbhgrt6mzODDqpa1AcI8vMX9clPd5p0T8ZCc7n2x7
 eh0vXj7joksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKY6VpSR4YpHVJWeiTaD1rrw3dzTQ2qnHJB+bV301oJh4tMCzoQiYYa/ApGuEpd
 lBdsN7G/ov652P2JZ3fTkZdhDPtOXO4wTPjgyAAA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_053956_144378_7882C30D 
X-CRM114-Status: UNSURE (   9.76  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT7921AUN modules are composite USB devices: btusb drives Bluetooth on
interfaces 0-2 and mt7921u drives Wi-Fi on interface 3. Resetting the
whole device from the Wi-Fi probe unbinds btusb, which has no
pre_reset/post_reset handlers, and since interfaces probe in order, btusb
is usually still downloading its firmware when that happens. The unbind
disables the Bluetooth interrupt endpoint under the running setup, so
HCI_Reset times out waiting for its event, and the Wi-Fi probe stalls for
about 5s until the Bluetooth power-on work gives up:

  Bluetooth: hci0: urb 00000000c4b7b871 failed to resubmit (2)
  Bluetooth: hci0: Opcode 0x0c03 failed: -110

Drop the reset. The USB core resets the port in hub_port_init() before
addressing any newly connected device, using the same hub_port_reset()
that usb_reset_device() ends up in, so the probe-time call repeats a
reset that has just happened. A rebind without re-enumeration resets the
Wi-Fi subsystem through mt792xu_wfsys_reset() on both disconnect and
probe.

Fixes: 0d2afe09fad5 ("mt76: mt7921: add mt7921u driver")
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/net/wireless/mediatek/mt76/mt7921/usb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
index 2fdecf239125..90b9bdf15e9a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/usb.c
@@ -181,7 +181,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 		.write_copy = mt792xu_copy,
 		.type = MT76_BUS_USB,
 	};
-	struct usb_device *udev = interface_to_usbdev(usb_intf);
 	struct ieee80211_ops *ops;
 	struct ieee80211_hw *hw;
 	struct mt792x_dev *dev;
@@ -205,8 +204,6 @@ static int mt7921u_probe(struct usb_interface *usb_intf,
 	atomic_set(&dev->mt76.bus_hung, false);
 	mt792xu_reset_work_init(dev);
 
-	usb_reset_device(udev);
-
 	usb_set_intfdata(usb_intf, dev);
 
 	ret = __mt76u_init(mdev, usb_intf, &bus_ops);

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261112-mt7921u-bt-reset-33288f29c855

Best regards,
--  
Alexey Charkov <alchark@flipper.net>


