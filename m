From: Oliver Neukum <oneukum-IBi9RG/b67k@public.gmane.org>
Subject: Re: [PATCH] xhci: create one unified function to calculate TRB TD
 remainder.
Date: Tue, 08 Sep 2015 13:46:38 +0200
Message-ID: <1441712798.26994.41.camel@suse.com>
References: <55EEBC33.5030906@intel.com>
	 <1441710591-4267-1-git-send-email-mathias.nyman@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441710591-4267-1-git-send-email-mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathias Nyman <mathias.nyman-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Tue, 2015-09-08 at 14:09 +0300, Mathias Nyman wrote:
> Now Mediatek host has an additional quirk on how it uses the TD Size
> field for remaining data. To prevent yet another function for
> calculating
> remainder we instead want to make one quirk friendly unified function.

Could you clarify whether this replaces an existing quirk
or renders unnecessary the introduction of a new quirk,
because that decides whether this patch must go into stable.

	Regards
		Oliver


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
