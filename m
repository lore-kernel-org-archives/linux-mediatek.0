From: Miquel Raynal <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] mtd: rawnand: mtk: Improve data sampling timing
 for read cycle
Date: Mon,  3 Jun 2019 10:04:46 +0200
Message-ID: <20190603080446.28858-1-miquel.raynal@bootlin.com>
References: <20190507102541.34341-3-xiaolei.li@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190507102541.34341-3-xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2019-05-07 at 10:25:39 UTC, Xiaolei Li wrote:
> Currently, we expand RE# low level time by choosing the max value
> between RE# pulse width and RE# access time, and sample data at the
> rising edge of RE#.
> 
> Then, if RE# access time is bigger than RE# pulse width, the real
> read cycle time may be more than NAND SPEC required. This makes
> read performance be worse than that expected.
> 
> This patch improves data sampling timing by calculating RE# low level
> time according to RE# pulse width. If RE# access time is bigger than
> RE# pulse width, then delay sampling data timing.
> 
> The result of contrast test base on MT2712 evaluat board is as follow.
> 
> nand: Micron MT29F16G08ADBCAH4
> nand: 2048 MiB, SLC, erase size: 256 KiB, page size: 4096, OOB size: 224
> NFI 2x clock rate: 124800000 HZ.
> 
> Read speed without this patch:
> mtd_speedtest: page read speed is 14012 KiB/s
> mtd_speedtest: 2 page read speed is 14860 KiB/s
> 
> Read speed with this patch:
> mtd_speedtest: page read speed is 18724 KiB/s
> mtd_speedtest: 2 page read speed is 18713 KiB/s
> 
> Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Miquel Raynal <miquel.raynal-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
