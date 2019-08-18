From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 2/4 v3] net: ethernet: mediatek: Rename
 MTK_QMTK_INT_STATUS to MTK_QDMA_INT_STATUS
Date: Sun, 18 Aug 2019 14:16:11 -0700 (PDT)
Message-ID: <20190818.141611.1445041129399564089.davem@davemloft.net>
References: <20190816132325.28426-1-sr@denx.de>
        <20190816132325.28426-2-sr@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190816132325.28426-2-sr@denx.de>
Sender: netdev-owner@vger.kernel.org
To: sr@denx.de
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, opensource@vdorst.com, daniel@makrotopia.org, sean.wang@mediatek.com, john@phrozen.org
List-Id: linux-mediatek@lists.infradead.org

From: Stefan Roese <sr@denx.de>
Date: Fri, 16 Aug 2019 15:23:23 +0200

> Currently all QDMA registers are named "MTK_QDMA_foo" in this driver
> with one exception: MTK_QMTK_INT_STATUS. This patch renames
> MTK_QMTK_INT_STATUS to MTK_QDMA_INT_STATUS so that all macros follow
> this rule.
> 
> Signed-off-by: Stefan Roese <sr@denx.de>

Applied.
