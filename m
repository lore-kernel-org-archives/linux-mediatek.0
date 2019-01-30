From: David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
Subject: Re: [PATCHv4 0/3]: net: dsa: mt7530: support MT7530 in the MT7621 SoC
Date: Wed, 30 Jan 2019 14:30:36 -0800 (PST)
Message-ID: <20190130.143036.859342199296326970.davem@davemloft.net>
References: <20190130012406.28271-1-gerg@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190130012406.28271-1-gerg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: gerg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: andrew-g2DYL2Zd6BY@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, vivien.didelot-4ysUXcep3aM1wj+D4I0NRVaTQe2KTcn/@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rene-91nzXlUTePbQT0dZR+AlfA@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org, neil-+NVA1uvv1dVBDLzU/O5InQ@public.gmane.org, bjorn-yOkvZcmFvRU@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

From: gerg-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Date: Wed, 30 Jan 2019 11:24:03 +1000

> This is the fourth version of a patch series supporting the MT7530 switch
> as used in the MediaTek MT7621 SoC. Unlike the MediaTek MT7623 the MT7621
> is built around a dual core MIPS CPU architecture. But inside it uses
> basically the same 7530 switch.
 ...

Series applied, and yes a COMPILE_TEST Kconfig dep would be great.
