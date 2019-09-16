From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: mt6360: add pmic mt6360 driver
Date: Mon, 16 Sep 2019 09:06:08 +0100
Message-ID: <20190916080608.GV26880@dell>
References: <1568275837-3560-1-git-send-email-gene.chen.richtek@gmail.com>
 <be0bbf3b-76f8-9e2a-7c51-d5987263a859@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <be0bbf3b-76f8-9e2a-7c51-d5987263a859@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Gene Chen <gene.chen.richtek@gmail.com>, gene_chen@richtek.com, Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Gene Chen <gene_chen@mediatek.corp-partner.google.com>
List-Id: linux-mediatek@lists.infradead.org

On Thu, 12 Sep 2019, Matthias Brugger wrote:

> Hi Gene Chen,
> 
> Please use ./scripts/get_maintainer.pl to find out which are the maintainer(s)
> for a specific series/patch.
> 
> I added Lee Jones, who is the maintainer of the MTD subsystem.
> 
> Right now I have no time to review the patches, sorry.
> 
> Regards,
> Matthias
> 
> On 12/09/2019 10:10, Gene Chen wrote:
> > From: Gene Chen <gene_chen@mediatek.corp-partner.google.com>

Please resubmit this containing a suitable commit message with me on
Cc.

> > ---
> >  drivers/mfd/Kconfig       |  12 ++
> >  drivers/mfd/Makefile      |   1 +
> >  drivers/mfd/mt6360-core.c | 463 ++++++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 476 insertions(+)
> >  create mode 100644 drivers/mfd/mt6360-core.c

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
