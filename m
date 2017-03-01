From: Laura Abbott <labbott-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: dump: hide kernel pointers
Date: Wed, 1 Mar 2017 07:18:33 -0800
Message-ID: <f27a46b7-e26f-5b22-be24-9e275ca19036@redhat.com>
References: <1488265536-20441-1-git-send-email-miles.chen@mediatek.com>
 <CAKv+Gu_AG0n5jPDCuUD6tvr2sAz9a4sycDy9CtL4iT+OHiN_iQ@mail.gmail.com>
 <20170228100420.GA3691@leverpostej>
 <ae6f608f-6c84-b999-d238-a74f6f42d2e5@redhat.com>
 <20170301035214.GA12637@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20170301035214.GA12637-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, wsd_upstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On 02/28/2017 07:52 PM, Will Deacon wrote:
> On Tue, Feb 28, 2017 at 02:55:51PM -0800, Laura Abbott wrote:
>> On 02/28/2017 02:04 AM, Mark Rutland wrote:
>>> On Tue, Feb 28, 2017 at 08:42:51AM +0000, Ard Biesheuvel wrote:
>>>> On 28 February 2017 at 07:05, Miles Chen <miles.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
>>>>> Mask kernel pointers of /sys/kernel/debug/kernel_page_tables entry like
>>>>> /proc/vmallocinfo does.
>>>>>
>>>>> With sysctl kernel.kptr_restrict=0 or 1:
>>>>> cat /sys/kernel/debug/kernel_page_tables
>>>>
>>>> I wonder if this file should be accessible at all if kptr_restrict > 0
>>>
>>> I don't have strong feelings either way.
>>>
>>> This isn't typically enabled, and it's under debugfs, so this shouldn't
>>> be accessible by a typical user anyhow.
>>>
>>> That said, there are very few of us who need to take a look at this
>>> file. I'm happy to deal with attacking kptr_restrict when required.
>>>
>>
>> In the interest of security it's probably for the best to switch to the
>> restricted pointer. Who knows what might get enabled or forgotten about.
>> I don't like the idea of tying enablement of the file to kptr_restrict
>> though.
> 
> ... but it's also pretty weird to show the sizes, mapping type and
> permissions yet hide the virtual addresses. If you want to keep the file
> in spite of kptr_restrict, which bits are actually useful once the
> addresses are nobbled?
> 
> Will
> 

I'm not saying the file is really useful, I just don't think kptr_restrict
is the right mechanism for this. The current documented purpose is for printk
formatting only and trying to double use that seems likely to confuse 
people if others start following the pattern elsewhere in the kernel.
A separate knob might be cleaner.

Thanks,
Laura
