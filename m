From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [bug report] mt76: add mac80211 driver for MT7615 PCIe-based
 chipsets
Date: Sat, 4 May 2019 08:01:02 +0800
Message-ID: <1556928062.5650.5.camel@mtkswgap22>
References: <20190503130642.GH29695@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190503130642.GH29695@mwanda>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2019-05-03 at 16:06 +0300, Dan Carpenter wrote:
> Hello Ryder Lee,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 04b8e65922f6: "mt76: add mac80211 driver for MT7615 
> PCIe-based chipsets" from Apr 1, 2019, leads to the following Smatch 
> complaint:
> 
>     drivers/net/wireless/mediatek/mt76/mt7615/mcu.c:1012 mt7615_mcu_set_wtbl_key()
>     error: we previously assumed 'key' could be null (see line 1008)
> 
> drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
>   1007			cipher = mt7615_get_key_info(key, wtbl_sec_key.key_material);
>   1008			if (cipher == MT_CIPHER_NONE && key)
>                                                         ^^^
> This check doesn't make much sense.  Do you want to just remove it?

Just in case that 'key != NULL' but 'cipher == MT_CIPHER_NONE'. It
should not happen.

>   1009				return -EOPNOTSUPP;
>   1010	
>   1011			wtbl_sec_key.cipher_id = cipher;
>   1012			wtbl_sec_key.key_id = key->keyidx;
>                                               ^^^^^^^^^^^
>   1013			wtbl_sec_key.key_len = key->keylen;
>   1014		} else {
> 
> regards,
> dan carpenter
