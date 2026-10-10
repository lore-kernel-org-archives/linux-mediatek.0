Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2A3CA9EC1
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 17:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VnReiZiwvIvSZhH8L3L6XIGF+JHHsViqn48IL31byjg=; b=SBd1AKOrS+dMJTS7CqU8byBMC/
	5erS7Uq4gboqmbJl3M0PFIrEHr0NI9/pQLY/qvl5vZ4SJ4toCMoc48mV3dgSlaaloYO732VjdCJ/Y
	zrNBYbUu2k3ZIM0tE6AYG1pcCL43myEbbPGrZAzaqEZ1+9cOhWcGQm9NpqZFABRa8jc5ZSwOeSj8v
	AfIb9MwsE8An0K+luSpUMw8bLk93QQp8cgYFXvNaGZtVsDfw+6QLVZyghBisUnh+7EVk/dx/Nkp1r
	7BYTKtZ4YP4VLV3merM7RCKLMDQAk2FEfCkW0XZexFygbwa5TJ4U4U/ewDgZKQJny9WILuLCmhdso
	0hX+D6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFajl-00000008K1U-2h7D;
	Sat, 10 Oct 2026 17:19:57 +0000
Received: from out-3.mta1.migadu.com ([2001:41d0:203:375::3] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFajj-00000008K0x-1Ygo
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 17:19:57 +0000
X-Envelope-To: linux-mediatek@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=18dNR+LGECj8vGXix6nvkFcEmzUURhXJfVh59siSNWU=;
 c=simple/simple; d=justthetip.ca;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791652791; v=1; x=1792257591;
 b=vNIpNhU2xRyFsPkti7peqX/BTeRpiPAyE+ne2SfOPZqNYtD+ycUc0h/38THAguD4AT6VQ/Oa
 kAxr5QS5XxAg1hxMuJX2lysZ/iCOmUmZZ+8yyecazM6FcPoJJRArSGYaO2ody1pgpJD2fxprjB1
 X8WEZCbjGgRecVaoM99vt8UQnO6NbzawZpyUeQ4zp/VFce2g2iuUGuR/YDyMLxzIUbx7XKEN4/8
 jXSBkYV3gsP43dvwJE6rLjqcNcDHqpU5j9mFdr11B658Tzl3x5foyTwEeH5A7zEvhZw/voCAYLf
 dG1M1CtvkoeT65xPLWDYc0f8QCS4ao+/I9omnev6NJErw==
X-Envelope-To: linux-mediatek@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 3d10b0d0e088b810;
	Sat, 10 Oct 2026 17:19:50 +0000
X-Mizu-Trace-ID: 3d10b0d0e088b810
X-Migadu-Flow: FLOW_OUT
From: Devin Wittmayer <lucid_duck@justthetip.ca>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Deren Wu <deren.wu@mediatek.com>,
	Breno Leitao <leitao@debian.org>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH wireless] wifi: mt76: fix NULL dereference reading napi_threaded in debugfs
Date: Sat, 10 Oct 2026 10:19:47 -0700
Message-ID: <20261010171947.12837-1-lucid_duck@justthetip.ca>
X-Mailer: git-send-email 2.56.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_101955_822794_488B2002 
X-CRM114-Status: UNSURE (   9.74  )
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

The napi_threaded debugfs file is created for every device, but only
devices that set up NAPI allocate the netdev behind it. SDIO devices
never do, and neither did USB devices before their receive path moved
to NAPI. Reading the file on one of them oopses:

  BUG: kernel NULL pointer dereference, address: 0000000000000343
  RIP: 0010:mt76_napi_threaded_get+0x10/0x30 [mt76]
  Call Trace:
   simple_attr_read
   debugfs_attr_read
   vfs_read

Refuse the read when there is no NAPI device, as the write side already
does for these devices.

Fixes: 08f116c9ea6d ("wifi: mt76: un-embedd netdev from mt76_dev")
Cc: stable@vger.kernel.org
Signed-off-by: Devin Wittmayer <lucid_duck@justthetip.ca>
---
I read the file as root after fresh boots. Patched builds used each
kernel's own source.

  USB, 6.12 to 7.2, stock      13 kernels   oops, 38 of 38 boots
  USB, 6.12 to 7.2, patched     9 kernels   refused, 270 of 270 reads
  USB, 6.8, stock               1 kernel    reads 0, 30 of 30
  USB, 7.3-rc, stock+patched    1 kernel    reads 1, 60 of 60
  PCIe, stock+patched           2 machines  reads 1, 93 of 93

  distros    Debian, Kali, Alpine, Ubuntu, Fedora, Arch, CachyOS,
             Raspberry Pi OS
  machines   x86 and arm64, bare metal and VMs
  adapters   MT7921AU and MT7925U on USB, MT7922 and MT7927 on PCIe
  compilers  gcc and clang

 drivers/net/wireless/mediatek/mt76/debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/debugfs.c b/drivers/net/wireless/mediatek/mt76/debugfs.c
index a5ac6ca86735..d04199b50a29 100644
--- a/drivers/net/wireless/mediatek/mt76/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/debugfs.c
@@ -44,6 +44,9 @@ mt76_napi_threaded_get(void *data, u64 *val)
 {
 	struct mt76_dev *dev = data;
 
+	if (!dev->napi_dev)
+		return -EOPNOTSUPP;
+
 	*val = dev->napi_dev->threaded;
 	return 0;
 }
-- 
2.56.0


