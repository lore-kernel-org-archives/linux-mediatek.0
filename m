From: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: [PATCH v2] usb: xhci: remove unused member 'parent' in xhci_regset
 struct
Date: Thu, 31 Jan 2019 09:51:30 +0800
Message-ID: <1548899490-19065-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, Alan Stern <stern@rowland.harvard.edu>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

The member @parent of xhci_regset struct is not used in fact,
so remove it

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: remove Change-Id
---
 drivers/usb/host/xhci-debugfs.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/host/xhci-debugfs.h b/drivers/usb/host/xhci-debugfs.h
index ac5bc40f5c3a..f7a4e2492b00 100644
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
2.20.1
