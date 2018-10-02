From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: arm64 dts updates for v4.20
Date: Tue, 2 Oct 2018 11:15:20 +0200
Message-ID: <CAK8P3a2kBuwk-TmsL4Df1MqXL9LofyaxDQydWdG8yyb7W27wGQ@mail.gmail.com>
References: <5b05e2ed-a909-dbb5-2b95-f1cab0ecc5c8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <5b05e2ed-a909-dbb5-2b95-f1cab0ecc5c8@gmail.com>
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
Cc: leilk.liu@mediatek.com, arm-soc <arm@kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Sat, Sep 29, 2018 at 5:20 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:
>
>   Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v4.19-next-dts64
>
> for you to fetch changes up to 3c2ac5b3ebcd387f5399c7888fae7279a65c606a:
>
>   arm64: dts: Add spi slave dts (2018-09-28 23:05:26 +0200)
>
> ----------------------------------------------------------------
> mt2712 - add spi slave node
>
> mt7622:
> - add timer node
> - add CCI node
> - add PMU node
> - add bluetooth node
> - add SPI slave node
> - fix reference board (rfb1) memory and sort node alphabetically
> - add support for Bananapi-R64

Pulled into next/dt, thanks!

       Arnd
