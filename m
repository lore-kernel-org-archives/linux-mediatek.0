Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB600606A31E
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 22:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DiXnlvk5;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TNFkLsTx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PZME0oUNNAqEZpUwzUI5t6YgowzhWBCKgVCF/Etflr0=; b=DiXnlvk5vbHyNX
	4Oc5VNfBmUbuigsflOpqx8tVMPzSJoKN+1Y0/MG7qXhxvpXt3IOzsAS107cQt7QwFlHuz99VvHwRR
	znW+KxNCN6zPgQ626tY6zmQvSgRgPXtuv0Zds+itp3kGteCuSOYJiVlAut2bon+0sovQzjf0zQR4Y
	xlSGk5daqLkTfUPhGoucs1ysYZMuEbU2NJcXgpUVHupFmoYnVk2AOBoH5ZXIYx7qLFC/2EAJSl72B
	HmGTC2LnwcHkNvdZ2I1dA17d+Ls+cwRXEvcxoSHWwVfDMF7QIUCyfMrMa+XYYUImsu+2y7Pk/JRYT
	uXYaFIqi35/lLtOZ/4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKkFg-00000000adk-46rr;
	Sat, 24 Oct 2026 22:30:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKkFe-00000000adK-3UU4
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 22:30:12 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ea759cc9b6so6333115ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 24 Oct 2026 15:30:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792881009; cv=none;
        d=google.com; s=arc-20260327;
        b=Su40ZtE3BtgiGCLzy4gHNHbG2+NH7mwGcbqBV36qkwACSjx/cOqWv07M++HU57KFkw
         05EJBm0lNbSlwlDZ/Gy3rf6wKveLGvBDUiyCjz3lfhGf0e7BUb6wnqtRhPr0GqABcjsi
         9qE5gE5+Jvvg0ZMhM9tnnigoaj2hZTiKpJmfqo2uChN+WvHPaI+KNCmz9FDfUl4q3g+6
         sfuX07eqrVo6HhPfAPEdWpcbAXEvrXfjLP2zdLHkIEarXFztqltnQKepPo1mmcVjUqZe
         8/wwGXUZ/JotNH5oICLS2tgWL0mEmdGB8N97Y1McTZnbDH7FUDdKzgfyev4eRieV/MpU
         d2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZME0oUNNAqEZpUwzUI5t6YgowzhWBCKgVCF/Etflr0=;
        fh=JwoDpP7PbVD37aeWTPbtBhUy4JELSQrn+K/rdQopBrg=;
        b=fNw0sHp5RUf/S+AILbizjecF6LchzqP/brPUyGA/1IdG/8r+wv4zxT+IFXezdxRRZb
         ZxFPASP7WvjL86ymvvXHh6sHJNr3fU9wILfYWaucuoq9jOva/zO07SlPZWpwj6y+pAcr
         S7e3nWXNs+zp93em91Nd69FXy3AWcjeiqi55nLYe/Yvnap4J5KADXvTLxfq39k91Y2kO
         eB0Tgsl8Uif+vIBZkT8ckZaorcPb6GzohAySY7kp64RHA9l78mi0nlKlcgWpLTQpECuZ
         lrj9lClOnrHnUkGmGqOyTjjtWqKiqWk4UwhnGlrcIGS3aGBt1ZCWZcOW9y/m8bB9PScX
         I0pA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792881009; x=1793485809; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZME0oUNNAqEZpUwzUI5t6YgowzhWBCKgVCF/Etflr0=;
        b=TNFkLsTx+/LXGEFP32O7hnWEqBQUmkZ41gW5L0GPAnmWI98jhb/BhSzM8UyJ+2sG3Y
         LMDRUxEze6gpOACmtki8lsJy+uUB0bP3+Xv7rXNZC3yNvdVbHWe7kKlus3+reu+TBECJ
         LuhNSdsvNO7ECBZImRJn4WJ2ZDzLH7m4bIjOLKNcfe4m6V0SExs5IgyzckaIBAFnSZ0g
         FwvSsjB3/w3yhand+xRxJau+7g/my2OPDrZomqRfRWu6E7B/NHRDvqpByqrWe4sqaLBy
         oV6C5oUbNkPOGVzYebseM0iYCEKFl3dLTQeVgxcsm7MFyXy2HfB7tgzXtHq+UZDq58vM
         eGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792881009; x=1793485809;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZME0oUNNAqEZpUwzUI5t6YgowzhWBCKgVCF/Etflr0=;
        b=LI/IAYED/Re2y0C5aI7ZAccMdQ1LqSSNdJrnGEpeJ6qeY5EWaEm4XDgyVbHXI/8QW2
         4rFap1L4WYbM63wua4X0ECTSKgoaQHxX9XQdeQKGgaauoGCiQZl52/b78bu+D81DYqz9
         4PQ6IbgdGGbTdiG5HM9T6Xwamn3iUxypXyRvTimAiyA4TRAJfrPtGvBJrhFMb108DXPJ
         wP+0JTcQ+buKdWJ6gXzzCBOybW1GYqEqJXWc1D9wWiWAN8YAssDrhfB7soWb/Hme0b4W
         kJSvFnvkQ6D+pfDMaZ2r2OPjfzFKuAhJkOXa2YAS3Hf4GRFLEaAR1yHueVJshXCxlI+n
         FSdw==
