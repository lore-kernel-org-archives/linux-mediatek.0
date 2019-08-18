From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next 3/4 v3] net: ethernet: mediatek: Rename
 NEXT_RX_DESP_IDX to NEXT_DESP_IDX
Date: Sun, 18 Aug 2019 14:16:16 -0700 (PDT)
Message-ID: <20190818.141616.811595483422495537.davem@davemloft.net>
References: <20190816132325.28426-1-sr@denx.de>
        <20190816132325.28426-3-sr@denx.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <20190816132325.28426-3-sr@denx.de>
Sender: netdev-owner@vger.kernel.org
To: sr@denx.de
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, opensource@vdorst.com, daniel@makrotopia.org, sean.wang@mediatek.com, john@phrozen.org
List-Id: linux-mediatek@lists.infradead.org

From: Stefan Roese <sr@denx.de>
Date: Fri, 16 Aug 2019 15:23:24 +0200

> Rename the NEXT_RX_DESP_IDX macro to NEXT_DESP_IDX, so that it better
> can be used for TX ops as well. This will be used in the upcoming
> MT7628/88 support (same functionality for RX and TX in this macro).
> 
> Signed-off-by: Stefan Roese <sr@denx.de>

Applied.
