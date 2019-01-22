From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v5 1/2] Bluetooth: btusb: Add protocol support for
 MediaTek MT7668U USB devices
Date: Tue, 22 Jan 2019 15:03:13 +0800
Message-ID: <201901221525.vm7lvaSU%fengguang.wu@intel.com>
References: <508f1c6ddf2e7d2a88d267e418159e929bf133c5.1547849398.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <508f1c6ddf2e7d2a88d267e418159e929bf133c5.1547849398.git.sean.wang@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: kbuild-all@01.org, marcel@holtmann.org, johan.hedberg@gmail.com, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

Hi Sean,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on v5.0-rc2 next-20190116]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/sean-wang-mediatek-com/Bluetooth-btusb-Add-protocol-support-for-MediaTek-MT7668U-USB-devices/20190122-041846
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master


coccinelle warnings: (new ones prefixed by >>)

>> drivers/bluetooth/btusb.c:2683:2-3: Unneeded semicolon

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
