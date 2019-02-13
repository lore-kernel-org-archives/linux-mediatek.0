From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 3/3] clk: mediatek: Mark bus and DRAM related clocks as critical
Date: Wed, 13 Feb 2019 09:09:39 -0800
Message-ID: <155007777974.115909.3599235649247866271@swboyd.mtv.corp.google.com>
References: <20190108121208.2473-1-matthias.bgg@kernel.org> <20190108121208.2473-4-matthias.bgg@kernel.org> <9db1f94f-7edd-73a1-fb09-9499c5f8cfcb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <9db1f94f-7edd-73a1-fb09-9499c5f8cfcb@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, kevin-cw.chen@mediatek.com, mars.cheng@mediatek.com, matthias.bgg@kernel.org, mturquette@baylibre.com
Cc: sean.wang@mediatek.com, jasu@njomotys.info, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Quoting Matthias Brugger (2019-02-08 05:39:02)
> Steven, Mike, any comments on that?

I was waiting for Mediatek to review. I thought I said that last time?
I suppose if they're not going to review it I'll just throw it into
clk-next and people can fix problems if they see them.

Would you mind resending one more time with a comment in the code where
CLK_IS_CRITICAL is used indicating why it's critical so that we know
what's going on without having to dig into the git history?
