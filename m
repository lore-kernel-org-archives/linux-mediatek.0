From: Davide Caratti <dcaratti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: mt76x0 bug report
Date: Fri, 14 Sep 2018 17:42:50 +0200
Message-ID: <cc038bb1e343b04f837af72f9ce9b815bf4c73ea.camel@redhat.com>
References: <CAM0KTbBJuhuEyuZB_z_BcDSeXa-CJ+NwupssS2jLx0pJ0KXQGQ@mail.gmail.com>
         <CAJ0CqmWAqdB8Og7fabLDeZnzFO5Aw5Qd0cYGaLrs7Ls-zM_yQw@mail.gmail.com>
         <CAM0KTbAbjDYNOzivxMdLmYrV9QHgwkLp7zXpdCvn1Kf1uEcQTQ@mail.gmail.com>
         <20180906093213.GB16539@redhat.com>
         <CAM0KTbBRGqNAu1H0myVoWg6Qu1aMXMneSJ7bXQUKbJGZUFkC_A@mail.gmail.com>
         <CAJ0CqmXHHE2J5O4irPogrypL_H95EDm2y+1_6rpWG1v3ZHxzXA@mail.gmail.com>
         <CAM0KTbAF_ztZzFk_iECyPbiWY69xrcdT_93ypnuTzocjX_fRuQ@mail.gmail.com>
         <20180907082413.GC2725@localhost.localdomain>
         <CAM0KTbAputKNN3seOfN-1zhz5XmT6yg_pbKBnapOsR6Vigv1XQ@mail.gmail.com>
         <CAM0KTbAu-LJ2ThAHbmbrggMw_ttpQ8fXr0+HTjGBZF6PBPiD8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAM0KTbAu-LJ2ThAHbmbrggMw_ttpQ8fXr0+HTjGBZF6PBPiD8Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sid Hayn <sidhayn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-wireless <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Fri, 2018-09-14 at 11:32 -0400, Sid Hayn wrote:
> Secondarily, ethtool still doesn't report firmware version and that
> would be a very helpful thing to have before 4.19 hits.

hello,

I just tested a draft patch for mt76 addressing the missing FW version in
ethtool, will send it to the ML in the next days.

regards,
-- 
davide
