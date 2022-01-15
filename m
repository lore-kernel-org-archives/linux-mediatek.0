Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B5CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jan 2022 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KplqNTjxXeHJRAg6NSHl89o1nKhMJHGv8LNHtSHuuuI=; b=Iat8WbV4yL1CQB
	MwvkCHAnIbNmm1qIIFKH4VvMDMmYPPlEmXdwcgGwPr1CWcK72pv4w69tq6f+2K6chL6pjrY0GnIG3
	7oX8XsFIpkPwd9DjK7BEXXoNR0xayso+TTphuOgCl3trAHtXV1h5/quMSpNdh7qYRsMZ/iSGbOJAC
	gtehnQklPC1gf/Gvg0AuylPAPJ7UKBCsmswQ3MxsXxFYzqWIVfWPAQEExWsG3uEvn4inUPCf4Ukie
	1rO3M7ifIeRyBSErsx1kCXf2XXn03pUzCA/unq88gq8sFIF3lqfrtMT36Zc+0+C4WowLAEML5jNfm
	1WO3kMTOKiWvM84Dt8jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8sxc-00BfZO-Cn; Sat, 15 Jan 2022 23:59:52 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8sxP-00BfY9-Pl
 for linux-mediatek@lists.infradead.org; Sat, 15 Jan 2022 23:59:41 +0000
Received: by mail-oi1-x231.google.com with SMTP id r138so17983785oie.3
 for <linux-mediatek@lists.infradead.org>; Sat, 15 Jan 2022 15:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BY0t3wChnwPpABJAzUPI2uRQxasjitbf0zoLnLuzNmM=;
 b=xELVyXalO+/z52bs31zIMVRomNZNMvebNU/EH0nbs+9Y845YgY/qW6U4CzW8ijlaYP
 mg9DCeggvHBxQ5UinnwOo8phB/k5lWUORlqCYh4uGXWHU6A+fctnXEh87NwBtWnxY+nJ
 F97BcU1laAUD6j2u/tIhTMpDO93qF/J+/sOspsgvrStamqciVxBHV5D2FjUtLmvYr4dn
 shlDqcN9uNaPVFkxImqHkD9tn5rs+yvN5dDp6TqcNabCBhIkFcUHax7vYm0bfSn2R8Ji
 HZfrCzHENBfchX1EA3yQD9iW3KRhZTlVfTTOrg7RzyRsFDonfYBVV2up1BAsDETjo+6l
 KaAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BY0t3wChnwPpABJAzUPI2uRQxasjitbf0zoLnLuzNmM=;
 b=f+sM1FdXoZHDehOdsw5xaFmGofc+oOh+V0gsm+KFadTaJqGBr8GaOsZL6i80N2KR+k
 /nl/DYcxDFS3S5tmq8lkt2kSl0r4Mr/581qeEGgZXwHrdNYUEAddG5GEkuIDMF1y4/dN
 On54HoYGfLUTE/WLvi98D7b+Ktg8nNK4VcpVySds6w+VpqFctS1nVduR9YFsEyvF+uXU
 R2DC6KAZk0nmJaHSJ2biZhCnNh9felodGRfeLJR2chMTlglzol/i4D8DDkNIo0I+AfRQ
 VAWKLCuVcXXBRHOmqHtzwwZtG3K3Ef0MElzmS8vgOfxAj8XCR+3v1aougYzGf9hH8ySK
 k7Kw==
X-Gm-Message-State: AOAM533pUngz9LZOYyaMNeL/imMXuCvIfNOnSW45K1v1gKXK29hFDSy8
 UekrhhiUK7KZXSeTkwtyLiYXg1o9+XAxfsbHP2JkVg==
X-Google-Smtp-Source: ABdhPJy/oexnFc8hU3ysnUaLWHcbDN0ylAfYaUb2qiC7xMh3/+4Bu0iKtmkB9eeU2Rgz97bTHlGyDz6kcjZ52JUrjGQ=
X-Received: by 2002:aca:5a87:: with SMTP id
 o129mr13134949oib.114.1642291177322; 
 Sat, 15 Jan 2022 15:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 16 Jan 2022 00:59:26 +0100
Message-ID: <CACRpkdZhxEc0iFYkUJmPVc1ydDVtRd6-gqwcELyLb1ZRLe5STA@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: mediatek: pinctrl-moore: Simplify with
 dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_155939_849133_121A21E9 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 3, 2022 at 11:19 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:

> Use the dev_err_probe() helper to simplify error handling during probe.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

This patch set seems in nice shape, sadly we missed the v5.17 merge
window but please resend it as v2 once v5.17-rc1 is out with Chen-Yu's
review tags and minor fixes folded in.

Thanks!
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
