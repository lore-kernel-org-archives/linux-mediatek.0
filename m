From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: soc driver updates for v4.20
Date: Tue, 2 Oct 2018 10:01:41 +0200
Message-ID: <CAK8P3a3sRnzAHY+UvU9CZ1d3H1+1SsRWf_S0Bh_puQ=PTcL=jQ@mail.gmail.com>
References: <fa4576fd-e8a5-8cfb-381f-e2343bb97786@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <fa4576fd-e8a5-8cfb-381f-e2343bb97786@gmail.com>
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
Cc: argus.lin@mediatek.com, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, arm-soc <arm@kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, hsin-hsiung.wang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Sat, Sep 29, 2018 at 5:22 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>   Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
> tags/v4.19-next-soc
>
> for you to fetch changes up to 3013b410a8f50cf251e09da00b8241fd43bb41fa:
>
>   soc: mediatek: pwrap: add mt6357 driver for mt6765 SoCs (2018-09-25 17:36:38
> +0200)
>
> ----------------------------------------------------------------
> PMIC wrapper:
> - sort SoCs and PMICs ascending
> - add capabilities
> - add support for mt8183 SoC + mt6358 PMIC
> - return false instead of 0
> - add support for mt6765 SoC + mt6357 PMIC

Pulled into next/drivers, thanks

       Arnd
