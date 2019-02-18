From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/2] wireless: mt76: call hweight8() instead of
 __sw_hweight8()
Date: Mon, 18 Feb 2019 22:49:40 +0100
Message-ID: <20190218214940.GI4265@zn.tnic>
References: <1550469571-25933-1-git-send-email-yamada.masahiro@socionext.com>
 <1550469571-25933-2-git-send-email-yamada.masahiro@socionext.com>
 <877edxt1f1.fsf@kamboji.qca.qualcomm.com>
 <87tvh0syq2.fsf@kamboji.qca.qualcomm.com>
 <87pnrosy29.fsf@kamboji.qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <netdev-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87pnrosy29.fsf@kamboji.qca.qualcomm.com>
Sender: netdev-owner@vger.kernel.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-wireless@vger.kernel.org, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

On Mon, Feb 18, 2019 at 09:20:46PM +0200, Kalle Valo wrote:
> So Masahiro, could you hold your x86 patch for a while until the mt76
> patch will be in Linus' tree? That should not take more than two weeks,
> I think.

No hurry - I won't take it into the x86 now and queue it for 5.1 because
it is not something urgent or fixing a bug or so. It is a cleanup and as
such it can surely wait for 5.2, I'd say. Unless there are other aspects
which I'm not thinking of right now...

Thx.

-- 
Regards/Gruss,
    Boris.

Good mailing practices for 400: avoid top-posting and trim the reply.
