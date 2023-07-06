Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8BAEB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jul 2023 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=npV8v+HBeJUOAG6u1PMdOShzTXKMKk90/y/7NWDMvQY=; b=rKatzIGC2E+KRJZy7zY3eN9E29
	LZXdDcHcCJCDqy0vfkpH0848qCJUfrdCiSfxjIWxdnUtKvDhE5nhrf1Z1U6Bs8JowxfovtMDzL2Er
	qKjGGEebFqES3th+v4T7V9+VmCYXWUwDO7xIzkBXDQL2iCk2aJWSLX1vuMnDAhYuPZ19ClCb4aipI
	yQgs59EyvCTQXTpyTnHZpRR2ll6Z2SfbOsb3dtYjyieP66kHVoe+9y1KCGpX/Yo6rzer/Cr1BnZrY
	pTMYqQoo7YX64oquFd0dhidhWkY5ez/hhsvBNkErls5S/lEZO5SbIbdUqHsrguA90Rx8ATNbX0qjz
	2R/ZVLPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO85-001ck8-1o;
	Thu, 06 Jul 2023 12:30:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHO80-001cfC-1j;
	Thu, 06 Jul 2023 12:30:34 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B7B76606FBA;
	Thu,  6 Jul 2023 13:30:29 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688646630;
	bh=pHMJmwNbtSKYMy6i3xzbiDAPsbITJLjZDpeNrBax1WY=;
	h=From:To:Cc:Subject:Date:From;
	b=HNIsmBblHxjvSoYlmth1zpKe3gbr8lume50N9BA8jGKtenz9T81nLWPrcbAKI8be8
	 itLehFcqyTZZbeOZ2/WT+KqmFWOPj6z1vp3bCf9oqsLkZ9izj1K3+nZG7ICWEQQp4Y
	 RIPJb7fjovW77FpQZ38wt5P7gqGTv1UPYCoKUV1JfbjRUG/JXF9XMuOOuupSjSXQ9c
	 GWK/MD3Lal7TDvj8qx9lnmQG8VV4UnpRiVcKuPJAGOPwfUALqbFST7/PZzF5TTm6bB
	 i04Mm1bVuNwMW+0irwbQDZ/wruRlLQgDlMMRvD8UcoqoOvFoSBtqdczXYAQHoMgjCZ
	 s+sM/Y2gE9g/A==
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
	nfraprado@collabora.com
Subject: [PATCH v4 0/9] MediaTek DisplayPort: support eDP and aux-bus
Date: Thu,  6 Jul 2023 14:30:16 +0200
Message-Id: <20230706123025.208408-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_053032_831568_17A0CA7E 
X-CRM114-Status: GOOD (  19.53  )
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


AngeloGioacchino Del Regno (9):
  drm/mediatek: dp: Cache EDID for eDP panel
  drm/mediatek: dp: Move AUX and panel poweron/off sequence to function
  drm/mediatek: dp: Always return connected status for eDP in .detect()
  drm/mediatek: dp: Always set cable_plugged_in at resume for eDP panel
  drm/mediatek: dp: Change logging to dev for mtk_dp_aux_transfer()
  drm/mediatek: dp: Enable event interrupt only when bridge attached
  drm/mediatek: dp: Use devm variant of drm_bridge_add()
  drm/mediatek: dp: Move AUX_P0 setting to
    mtk_dp_initialize_aux_settings()
  drm/mediatek: dp: Add support for embedded DisplayPort aux-bus

 drivers/gpu/drm/mediatek/mtk_dp.c | 197 +++++++++++++++++++-----------
 1 file changed, 127 insertions(+), 70 deletions(-)

-- 
2.40.1


