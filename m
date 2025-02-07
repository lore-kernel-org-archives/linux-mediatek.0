Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93670C0219D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2025 22:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OF+hf58ILF4mM/UY120jDE/GZW1jWogoUJE25dCRBcQ=; b=cCMnp0p7enavw9WmW+iqPMZLbH
	9j/ipYlnq76OfeFNUvqxA3qYmF1nZ36lsLd601uT0FZ9CsxqOLcaBGkiG2IsxWhWXjyTa8URzn/w3
	aNo1OmT8ol3F/jNIfxTcY/Tc0tmeZBd4zILzkbJTxtEQoXqEmm0ufUZurrLqgVJYxDPrSaNg3G5gy
	WyfWf3mkKzsaU27LZ08OAxdfKGxvY0kxgnsHkwQ+0ydCKwBcmrPxQ7q5ZaLpTKaLo3rX+g/S+6XLb
	oaM5AD4P2+XR+FvYWzr46LEKSpesjrA7AB1SFcDZJC7JG71MJC/Fz5jJt6MMjQy84iy0r0RGrEzjC
	dtZEtsXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWlT-0000000BNR0-1qQM;
	Fri, 07 Feb 2025 22:23:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgWlQ-0000000BNQK-2SCJ
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Feb 2025 22:23:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D7A5F5C5870;
	Fri,  7 Feb 2025 22:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16F5FC4CED1;
	Fri,  7 Feb 2025 22:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738967034;
	bh=z71GRjU5YMVA5314bHpHU5tEWi/e4K22CBTyU7kCNuA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=K21oY5fkU528S+VLZVhJgko2LHzRdTXdDQkGlomm0nJ/cgPJNEkIyAUV9cb4gCPJz
	 L1+yv/l+D6tUFbvC3fnI2AnYov9fd5joAVQn6u9AtmIugiDUHRLw60wA/j5CMRqmYq
	 qpwxH1z1cIfL9pOUoNXSkduFgm2kvtHymMftfpXja00KqgUqa1+r8vjKjCpDteDBmo
	 TTixmrunnEdH5/BKZaH6E47n6vmd0KLXUP1rlVZ3WJ8xwQp8SEmxQaRBVc2SH4cJqa
	 +KvZPGC8wghAxgNOjjhAVMBsEEAoBA6l5IofpB74qFWXIEgek6T0cNBVdIoc0YUVyw
	 retM3YX9JI8QQ==
Date: Fri, 7 Feb 2025 16:23:52 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Jan Beulich <jbeulich@suse.com>, Bjorn Helgaas <bhelgaas@google.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	Deren Wu <Deren.Wu@mediatek.com>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Shayne Chen <Shayne.Chen@mediatek.com>,
	Sean Wang <Sean.Wang@mediatek.com>,
	Leon Yen <Leon.Yen@mediatek.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: Config space access to Mediatek MT7922 doesn't work after device
 reset in Xen PV dom0 (regression, Linux 6.12)
Message-ID: <20250207222352.GA949665@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z6PiuRDjml0UNWd_@mail-itl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_142356_714172_E5B8C75A 
X-CRM114-Status: GOOD (  23.93  )
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

