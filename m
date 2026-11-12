Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B5E606A323
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 21:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uolaXVzE;
	dkim=pass (2048-bit key, unprotected) header.d=justthetip.ca header.i=@justthetip.ca header.a=rsa-sha256 header.s=key1 header.b=o00RJ+K1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cAIwJJxeuz1biQtNQaAWgjnNY+1Py3EUWw+Z+E4uA40=; b=uolaXVzE7SJSEq
	1OcZ99mHSNWriYHHwhDusRK+IFQRr7JDTzRk0lKpVxyO7ZXqSxNyPJgvKFNkZBz4Wzz4k7twwvQsE
	YicD+SG41AhIK+7xoers9YBphu7WsdY/X265Qn4zR222xZr4JoZL7YezKUwYxKTM2Ga8ELq3HhN40
	8X2qSKm9NEJTIWzg1yw1sa4DNVVL7mHldCxUkb7xDZJqmlrWg+DvTqIf3B2VFzNEORL3p0PU5zX8P
	ujIZMsbebtZINT/5QgL8DitD6CBsPMNSlqd1Un3Lb/6jcEg35i+g1oHT64JGLpIMnflXV41i0Rupm
	mRcoJC5pCe2wtSG5bcVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRclM-0000000B8SB-1arP;
	Thu, 12 Nov 2026 21:55:20 +0000
Received: from out-209.mta0.migadu.com ([2001:41d0:1004:224b::d1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRclH-0000000B8RE-3AEt
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 21:55:19 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=zezGc3eMSrsT2LIUqprixo1HTjLNM/g3ZvrIcC9TmJo=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794520510; v=1; x=1795125310;
 b=o00RJ+K1g6WRyA7C5NTeeZBY9QpVDmVZqHhTyxSH1L1fvJBAx59ZM3xecF6cQeWGJvFHi4Kp
 OJOdoSygxxgmsxcJDSUEwYC4mHsiv50LqXaBlC+pRREA8glhg6OYL3MVESHqUtFHy41wJ9DgAcV
 z1BvSTbkkpXqhBmvHqLcpSzOpTYYCJc4gekyWA3SDeodZ/5SG8ogcT55xVjJbrioKy3bO9gPqlY
 nNcvey+PxEBmvoJQk/ova4U1EsJRYPhKPk5yolg1CMWfv0mCNIJ7PSUqbXYv3+vFDGyljLZf6lB
 W0lcbXFK6djb/wXLbiq1p9pyP9PV5MdYc+vhQXRxPuyFA==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e2ec1a3cb47568d1;
	Thu, 12 Nov 2026 21:55:07 +0000
X-Mizu-Trace-ID: e2ec1a3cb47568d1
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Alexey Charkov <alchark@flipper.net>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] wifi: mt76: mt7921u: Don't reset the USB device on probe
Date: Thu, 12 Nov 2026 14:55:04 -0700
Message-ID: <20261112215504.18199-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261112-mt7921u-bt-reset-v1-1-65587a4d7b81@flipper.net>
References: <20261112-mt7921u-bt-reset-v1-1-65587a4d7b81@flipper.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_135516_529799_BF39B03C 
X-CRM114-Status: GOOD (  11.80  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 05:39:33PM +0400, Alexey Charkov wrote:
>   Bluetooth: hci0: urb 00000000c4b7b871 failed to resubmit (2)
>   Bluetooth: hci0: Opcode 0x0c03 failed: -110

I get the same timeout on an Alfa AWUS036AXML (MT7921AU, x86) every
time Bluetooth and Wi-Fi probe back to back, and never with the patch:

                                  v7.4-rc1           6.18.52
                                  stock   patched    stock   patched
  Bluetooth reset times out
    port disabled and enabled     5 of 5  0 of 5     5 of 5  0 of 5
    reset and reauthorize         5 of 5  0 of 5     5 of 5  0 of 5
      Wi-Fi interface appears in  8.8 s   1.9 s      8.8 s   1.9 s
    reauthorize at USB 3.0        -       -          5 of 5  0 of 5
  (high-speed USB unless noted)

Both ways put the two probes back to back with the Wi-Fi driver
loaded. Wi-Fi behaves as on stock otherwise, unloading under traffic
included.

> Drop the reset. The USB core resets the port in hub_port_init() before
> addressing any newly connected device, using the same hub_port_reset()
> that usb_reset_device() ends up in, so the probe-time call repeats a
> reset that has just happened. A rebind without re-enumeration resets the
> Wi-Fi subsystem through mt792xu_wfsys_reset() on both disconnect and
> probe.

In the port case the probe finds the Wi-Fi firmware still running (I
logged the ready field). The patched driver comes up from there every
time, and from a cold plug-in at USB 3.0. On stock the field is still
set after the reset.

The second hunk does not apply to 6.18.52, where the probe still takes
a device reference. I dropped only the reset line.

Tested-by: Devin Wittmayer <lucid_duck@justthetip.ca> # Alfa AWUS036AXML

