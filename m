From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH] mt76: convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat, 15 Dec 2018 17:11:37 +0800
Message-ID: <CAEExFWvtMsYkMR5gzCF6rrRKFX_Z+wuZTO8mXwEodsR8CAAFuw@mail.gmail.com>
References: <20181203134028.12645-1-tiny.windzz@gmail.com> <a8daff3575d4682107dede1f07bf98470acb98ff.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8daff3575d4682107dede1f07bf98470acb98ff.camel@perches.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joe Perches <joe@perches.com>
Cc: davem@davemloft.net, kubakici@wp.pl, Matthias Brugger <matthias.bgg@gmail.com>, Felix Fietkau <nbd@nbd.name>, lorenzo.bianconi@redhat.com, sgruszka@redhat.com, kvalo@codeaurora.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Thu, Dec 6, 2018 at 2:09 AM Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2018-12-03 at 08:40 -0500, Yangtao Li wrote:
> > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
>
> Thanks.
>
> Are you doing these manually or using some script?
In fact, just use grep.

Yours,
Yangtao
>
>
