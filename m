From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v3 4/4] mtd: rawnand: mtk: Fix wrongly assigned OOB buffer
 pointer issue
Date: Mon,  3 Jun 2019 10:04:29 +0200
Message-ID: <20190603080429.28728-1-miquel.raynal@bootlin.com>
References: <20190507102541.34341-5-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190507102541.34341-5-xiaolei.li@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Xiaolei Li <xiaolei.li@mediatek.com>, miquel.raynal@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-05-07 at 10:25:41 UTC, Xiaolei Li wrote:
> One main goal of the function mtk_nfc_update_ecc_stats is to check
> whether sectors are all empty. If they are empty, set these sectors's
> data buffer and OOB buffer as 0xff.
> 
> But now, the sector OOB buffer pointer is wrongly assigned. We always
> do memset from sector 0.
> 
> To fix this issue, pass start sector number to make OOB buffer pointer
> be properly assigned.
> 
> Fixes: 1d6b1e464950 ("mtd: mediatek: driver for MTK Smart Device")
> Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
