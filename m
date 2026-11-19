Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4440606A320
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 23:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JFiFvA1S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=JkrGmci7yhu6PN7as19CyUlWHC7xmqAaCBrk/5MfRro=; b=JFiFvA1S+WlcWzPVYv2zt7C7hv
	LsZkpIpnR6tPO9CKO3ca1nbwSHQ03F0cG2DJF8lRfRT1TwsV+jr3b2l5bBLpomUQOmiBQyuM2BhW+
	blkicmpns+3S17G8gaIEM9uu2QngQaMhpGa5nqtGK5unInu/Us6zm6qWmFIE8XmBUqnWWQqE36dmh
	2iYjNgN9pNgAtFet7gxWRJDpPCXe/EqQF9U3VZgullSrcR3a47U0D8Q944Y7cvpWxwImWidOQWpXL
	JWMRXT6G075HwG7J14wSOCdA6gubKB+G4IO1fiTJnkyqsUjvIQpZHSKQhGgaA8sL2dj2nhfwL9BRp
	Yn45NOnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC1f-0000000Dgyx-225M;
	Thu, 19 Nov 2026 23:58:47 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUC1c-0000000DgyR-2X3A;
	Thu, 19 Nov 2026 23:58:46 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1xUC1R-0000000020D-2lma;
	Thu, 19 Nov 2026 23:58:33 +0000
Date: Thu, 19 Nov 2026 23:58:24 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hermes Wu <hermes.wu@ite.com.tw>,
	Pin-yen Lin <treapking@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v9 00/14] drm/bridge: it6505: DP audio support + shared-DAI
 hw_params fix
