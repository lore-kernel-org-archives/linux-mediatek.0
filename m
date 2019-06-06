From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 2/2] clk: reset: Modify reset-controller driver
Date: Thu, 06 Jun 2019 13:33:31 -0700
Message-ID: <20190606203331.ED6AD2083E@mail.kernel.org>
References: <1556607888-10301-1-git-send-email-yong.liang@mediatek.com>
 <1556607888-10301-2-git-send-email-yong.liang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1556607888-10301-2-git-send-email-yong.liang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: chunhui.dai@mediatek.com, drinkcat@chromium.org, eddie.huang@mediatek.com, erin.lo@mediatek.com, jamesjj.liao@mediatek.com, jasu@njomotys.info, mark.rutland@arm.com, matthias.bgg@gmail.com, mturquette@baylibre.com, owen.chen@mediatek.com, p.zabel@pengutronix.de, robh+dt@kernel.org, weiyi.lu@mediatek.com
Cc: "yong.liang" <yong.liang@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Forgot to mention, please Cc linux-clk@vger.kernel.org on clk drivers.

Quoting Yong Liang (2019-04-30 00:04:48)
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Set reset signal by a register and clear reset signal by another register for 8183.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
