From: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH] mt76: switch to SPDX tag instead of verbose boilerplate
 text
Date: Wed, 24 Jul 2019 11:15:46 +0800
Message-ID: <1563938146.8010.4.camel@mtkswgap22>
References: <6f6d5cf551a0b0d0dd1b902aca2c5417b7f98da7.1563864007.git.ryder.lee@mediatek.com>
         <CA+zupgyq9VZkstdOOX4E_G9KWVN2WB+u0XnLiFAbxGws6Mt4qA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CA+zupgyq9VZkstdOOX4E_G9KWVN2WB+u0XnLiFAbxGws6Mt4qA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Roy Luo <royluo@google.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Wed, 2019-07-24 at 11:03 +0800, Roy Luo wrote:
> Hi Ryder,
> 
> Please follow the convention, some of your header files use //.
> 
> C source: // SPDX-License-Identifier: <SPDX License Expression>
> C header: /* SPDX-License-Identifier: <SPDX License Expression> */
> 
> Regards,
> Cheng-Hao (Roy) Luo

I also found that - copy paste mistake.

And I will fold this one into 'fix many checkpatch.pl warnings' series
then send v1.

Ryder

> On Tue, Jul 23, 2019 at 2:45 PM Ryder Lee <ryder.lee@mediatek.com> wrote:
> >
> > Add SPDX identifiers to all remaining files in mt76/
> >
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > ---
