From: Kyle McMartin <kyle-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: pull request: lunux-firmware: Add Mediatek MT8173 VPU firmware
Date: Tue, 5 Jul 2016 09:43:23 -0400
Message-ID: <20160705134323.GC8680@merlin.infradead.org>
References: <1467629314-31902-1-git-send-email-andrew-ct.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467629314-31902-1-git-send-email-andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Andrew-CT Chen <andrew-ct.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-firmware-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, tiffany.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Jul 04, 2016 at 06:48:34PM +0800, Andrew-CT Chen wrote:
> Hi linux-firmware maintainers,
> 
> The following changes since commit 3ef7857d511ce6a91c5ce609da76c4702651cfa5:
> 
>   amdgpu: update polaris ucode (2016-06-28 14:31:11 -0400)
> 
> are available in the git repository at:
> 
>   https://github.com/andrewct-chen/vpu-linux-firmware.git vpu_encode
> 
> for you to fetch changes up to 40876d7b3c911161ab71bc84a6e90f257a13cdc4:
> 
>   mediatek: Add mt8173 VPU firmware (2016-07-04 16:26:54 +0800)

Pulled, thanks.

regards, --Kyle

> 
> ----------------------------------------------------------------
> Andrew-CT Chen (1):
>       mediatek: Add mt8173 VPU firmware
> 
>  WHENCE    |   19 +++++++++++++++++++
>  vpu_d.bin |  Bin 0 -> 4084848 bytes
>  vpu_p.bin |  Bin 0 -> 131036 bytes
>  3 files changed, 19 insertions(+)
>  create mode 100644 vpu_d.bin
>  create mode 100644 vpu_p.bin
> 
