From: Andy Gross <andy.gross@linaro.org>
Subject: [PATCH 0/2] Support ARM SMCC SoC vendor quirks
Date: Tue, 29 Nov 2016 01:44:21 -0600
Message-ID: <1480405463-23165-1-git-send-email-andy.gross@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@armlinux.org.uk, jesper.nilsson@axis.com, lars.persson@axis.com, niklas.cassel@axis.com, will.deacon@arm.com, heiko@sntech.de, Kevin Hilman <khilman@baylibre.com>, lorenzo.pieralisi@arm.com, ck.hu@mediatek.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, Andy Gross <andy.gross@linaro.org>
List-Id: linux-mediatek@lists.infradead.org

At least one SoC vendor (Qualcomm) requires additional processing done
during ARM SMCCC calls.  As such, an additional parameter to the
arm_smccc_smc is required to be able to handle SoC specific quirks.

The Qualcomm quirk is necessary due to the fact that the scm call can
be interrupted on Qualcomm ARM64 platforms.  When this occurs, the
call must be restarted using information that was passed back during
the original smc call.

The first patch in this series adds a quirk structure and also adds a
quirk paramter to arm_smccc_smc calls.  All of the current users of
the call are modified to accomodate the new API parameter.

The second patch adds the Qualcomm quirk and also implements the
Qualcomm firmware changes required to handle the restarting of the
interrupted SMC call.

The original patch set for the SMCCC session ID is located at:
https://lkml.org/lkml/2016/8/20/7

Andy Gross (2):
  arm: kernel: Add SMC structure parameter
  firmware: qcom: scm: Fix interrupted SCM calls

 arch/arm/kernel/smccc-call.S         |  3 ++-
 arch/arm/mach-artpec/board-artpec6.c |  2 +-
 arch/arm64/kernel/asm-offsets.c      |  7 +++++--
 arch/arm64/kernel/smccc-call.S       | 12 ++++++++++--
 drivers/clk/rockchip/clk-ddr.c       |  6 +++---
 drivers/devfreq/rk3399_dmc.c         |  6 +++---
 drivers/firmware/meson/meson_sm.c    |  2 +-
 drivers/firmware/psci.c              |  2 +-
 drivers/firmware/qcom_scm-64.c       | 13 ++++++++++---
 drivers/gpu/drm/mediatek/mtk_hdmi.c  |  2 +-
 include/linux/arm-smccc.h            | 29 ++++++++++++++++++++++++-----
 11 files changed, 61 insertions(+), 23 deletions(-)

-- 
1.9.1
