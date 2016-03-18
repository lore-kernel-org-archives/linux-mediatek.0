From: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] mtd: mediatek: driver for MTK Smart Device Gen1 NAND
Date: Fri, 18 Mar 2016 10:00:21 -0400
Message-ID: <56EC09F5.5020704@linaro.org>
References: <1456938013-8819-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1456938013-8819-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160308172437.6eccce05@bbrezillon> <56E08112.7040201@linaro.org>
 <20160309214348.5aa78af5@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20160309214348.5aa78af5@bbrezillon>
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
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 03/09/2016 03:43 PM, Boris Brezillon wrote:
> On Wed, 9 Mar 2016 15:01:22 -0500
> Jorge Ramirez-Ortiz <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> wrote:
>
>> On 03/08/2016 11:24 AM, Boris Brezillon wrote:
>>>> +	switch (mtd->writesize) {
>>>>> +	case KB(2):
>>>>> +		fmt = PAGEFMT_512_2K;
>>>>> +		chip->ecc.layout = &nand_2k_64;
>>>>> +		break;
>>>>> +	case KB(4):
>>>>> +		fmt = PAGEFMT_2K_4K;
>>>>> +		chip->ecc.layout = &nand_4k_128;
>>>>> +		break;
>>>>> +	case KB(8):
>>>>> +		fmt = PAGEFMT_4K_8K;
>>>>> +		break;
>>>>> +	default:
>>>>> +		dev_err(dev, "invalid page size: %d\n", mtd->writesize);
>>>>> +		return -EINVAL;
>>>>> +	}
>>> ecclayout info should be exposed through mtd_ooblayout_ops now.
>>>
>> do you have an approximate date for when this interface will be merged in
>> git://git.infradead.org/l2-mtd.git?
>>
> Should be ready for 4.7, in the meantime you can base your work on my
> branch [1] (which is based on l2-mtd/master).
>
> [1]https://github.com/bbrezillon/linux-0day/tree/nand/ecclayout


hi Boris, just a quick one, please could you confirm that you would like to see
the RFC v2 patch-set for this driver based on this branch? or should we rebase
on some other tree?
