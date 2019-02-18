From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] wireless: mt76: call hweight8() instead of __sw_hweight8()
Date: Mon, 18 Feb 2019 21:06:29 +0200
Message-ID: <87tvh0syq2.fsf@kamboji.qca.qualcomm.com>
References: <1550469571-25933-1-git-send-email-yamada.masahiro@socionext.com>
        <1550469571-25933-2-git-send-email-yamada.masahiro@socionext.com>
        <877edxt1f1.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <877edxt1f1.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
        of "Mon, 18 Feb 2019 20:08:18 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-wireless@vger.kernel.org, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Kalle Valo <kvalo@codeaurora.org> writes:

> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
>> __sw_hweight8() is just internal implementation.
>>
>> Drivers should use the common API, hweight8().
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> Acked-by: Kalle Valo <kvalo@codeaurora.org>
>
>> This patch should go to x86 tree along with 2/2.
>>
>> Otherwise, all{yes,mod}config of x86 would be broken.
>>
>> This patch is trivial enough.
>> I want ACK from the net/wireless maintainer
>> so that this can go in via x86 tree.
>
> Sounds good to me, feel free to push via the x86 tree.

Actually, can you wait a bit? Felix just reminded me that we have a
similar patch pending from Ben Hutchings:

https://patchwork.kernel.org/patch/10808203/

And it seems there are two instances of __sw_hweight8, at least in my
wireless-drivers-next tree:

drivers/net/wireless/mediatek/mt76/mac80211.c:  int i, nstream = __sw_hweight8(dev->antenna_mask);
drivers/net/wireless/mediatek/mt76/mac80211.c:  int n_chains = __sw_hweight8(dev->antenna_mask);

So we need to think what to do.

-- 
Kalle Valo
