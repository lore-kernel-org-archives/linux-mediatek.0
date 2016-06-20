From: Jorge Ramirez <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v5 0/2] MTK Smart Device Gen1 NAND Driver
Date: Mon, 20 Jun 2016 10:17:55 -0400
Message-ID: <5767FB13.5070503@linaro.org>
References: <1465919451-1891-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160620135411.2ef381e0@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160620135411.2ef381e0@bbrezillon>
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
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 06/20/2016 07:54 AM, Boris Brezillon wrote:
>> >Tests:
>> >======
>> >
>> >* UBIFS support has been validated on 512MiB device (iozone, dd)
>> >* All drivers/mtd/tests/* pass clean.
>> >* Speed tests:
>> >   eraseblock write speed:	7563 KiB/s
>> >   eraseblock read speed:	10904 KiB/s
>> >   page write speed:		7497 KiB/s
>> >   page read speed:		10864 KiB/s
>> >   2 page write speed:		7527 KiB/s
>> >   2 page read speed:		10881 KiB/s
>> >   erase speed:			103157 KiB/s
>> >   2x multi-block erase speed:	357445 KiB/s
>> >   4x multi-block erase speed:	362944 KiB/s
>> >   8x multi-block erase speed:	363805 KiB/s
>> >   16x multi-block erase speed:	364237 KiB/s
>> >   32x multi-block erase speed:	364670 KiB/s
>> >   64x multi-block erase speed:	365104 KiB/s
> Applied after fixing a few coding style issues.
>

Awesome.
Thanks for all the reviews and these additional fixes!

jorge
