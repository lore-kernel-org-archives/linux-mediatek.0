From: Stu Hsieh <stu.hsieh@mediatek.com>
Subject: [PATCH 00/14] Add mediatek mipicsi driver for Mediatek SOC MT2712
Date: Mon, 8 Apr 2019 19:54:51 +0800
Message-ID: <1554724505-19882-1-git-send-email-stu.hsieh@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

Add mediatek mipicsi driver for Mediatek SOC MT2712

Stu Hsieh (14):
  [media] mtk-mipicsi: add mediatek mipicsi driver for mt2712
  [media] mtk-mipicsi: add pm function
  [media] mtk-mipicsi: add color format support for mt2712
  [media] mtk-mipicsi: get the w/h/bytepwerline for mtk_mipicsi
  [media] mtk-mipicsi: add function to support SerDes for link number
  [media] mtk-mipicsi: add mipicsi reg setting for mt2712
  [media] mtk-mipicsi: enable/disable ana clk
  [media] mtk-mipicsi: enable/disable cmos for mt2712
  [media] mtk-mipicsi: add ISR for writing the data to buffer
  [media] mtk-mipicsi: set the output address in HW reg
  [media] mtk-mipicsi: add function to get the format
  [media] mtk-mipicsi: add the function for Get/Set PARM for application
  [media] mtk-mipicsi: add debug message for mipicsi driver
  [media] mtk-mipicsi: add debugfs for mipicsi driver

 drivers/media/platform/mtk-mipicsi/Makefile   |    4 +
 .../media/platform/mtk-mipicsi/mtk_mipicsi.c  | 1692 +++++++++++++++++
 2 files changed, 1696 insertions(+)
 create mode 100644 drivers/media/platform/mtk-mipicsi/Makefile
 create mode 100644 drivers/media/platform/mtk-mipicsi/mtk_mipicsi.c

-- 
2.18.0
