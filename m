From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] ARM: mediatek: 32-bit DT updates for v4.19
Date: Thu, 26 Jul 2018 22:05:51 +0200
Message-ID: <CAOesGMjyag+aq7kRgUhMAtxa5d45Uv0aCB=0m9k2jdFg9atcJA@mail.gmail.com>
References: <2d918d15-d1d3-b4e0-7427-0b3baa56100a@gmail.com>
 <3ee3ccfb-8fd6-34b0-c03d-67532067e707@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3ee3ccfb-8fd6-34b0-c03d-67532067e707@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Frank Wunderlich <frank-w@public-files.de>, Viresh Kumar <viresh.kumar@linaro.org>, arm-soc <arm@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jul 26, 2018 at 10:31 AM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> Hi Olof,
> Hi Arnd,
>
> This is the second attempt to send the pull request, as in the first one I sent
> the branch instead of the tag.
>
> Please have a look.
> Regards,
> Matthias
>
> ---
>
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:
>
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v4.18-next-dts32
>
> for you to fetch changes up to 11a20c5601c5f0c685fa3a166348b7ffa830e123:
>
>   dt-bindings: arm: mediatek: cleanup MT7623N reference boards (2018-07-16
> 15:57:40 +0200)
>
> ----------------------------------------------------------------
> - mt7623
> - delete unsupported reference board
> - fix pio leds
> - add missing cooling device
>
> ----------------------------------------------------------------
> Frank Wunderlich (1):
>       arm: dts: mediatek: Fix pio-leds for Bananapi-R2
>
> Ryder Lee (2):
>       arm: dts: mt7623: cleanup MT7623N NAND dts file
>       dt-bindings: arm: mediatek: cleanup MT7623N reference boards
>
> Viresh Kumar (1):
>       arm: dts: mediatek: Add missing cooling device properties for CPUs

Merged, but a friendly reminder that 32-bit uses ARM: while 64-bit
uses arm64: as prefix. I've nagged a few other maintainers about it,
and will post checkpatch patches for it.


Thanks!

-Olof
