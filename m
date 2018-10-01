From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] ARM: defconfig update for v4.20
Date: Mon, 1 Oct 2018 18:06:37 +0200
Message-ID: <CAK8P3a1jtA77tunDWEjqAvYgNac-EFVdg07Va6neya4r2HSdQQ@mail.gmail.com>
References: <8bb0af1d-8323-9833-ee1c-bbbb9d65a686@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <8bb0af1d-8323-9833-ee1c-bbbb9d65a686@gmail.com>
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
Cc: arm-soc <arm@kernel.org>, "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Sat, Sep 29, 2018 at 5:16 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:

>
> for you to fetch changes up to f718739d1c219decf2e4e4f0121753439850e5ab:
>
>   ARM: defconfig: add mediatek_v7_defconfig (2018-09-25 16:18:15 +0200)
>
> ----------------------------------------------------------------
> - add arm32 defconfig for mediatek SoCs.

You probably don't want CONFIG_DEBUG_LL=y, or CONFIG_COMPILE_TEST=y
in there. Please review the file for additional options that might be incorrect.

       Arnd
