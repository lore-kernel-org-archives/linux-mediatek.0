Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0FBC0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jul 2023 07:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PL5gP3fxvbuS3UioNzBrxR9AFkmYIID0tJhD1/ZXRfQ=; b=iI8sa9wmwhHizwUxjY+tRLKmD+
	mJewUS8atVugFCti8HJDSRu6RZZhGijzGF+e8pB1u97Im/qQAdkS7eChq+RIiI38gP+ZIuPIIHX5N
	Mp3VT4Td4O+hsat0Eh/kJ9738pspOzxdUkE96TLg6DBO0cskoimz6V8jPVsrKiNbCnunMGNi5ILmz
	uzukScVo3GM/QXolECi8EBXzucZl1Eu9DlRqhA588ZUSmIAKFumZ4QGXM2Casw4W3EOg6+foyiLTY
	Q6YjLd3t+e3NnCHFQ/rlTsAFgoz5kqWFeupiLjkYulxm5qXaTu61K8gnQ3of6sIkBYGAdBx2VXKyR
	OxlHeZ9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXO-006bTs-12;
	Tue, 25 Jul 2023 07:32:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOCXI-006bPD-0O;
	Tue, 25 Jul 2023 07:32:50 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DF1CF6606FD7;
	Tue, 25 Jul 2023 08:32:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1690270366;
	bh=cqT5ajCvLBVW2JDEu4SAc+isETbiI/4DindheJNWVwY=;
	h=From:To:Cc:Subject:Date:From;
	b=ZqxY7CsQzW6zutuCyeGL3r0WMvStGYxqsugP1I8mGG2VsE4It7zvPYgSQ0lQ8Yxd6
	 G3VYNkJ7Lw2JVSWkDcliSYZk+fTx8qC6Az76c0qO60SVgewok+0v5rQKtQ8r4aL/mz
	 lEQSb8atHM/0D5gLsIYjPqoMeSaCFnPZR+hmun02WrTcThc2Eq2lQ+iwFsytxRnmrW
	 IRxmDlMoOw47jU/8Ri3ryO9BJiA1N7TMrdR5XVSIrYwsc4STG3PNVQAmHc4+wuIXtB
	 Olosf33iNhQixG4LaKMyNqQosyJ1EnHe5F1YhqN5Hkav3q0MXmp2Z1nhp8wNbIwKXP
	 rLpWliRSZCLHw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org,
	nfraprado@collabora.com,
	ehristev@collabora.com
Subject: [PATCH v7 00/11] MediaTek DisplayPort: support eDP and aux-bus
Date: Tue, 25 Jul 2023 09:32:23 +0200
Message-ID: <20230725073234.55892-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_003248_439226_19F760E9 
X-CRM114-Status: GOOD (  23.17  )
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

Changes in v7:
 - Fixed snippet removal, moved from patch [11/11] to [9/11] where
   it actually belongs to, as in patch 9/11 I'm moving that snippet
   to a new function.

Changes in v6:
 - Added some previously missing error checking (patch [01/11])
 - Added error checks for devm_drm_bridge_add()
 - Made sure that cable_plugged_in is set to false if HPD assertion
   polling fails (timeout)
 - Support panel as module (tested with panel-edp on MT8195 Tomato)
 - Rebased over next-20230717

Changes in v5:
 - Added .wait_hpd_asserted() callback for aux-bus
 - Avoid enabling and registering HPD interrupt + handlers for
   eDP case only (keeps HPD interrupts enabled for full DP case)
 - Support not always-on eDP panels (boot with regulator off,
   suspend with regulator off) for power saving in PM suspend.

