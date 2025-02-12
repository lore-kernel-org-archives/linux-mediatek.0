Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28C8C021A0
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Feb 2025 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oBQtzG5jgWAy0fJPiBU/SOSz9hcA3WZM/DGjMQ8Vqfw=; b=sixavTpBPXOtgJRJKVHNg8hb3c
	wWmy60p/IM2xbqvf0/LWHOTXF7HbgH38U71HsjDuWlvBXEjQTwFo8gya2jBHmmpp2BNurOEVkVtog
	n6AFxO5CUcxWZLJHzIhaZ5YFm3qsX8cydvc6XezJfADCMp3wyo03ldzlpJv0QjugUGjlVA2RtjVYs
	rB579MC27AUhSO8OdiORgTFo0W0WYvwY6K/cZkKMYxjyAn7tFhM3/CH4VBKjBfkdv7xbOjLD14NZv
	TAEytvVFB4RQBtoPQ+weh9XBoAqPGzM+6K+Wdl6iIiWzo6NYC/aX78HDa+e0ocvPxWlhMtPZDeheg
	jmAzmJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIXY-00000008fA6-301U;
	Wed, 12 Feb 2025 19:36:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiIW4-00000008emC-2tdM
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Feb 2025 19:35:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2D035C61E3;
	Wed, 12 Feb 2025 19:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A419C4CEDF;
	Wed, 12 Feb 2025 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739388923;
	bh=Ugf2g2Yhg5Aw7lvSOZInqiVQU41aKtxd+Iq+ubuXWEg=;
	h=From:To:Cc:Subject:Date:From;
	b=uI3m2wF4Xy0uTW4CBkbjuWo3J7yN1REN3JcZj1mpdYXFEtL7T88sdAvRnb1/MVrU0
	 HXdV7MmRBPS0YI+UXLj+AvaYht9/ohnRiXQU3tnh31cN9WYwW57S2uZmvTjg7rm4nw
	 oekL0p384QdGbuQvSSCQ4s6AWgb+kU89zVwLeZbeYvUmavrBOZlotZjvR2VO6YQqbK
	 jnZncsAC7MCaP/DmaCPaN/jfVVcmZLr2Ce+PLa8l2dk3LIQ9d3K2s21TZcme6sYMx0
	 L0TcvYDJaO9zmPCvT39dPi7GgTfEVyAn7Q5nPyLTrcmfn28Vm+FuSEJlJBot2Lv4D7
	 65O8+aKHg5kaw==
From: Bjorn Helgaas <helgaas@kernel.org>
To: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-pci@vger.kernel.org
Cc: =?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jan Beulich <jbeulich@suse.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Deren Wu <Deren.Wu@mediatek.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Shayne Chen <Shayne.Chen@mediatek.com>,
	Sean Wang <Sean.Wang@mediatek.com>,
	Leon Yen <Leon.Yen@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	regressions@lists.linux.dev,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] PCI: Avoid FLR for Mediatek MT7922 WiFi
Date: Wed, 12 Feb 2025 13:35:16 -0600
Message-Id: <20250212193516.88741-1-helgaas@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_113524_817888_C3E4C525 
X-CRM114-Status: GOOD (  13.07  )
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

From: Bjorn Helgaas <bhelgaas@google.com>

The Mediatek MT7922 WiFi device advertises FLR support, but it apparently
does not work, and all subsequent config reads return ~0:

  pci 0000:01:00.0: [14c3:0616] type 00 class 0x028000 PCIe Endpoint
  pciback 0000:01:00.0: not ready 65535ms after FLR; giving up

After an FLR, pci_dev_wait() waits for the device to become ready.  Prior
to d591f6804e7e ("PCI: Wait for device readiness with Configuration RRS"),
it polls PCI_COMMAND until it is something other that PCI_POSSIBLE_ERROR
(~0).  If it times out, pci_dev_wait() returns -ENOTTY and
__pci_reset_function_locked() tries the next available reset method.
Typically this is Secondary Bus Reset, which does work, so the MT7922 is
eventually usable.

After d591f6804e7e, if Configuration Request Retry Status Software
Visibility (RRS SV) is enabled, pci_dev_wait() polls PCI_VENDOR_ID until it
is something other than the special 0x0001 Vendor ID that indicates a
completion with RRS status.

When RRS SV is enabled, reads of PCI_VENDOR_ID should return either 0x0001,
i.e., the config read was completed with RRS, or a valid Vendor ID.  On the
MT7922, it seems that all config reads after FLR return ~0 indefinitely.
When pci_dev_wait() reads PCI_VENDOR_ID and gets 0xffff, it assumes that's
a valid Vendor ID and the device is now ready, so it returns with success.

After pci_dev_wait() returns success, we restore config space and continue.
Since the MT7922 is not actually ready after the FLR, the restore fails and
the device is unusable.

We considered changing pci_dev_wait() to continue polling if a
PCI_VENDOR_ID read returns either 0x0001 or 0xffff.  This "works" as it did
before d591f6804e7e, although we have to wait for the timeout and then fall
back to SBR.  But it doesn't work for SR-IOV VFs, which *always* return
0xffff as the Vendor ID.

Mark Mediatek MT7922 WiFi devices to avoid the use of FLR completely.  This
will cause fallback to another reset method, such as SBR.

Fixes: d591f6804e7e ("PCI: Wait for device readiness with Configuration RRS")
Link: https://github.com/QubesOS/qubes-issues/issues/9689#issuecomment-2582927149
Link: https://lore.kernel.org/r/Z4pHll_6GX7OUBzQ@mail-itl
Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/quirks.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b84ff7bade82..82b21e34c545 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -5522,7 +5522,7 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x443, quirk_intel_qat_vf_cap);
  * AMD Matisse USB 3.0 Host Controller 0x149c
  * Intel 82579LM Gigabit Ethernet Controller 0x1502
  * Intel 82579V Gigabit Ethernet Controller 0x1503
- *
+ * Mediatek MT7922 802.11ax PCI Express Wireless Network Adapter
  */
 static void quirk_no_flr(struct pci_dev *dev)
 {
@@ -5534,6 +5534,7 @@ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AMD, 0x149c, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_AMD, 0x7901, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1502, quirk_no_flr);
 DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x1503, quirk_no_flr);
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_MEDIATEK, 0x0616, quirk_no_flr);
 
 /* FLR may cause the SolidRun SNET DPU (rev 0x1) to hang */
 static void quirk_no_flr_snet(struct pci_dev *dev)
-- 
2.34.1


