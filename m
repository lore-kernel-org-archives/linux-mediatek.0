From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL v2] arm: Updates of armv7 DTS for v4.15-next
Date: Thu, 21 Dec 2017 18:09:16 +0100
Message-ID: <CAK8P3a2qtezVL1EX0E6Oe+FjU5PuwOFpBXrvqNhHYoJ5HRBHpg@mail.gmail.com>
References: <938d913c-02c2-e44c-1c03-e620276ce35e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <938d913c-02c2-e44c-1c03-e620276ce35e@gmail.com>
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
Cc: Mathieu Malaterre <malat@debian.org>, arm-soc <arm@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Dec 21, 2017 at 12:45 PM, Matthias Brugger
<matthias.bgg@gmail.com> wrote:
> The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:
>
>   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
> tags/v4.15-next-dts32
>
> for you to fetch changes up to a227cf4dfd74a873857c9cc017100168d01539ed:
>
>   dt-bindings: ARM: Mediatek: Fix ethsys documentation (2017-12-20 18:10:12 +0100)
>
> ----------------------------------------------------------------
> - add reset cells mt2701 and mt7623 ethsys
> - update mmc nodes for mt7623
> - mt7623 change mmc card detection pin to active low
> - mt7623 set unit address to lower case

Pulled into next/dt, thanks!

       Arnd
