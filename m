From: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [PATCH RFC v2 0/2] Use cpu based scaling passive governor for MT8183 CCI
Date: Wed, 17 Jul 2019 14:11:23 +0800
Message-ID: <20190717061124.453-1-hsinyi@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: "MyungJoo Ham )" <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

This series depends on following series:
1. mt8183 cpufreq and cci devfreq from andrew-sh.cheng
https://patchwork.kernel.org/cover/10946047/

2. cpu based scaling support to passive_governor from Sibi Sankar
https://lore.kernel.org/patchwork/patch/1101049/

This series uses cpu based scaling passive governor for mt8183-cci to improve
performance and deal with shared regulator voltage setting issue.

Hsin-Yi Wang (2):
  devfreq: mt8183-cci: using cpu based scaling passive_governor
  cpufreq: mediatek: Support vproc shared by multiple component

 drivers/cpufreq/mediatek-cpufreq.c   |  16 +-
 drivers/devfreq/mt8183-cci-devfreq.c | 239 +++++++--------------------
 2 files changed, 68 insertions(+), 187 deletions(-)

-- 
2.20.1
