From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v2] cpufreq: mt8173: move resources allocation into
 ->probe()
Date: Sun, 6 Dec 2015 07:54:46 +0530
Message-ID: <20151206022446.GV3430@ubuntu>
References: <1448785898-17838-4-git-send-email-pi-cheng.chen@linaro.org>
 <1449295306-9222-1-git-send-email-pi-cheng.chen@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449295306-9222-1-git-send-email-pi-cheng.chen@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Daniel Kurtz <djkurtz@chromium.org>, Ricky Liang <jcliang@chromium.org>, linux-mediatek@lists.infradead.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On 05-12-15, 14:01, Pi-Cheng Chen wrote:
> Since the return value of ->init() of cpufreq driver is not propagated
> to the device driver model now, move resources allocation into
> ->probe() to handle -EPROBE_DEFER properly.
> 
> Signed-off-by: Pi-Cheng Chen <pi-cheng.chen@linaro.org>
> ---
> v1->v2:
> - fix error handling path in ->probe()

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
