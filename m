From: Kuba Kicinski <kubakici-5tc4TXWwyLM@public.gmane.org>
Subject: Re: [PATCH] mt7601u: do not free dma_buf when ivp allocation fails
Date: Thu, 25 Feb 2016 17:56:26 -0500
Message-ID: <63E1009A-F983-4D81-82AE-B4C6E4D060B5@wp.pl>
References: <1456439339-18458-1-git-send-email-colin.king@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1456439339-18458-1-git-send-email-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On 25 February 2016 17:28:59 GMT-05:00, Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>From: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>
>If the allocation of ivp fails the error handling attempts to
>free an uninitialized dma_buf; this data structure just contains
>garbage on the stack, so the freeing will cause issues when the
>urb, buf and dma fields are cleaned. Fix this by handling the
>ivp check and

Commit message looks truncated?

>Signed-off-by: Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>---
> drivers/net/wireless/mediatek/mt7601u/mcu.c | 11 ++++++-----
> 1 file changed, 6 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/net/wireless/mediatek/mt7601u/mcu.c
>b/drivers/net/wireless/mediatek/mt7601u/mcu.c
>index fbb1986..06ac657 100644
>--- a/drivers/net/wireless/mediatek/mt7601u/mcu.c
>+++ b/drivers/net/wireless/mediatek/mt7601u/mcu.c
>@@ -359,13 +359,13 @@ mt7601u_upload_firmware(struct mt7601u_dev *dev,
>const struct mt76_fw *fw)
> 	struct mt7601u_dma_buf dma_buf;
> 	void *ivb;
> 	u32 ilm_len, dlm_len;
>-	int i, ret;
>+	int i, ret = -ENOMEM;

No need...

> 
> 	ivb = kmemdup(fw->ivb, sizeof(fw->ivb), GFP_KERNEL);
>-	if (!ivb || mt7601u_usb_alloc_buf(dev, MCU_FW_URB_SIZE, &dma_buf)) {
>-		ret = -ENOMEM;
>+	if (!ivb)
>+		goto error_ivb;

...just return -ENOMEM here, because...

>+error_ivb:
>+	kfree(ivb);

...calling kfree on a null pointer is redundant.

Thanks!!
[trimming To/CC a bit]
