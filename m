From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH RFC 0/2] Use cpufreq-map governor for MT8183 CCI
Date: Tue, 18 Jun 2019 12:14:32 +0800
Message-ID: <20190618041433.245629-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Saravana Kannan <skannan@codeaurora.org>, "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

From: Hsin-Yi Wang <hsinyi@chromium.org>

This series uses cpufreq-map governor for mt8183-cci to improve performance.

Hsin-Yi Wang (1):
  devfreq: mt8183-cci: using cpufreq-map governor in cci dvfs driver

Saravana Kannan (1):
  PM / devfreq: Generic CPU frequency to device frequency mapping
    governor

 .../bindings/devfreq/devfreq-cpufreq-map.txt  |  53 ++
 drivers/devfreq/Kconfig                       |   8 +
 drivers/devfreq/Makefile                      |   1 +
 drivers/devfreq/governor_cpufreq_map.c        | 583 ++++++++++++++++++
 drivers/devfreq/mt8183-cci-devfreq.c          | 194 +-----
 5 files changed, 649 insertions(+), 190 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/devfreq/devfreq-cpufreq-map.txt
 create mode 100644 drivers/devfreq/governor_cpufreq_map.c

-- 
2.20.1
