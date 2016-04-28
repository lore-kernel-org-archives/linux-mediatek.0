From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: MTK Smart Device Gen1 NAND Driver - Testing on MT7623
Date: Thu, 28 Apr 2016 14:13:33 +0200
Message-ID: <5f7284a2-ff27-100d-87a3-a9a74448da0e@openwrt.org>
References: <e397161c-2fe8-7e9d-c34f-adf5e91a99d7@openwrt.org>
 <20160427100627.63b148c3@bbrezillon>
 <869e6090-04fd-0f99-f248-af68e948362e@openwrt.org>
 <5720A5F5.8060602@linaro.org> <1461814664.8414.112.camel@mhfsdcap03>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1461814664.8414.112.camel@mhfsdcap03>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: xiaolei li <xiaolei.li-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, =?UTF-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?= <steven.liu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?= <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Jorge Ramirez <jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org



On 28/04/2016 05:37, xiaolei li wrote:
> On Wed, 2016-04-27 at 07:43 -0400, Jorge Ramirez wrote:
>> 
>> On 04/27/2016 04:41 AM, John Crispin wrote:
>> > thanks for the info. i tried that aswell as some other settings but none
>> > makes the flash work. lets see if Jorge has some ideas. otherwise i will
>> > wait for V4.
>> 
>> we are about to post v4 (need another day or two); we have major 
>> differences as to how the bad blocks are being marked and some other 
>> optimizations. if you don't mind upgrading to that version then we can 
>> help you debug on your side.
>> 
>> btw, does any of the mtd tests pass? oobtest, pagetest..?
>> 
>> I am also adding Xiaolei to the thread (we have been working together on 
>> this driver)
>> 
>> 
> Hi John.
> 
> As Jorge said, we will post v4 soon. You can have a try then.
> 
> Also, if you wanna use V3 now. I think you can have a try to set
> spare_per_sector = <32>. In V4, there will be no this setting in DT
> file.
> 
> Thanks
> Xiaolei
> 

Hi

i tried 32 and that just makes the driver spew errors during probe :-)

i'll wait for V4 and test using that version
	
	John

> ************* Email Confidentiality Notice ********************
> The information contained in this e-mail message (including any 
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be 
> conveyed only to the designated recipient(s). Any use, dissemination, 
> distribution, printing, retaining or copying of this e-mail (including its 
> attachments) by unintended recipient(s) is strictly prohibited and may 
> be unlawful. If you are not an intended recipient of this e-mail, or believe 
> that you have received this e-mail in error, please notify the sender 
> immediately (by replying to this e-mail), delete any and all copies of 
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!
> 
