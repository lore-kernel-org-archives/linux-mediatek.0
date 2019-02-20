From: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [bug report] mt76: usb: fix possible memory leak in mt76u_buf_free
Date: Wed, 20 Feb 2019 23:57:13 +0300
Message-ID: <20190220205713.GA26590@kadam>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

Hello Lorenzo Bianconi,

The patch cb83585e1121: "mt76: usb: fix possible memory leak in
mt76u_buf_free" from Feb 10, 2019, leads to the following static
checker warning:

	drivers/net/wireless/mediatek/mt76/usb.c:372 mt76u_buf_free()
	warn: address of 'urb->sg[i]' is non-NULL

drivers/net/wireless/mediatek/mt76/usb.c
    362 }
    363 
    364 void mt76u_buf_free(struct mt76u_buf *buf)
    365 {
    366 	struct urb *urb = buf->urb;
    367 	struct scatterlist *sg;
    368 	int i;
    369 
    370 	for (i = 0; i < urb->num_sgs; i++) {
    371 		sg = &urb->sg[i];
--> 372 		if (!sg)
                            ^^^
This address isn't NULL.  Was something else intended?

    373 			continue;
    374 
    375 		skb_free_frag(sg_virt(sg));
    376 	}
    377 	if (buf->buf)
    378 		skb_free_frag(buf->buf);
    379 
    380 	usb_free_urb(buf->urb);
    381 }

regards,
dan carpenter
