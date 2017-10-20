From: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: armv7 boot regression on v4.14-rc1
Date: Fri, 20 Oct 2017 17:45:41 +0100
Message-ID: <CAKv+Gu9Dr4ziYftohi7sncgUGXUJGx3OJvUMn+VgqwmPo-8NGw@mail.gmail.com>
References: <297ac268-ab26-5172-68f8-d3b4b5883af5@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <297ac268-ab26-5172-68f8-d3b4b5883af5-IBi9RG/b67k@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>
Cc: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

On 20 October 2017 at 17:42, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org> wrote:
> Hi Ard,
>
> Today I realized that the Mediatek based Bananapi-R2 [1] stopped booting
> somewhere between v4.13 and v4.14-rc1. Serial console is just quiet, not even
> earlycon is working.
>
> I bisect the issue and got pointed to:
> e4bae4d0b5f3 ("arm/efi: Split zImage code and data into separate PE/COFF sections")
>
> After reverting the patch, I was able to boot.
>
> Any clue what went wrong here?
>
> I added Sean, maybe he has an idea if this is a FW issue. Also I doubt the board
> uses EFI.
>

Hello Matthias,

You are probably being bitten by a known issue:
https://marc.info/?l=linux-arm-kernel&m=150488477807353

The maintainer is dragging his feet a bit, and I am not sure why. But
we should be able to resolve this shortly

Thanks,
Ard.
