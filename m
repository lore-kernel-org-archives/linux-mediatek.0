From: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [GIT PULL v2] Mediatek: 32-bit DTS updates for v4.15
Date: Tue, 7 Nov 2017 15:14:31 +0100
Message-ID: <6fcfb359-6486-3051-1d6a-1eb18e6f0bc4@gmail.com>
References: <8a52a27e-f930-e873-6803-233dfa48b087@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <8a52a27e-f930-e873-6803-233dfa48b087-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: arm-soc <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Weiqing Kong <weiqing.kong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-mediatek@lists.infradead.org

Hi Arnd,

On 11/02/2017 07:52 PM, Matthias Brugger wrote:
> Hi Arnd and Olof,
> 
> Please pull the following commits. This is version 2 of the pull request. I
> dropped the PCI nodes addition as it needs more clarification.
> 
> Thanks
> Matthias
> 
> ---
> 
> The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:
> 
>   Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)
> 
> are available in the git repository at:
> 
>   https://github.com/mbgg/linux-mediatek.git tags/v4.14-next-dts32-2
> 
> for you to fetch changes up to eb54a522f164f89587381d665307d53acf75f114:
> 
>   arm: dts: mt7623: remove unused compatible string for pio node (2017-11-02
> 19:43:20 +0100)
> 
> ----------------------------------------------------------------
> - mt7623 update nodes to binding description
> - mt2701 add display pwn nodes
> - mt2701 update audio node description
> 
> ----------------------------------------------------------------
> Ryder Lee (4):
>       arm: dts: mediatek: update audio node for mt2701 and mt7623
>       arm: dts: mt7623: update crypto node
>       arm: dts: mt7623: update usb related nodes
>       arm: dts: mt7623: remove unused compatible string for pio node
> 
> Weiqing Kong (2):
>       arm: dts: mt2701: add pwm backlight device node
>       arm: dts: mt2701: enable display pwm backlight
> 
>  arch/arm/boot/dts/mt2701-evb.dts | 23 +++++++++++++++++++++++
>  arch/arm/boot/dts/mt2701.dtsi    | 13 ++++++++++++-
>  arch/arm/boot/dts/mt7623.dtsi    | 30 +++++++++++++++++-------------
>  3 files changed, 52 insertions(+), 14 deletions(-)
> 

I don't see this commits in your repository. Did you forgot to merge them?

Best regards,
Matthias
