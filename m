From: "Hsin-Yi, Wang" <hsinyi@chromium.org>
Subject: [V3] usb/mtu3: power down device ip at setup
Date: Wed, 28 Nov 2018 17:53:58 +0800
Message-ID: <20181128095358.42498-1-hsinyi@chromium.org>
References: <20181128092953.41541-1-hsinyi@chromium.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181128092953.41541-1-hsinyi@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Originally, when dr_mode is USB_DR_MODE_HOST, it didn't power down device ip,
so host ip sleep will fail at ssusb_host_disable.

Power down device ip at ssusb_host_setup.

Signed-off-by: Hsin-Yi, Wang <hsinyi@chromium.org>
---
 drivers/usb/mtu3/mtu3_plat.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_plat.c b/drivers/usb/mtu3/mtu3_plat.c
index 46551f6d16fd..792c420fd4ad 100644
--- a/drivers/usb/mtu3/mtu3_plat.c
+++ b/drivers/usb/mtu3/mtu3_plat.c
@@ -200,6 +200,13 @@ static void ssusb_ip_sw_reset(struct ssusb_mtk *ssusb)
 	mtu3_setbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL0, SSUSB_IP_SW_RST);
 	udelay(1);
 	mtu3_clrbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL0, SSUSB_IP_SW_RST);
+
+	/*
+	 * device ip maybe poweron in LK/BROM stage before enter kernel stage;
+	 * power down device ip, otherwise ip-sleep will fail when works as host
+	 * only mode
+	 */
+	mtu3_setbits(ssusb->ippc_base, U3D_SSUSB_IP_PW_CTRL2, SSUSB_IP_DEV_PDN);
 }
 
 /* ignore the error if the clock does not exist */
-- 
2.18.1
