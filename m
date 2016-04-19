From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Date: Tue, 19 Apr 2016 17:16:28 -0400
Message-ID: <5716A02C.6090900@linaro.org>
References: <1460393772-26910-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1460393772-26910-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160419222446.052cfa63@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160419222446.052cfa63@bbrezillon>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 04/19/2016 04:24 PM, Boris Brezillon wrote:
> On Mon, 11 Apr 2016 12:56:12 -0400
> Jorge Ramirez-Ortiz<jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>  wrote:
>
>
>> >+static int mtk_nfc_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
>> >+				int page)
>> >+{
>> >+	u8 *buf = chip->buffers->databuf;
> You're touching ->databuf here, and the core uses this buffer for its
> internal cache. If want to use this buffer you have to invalidate the
> cache by setting chip->pagebuf to -1 first.
>

ack. we will use our private buffer instead as discussed on IRC.

  static int mtk_nfc_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
                                 int page)
  {
-   u8 *data = chip->buffers->databuf;
+ struct mtk_nfc *nfc = nand_get_controller_data(chip);
         int ret;

-   memset(data, 0xff, mtd->writesize);
+ memset(nfc->buffer, 0xff, mtd->writesize);

         chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);

-   ret = mtk_nfc_write_page_hwecc(mtd, chip, data, 1, page);
+ ret = mtk_nfc_write_page_hwecc(mtd, chip, nfc->buffer, 1, page);
         if (ret < 0)
                 return -EIO;
