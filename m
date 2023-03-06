Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12BAC678D4
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Mar 2023 13:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6UPnvKq09Wou2+IQachtCQ63VCTkOWQC89w6AgtMPM=; b=mBB2f4p1mgMfulm5fQo52WQCua
	02LNZRjcX+ldIEhn9WA+ax/0c/P8vNk8ZcjRPhSogewMH5qKhlCki6nIwY/OXgHwSmlT/nl+eLAY6
	JNTIbtDME6VI1ZGms6t7SVPZ0D6xU4004mls2vQdEQBgL9bCFPpCpUbW8m9N7viy1I8WO2sw5ErQv
	vIAe/IeOW5PxWW4iClFHpaTtZlvnk6lEPjsQRie7rpiZLuE3nrALF65SghR8TYaWis8NKpetCO2CI
	rKTxynyYaiELlqTMFG0/JolPrcuc6wn/lUSFOuS98gT7vwR6JXSjT5lp62Eup4PJ+uicUr0jH+CAW
	3Ityl+rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAoI-00CrwB-Ib; Mon, 06 Mar 2023 13:23:26 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZAoF-00Crv6-1E
	for linux-mediatek@lists.infradead.org; Mon, 06 Mar 2023 13:23:24 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-536bbe5f888so183306387b3.8
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Mar 2023 05:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678108999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6UPnvKq09Wou2+IQachtCQ63VCTkOWQC89w6AgtMPM=;
        b=BxnBHQDCamtmwpqCeExj//dagBQrW6HHltyHkLJJEamdTia5Xi3n1MMpVx3WQN3uTR
         ++YezTuGdjOjToEuahsL0RuqU5p3n0m5PcyMnLBFdxYJlMv07cHkeflOgYGHj+U1bJzC
         5o6Hcyf6d4uLkUYn/ZXjxOlQELveWzV6ouKvFCfMQ4oYWN8rZfsPgdymBeKkzD2KHtAb
         UeNdBSMi5GkrILM+YioOmOir9B39Uo/4hHJgZI9AX1n2up1lP/HMwHUKOwKJaYdpSKEj
         3hBlTqD/qdxoHSyUXuHIYg8OK+VQCWZTcGPgT3w+4bHF16ibOB+o63mSYJG1Jh6raUR9
         mMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678108999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A6UPnvKq09Wou2+IQachtCQ63VCTkOWQC89w6AgtMPM=;
        b=53UuAh7vpH8HRPJBkQHbLr1QiJnfSzG+VsIgTXQKWNaac6qnLi8Jlznq8V2g13Hsmy
         vUdhzieNFf03fTlhvlebdwyN9ShEC3aO1d60MarQrCsimu7CZkkddH4Hxu04Yr34Svrd
         mr70P1hAdKes+p1XJNvm/PPiWYUWfv65EE7kmHdBYRndTLftsX/MagBw6UNhLFa9IqdT
         3tZAK7LX/WRkWKz0ZmK3Uv6gbHot80Q8oesPdV+8yEerV+9FWiltAjzXfNoJKEMcL+Ep
         TOKgKNnkM+oXcgd8aR5slNHtMqN7fP9pX3Kq83gvp7JdpK4sUm10lxinKJnidF4Noe6y
         SyPQ==
X-Gm-Message-State: AO0yUKXdROFK6nJz/rL8vVS9YV/OwgWLWYdKThtGjDifED+bk+bFHa9o
	YoZiwy06QY4u29S/3pgp6RDNRM+lvCehxxvzlLMCpA==
X-Google-Smtp-Source: AK7set/s6kdSu1VcFIDUDDAjhyT5WX5VXxR9fDOOK3NMP0aCh1mWegJfszBB8kiuEvAwn0UNiI+jPIKsmpqnhlWyXBE=
X-Received: by 2002:a81:b61a:0:b0:52e:cea7:f6e3 with SMTP id
 u26-20020a81b61a000000b0052ecea7f6e3mr6509470ywh.10.1678108999681; Mon, 06
 Mar 2023 05:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20230218065108.8958-1-arinc.unal@arinc9.com>
In-Reply-To: <20230218065108.8958-1-arinc.unal@arinc9.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 14:23:08 +0100
Message-ID: <CACRpkdY1xPVd1dTch1jvP6Wc27977Qm7GJ9fKffzhF9odHWG9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: add missing options to PINCTRL_MT7981
To: arinc9.unal@gmail.com
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	=?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Daniel Golle <daniel@makrotopia.org>, erkin.bozoglu@xeront.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_052323_101112_C23E1A53 
X-CRM114-Status: UNSURE (   7.32  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Feb 18, 2023 at 7:51 AM <arinc9.unal@gmail.com> wrote:

> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> There are options missing from PINCTRL_MT7981 whilst being on every other
> pin controller. Add them.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>

Patch applied for fixes.

Yours,
Linus Walleij

