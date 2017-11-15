From: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [POC 00/16] Chromebook R13 GPU driver port
Date: Wed, 15 Nov 2017 16:24:07 +0100
Message-ID: <1510759463-30201-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Ulrich Hecht <ulrich.hecht+renesas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, mbrugger-IBi9RG/b67k@public.gmane.org, magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hi!

Here's a port of the PowerVR Rogue GPU driver for the Acer Chromebook R13,
taken from the Chrome OS 3.18 vendor kernel. It does not really work ATM,
but it's not completely dysfunctional either. Run
https://github.com/uli/bogocube twenty times, and it will work correctly
once or twice. The most frequent issue is that the driver times out waiting
for the firmware to boot. I suspect a power management issue, but I have
not found anything concrete yet.

Instructions on where to get the binary blobs from can be found at
https://www.elinux.org/User:Uli/Acer_Chromebook_R13_GPU_test_system.

Because the driver is rather bulky, this series only contains the changes
vs. the Chrome OS 3.18 kernel version; the full tree can be found at
https://github.com/uli/kernel in branch elm-gpu.

This driver is not usable in its current state, nor is it in any way
suitable for upstreaming. I'm just posting it here in case somebody is
interested.

CU
Uli


Ulrich Hecht (16):
  drm/img-rogue: fix signatures of struct devfreq_cooling_power ops
  drm/img-rogue: convert pfn to pfn_t for vm_insert_mixed()
  drm/img-rogue: change #include <asm/uaccess.h> to <linux/uaccess.h>
  drm/img-rogue: #include <linux/sched/clock.h> in osfunc.c
  drm/img-rogue: adapt to changed fence API
  drm/img-rogue: dma_ops->sync_single_for_*() -> dma_sync_single_for_*()
  drm/img-rogue: __GFP_WAIT is now __GFP_RECLAIM
  drm/img-rogue: dma_buf_ops .kmap_* are now .map_*
  drm/img-rogue: translate pgprot_t to pgprot value for
    __pgprot_modify()
  drm/img-rogue: remove .set_busid methods from drm_driver
  drm/img-rogue: replace call to obsolete drm_platform_init()
  drm/img-rogue: remove locking around devfreq opp functions
  drm/img-rogue: enable img-rogue driver in Kconfig/Makefile
  arm64: dts: mt8173: add CPU OPP tables
  arm64: dts: mt8173: add GPU device
  arm64: dts: mt8173-oak: enable GPU

 arch/arm64/boot/dts/mediatek/mt8173-oak.dtsi       |  13 ++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           | 131 +++++++++++++++++++++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   2 +
 .../drm/img-rogue/1.6/mt8173/mt8173_sysconfig.c    |   6 +-
 drivers/gpu/drm/img-rogue/1.6/mt8173/mtk_module.c  |  14 ++-
 drivers/gpu/drm/img-rogue/1.6/osfunc.c             |   4 +-
 drivers/gpu/drm/img-rogue/1.6/osfunc_arm64.c       |   8 +-
 drivers/gpu/drm/img-rogue/1.6/physmem_dmabuf.c     |   4 +-
 .../gpu/drm/img-rogue/1.6/physmem_osmem_linux.c    |   2 +-
 drivers/gpu/drm/img-rogue/1.6/pmr_os.c             |   2 +-
 drivers/gpu/drm/img-rogue/1.6/pvr_buffer_sync.c    |  36 +++---
 drivers/gpu/drm/img-rogue/1.6/pvr_drm.c            |  34 +-----
 drivers/gpu/drm/img-rogue/1.6/pvr_dvfs_device.c    |   7 --
 drivers/gpu/drm/img-rogue/1.6/pvr_fence.c          |  70 +++++------
 drivers/gpu/drm/img-rogue/1.6/pvr_fence.h          |  20 ++--
 drivers/gpu/drm/img-rogue/1.6/pvr_uaccess.h        |   2 +-
 drivers/gpu/drm/img-rogue/Kconfig                  |   1 +
 18 files changed, 241 insertions(+), 117 deletions(-)

-- 
2.7.4
