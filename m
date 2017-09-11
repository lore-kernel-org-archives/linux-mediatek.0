From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/5] nvmem: some cleanups and sparse warning fixes
Date: Mon, 11 Sep 2017 22:00:59 +0900
Message-ID: <1505134864-11975-1-git-send-email-yamada.masahiro@socionext.com>
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
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jassi Brar <jaswinder.singh@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Joachim Eastwood <manabian@gmail.com>, Keiji Hayashibara <hayashibara.keiji@socionext.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Chen-Yu Tsai <wens@csie.org>, linux-mediatek@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>, linux-amlogic@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-rockchip@lists.infradead.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org


Socionext is trying to add a new nvmem driver.

Before adding a new one, I'd like to be sure about the preferred
coding style in this subsystem, and build-up cleaner code base.

Please pick up what you like.  Please feel free to throw away
what you do not like.

1/5, 2/5: convert kzalloc to stack because nvmem_config
is small one-time use data.
This is what we agreed in the discussion.

3/5, 4/5: fix sparse warning
For mtk-efuse, qfprom, the base address is the only private data
but, assigning (void __iomem *) to ->priv directly causes sparse
warnings.

5/5: clean-up of owner settings - if the owner field matches
nvmem->dev->driver->onwer, we need not set the onwer field
explicitly.



Masahiro Yamada (5):
  nvmem: imx-iim: use stack for nvmem_config instead of malloc'ing it
  nvmem: mtk-efuse: use stack for nvmem_config instead of malloc'ing it
  nvmem: mtk-efuse: fix different address space warnings of sparse
  nvmem: qfprom: fix different address space warnings of sparse
  nvmem: set nvmem->owner to nvmem->dev->driver->owner if unset

 drivers/nvmem/bcm-ocotp.c      |  1 -
 drivers/nvmem/core.c           |  2 ++
 drivers/nvmem/imx-iim.c        | 24 +++++++++------------
 drivers/nvmem/imx-ocotp.c      |  1 -
 drivers/nvmem/lpc18xx_eeprom.c |  1 -
 drivers/nvmem/lpc18xx_otp.c    |  1 -
 drivers/nvmem/meson-efuse.c    |  1 -
 drivers/nvmem/mtk-efuse.c      | 47 ++++++++++++++++++++++--------------------
 drivers/nvmem/mxs-ocotp.c      |  1 -
 drivers/nvmem/qfprom.c         | 27 +++++++++++++++---------
 drivers/nvmem/rockchip-efuse.c |  1 -
 drivers/nvmem/sunxi_sid.c      |  1 -
 drivers/nvmem/vf610-ocotp.c    |  1 -
 13 files changed, 54 insertions(+), 55 deletions(-)

-- 
2.7.4
