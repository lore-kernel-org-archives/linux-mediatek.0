From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH] usb: xhci: remove unused member 'parent' in xhci_regset struct
Date: Wed, 30 Jan 2019 10:12:21 +0800
Message-ID: <1548814341-15116-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Felipe Balbi <felipe.balbi@linux.intel.com>, Alan Stern <stern@rowland.harvard.edu>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
List-Id: linux-mediatek@lists.infradead.org

The member @parent of xhci_regset struct is not used in fact,
so remove it

Change-Id: Ic6727c28f7200782fe4516bcb41c789b427318a2
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-debugfs.h |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debugfs.h
index ac5bc40..f7a4e24 100644
--- a/drivers/usb/host/xhci-debugfs.h
+++ b/drivers/usb/host/xhci-debugfs.h
@@ -80,7 +80,6 @@ struct xhci_regset {
 	char			name[DEBUGFS_NAMELEN];
 	struct debugfs_regset32	regset;
 	size_t			nregs;
-	struct dentry		*parent;
 	struct list_head	list;
 };
 
-- 
1.7.9.5