X-Forwarded-Encrypted: i=1; AKwUvBxkoLF77PxLXyd7bxs1BD/tveJU+FEO4I5OLfkO9A9LpOLHoO9bhzVDhzQQ84NNiYBA1mB1LO49TmuzQA1+RA==@lists.infradead.org
X-Gm-Message-State: AFq9FYJlG1d0u82IIgMKBAo9skSg7hwjZJdFau1lI4XHUsGSEo2X6KdJ
	+MSiutIFfxWbM/bZ0Z6yZySREDAg6pWNvPqDOdA2qAuQSgZiB8DMGCmGdFzOngoZO5MPmoUbe7d
	604ejdoQ2tqUAC+ncQ/UqQjGcNgyTdvM=
X-Gm-Gg: AYBFou2G1JmgxZYLAZZFz3QvdqWS/pygeFq0MAkUrEP/BprIb2UOiwZdzcKxrzfNxSV
	9/mDO4kpP99OZRoJ8WKWBOa/JuDFydnyoN3XUPy0jHlRYu7qa9I7JN/82PZHs/6umtIJG/WaB9Z
	tBW9f6JmZ64XO5kuMa/qytxvvppvhaScPc/k/wa/BDuw78eeKCyh4dp2kILPRtSYTbAY8RjwX52
	6orDG9qwE8oJbHi2fzhxvnbgc5GMlXFHTQp4yPHLs+mY7flLxIbMGCeTkIyHcP6o73cfvwXnGat
	w1sB2Ho9dAsxIwC1kKFExI5JR61nx7xk9g1+NgKiYDmRv5uow87uFq2u7uJ2jAD42zlzzvzvaKf
	PuTCOi4Zc7nLL8U1/u7pberaXuy4vTw8G6BrNOQ==
X-Received: by 2002:a05:6a20:548c:b0:3e2:9dee:42cd with SMTP id
 adf61e73a8af0-3e7bfa95bc8mr2307021637.36.1792881009249; Sat, 24 Oct 2026
 15:30:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CAHaeJsQLvC-KBEpy5qu8iYxSB51mbHohrPvN4PJushF_Tk3foA@mail.gmail.com>
 <20261023180554.7266-1-lucid_duck@justthetip.ca> <CAHaeJsSfoTxJhWVCrELCiLZr1zD42LGJUvrmf7oSzRQpwh6-jw@mail.gmail.com>
 <20261024173414.10559-1-lucid_duck@justthetip.ca>
In-Reply-To: <20261024173414.10559-1-lucid_duck@justthetip.ca>
From: Chris <hoopyfrood42@gmail.com>
Date: Sat, 24 Oct 2026 18:29:57 -0400
X-Gm-Features: AclHuK9o9StbGbjqRGEyKvKK_k8FgZq3xzv3Qw33wdsis2WlZchhyzyHV6yo0Hw
Message-ID: <CAHaeJsTHykkk8Cm+FUZW2RmzzmT47aJNxRR1kpymhDvknnhKuQ@mail.gmail.com>
Subject: Re: [RFC PATCH wireless] wifi: mt76: mt7925: get the survey airtime
 from the firmware
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Deren Wu <deren.wu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Javier Tia <floss@jetm.me>, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_153010_883703_40A18617 
X-CRM114-Status: GOOD (  16.29  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 1:34=E2=80=AFPM Devin Wittmayer
<lucid_duck@justthetip.ca> wrote:
>
> Chris wrote:
> > One thing on offset 20: in monitor mode it doesn't look like all of
> > rx.
>
> You're right, it isn't all of rx. Your numbers made me curious, so I
> tried it here with an A9000 as a 20 MHz monitor next to an Alfa. It
> seems to come down to how strong the signal is. Share of the time:
>
>                                          offset 20   decoded frames
>   one strong neighbour (-22 dBm)            2.3%          2.0%
>   only weak neighbours (-73 dBm or less)    0.0%          3.6%
>   my upload, monitor on a side channel     54.6%          7.5%
>
> Strong signals land in 20 even when the monitor can't decode them,
> including spill from the next channel, and weak ones are left out.
> That would fit what you saw on 5 GHz and on channels 2 to 4.
>
> As a station the A9000's own downlink does show up in 20, so I'd keep
> it as the receive time.
>
> Thanks for the long run against the Wi-Spy, and for the Tested-by.
>
> Devin


Devin Wittmayer wrote:
> As a station the A9000's own downlink does show up in 20, so I'd keep
> it as the receive time.

Makes sense, thanks for running that down. Strong signals counting and
weak ones not explains both of the oddities I saw. For my use, a monitor
hopping channels, busy time is the figure that matters, and that one
held up on every channel.

Happy to test a v2 on the A9000 if one comes.

Chris

