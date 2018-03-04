From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v4 11/22] nvmem: meson-mx-efuse: Convert to use
 devm_nvmem_register()
Date: Sun, 4 Mar 2018 19:13:33 +0800
Message-ID: <201803041808.QKiA80AX%fengguang.wu@intel.com>
References: <20180228144106.16363-12-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180228144106.16363-12-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Andrey Smirnov <andrew.smirnov@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Carlo Caione <carlo@caione.org>, Kevin Hilman <khilman@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, cphealy@gmail.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Andrey,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v4.16-rc3 next-20180302]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Andrey-Smirnov/Verbatim-device-names-and-devm_nvmem_-un-register/20180303-220801


coccinelle warnings: (new ones prefixed by >>)

>> drivers/nvmem/meson-mx-efuse.c:237:1-3: WARNING: PTR_ERR_OR_ZERO can be used

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
