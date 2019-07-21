From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH 1/3] mt76: fix checkpatch warnings and errors
Date: Sun, 21 Jul 2019 09:56:18 -0700
Message-ID: <3a2d6eb86fc211002607aad12b35648736e46342.camel@perches.com>
References: <50d28c9b0f9e7d6b277d36fc93f55142d7535259.1563518381.git.ryder.lee@mediatek.com>
         <87blxnsmxm.fsf@purkki.adurom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87blxnsmxm.fsf@purkki.adurom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>, Ryder Lee <ryder.lee@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Roy Luo <royluo@google.com>, YF Luo <yf.luo@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-mediatek@lists.infradead.org

On Sun, 2019-07-21 at 13:26 +0300, Kalle Valo wrote:
> Ryder Lee <ryder.lee@mediatek.com> writes:
> > Fix warnings and errors as much as possible.
[]
> This is way too big and the commit log is too vague, please fix one
> problem at a time and describe in the commit log what you fixed.

Hello Ryder.

One option is to perform all the whitespace corrections
in a single patch and then show that the object files
have not changed.

I posted a trivial script several years ago that might
be of some help here.

https://lore.kernel.org/lkml/1405128087.6751.12.camel@joe-AO725/

It trivially reformats using checkpatch and produces a
possible set of changes that can be used to update a
git tree.
