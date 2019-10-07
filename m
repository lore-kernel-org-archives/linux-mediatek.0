From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: Aw: Re: [PATCH] mfd: mt6397: fix probe after changing
 mt6397-core
Date: Mon, 7 Oct 2019 11:32:27 +0800
Message-ID: <1570419147.28952.1.camel@mtksdaap41>
References: <20191003185323.24646-1-frank-w@public-files.de>
         <20191004152001.GS18429@dell>
         <trinity-c33ab112-57a5-47d6-80e5-13c96442e302-1570204319219@3c-app-gmx-bap10>
         <3dcb030d-006e-7518-2679-48726d0c4e0e@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3dcb030d-006e-7518-2679-48726d0c4e0e@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Frank Wunderlich <frank-w@public-files.de>, Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sat, 2019-10-05 at 10:16 +0200, Matthias Brugger wrote:
> 
> On 04/10/2019 17:51, Frank Wunderlich wrote:
> > This Question goes to Hsin-Hsiung Wang ;)
> > 
> > i only took his code (and splitted the 3rd part) to get mt6323 working again without reverting the other 2 Patches
> >> regards Frank

Hi, Frank
Sorry for the late reply.
I appreciate your help very much for splitting the code to fix the
issue.
This patch is ok for me.

> > 
> > 
> >> Gesendet: Freitag, 04. Oktober 2019 um 17:20 Uhr
> >> Von: "Lee Jones" <lee.jones@linaro.org>
> > 
> >> Will there be other devices which have a !0 CID shift?
> > 
> 
> Frank, a quick look at the series would have given you the answer.
> @Lee: yes, this change is the preparation to support MT6358:
> https://patchwork.kernel.org/patch/11110515/
> 
Hi, Lee
MT6358 uses 8 for the cid shift and I will submit next version patch of
mt6358 which is based on Frank's patch.

Hi, Matthias
Many thanks for the explanation.

> Regards,
> Matthias
