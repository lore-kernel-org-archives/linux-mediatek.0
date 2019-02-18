From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH 1/2] wireless: mt76: call hweight8() instead of __sw_hweight8()
Date: Mon, 18 Feb 2019 20:08:18 +0200
Message-ID: <877edxt1f1.fsf@kamboji.qca.qualcomm.com>
References: <1550469571-25933-1-git-send-email-yamada.masahiro@socionext.com>
        <1550469571-25933-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550469571-25933-2-git-send-email-yamada.masahiro@socionext.com>
        (Masahiro Yamada's message of "Mon, 18 Feb 2019 14:59:30 +0900")
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ingo Molnar <mingo@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-wireless@vger.kernel.org, Christoph Hellwig <hch@lst.de>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: linux-mediatek@lists.infradead.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> __sw_hweight8() is just internal implementation.
>
> Drivers should use the common API, hweight8().
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Acked-by: Kalle Valo <kvalo@codeaurora.org>

> This patch should go to x86 tree along with 2/2.
>
> Otherwise, all{yes,mod}config of x86 would be broken.
>
> This patch is trivial enough.
> I want ACK from the net/wireless maintainer
> so that this can go in via x86 tree.

Sounds good to me, feel free to push via the x86 tree.

-- 
Kalle Valo
