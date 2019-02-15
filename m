From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL] Mediatek DT 64 bit updates for v5.1
Date: Fri, 15 Feb 2019 15:58:58 +0100
Message-ID: <CAK8P3a0wfWzZ0GTgMDAEPFNM_g5tLMVW=6ZdR+cK1L2cxc=YhA@mail.gmail.com>
References: <d55e396b-0cbc-62a2-7bfd-c988cda086ff@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <d55e396b-0cbc-62a2-7bfd-c988cda086ff@gmail.com>
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
Cc: Matthias Brugger <mbrugger@suse.com>, Viresh Kumar <viresh.kumar@linaro.org>, Erin Lo <erin.lo@mediatek.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>, YT Shen <yt.shen@mediatek.com>, arm-soc <arm@kernel.org>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, honghui.zhang@mediatek.com, Chunfeng Yun <chunfeng.yun@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, Feb 8, 2019 at 9:00 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:

> ----------------------------------------------------------------
> mt2712:
> Add device nodes for usb3, iommu, smi, i2c, spi, pwm,
> mmc, NAND flash and PCIe
>
> mt6797:
> add pinctrl node
> enable uart pins on x20 board
> enable uart pins on EVB
>
> mt7622:
> Add all CPUs to the cooling maps
>
> mt7623a:
> Remove unused binding description
>
> mt7629:
> Add binding description for the SoC and the BananaPi
> based on this chip
>
> mt8173:
> Add all CPUs to the cooling maps
>
> mt8183:
> Add binding description for the SoC

Pulled into arm/dt, thanks!

      Arnd
