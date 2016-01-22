From: John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
Subject: Re: [PATCH V2 1/4] soc: mediatek: PMIC wrap: DEW base addr may vary
Date: Fri, 22 Jan 2016 10:03:31 +0100
Message-ID: <56A1F063.1080706@openwrt.org>
References: <1452441884-25882-1-git-send-email-blogic@openwrt.org>
 <1452572924.31465.13.camel@mtksdaap41> <56A0C4B4.8090807@gmail.com>
 <56A0D7AA.3010301@openwrt.org> <56A10718.1010801@gmail.com>
 <56A10C7A.5080809@openwrt.org> <1453439072.8457.21.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1453439072.8457.21.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Henry Chen <henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Henry

>>>> not sure if that is a good idea. the code path and dew register usage
>>>> depends on the slave type. putting the dew registers into the DT will
>>>> only have the effect that we will have 1 array less in the driver but in
>>>> turn will have code to load that exact array back. also it wont be a
>>>> simple array that we store in the DT. but we need to match register
>>>> names to register offsets.
>>>>
>>>> although i agree that putting static data into the DT tends to be a good
>>>> thing i believe in this case it is not really sane.
>>>>
>>>
>>> Actually I wasn't thinking of this. My idea (poor mans solution) would
>>> be to identify the pmic dts node and use the values dependent on this,
>>> rather then on the SoC version.
>>
>> i have that bit already in my series based on code i got from mtk.
>>
>> however even cooler might be to just read the CID register and make an
>> educated decision based on that.
>>
> CID of mt6397/mt6391/mt6323 was 0x0100 => bit[7:0]
> 

Yep, i have a patch here that i will test today that utilizes the CID
register.

>> i'll try to cleanup the patches tomorrow and then post them.
>>
>>>
>>> The premium class solution would be to have the registers definded in
>>> the pmic driver and get them accessed through the pmic-wrapper driver.
>>
>> indeed that would be an option.
> There was a problem, pmic-wrapper driver was needed to probe before pmic
> driver, if DEW address was definded in the pmic driver or stored in pmic
> device tree, how could pmic-wrap driver to get them because pmic driver
> was not initialize yet?
> 

That is exactly what i was wondering about. i can only think of
solutions that would

i have respun the series and will resend it today once i tested it on a
device.

	John
