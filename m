From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [GIT PULL] arm: mediatek: DT fixes for v4.20
Date: Sun, 2 Dec 2018 20:56:59 +0100
Message-ID: <5e3371a7-e4a3-49cc-b517-20902a5e2ed4@gmail.com>
References: <d131fdd3-663c-9a5b-4296-94f2635f8c41@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d131fdd3-663c-9a5b-4296-94f2635f8c41@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm-soc <arm@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

Hi all,

On 26/11/2018 11:34, Matthias Brugger wrote:
> Hi Olof,
> Hi Arnd,
> 
> There two issues with the mt7622 based boards in the current v4.20-rc cycle.
> Could you please pull the following fixes for the issues.
> 
> Thanks,
> Matthias

I just saw, that this is not part of armsoc-fixes [1]
Does it fall through the cracks or are there any comments?

Regards,
Matthias


[1]
https://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git/log/?h=armsoc-fixes


> ----
> 
> The following changes since commit 9ff01193a20d391e8dbce4403dd5ef87c7eaaca6:
> 
>   Linux 4.20-rc3 (2018-11-18 13:33:44 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v4.19-next-fixes
> 
> for you to fetch changes up to ce68cc6fad893eb33b69ef7ec186233a51696236:
> 
>   arm64: dts: mt7622: Drop the general purpose timer node (2018-11-26 11:19:19
> +0100)
> 
> ----------------------------------------------------------------
> DT mt7622:
> - kernelci awaits a working stdout-path.
>   Fix the path for reference board and bananapi-r64
> - general propouse timer has issues with clocks that didn't
>   get probed early. Delete the DT node as the timer isn't
>   need, a ARM arch timer exists on the system.
> 
> ----------------------------------------------------------------
> Ryder Lee (3):
>       arm64: dts: mt7622: fix no more console output on rfb1
>       arm64: dts: mt7622: fix no more console output on BPI-R64 board
>       arm64: dts: mt7622: Drop the general purpose timer node
> 
>  arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts |  7 ++++++-
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             |  7 ++++++-
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi                 | 10 ----------
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
