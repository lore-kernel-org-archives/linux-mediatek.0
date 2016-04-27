From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: MTK Smart Device Gen1 NAND Driver - Testing on MT7623
Date: Wed, 27 Apr 2016 13:47:02 +0200
Message-ID: <d88a8d82-deb2-ff4a-92b2-6415218da92f@openwrt.org>
References: <e397161c-2fe8-7e9d-c34f-adf5e91a99d7@openwrt.org>
 <20160427100627.63b148c3@bbrezillon>
 <869e6090-04fd-0f99-f248-af68e948362e@openwrt.org>
 <5720A5F5.8060602@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <5720A5F5.8060602-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Jorge Ramirez <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, xiaolei li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org



On 27/04/2016 13:43, Jorge Ramirez wrote:
> 
> 
> On 04/27/2016 04:41 AM, John Crispin wrote:
>> thanks for the info. i tried that aswell as some other settings but none
>> makes the flash work. lets see if Jorge has some ideas. otherwise i will
>> wait for V4.
> 
> we are about to post v4 (need another day or two); we have major
> differences as to how the bad blocks are being marked and some other
> optimizations. if you don't mind upgrading to that version then we can
> help you debug on your side.

great, i'll test V4 right away when you post it

> btw, does any of the mtd tests pass? oobtest, pagetest..?

not used those tools yet. i'll give them a shot once you posted V4

> I am also adding Xiaolei to the thread (we have been working together on
> this driver)

thanks !
