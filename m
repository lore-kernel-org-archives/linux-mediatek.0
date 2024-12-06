Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF99E7716E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 03:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z9pTFN86FS0SyOTwo7aOv5Uh6k0CB0B2OHdLmFLdDxg=; b=Y2wXxlulshQcmPrHJmWnQqxFHA
	/RBz1Uz6XUG+wNCobHsS0hBGaY4zJL6VWAV9nncIAg4BOP65zl+4Gf68p/S87/FEvyY0cge6jmWBi
	ssZXVr2M5RGsCfidj68Z7O6FkABTOuztY1/QLOdR9DV/4B+6z3SN8wgaPVhO+Gub+fELFM5v1QOOH
	yZytSCQIAPZpZmW4Yyr6ZlSa17L2WcXl4AjyRk4jZSmDQk9aMAsJD746P3ANMUqaNO3/c+e0GbF0z
	/j5qYb1UIFQE2K5jtKBLqu5S+aIkWOQw8bMcPW4MLcN5c6YyXGpfB5kloRHgbjFU3pISEBboYICH/
	NPnoSnnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOpU-00000000PNe-46OQ;
	Fri, 06 Dec 2024 03:16:32 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOoe-00000000PFH-1pLJ
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 03:15:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5F079A438BE;
	Fri,  6 Dec 2024 03:13:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B488DC4CED1;
	Fri,  6 Dec 2024 03:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733454938;
	bh=c0Mesm+3j7sbbxCt6GkL2YPqaVbb1Dh84roeUjk7ymM=;
	h=From:To:Cc:Subject:Date:From;
	b=bre7l5Sw6r8gBERcKUaPzRfipVFf4rHPhW8fZ35jxG0DV8gk9lRhIyU05t3R0buG8
	 lz1BdQSdh5FdYMkaUv12Qs0yZMqzeoco1QfhuHDVIy8SRVsBH+yKCXJHgv5LVT6u5Y
	 NvOS05Rn8ud+n62dhDlCEIEoNI8gN4Ysyb5FwZn0+NHIi55SO9weOV+gdXnj1QvrSV
	 6Ta51BWPDI9SIcwgqWxD+wC2dqXambUtrjilrIH/Isxz8SGpHp/afOmeLVrCRl7A8t
	 pfRnmSSN44Nv8A+l3CcHPhdAwtxMjODy8sJAjeCd+DG363vZzGTJxwhcNSyDUdbuQM
	 hcKw4+a2Jf4Gw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org
Cc: nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux@weissschuh.net,
	devicetree@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	bleung@chromium.org,
	groeck@chromium.org,
	tzungbi@kernel.org
Subject: [PATCH 0/2] platform/chrome: Remove cros-kbd-led-backlight
Date: Fri,  6 Dec 2024 03:14:03 +0000
Message-ID: <20241206031405.1711996-1-tzungbi@kernel.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_191540_579042_642171C3 
X-CRM114-Status: UNSURE (   5.46  )
X-CRM114-Notice: Please train this message.
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

After applying 4c03a44e2668 ("arm64: dts: mediatek: mt8195-cherry: Remove
keyboard-backlight node"), there are no users for using the OF match.
Instead, the device is added via drivers/mfd/cros_ec_dev.c by
970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight subdevice").

The series removes the OF match and the DT bindings.

Tzung-Bi Shih (2):
  platform/chrome: cros_kbd_led_backlight: Remove OF match
  dt-bindings: cros-ec: Remove google,cros-kbd-led-backlight

 .../chrome/google,cros-kbd-led-backlight.yaml | 36 -----------
 .../bindings/mfd/google,cros-ec.yaml          |  3 -
 .../platform/chrome/cros_kbd_led_backlight.c  | 62 ++++---------------
 3 files changed, 11 insertions(+), 90 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/chrome/google,cros-kbd-led-backlight.yaml

-- 
2.47.0.338.g60cca15819-goog


