From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] wireless: mt76: call hweight8() instead of __sw_hweight8()
Date: Tue, 19 Feb 2019 06:06:54 +0200
Message-ID: <878sycs9pd.fsf@kamboji.qca.qualcomm.com>
References: <1550469571-25933-1-git-send-email-yamada.masahiro@socionext.com>
        <1550469571-25933-2-git-send-email-yamada.masahiro@socionext.com>
        <877edxt1f1.fsf@kamboji.qca.qualcomm.com>
        <87tvh0syq2.fsf@kamboji.qca.qualcomm.com>
        <87pnrosy29.fsf@kamboji.qca.qualcomm.com>
        <CAK7LNAQMgFXw=rtpdPNZ=xpLw-SiwKGAgM__Owvqd1EhTCUntQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK7LNAQMgFXw=rtpdPNZ=xpLw-SiwKGAgM__Owvqd1EhTCUntQ@mail.gmail.com>
        (Masahiro Yamada's message of "Tue, 19 Feb 2019 10:13:27 +0900")
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, linux-wireless@vger.kernel.org, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> On Tue, Feb 19, 2019 at 4:38 AM Kalle Valo <kvalo@codeaurora.org> wrote:
>>
>> Kalle Valo <kvalo@codeaurora.org> writes:
>>
>> > Kalle Valo <kvalo@codeaurora.org> writes:
>> >
>> >> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>> >>
>> >>> __sw_hweight8() is just internal implementation.
>> >>>
>> >>> Drivers should use the common API, hweight8().
>> >>>
>> >>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> >>
>> >> Acked-by: Kalle Valo <kvalo@codeaurora.org>
>> >>
>> >>> This patch should go to x86 tree along with 2/2.
>> >>>
>> >>> Otherwise, all{yes,mod}config of x86 would be broken.
>> >>>
>> >>> This patch is trivial enough.
>> >>> I want ACK from the net/wireless maintainer
>> >>> so that this can go in via x86 tree.
>> >>
>> >> Sounds good to me, feel free to push via the x86 tree.
>> >
>> > Actually, can you wait a bit? Felix just reminded me that we have a
>> > similar patch pending from Ben Hutchings:
>> >
>> > https://patchwork.kernel.org/patch/10808203/
>> >
>> > And it seems there are two instances of __sw_hweight8, at least in my
>> > wireless-drivers-next tree:
>> >
>> > drivers/net/wireless/mediatek/mt76/mac80211.c: int i, nstream =
>> > __sw_hweight8(dev->antenna_mask);
>> > drivers/net/wireless/mediatek/mt76/mac80211.c: int n_chains =
>> > __sw_hweight8(dev->antenna_mask);
>> >
>> > So we need to think what to do.
>>
>> I think the best would be that Felix applies Ben's patch to the wireless
>> tree and I'll push it to Linus during the next merge window (via
>> net-next). Simpler and less conflicts that way.
>>
>> So Masahiro, could you hold your x86 patch for a while until the mt76
>> patch will be in Linus' tree? That should not take more than two weeks,
>> I think.
>
> Sure.
> I will resend 2/2 later.

Great, thanks!

-- 
Kalle Valo
