From: Josh Boyer <jwboyer-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] linux-firmware: add firmware for mt76x2u
Date: Mon, 30 Jul 2018 07:21:22 -0400
Message-ID: <CA+5PVA7q1BXBF9Kv4a-zu5wYbPtohAyZ4ZOO7J80RCf42Bi+Ug@mail.gmail.com>
References: <20180728103857.1458-1-lorenzo.bianconi@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20180728103857.1458-1-lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
Cc: Stanislaw Gruszka <sgruszka-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Linux Firmware <linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felix Fietkau <nbd-Vt+b4OUoWG0@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On Sat, Jul 28, 2018 at 6:39 AM Lorenzo Bianconi
<lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> Add binary firmware for MT76x2u based devices
>
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> Changes since v1:
> - move bin files in mediatek folder
> - use LICENCE.mediatek as licence file
> ---
>  WHENCE                         |  12 ++++++++++++
>  mediatek/mt7662u.bin           | Bin 0 -> 91412 bytes
>  mediatek/mt7662u_rom_patch.bin | Bin 0 -> 20686 bytes
>  3 files changed, 12 insertions(+)
>  create mode 100644 mediatek/mt7662u.bin
>  create mode 100644 mediatek/mt7662u_rom_patch.bin

Applied and pushed out.

josh
