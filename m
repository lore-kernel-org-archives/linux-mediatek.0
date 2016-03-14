From: Eddie Huang <eddie.huang@mediatek.com>
Subject: NVMEM usage question
Date: Mon, 14 Mar 2016 20:01:39 +0800
Message-ID: <1457956899.20370.25.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: linux-mediatek@lists.infradead.org, andrew-ct.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

Hi,

Mediatek PMIC chip have some spare registers used to store information.
The value of these registers will exist until user unplug battery or
battery depletion. One of our usage example is store battery utilization
in these spare registers. We want to implement NVMEM driver to
read/write sparse registers, but binding document describe NVMEM is for
"Non-volatile memory", and for hardware like eeprom, efuse. Since the
usage here is some kind of "battery backup memory", but not real
non-volatile memory, is NVMEM driver suitable for this case ?

Eddie
