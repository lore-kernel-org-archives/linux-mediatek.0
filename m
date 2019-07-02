From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCH] net: ethernet: mediatek: Allow non TRGMII mode with
 MT7621 DDR2 devices
Date: Tue, 02 Jul 2019 14:06:03 -0700 (PDT)
Message-ID: <20190702.140603.579018215880523684.davem@davemloft.net>
References: <20190629122451.19578-1-opensource@vdorst.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190629122451.19578-1-opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, frank-w-SipyoOjXbOMoAHOVJHB0wA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-mips-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vivien.didelot-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: Ren=E9 van Dorst <opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org>
Date: Sat, 29 Jun 2019 14:24:51 +0200

> No reason to error out on a MT7621 device with DDR2 memory when non
> TRGMII mode is selected.
> Only MT7621 DDR2 clock setup is not supported for TRGMII mode.
> But non TRGMII mode doesn't need any special clock setup.
> =

> Signed-off-by: Ren=E9 van Dorst <opensource-91nzXlUTePbQT0dZR+AlfA@public.gmane.org>

Applied to net-next, thanks.
