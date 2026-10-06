Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D1ECA5FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Oct 2026 20:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=; b=OYIF3exr4iZtep
	uAxlIVpXbIletksX5fPOam/aRJ2VPJUMc2lFPV29vRHUTktIjweH65fqxNlBTQgZajH6R0hexVC07
	B2mHxw6Ool1d5qYXMWgR5CHKPMPBYIQjmP1bQZA0OYT1tWJdKVJ2bFjD4TyJFyvpTEmKPddp2U9eB
	6g7A/wSypKPA0n/IfZLDuwQt4yojtSXbMPfvhJZgG6NPL/8SEjC3wpXsz0JsJKHwx/39j1wTjsNOT
	CmkDtLrUAkTkOnyhPuwLlkCTdqDqtigaz3abLNUrzCmuwGlx73kk2j6Dem+sjy3NM6XLol+tLN5qB
	NP/gbx++2bsm6s8EnMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjO-00000001MM2-2djV;
	Tue, 06 Oct 2026 20:25:46 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEBjL-00000001MKb-1rwd
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Oct 2026 20:25:45 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6deb848ddd7so2430083eaf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Oct 2026 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791318341; x=1791923141; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=;
        b=VjMVbxq/3KAYHJ4ogiwzK7TXH8hXvJsUUmc4BNLKBrCZhNxujgL8XZ0DRxjjn6vfVB
         Auu63FNoTjDrGleoRsWnH4hxFqdbc4vjPewZwZAwoDS/7khJ11d+amdkdVufibGtgo4Z
         5TycF9/mwinGIKvAzrj7JvN2MMWfLpUTih6Mk870Eoeq3RoVItM3JhCKe022Dn4eUtYk
         C6lWditVyU7MTSw7ZujaGAxKi2AzOTXr4LpXiOfKJw+RrgWtuBugvH5169Tyi7K4YCcS
         7bQzqbZmwo5JZA3yyY/dpA/Ncp3u45aWQNKzkWxffHoktuHCki6VPuMCaeFd4p0up8Nl
         rCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791318341; x=1791923141;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=emWWp9zQLotPqVu53IbNyTMqcxVh3ZiXLOMaxjjb42A=;
        b=0DgiKddqBqY6jXyF+31XKrPsjpyoI1sWgMUUAveV4eJfdBgzQxJ3VgxT5jTLEcr8ma
         oCtc/8SJap9JZj7/qw2eaMeEXNdQtQDLaJaAx5lj2Yo/Sfzk+Ol2OjYMjNmfLAkGW8UI
         Q44OTq6HbHvjGin/uLWq2BqFJbSPWzmjhqkhoV2EJBJ8kq2ZQ/aNkNdQ7inkga9HqtFb
         c7HDE9s7k4FaTKkbk1F5H1fqd+V2pjNLXv5mMWpLVpw2e5um6UrXKiWyITFU1UUESmwL
         huJDLdcDW6Jk6JKYHUm6YwDuHfETowa9O8c9Zmh6PnTgZQ9PWGZaGGR3aC12Vc1DnGXR
         YrKQ==
X-Forwarded-Encrypted: i=1; AKwUvBzx2knC6M0q+IayMELxNFZodPXcgsxgQISHcMjjEw5o1p4rIIYFUkGE+kS9IPzmiFPp6lzo/vCP5sOV6YX6cQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l/dhY6WQaWlnTA0ignNF5ljb2OTl0Kp1maeDOO9ZV+rtN3kCv3
	mlKRXXdzuXjYzluaZBf7NlfdV1u3NfahUKWNlXWIb7pLJcqoKIWePQlzZLxWArCRAkI=
X-Gm-Gg: AYBFou32xFKjyQZMnlnfgN4YhTnBYWMnlrucR6fv3tWocKpMMggadEAMPPqQymwhVBt
	falocp9LVpaGLhNg6F1IoMLeIpOm+v3gXi0u66pa1/mXAUMPDPapUHvN5zrr1cuXUtpfP/2y3Ao
	+ubYWgp7SI0jDXSWB84jCu/LAT3EKVQnmP7eRh406+Lc1pXG9AjmeFEQY4hoMa+s7Mp0ngWS/tN
	vZyMUCn5Z+Kbp33/UfSJ3OvoSUsPYnsKAFxwjo90VRDfE9OdhCi3/yEt63qHCqmVeArS62OjVVi
	nG7aXat49F0ONT72++DSE/9Aud9Z74fzB/alGDeVeYYjCxDJa+UITgSjz5bDFHPcSz52oreAXTd
	60AY6UZm5ms5aDgSw3wpEy443X9Tv4ezuolV+EESg0BJssmLBXvWfgBVjwo7R/KAzl7xsyIqr2F
	EVSOoJwGY5IGaY0+iS85CC1OfJqECRa1/Qvv3og3c6PC0Cz/KjApaXwWDvefyxQlStZL1W2bmuz
	g==
