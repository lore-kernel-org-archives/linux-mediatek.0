From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 1/4] mtd: rawnand: mtk: Correct low level time calculation of r/w cycle
Date: Mon,  3 Jun 2019 10:04:51 +0200
Message-ID: <20190603080451.28923-1-miquel.raynal@bootlin.com>
References: <20190507102541.34341-2-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190507102541.34341-2-xiaolei.li@mediatek.com>
Sender: stable-owner@vger.kernel.org
To: Xiaolei Li <xiaolei.li@mediatek.com>, miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-mediatek@lists.infradead.org, linux-mtd@lists.infradead.org, stable@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-05-07 at 10:25:38 UTC, Xiaolei Li wrote:
> At present, the flow of calculating AC timing of read/write cycle in SDR
> mode is that:
> At first, calculate high hold time which is valid for both read and write
> cycle using the max value between tREH_min and tWH_min.
> Secondly, calculate WE# pulse width using tWP_min.
> Thridly, calculate RE# pulse width using the bigger one between tREA_max
> and tRP_min.
> 
> But NAND SPEC shows that Controller should also meet write/read cycle time.
> That is write cycle time should be more than tWC_min and read cycle should
> be more than tRC_min. Obviously, we do not achieve that now.
> 
> This patch corrects the low level time calculation to meet minimum
> read/write cycle time required. After getting the high hold time, WE# low
> level time will be promised to meet tWP_min and tWC_min requirement,
> and RE# low level time will be promised to meet tREA_max, tRP_min and
> tRC_min requirement.
> 
> Fixes: edfee3619c49 ("mtd: nand: mtk: add ->setup_data_interface() hook")
> Cc: stable@vger.kernel.org # v4.17+
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