[+cc Alex, Mediatek folks, thread at https://lore.kernel.org/r/Z4pHll_6GX7OUBzQ@mail-itl]

On Wed, Feb 05, 2025 at 11:14:17PM +0100, Marek Marczykowski-Górecki wrote:
> On Thu, Jan 30, 2025 at 03:31:23PM -0600, Bjorn Helgaas wrote:
> > On Thu, Jan 30, 2025 at 10:30:33AM +0100, Jan Beulich wrote:
> > > On 30.01.2025 05:55, Marek Marczykowski-Górecki wrote:
> > > > I've added logging of all config read/write to this device. Full log at
> > > > [1].
> > > ...

> ...  Generally it looks like this device has broken FLR, and the
> reset works due to the fallback to the secondary bus reset on
> timeout.

> I repeated the test with my additional "&& !PCI_POSSIBLE_ERROR(id)"
> and I got this:
> https://gist.github.com/marmarek/db0808702131b69ea2f66f339a55d71b

I'm having a really hard time piecing this all together.  I'm trying
to recap the current theory:

  - https://github.com/QubesOS/qubes-issues/issues/9689 reports
    Mediatek MT7922 wifi (device/vendor [14c3:0616]) broke when
    running v6.12 on Xen.

  - Marek reproduced this and bisected to d591f6804e7e ("PCI: Wait for
    device readiness with Configuration RRS"), which appeared in
    v6.12.

  - We do FLR on the device, either via sysfs or the xen-pciback
    driver, e.g., pcistub_reset_device_state().

  - We theorize that FLR is unreliable on this device, and it may
    never respond successfully again.  All reads, either to
    PCI_COMMAND (before d591f6804e7e) or PCI_VENDOR_ID (after
    d591f6804e7e) get ~0.

  - Prior to d591f6804e7e, e.g., in v6.11, pci_dev_wait() times out
    because polling PCI_COMMAND always returns ~0, and returns
    -ENOTTY.

    Since -ENOTTY was returned, we try another reset method.  A
    Secondary Bus Reset (SBR) works, and the device works again.

    [3] seems to show this scenario ("NO BUG (kernel rollback 6.11)").
    We waited ~345 seconds before giving up.

  - After d591f6804e7e, e.g., in v6.12, pci_dev_wait() polls
    PCI_VENDOR_ID looking for anything other than 0x0001.  We
    immediately get 0xffff and exit the loop.  We assume the device is
    ready, but it's actually not.

    If pci_dbg were enabled (CONFIG_DYNAMIC_DEBUG=y and booted with
    dyndbg="file drivers/pci/* +p"), we should see "ready %dms after
    FLR" with a very small time.

    We mistakenly think the device is ready, so we restore config
    space, which the device ignores because it's not ready.  The
    device doesn't work at all, perhaps because its config space has
    not been restored.

  - After including the debug patch below, pci_dev_wait() polls
    PCI_VENDOR_ID for something other than either 0x0001 or 0xffff.

    This "works" the same as before d591f6804e7e: We always get ~0,
    eventually time out, return -ENOTTY, fall back to SBR, and the
    device works again.  Because of the timeout, it takes about 70
    seconds in both the Xen and the native logs in [4].

  - The initial report said this works on v6.12 after a warm reboot
    from v6.11, but fails after a cold boot [3].  Followup says this
    works on v6.12 running natively, but it fails when running on
    Xen [5].

    I can't explain why this works in some cases but not others.

  - It seems that even in v6.11, FLR didn't work for this device.  The
    device did eventually become usable, but only because we waited
    70+ seconds after FLR, timed out, and fell back to SBR.

    The quirk patch below should avoid use of FLR completely.  The
    mt7921 driver supports several other devices, maybe more should be
    added.

    Searches for mediatek "not ready" "after FLR" find many similar
    reports from the web: [6], [7] (suspicious in that holding power
    button 60 seconds seems to fix something, maybe similar to the
    warm/cold reboot thing), [8] (works, then fails after
    suspend/resume), [9], [10].

[3] https://github.com/QubesOS/qubes-issues/issues/9689#issuecomment-2582927149
[4] https://gist.github.com/marmarek/db0808702131b69ea2f66f339a55d71b
[5] https://lore.kernel.org/r/Z4pHll_6GX7OUBzQ@mail-itl
[6] https://community.frame.work/t/responded-yet-more-mediatek-issues-on-amd-linux/50039
[7] https://www.linux.org/threads/solved-wifi-adaptator-not-found-mediatek-wi-fi-6-mt7921-wireless-lan-card.37699/page-2
[8] https://forum.manjaro.org/t/mediatek-mt7922-wifi-not-working-after-waking-up/160664
[9] https://forum.manjaro.org/t/mediatek-mt7921e-fails-in-kernel-6-6-and-later-through-6-10/164217
[10] https://www.reddit.com/r/archlinux/comments/188ccib/wifi_disabled_after_disconnected_power/

Debug patch:

  @@ -1297,7 +1297,8 @@ static int pci_dev_wait(struct pci_dev *dev, char *reset_type, int timeout)
                  if (root && root->config_rrs_sv) {
                          pci_read_config_dword(dev, PCI_VENDOR_ID, &id);
  -                     if (!pci_bus_rrs_vendor_id(id))
  +                     if (!pci_bus_rrs_vendor_id(id) &&
  +                         !PCI_POSSIBLE_ERROR(id))
                                  break;


commit 70197d3ec778 ("PCI: Avoid FLR for Mediatek MT7922 WiFi")
Author: Bjorn Helgaas <bhelgaas@google.com>
Date:   Fri Feb 7 14:50:42 2025 -0600

    PCI: Avoid FLR for Mediatek MT7922 WiFi
    


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

