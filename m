From: "Frank Wunderlich" <frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org>
Subject: Aw: Re: [PATCH V10 0/5] make mt7623 clock of hdmi stable
Date: Sun, 14 Apr 2019 19:08:40 +0200
Message-ID: <trinity-28840ab1-2bca-46d1-a6d4-374ba31aa2e2-1555261720443@3c-app-gmx-bs62>
References: <20190409065307.82280-1-wangyan.wang@mediatek.com>
 <1554803700.4573.2.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1554803700.4573.2.camel@mtksdaap41>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: CK Hu <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, wangyan wang <wangyan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, chunhui dai <chunhui.dai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi,

have you got hdmi on mt7623 and kernel 5.1 working?

i have applied this patchset, the clockpatch and some additional Patches like dts for bananapi r2 here, but i can't get hdmi (xserver) running

https://github.com/frank-w/BPI-R2-4.14/commits/5.1-hdmi-v10

found no errors in dmesg, also no error when starting xserver, but it still shows nothing

5.0 works with xserver:

https://github.com/frank-w/BPI-R2-4.14/commits/5.0-hdmi

anyone can guide me get it working?

regards Frank


> Gesendet: Dienstag, 09. April 2019 um 11:55 Uhr
> Von: "CK Hu" <ck.hu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> An: "wangyan wang" <wangyan.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> Cc: "Ryder Lee" <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "Philipp Zabel" <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, "chunhui dai" <chunhui.dai-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "Stephen Boyd" <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Michael Turquette" <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, "Sean Wang" <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "David Airlie" <airlied-cv59FeDIM0c@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Daniel Vetter" <daniel-/w4YWyX8dFk@public.gmane.org>, "Matthias Brugger" <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "Colin Ian King" <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Betreff: Re: [PATCH V10 0/5] make mt7623 clock of hdmi stable
>
> Hi, Wangyan:
>
> This version still has alignment problem, but I've fixed it and for this
> series,
>
> Applied to mediatek-drm-fixes-5.1 [1], thanks.
>
> [1]
> https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.1
>
> Regards,
> CK
