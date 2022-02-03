Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6721FC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 03:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lC09hloyoVGXQUHVsA62r2Tk+i2adjoQ0BSJq95Iek=; b=h1ul4GzFLADI9a
	nqKBte/ahRLHmLcYUwScWkTSk9xpN95EV3pMJBbyLp0R7YjRSuALVVICLEPKg+54xKnEnGy+LN96y
	SIbI5a353T63YrJB/3QYJ11mg2UdX849TjTOTvPT0w+4uwBbevDkTWREPiqmaoEEHclSk0boWWpqS
	Xpl+kZyTgeismWfnd/C2dGQVVslbfhQH+Mmaxt6uaK66C+8X1hVY3xx3Auk8DvHK6LzGv83He0E95
	glB4R7TMqjlDFGiDrRSzgbRHaMT8k+wpooK2U7wxUREmreeiJSLYfRnK1Tty2DneZy+vPXnGUjrz5
	q841Ba3SYv58Kd7JCPRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFSb9-00HUWJ-12; Thu, 03 Feb 2022 03:15:51 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFSb7-00HUW8-AB; Thu, 03 Feb 2022 03:15:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=T8bNH9fL4HTNLFcbm/NljfXqh0eT/3CzmsIE177pSnI=; b=n/xSt0MdUbZxJg954Oxg8G0yzz
 My+XNLZEgmIIuimUoq5ush3+t+uSH1sAmtWtVm11n8XcNWCxSfMrkf7cel7FF9enxhFOl0jV/CM+e
 qV08qYdtpro2Ctm4iZfKHiRIfMRIYqON1OYy22//5x+iY7qI5CAzP6cXQbVc2qdkgzr/yfPa8zEtS
 UUlCOaRsTbcYGfARsqVA2JcmAZgLcYnMAcj1eY1Yxf0f1Ua70xpBuFD5VqOQnmHpKx3Jou+ECFGjb
 mCu8yEbZ+FN3cDDGpydHRll2Cdl3UEZ7Fw+cf0O+QT15RyeWuc68fe1gu+0ciD+PyPq6Q1Xkljm1w
 9tOhOXwg==;
Received: from [2601:1c0:6280:3f0::aa0b]
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFSb0-00HRUX-JR; Thu, 03 Feb 2022 03:15:42 +0000
Message-ID: <582f032f-e04c-aade-4d18-514fb7e2d848@infradead.org>
Date: Wed, 2 Feb 2022 19:15:36 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Kconfig CONFIG_FB dependency regression
Content-Language: en-US
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, Kees Cook <keescook@chromium.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi--

On 2/2/22 15:55, Thinh Nguyen wrote:
> Arnd Bergmann wrote:
>> On Wed, Feb 2, 2022 at 1:14 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
>>> Fabio Estevam wrote:
>>>> On Tue, Feb 1, 2022 at 8:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>>
>>>>> On 2/1/22 15:01, Thinh Nguyen wrote:
>>>>>> Hi,
>>>>>>
>>>>>> One of our test setups is unable to boot (stuck at initramfs). Git
>>>>>> bisection points to the commit below:
>>>>>>
>>>>>> f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
>>>>>>
>>>>>> Reverting this patch resolves the issue. This issue persists in mainline
>>>>>> also. Unfortunately there isn't any meaningful log. Hopefully someone
>>>>>> can give some insight as to what could be the issue and revert/fix this
>>>>>> issue.
>>>>>
>>>>> Hi,
>>>>> Did you enable DRM_FBDEV_EMULATION?
>>>
>>> I did not enable it.
>>>
>>>>> Please provide the failing .config file.
>>>>
>>>> Does selecting CONFIG_FB=y help?
>>>>
>>>
>>> On the config that has the issue, this isn't set. After reverting the
>>> commit above, this was set. Maybe this is what's needed? I need to test it.
>>
>> CONFIG_FB should not normally be needed for booting, so unless
>> you have a graphical application in your initramfs that requires the /dev/fb0
>> device to work, it is not supposed to make a difference.
>>
> 
> I'm not sure, but it seems like the setup we have isn't the only one
> that needed it. Fabio also noted that the imx_v6_v7_defconfig also needs
> to have CONFIG_FB set.
> 
>> Are there any other differences in your .config before and after the patch?
>> It's possible that you use some other driver that in turn depends on
>> CONFIG_FB. Does your machine have any graphical output device?
>> If yes, which driver do you use?
> 
> I don't have the answer to those questions yet. Need more investigation.
> I'm new to this particular test setup.
> 
>>
>> You may also want to make sure that you have 9d6366e743f3 ("drm:
>> fb_helper: improve CONFIG_FB dependency") in your kernel, which
>> fixes a minor problem with my original patch.
>>
>>          Arnd
> 
> The issue also occurs in mainline, which has your minor fix commit
> above. The revert isn't clean for the latest kernel version. I also have
> to revert some of the changes along with CONFIG_FB. The revert looks
> more like this for the latest kernel:
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b1f22e457fd0..7cbc733a8569 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -118,8 +118,9 @@ config DRM_DEBUG_MODESET_LOCK
> 
>  config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
> -       depends on DRM_KMS_HELPER
> -       depends on FB=y || FB=DRM_KMS_HELPER
> +       depends on DRM
> +       select DRM_KMS_HELPER
> +       select FB
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT
> 
> 
> 
> I attached the configs for kernel v5.17-rc1. The "bad" config is without
> any revert, the "good" config is with the change above.

I took bad.config with kernel 5.17-rc1 and then manually set/enabled:

CONFIG_FB
CONFIG_FB_EFI
CONFIG_FB_MODE_HELPERS
CONFIG_FB_TILEBLITTING
CONFIG_LOGO

and I got very close to your good.config file.
Can you do the same and see if it works for you?
If so, then we can decide what to do about it.


thanks.
-- 
~Randy

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