Changes in v4:
 - Set data lanes to idle to prevent stalls if bootloader didn't
   properly close the eDP port
 - Now using the .done_probing() callback for AUX bus to prevent
   probe deferral loops in case the panel-edp driver is a module
   as previously seen with another bridge driver (ANX7625) on
   some other SoCs (MT8192 and others)
 - Rebased over next-20230706
 - Dropped Chen-Yu's T-b tag on last patch as some logic changed
   (before, I wasn't using the .done_probing() callback).

Changes in v3:
 - Added DPTX AUX block initialization before trying to communicate
   to stop relying on the bootloader keeping it initialized before
   booting Linux.
 - Fixed commit description for patch [09/09] and removed commented
   out code (that slipped from dev phase.. sorry!).

This series adds "real" support for eDP in the mtk-dp DisplayPort driver.

Explaining the "real":
Before this change, the DisplayPort driver did support eDP to some
extent, but it was treating it entirely like a regular DP interface
which is partially fine, after all, embedded DisplayPort *is* actually
DisplayPort, but there might be some differences to account for... and
this is for both small performance improvements and, more importantly,
for correct functionality in some systems.

Functionality first:

One of the common differences found in various boards implementing eDP
and machines using an eDP panel is that many times the HPD line is not
connected. This *must* be accounted for: at startup, this specific IP
will raise a HPD interrupt (which should maybe be ignored... as it does
not appear to be a "real" event...) that will make the eDP panel to be
detected and to actually work but, after a suspend-resume cycle, there
will be no HPD interrupt (as there's no HPD line in my case!) producing
a functionality issue - specifically, the DP Link Training fails because
the panel doesn't get powered up, then it stays black and won't work
until rebooting the machine (or removing and reinserting the module I
think, but I haven't tried that).

Now for.. both:
eDP panels are *e*DP because they are *not* removable (in the sense that
you can't unplug the cable without disassembling the machine, in which
case, the machine shall be powered down..!): this (correct) assumption
makes us able to solve some issues and to also gain a little performance
during PM operations.

What was done here is:
 - Caching the EDID if the panel is eDP: we're always going to read the
   same data everytime, so we can just cache that (as it's small enough)
   shortening PM resume times for the eDP driver instance;
 - Always return connector_status_connected if it's eDP: non-removable
   means connector_status_disconnected can't happen during runtime...
   this also saves us some time and even power, as we won't have to
   perform yet another power cycle of the HW;
 - Added aux-bus support!
   This makes us able to rely on panel autodetection from the EDID,
   avoiding to add more and more panel timings to panel-edp and, even
   better, allowing to use one panel node in devicetrees for multiple
   variants of the same machine since, at that point, it's not important
   to "preventively know" what panel we have (eh, it's autodetected...!).

This was tested on a MT8195 Cherry Tomato Chromebook (panel-edp on aux-bus)


P.S.: For your own testing commodity, here's a reference devicetree:

pp3300_disp_x: regulator-pp3300-disp-x {
	compatible = "regulator-fixed";
	regulator-name = "pp3300_disp_x";
	regulator-min-microvolt = <3300000>;
	regulator-max-microvolt = <3300000>;
	enable-active-high;
	gpio = <&pio 55 GPIO_ACTIVE_HIGH>;
	pinctrl-names = "default";
	pinctrl-0 = <&panel_fixed_pins>;
};

&edp_tx {
	status = "okay";

	pinctrl-names = "default";
	pinctrl-0 = <&edptx_pins_default>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@0 {
			reg = <0>;
			edp_in: endpoint {
				remote-endpoint = <&dp_intf0_out>;
			};
		};

		port@1 {
			reg = <1>;
			edp_out: endpoint {
				data-lanes = <0 1 2 3>;
				remote-endpoint = <&panel_in>;
			};
		};
	};

	aux-bus {
		panel: panel {
			compatible = "edp-panel";
			power-supply = <&pp3300_disp_x>;
			backlight = <&backlight_lcd0>;
			port {
				panel_in: endpoint {
					remote-endpoint = <&edp_out>;
				};
			};
		};
	};
};

AngeloGioacchino Del Regno (11):
  drm/mediatek: dp: Add missing error checks in
    mtk_dp_parse_capabilities
  drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
  drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
  drm/mediatek: dp: Use devm variant of drm_bridge_add()
  drm/mediatek: dp: Move AUX_P0 setting to
    mtk_dp_initialize_aux_settings()
  drm/mediatek: dp: Enable event interrupt only when bridge attached
  drm/mediatek: dp: Avoid mutex locks if audio is not supported/enabled
  drm/mediatek: dp: Move PHY registration to new function
  drm/mediatek: dp: Add support for embedded DisplayPort aux-bus
  drm/mediatek: dp: Add .wait_hpd_asserted() for AUX bus
  drm/mediatek: dp: Don't register HPD interrupt handler for eDP case

 drivers/gpu/drm/mediatek/Kconfig  |   1 +
 drivers/gpu/drm/mediatek/mtk_dp.c | 360 ++++++++++++++++++++----------
 2 files changed, 242 insertions(+), 119 deletions(-)

-- 
2.41.0


