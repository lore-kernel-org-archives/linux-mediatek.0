From: Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
Subject: Re: [PATCH 38/42] mt76: initial separation of mmio part
Date: Thu, 6 Sep 2018 11:41:11 +0200
Message-ID: <df9189e2-d5b7-8744-9c55-dbff12808983@nbd.name>
References: <1536225538-16454-1-git-send-email-sgruszka@redhat.com>
 <1536225538-16454-39-git-send-email-sgruszka@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1536225538-16454-39-git-send-email-sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 2018-09-06 11:18, Stanislaw Gruszka wrote:
> Create mt76_mmio module to contain generic mt76 PCEe/SOC code.
> 
> Signed-off-by: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>I would strongly prefer to not do this. In my opinion, the mmio specific
code is not big enough to justify the extra overhead of having another
kernel module.

- Felix
