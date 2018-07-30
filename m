From: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] linux-firmware: add firmware for mt76x2u
Date: Mon, 30 Jul 2018 14:19:42 +0200
Message-ID: <20180730121941.GA1416@localhost.localdomain>
References: <20180728103857.1458-1-lorenzo.bianconi@redhat.com>
 <20180730121618.GA1993@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180730121618.GA1993-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nbd-Vt+b4OUoWG0@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Jul 30, Stanislaw Gruszka wrote:
> On Sat, Jul 28, 2018 at 12:38:57PM +0200, Lorenzo Bianconi wrote:
> > Add binary firmware for MT76x2u based devices
> > 
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> > Changes since v1:
> > - move bin files in mediatek folder
> > - use LICENCE.mediatek as licence file
> > ---
> >  WHENCE                         |  12 ++++++++++++
> >  mediatek/mt7662u.bin           | Bin 0 -> 91412 bytes
> >  mediatek/mt7662u_rom_patch.bin | Bin 0 -> 20686 bytes
> 
> Seems this location will also require change in the driver
> to look into mediatek subdirectory for the firmware.
> 
> Stanislaw

Correct, I planned to change driver fw definitions in v2

Regards,
Lorenzo
