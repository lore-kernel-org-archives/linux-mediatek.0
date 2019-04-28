From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH 0/6] fix some bugs and add some features in stmmac
Date: Sun, 28 Apr 2019 08:48:58 -0400 (EDT)
Message-ID: <20190428.084858.1947886833982935707.davem@davemloft.net>
References: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1556433009-25759-1-git-send-email-biao.huang@mediatek.com>
Sender: netdev-owner@vger.kernel.org
To: biao.huang@mediatek.com
Cc: joabreu@synopsys.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, yt.shen@mediatek.com, jianguo.zhang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

From: Biao Huang <biao.huang@mediatek.com>
Date: Sun, 28 Apr 2019 14:30:03 +0800

> This series fix some bugs and add some features in stmmac driver.               

Please do not mix feature additions and bug fixes.

Bug fixes should target my 'net' tree.

New features should target my 'net-next' tree.
