From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH] wireless: convert to DEFINE_SHOW_ATTRIBUTE
Date: Mon, 3 Dec 2018 21:41:30 +0800
Message-ID: <CAEExFWtWCteDgt2vr2TcdreZu3SROKjPmZhucwSggjopEgO3Wg@mail.gmail.com>
References: <20181202093047.11174-1-tiny.windzz@gmail.com> <87d0qig4hu.fsf@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87d0qig4hu.fsf@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kvalo@codeaurora.org
Cc: merez@codeaurora.org, davem@davemloft.net, kubakici@wp.pl, Solomon Peachy <pizza@shaftnet.org>, Matthias Brugger <matthias.bgg@gmail.com>, lorenzo.bianconi@redhat.com, Felix Fietkau <nbd@nbd.name>, sgruszka@redhat.com, joe@perches.com, linux-wireless@vger.kernel.org, wil6210@qti.qualcomm.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

On Mon, Dec 3, 2018 at 8:49 PM Kalle Valo <kvalo@codeaurora.org> wrote:
>
> Yangtao Li <tiny.windzz@gmail.com> writes:
>
> > Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  drivers/net/wireless/ath/wil6210/debugfs.c    | 240 +++---------------
> >  .../wireless/mediatek/mt76/mt76x0/debugfs.c   |  20 +-
> >  .../wireless/mediatek/mt76/mt76x2/debugfs.c   |  38 +--
> >  .../net/wireless/mediatek/mt7601u/debugfs.c   |  40 +--
> >  drivers/net/wireless/st/cw1200/debug.c        |  32 +--
> >  5 files changed, 64 insertions(+), 306 deletions(-)
>
> This is rather large cleanup so please split these per driver (wil6210,
> mt76 and cw1200).
>
> --
> Kalle Valo
Has been divided into several small files.

Yours,
Yangtao
