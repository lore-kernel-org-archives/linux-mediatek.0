From: Wu-Cheng Li <wuchengli@chromium.org>
Subject: [PATCH v1 0/1] mtk-vcodec: check the vp9 decoder buffer index from VPU
Date: Tue,  7 Mar 2017 14:03:27 +0800
Message-ID: <20170307060328.114348-1-wuchengli@chromium.org>
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
To: pawel@osciak.com, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com, hans.verkuil@cisco.com, wuchengli@google.com
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, djkurtz@chromium.org, linux-media@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

From: Wu-Cheng Li <wuchengli@google.com>

This patch guards against the invalid buffer index from
VPU firmware.

Wu-Cheng Li (1):
  mtk-vcodec: check the vp9 decoder buffer index from VPU.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c |  6 +++++
 .../media/platform/mtk-vcodec/vdec/vdec_vp9_if.c   | 26 ++++++++++++++++++++++
 drivers/media/platform/mtk-vcodec/vdec_drv_if.h    |  2 ++
 3 files changed, 34 insertions(+)

-- 
2.12.0.rc1.440.g5b76565f74-goog
