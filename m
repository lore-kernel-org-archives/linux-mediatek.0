From: xiaolei li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] mtd: rawnand: mtk: Replace max_sector_size with
 sector size array
Date: Mon, 23 Apr 2018 09:49:58 +0800
Message-ID: <1524448198.14673.45.camel@mhfsdcap03>
References: <1523864464-41059-1-git-send-email-xiaolei.li@mediatek.com>
 <1523864464-41059-4-git-send-email-xiaolei.li@mediatek.com>
 <20180420221843.45f9d006@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180420221843.45f9d006@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Cc: richard-/L3Ra7n9ekc@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2018-04-20 at 22:18 +0200, Boris Brezillon wrote:
> On Mon, 16 Apr 2018 15:41:03 +0800
> Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> 
> > Remove max_sector_size from struct mtk_nfc_caps, and use sector size
> > array and number of sector size to show sector sizes that controller
> > supports.
> > 
> > Signed-off-by: Xiaolei Li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> I don't see the point of this patch. I was seeing a clear benefit when
> you were moving to the generic ECC selection code, but since you've
> dropped this part from the patch series, this patch becomes useless.
> 
> Am I missing something?

Very sorry. Forget to remove this patch.
Please ignore this patch. Thanks!

> 
> > ---
> >  drivers/mtd/nand/raw/mtk_nand.c | 32 +++++++++++++++++++++++++++-----
> >  1 file changed, 27 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/mtk_nand.c b/drivers/mtd/nand/raw/mtk_nand.c
> > index 6977da3..03a4df2 100644
> > --- a/drivers/mtd/nand/raw/mtk_nand.c
> > +++ b/drivers/mtd/nand/raw/mtk_nand.c
> > @@ -106,10 +106,11 @@
> >  struct mtk_nfc_caps {
> >  	const u8 *spare_size;
> >  	u8 num_spare_size;
> > +	const int *sector_size;
> > +	int num_sector_size;
> >  	u8 pageformat_spare_shift;
> >  	u8 nfi_clk_div;
> >  	u8 max_sector;
> > -	u32 max_sector_size;
> >  };
> >  
> >  struct mtk_nfc_bad_mark_ctl {
> > @@ -178,6 +179,14 @@ struct mtk_nfc {
> >  	16, 26, 27, 28
> >  };
> >  
> > +static const int sector_size_max_1k[] = {
> > +	1024, 512
> > +};
> > +
> > +static const int sector_size_max_512[] = {
> > +	512
> > +};
> > +
> >  static inline struct mtk_nfc_nand_chip *to_mtk_nand(struct nand_chip *nand)
> >  {
> >  	return container_of(nand, struct mtk_nfc_nand_chip, nand);
> > @@ -258,6 +267,16 @@ static inline u8 nfi_readb(struct mtk_nfc *nfc, u32 reg)
> >  	return readb_relaxed(nfc->regs + reg);
> >  }
> >  
> > +static int mtk_nfc_max_sector_size(struct mtk_nfc *nfc)
> > +{
> > +	int i, sector_size = 0;
> > +
> > +	for (i = 0; i < nfc->caps->num_sector_size; i++)
> > +		sector_size = max(sector_size, nfc->caps->sector_size[i]);
> > +
> > +	return sector_size;
> > +}
> > +
> >  static void mtk_nfc_hw_reset(struct mtk_nfc *nfc)
> >  {
> >  	struct device *dev = nfc->dev;
> > @@ -1207,7 +1226,7 @@ static int mtk_nfc_ecc_init(struct device *dev, struct mtd_info *mtd)
> >  		 */
> >  		if (nand->ecc.size < 1024) {
> >  			if (mtd->writesize > 512 &&
> > -			    nfc->caps->max_sector_size > 512) {
> > +			    mtk_nfc_max_sector_size(nfc) > 512) {
> >  				nand->ecc.size = 1024;
> >  				nand->ecc.strength <<= 1;
> >  			} else {
> > @@ -1389,28 +1408,31 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
> >  static const struct mtk_nfc_caps mtk_nfc_caps_mt2701 = {
> >  	.spare_size = spare_size_mt2701,
> >  	.num_spare_size = 16,
> > +	.sector_size = sector_size_max_1k,
> > +	.num_sector_size = 2,
> >  	.pageformat_spare_shift = 4,
> >  	.nfi_clk_div = 1,
> >  	.max_sector = 16,
> > -	.max_sector_size = 1024,
> >  };
> >  
> >  static const struct mtk_nfc_caps mtk_nfc_caps_mt2712 = {
> >  	.spare_size = spare_size_mt2712,
> >  	.num_spare_size = 19,
> > +	.sector_size = sector_size_max_1k,
> > +	.num_sector_size = 2,
> >  	.pageformat_spare_shift = 16,
> >  	.nfi_clk_div = 2,
> >  	.max_sector = 16,
> > -	.max_sector_size = 1024,
> >  };
> >  
> >  static const struct mtk_nfc_caps mtk_nfc_caps_mt7622 = {
> >  	.spare_size = spare_size_mt7622,
> >  	.num_spare_size = 4,
> > +	.sector_size = sector_size_max_512,
> > +	.num_sector_size = 1,
> >  	.pageformat_spare_shift = 4,
> >  	.nfi_clk_div = 1,
> >  	.max_sector = 8,
> > -	.max_sector_size = 512,
> >  };
> >  
> >  static const struct of_device_id mtk_nfc_id_table[] = {
> 
