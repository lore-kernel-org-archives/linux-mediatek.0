From: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] xhci: create one unified function to calculate TRB TD
 remainder.
Date: Tue, 08 Sep 2015 15:21:43 +0300
Message-ID: <55EED2D7.6090308@linux.intel.com>
References: <55EEBC33.5030906@intel.com>	 <1441710591-4267-1-git-send-email-mathias.nyman@linux.intel.com> <1441712798.26994.41.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441712798.26994.41.camel-IBi9RG/b67k@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Oliver Neukum <oneukum-IBi9RG/b67k@public.gmane.org>
Cc: chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 08.09.2015 14:46, Oliver Neukum wrote:
> On Tue, 2015-09-08 at 14:09 +0300, Mathias Nyman wrote:
>> Now Mediatek host has an additional quirk on how it uses the TD Size
>> field for remaining data. To prevent yet another function for
>> calculating
>> remainder we instead want to make one quirk friendly unified function.
>
> Could you clarify whether this replaces an existing quirk
> or renders unnecessary the introduction of a new quirk,
> because that decides whether this patch must go into stable.
>

Neither :)

This patch will simplify the quirk Mediatek wants to include in their patchseries.

After this patch the TD size part of the mediatek quirk can be reduced to maybe
a couple lines in total.
Yet another version of the Mediatek patcheries will be needed after this, but it will
be 50 - 100 lines shorter.

This patch is basically just code refactoring, enabling easier quirking.

It seems I need to do some rewording of the commit message of this patch as well

-Mathias
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