X-Received: by 2002:a05:6820:80c8:b0:6dd:696d:b245 with SMTP id 006d021491bc7-6e7a7185793mr353926eaf.53.1791318341561;
        Tue, 06 Oct 2026 13:25:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:372:3180:ce34:1fe7])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6e793f68bf6sm463442eaf.8.2026.10.06.13.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 13:25:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/4] drm/panel: himax-hx8279: add VDDP supply for Startek
 KD070FHFID078
Date: Tue, 06 Oct 2026 15:25:00 -0500
Message-Id: <20261006-panel-himax-hx8279-vddp-v1-0-50d884b42aae@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQrDIBBA4auEWXfACE1qrlK68GeMU1oj2gYh5
 O41zfJbvLdBocxUYOo2yLRy4SU29JcObNBxJmTXDFLIoRdiwKQjvTDwW1cM9SZHhatzCa9OGzL
 eS6sUtDpl8lz/5/vjdPmaJ9nPsYN9/wF2kTCEewAAAA==
X-Change-ID: 20261006-panel-himax-hx8279-vddp-5dabebff2c99
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=pzE7TBtHaXQdTUaCA18apuhFLo+Jj6/WeoKJzFQFzDo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBqxVkes7QQS6aQ71ndy4RUpYujm7OFMzt2sBzSY
 kEu4bXRqfeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCasVZHgAKCRDCzCAB/wGP
 wGuSB/44mamJHa1OYsjk/6qCu9iX+nj2K3lZ+OPUrj2F/Tu1EPxYNTztwaI0acbMEtPAOin2fWA
 A8UERPrClUfDtJtQXleqD4fA4k4PCtaUDej9JuJpGH0hwuJm7y/s8SLzyqYDDgx8vj+fMDE9xFQ
 C8DBJBTejRaGWQn6OSrJ+aTu4QkEVuoMCMsKtLs3rsvMgLVaPz0bfKummw3fPVfhnIuG1Wqf9CY
 BQAhcSUE7ntQRjbKr1VUnFFZ853aN+Zvq9RG4Yd/9n8KBIejxnfEwMHGgMxKOb/oI4bLK8v/o7E
 n5On7Txi/XfsGkgGSlQtP53KKDh5xDd6iYFUeK6QSIK21wJa
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_132543_827800_FF47F077 
X-CRM114-Status: GOOD (  10.93  )
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

The Startek KD070FHFID078 panel has a VDDP power input, which feeds its
DC-DC converter in addition to VDD and IOVCC. On the MediaTek Genio 520
and 720 EVKs, VDDP is switched by its own regulator, and on the Genio
1200 EVK it comes from its own PMIC LDO, so it needs to be described and
enabled. The existing Genio 1200 EVK device tree also turned out to
describe the panel supplies incorrectly, so this series fixes that too.

Patch 1 adds vddp-supply to the binding, required for the Startek panel
only, since it is not known whether the Aoly panel has a VDDP input.
Patch 2 enables the new supply in the driver. Boards without a
vddp-supply in their device tree get a dummy regulator and keep working
so nothing breaks.

Patch 3 adds the property to the Genio 510 and 700 EVK device trees,
where VDDP and VDD share the same VSYS_LCM1 rail. Patch 4 fixes the
panel supplies on the Genio 1200 EVK: its device tree pointed vdd-supply
at the VDDP rail and used the backlight (VDD) switch as the IOVCC
regulator.

The Genio 520 and 720 EVK device trees are not upstream yet; U-Boot
support for them is being submitted separately and uses this property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (4):
      dt-bindings: display: panel: himax,hx8279: add vddp-supply
      drm/panel: himax-hx8279: add the VDDP supply
      arm64: dts: mediatek: mt8390-genio-common: add the panel vddp-supply
      arm64: dts: mediatek: mt8395-genio-common: fix the panel supplies

 .../bindings/display/panel/himax,hx8279.yaml        | 13 +++++++++++++
 .../boot/dts/mediatek/mt8390-genio-common.dtsi      |  1 +
 .../boot/dts/mediatek/mt8395-genio-common.dtsi      | 21 ++++++++-------------
 drivers/gpu/drm/panel/panel-himax-hx8279.c          |  3 ++-
 4 files changed, 24 insertions(+), 14 deletions(-)
---
base-commit: 5d7b464a4f517d1db533b1b231f42ddcf4e1dff4
change-id: 20261006-panel-himax-hx8279-vddp-5dabebff2c99

Best regards,
--  
David Lechner <dlechner@baylibre.com>