Message-ID: <cover.1795132452.git.daniel@makrotopia.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_155844_794181_7199BAF4 
X-CRM114-Status: GOOD (  23.08  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Revive HDMI/DP audio support for the it6505, originally posted by
Jiaxin Yu [1], rebased onto current -next with the review feedback
addressed: &client->dev is gone (the driver gained it6505->dev) and
"#sound-dai-cells" has since been added by commit 325af1bef5b9
("dt-bindings: display: bridge: it6505: Add #sound-dai-cells").

Patches 1-12 fix pre-existing bugs found during review of earlier
versions of this series; they carry Fixes: tags and are ordered first
so stable trees can pick them.

Patch 13 wires up the it6505 audio helpers via hdmi_codec_ops,
unblocking the mt8186-mt6366 sound card which references it6505 as
the I2S3 codec. Without it the whole sound card fails to probe, so
speakers, microphone and headset jack don't work either. Patch 14
makes hw_params succeed with no display attached, needed when the I2S
bus is shared with another codec as on MT8186 "steelix" Chromebooks,
where the speaker path must keep working regardless of the it6505
link state.

Earlier revisions were tested on a MT8186 (google,steelix) Chromebook:
the sound card comes up, speakers, microphone and headset jack work.
Angelo tested v6 on the same machine [2]. I no longer have access to
the hardware, so the changes since v6 are build-tested only (clang,
W=1, every patch of the series). HDMI/DP audio output itself could not
be tested for lack of a suitable adapter cable. The error paths fixed
by patches 5-12 (failing register reads, divisions by zero, malformed
DT properties) were not triggered on hardware.

Angelo, could you give v9 another spin on your steelix? The patches
that changed since v6 (2, 4, 6, 8 and 13) don't carry your tags.

Tool use:

All patches of this series were drafted with the help of Claude Code
(Anthropic). I did not keep track of which Claude models were used for
v1-v8; the v9 changes were made with Claude Opus 5.5.

 * Patch 13 is based on Jiaxin Yu's v3 [1]. Claude Code rebased it onto
   current -next and wrote the audio_lock and mute state serialisation
   added since v3 of this series in response to review.

 * Patches 1-12 and 14 address findings of the Sashiko AI review of
   earlier revisions, most of them pre-existing defects. For each
   revision I handed the complete Sashiko review to Claude Code, which
   assessed the findings, wrote fixes for the valid ones and pointed out
   those that were out of scope or invalid (see the changelog below).
   I reviewed the resulting changes.

 * Commit messages and cover letters were partially drafted by Claude
   Code and edited by me.

[1] https://lore.kernel.org/all/20230730180803.22570-4-jiaxin.yu@mediatek.com/
[2] https://lore.kernel.org/all/7eebbd9b-3a5e-4d95-bbbb-8ba3a7238383@collabora.com/
---
v9:
 * describe tool use in the cover letter instead of Assisted-by:
   trailers, as Documentation/process/generated-content.rst now asks
 * patch 4: track the DP AUX registration in a flag, serialised by a
   new mutex, instead of relying on drm_dp_aux_unregister() doing
   nothing for an unregistered adapter (Luca Ceresoli)
 * patch 6: read and acknowledge the interrupt status registers with
   single regmap bulk transfers; int_status[] becomes u8, dropping the
   casts (Luca Ceresoli)
 * patch 8: drop the audio input FS debug print and its register read
   instead of guarding the division; retitled; the commit message now
   describes the register as confirmed by Hermes Wu (Luca Ceresoli)
 * patches 1, 2, 3, 5 and 7: collected Luca's Reviewed-by
 * patches 1, 3, 5, 7, 9-12 and 14: carry Angelo's Reviewed-by and
   Tested-by given for v6 [2], which v7 and v8 failed to pick up; the
   patches that changed since (2, 4, 6, 8 and 13) don't carry them,
   patch 5 only gained newlines in its messages
 * rebased onto next-20261119
 * patches 9-14: no changes

v8:
 * patch 4: keep the DP AUX unregister in remove() as well, so an i2c
   unbind waits for in-flight AUX device users before the regmap is
   freed; flagged by the Sashiko AI review of v7
 * patch 5: terminate the new dev_err() messages with a newline
 * patch 13: it6505_poweron() sets the powered flag and runs the
   logic reset and init sequence under audio_lock, closing a race
   with the delayed enable work flagged by the Sashiko AI review of
   v7; newline for the new dev_err() message
 * rebased onto next-20260925
 * patches 1-3, 6-12 and 14: no changes

v7:
 * new patch 2: cancel link_works, hdcp_wait_ksv_list and hdcp_work
   in it6505_poweroff() so link training and HDCP authentication
   cannot run into a chip being powered off; pre-existing, found
   while assessing the Sashiko AI review of v6
 * patch 13 (was 12): it6505_poweroff() clears the powered flag
   under audio_lock, closing the race between the codec ops and a
   concurrent power-off flagged by the Sashiko AI review of v6; the
   it6505_enable_audio() wrapper is folded into the delayed work
 * the remaining v6 review findings are already fixed by later
   patches of this series (patches 3, 4, 6, 8, 11 and 12), concern
   pre-existing code outside its scope (whole-register restore in
   it6505_audio_input(), unchecked reads in it6505_aux_i2c_wait()
   and it6505_calc_video_info(), regulator disable order) or do not
   apply (AUX unregister on unbind, missing newline in dev_err())
 * rebased onto next-20260923
 * patches 1, 3-12 and 14: no changes

v6:
 * patch 1: track notifier registration in a flag instead of
   clearing notifier_call, which a chain traversal racing the
   unregistration could have called as NULL (extcon traverses its
   raw notifier chain unlocked); flagged by Sashiko AI review of v5.
   The in-flight-callback race also flagged there is an extcon core
   limitation affecting all its consumers and cannot be closed from
   a consumer driver.
 * patch 4: note that a failed regulator_disable() leaks the
   reference either way
 * new patches 10 and 11: two more pre-existing fixes from v5
   review, an uninitialised link-frequencies value and an error
   code written back to the reset register
 * patches 2, 3, 5-9, 12 and 13: no changes

v5:
 * patch 1: serialise notifier registration state with extcon_lock
 * patch 2: also drop the runtime PM usage ref held for a connected
   display; retitled
 * new patches 3-7 and 9: more pre-existing fixes from v4 review
   (AUX unregister symmetry, poweroff error path, IRQ status read
   errors, two divisions by zero, of_node_put before use)
 * patch 10 (was 4): update plugged_cb/codec_dev under mode_lock
 * patches 8 and 11: no changes

v4:
 * patch 1: quiesce extcon notifier and IRQ before cancelling work,
   initialise extcon_wq in probe; retitled
 * new patch 2: disable runtime PM on remove
 * patch 3 (was 2): collected Chen-Yu Tsai's Reviewed-by
 * patch 4 (was 3): start out muted; mute state and cached
   parameters updated under audio_lock; unregister codec after
   quiesce
 * patch 5 (was 4): apply audio defaults at probe time

v3:
 * new patches 1 and 2, fixing a pre-existing use-after-free on
   remove() and an out-of-bounds read with channel_count == 0
 * patch 3 (was 1): serialise audio enable/disable with audio_lock;
   track mute state so the FIFO-error IRQ cannot undo a mute
 * patch 4 (was 2): no changes

v2:
 * keep and unregister the hdmi-codec platform_device on remove
 * initialise delayed_audio before registering the codec device
 * cancel delayed_audio synchronously on shutdown and remove
 * disable audio immediately when muting
 * patch 2: drop the encoder check instead of returning 0 early

v1: https://lore.kernel.org/all/cover.1784393979.git.daniel@makrotopia.org/
v2: https://lore.kernel.org/all/cover.1784561622.git.daniel@makrotopia.org/
v3: https://lore.kernel.org/all/cover.1784600387.git.daniel@makrotopia.org/
v4: https://lore.kernel.org/all/cover.1784681487.git.daniel@makrotopia.org/
v5: https://lore.kernel.org/all/cover.1784717129.git.daniel@makrotopia.org/
v6: https://lore.kernel.org/all/cover.1784947240.git.daniel@makrotopia.org/
v7: https://lore.kernel.org/all/cover.1790275151.git.daniel@makrotopia.org/
v8: https://lore.kernel.org/all/cover.1790552614.git.daniel@makrotopia.org/

Daniel Golle (13):
  drm/bridge: it6505: quiesce event sources and work on remove()
  drm/bridge: it6505: quiesce work items before powering off
  drm/bridge: it6505: balance and disable runtime PM on remove
  drm/bridge: it6505: unregister DP AUX adapter on bridge detach
  drm/bridge: it6505: complete poweroff even if disabling regulators
    fails
  drm/bridge: it6505: bail out of the IRQ handler when status reads fail
  drm/bridge: it6505: avoid division by zero in pixel clock calculation
  drm/bridge: it6505: drop the audio input FS debug print
  drm/bridge: it6505: guard against zero channel count in audio
    infoframe
  drm/bridge: it6505: hold endpoint OF node reference while parsing it
  drm/bridge: it6505: reject a too short link-frequencies property
  drm/bridge: it6505: don't write an error code back to the reset
    register
  drm/bridge: it6505: Don't reject audio hw_params without an encoder

Jiaxin Yu (1):
  drm/bridge: it6505: Add audio support

 drivers/gpu/drm/bridge/ite-it6505.c | 323 ++++++++++++++++++++--------
 1 file changed, 239 insertions(+), 84 deletions(-)


base-commit: adcad7f4e6332cff3d6d7165f41584899f598534
-- 
2.56.1

