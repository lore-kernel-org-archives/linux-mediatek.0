Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFC4C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 06:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=27Rub21gSh1XV2+0EkPwBcTe3XiiNWsAL6GxLuOsDgM=; b=0zYFxB3h4avn2A
	Dr2eihJ92z77ZaCVuhZeuORKJSPInFfCtYN6ZmrmNW55VX428SS/sAD6m/hxFqJtwcmWCIqR4Ucx1
	Rr97mW73ZCGt0BpW/bWG1uj4R/4dk8Qg+uWTyiEI/iKlNqWxPN9xrBmH5d7z9mbvb3e4R/b7Kcimi
	6gPmZQzeSOJZS8IbLmzdhQ/97OohE9ZZamQ8fbnkfWl61deei9ijvePp1zCcXHidP/E8Sdytm1Nbq
	XYQhjvjxP/+oN1MmjmK6roLdbkO7DomIekSaEHJCImu6K89kMTGcyCatzQXsHbnUmB1PFGyNljOg7
	/3RnagWhu8xsumDQZayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyl2-0051C7-Ew; Fri, 03 Mar 2023 06:19:08 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyl0-0051BM-Fm; Fri, 03 Mar 2023 06:19:07 +0000
Received: by mail-oi1-x229.google.com with SMTP id r40so1094962oiw.0;
        Thu, 02 Mar 2023 22:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677824345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27Rub21gSh1XV2+0EkPwBcTe3XiiNWsAL6GxLuOsDgM=;
        b=WFBYt3L8DntAMPfj6wX4uDprAl5N5HINLj7Bf3RwcmiN3lbIvi8oMORSjWSbWxfxsw
         Wlslp48ES248GNt9LfrlqHo5jxS/EmPFKIz9rWZ1KB49AxxP1qXKz/JoYPjiCYYQX2ZP
         EhCwMybz29eI4Eewl/xw989srlioqGomgGzPmaf1ysUtVe01QJol2v/3rzeRL5yXKq7h
         pgBkky1uf+mQ70H0KloAB0bp5OVNmPH7v+mztsjSY8digjflIiDdzsZqONn+74Jf7Vg3
         c9Esp8v0Xq0xejAUiyNs9WyVBsqXxGcKhPlm7TNp3y89ZSfLVsjMpBjPR9cykcNHskFO
         foWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677824345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27Rub21gSh1XV2+0EkPwBcTe3XiiNWsAL6GxLuOsDgM=;
        b=kiHz04JyPvpoFYDlWf5HZd8GoNHYU/7M+t7+Uef9aZ6VK0BuRhLVDCdpjCZ2IguitG
         BHM4nA9PFfmZq3XuqXUyiJIo3rU/WCXsEZt/r9Yc75fiEraqPiWH38bcimYv+lzC7wHq
         CXUE2JG9XlLZmnoTsI7FUICms6sAkevu+YEE7MDGkUiCT1XAqOA9dH3fzYXqRqsRqz1n
         IscWLhcpDBkQBHqfd0mos3ECCOusZPqmHzeVryrhIEN//gnXEmz9WQ2zABFz0WG27Ki3
         b0RRkXwhesACyO55aR4DNtl/P6WKvsOh2xTIXmycQYkYRqOfBP+AK0v6ZedLlox8MJmg
         /MnA==
X-Gm-Message-State: AO0yUKXA3xegpAvb9/uNXgGTp9ODqRU7tQTI7007ZvUmU5vh5BA03k0v
	Y22jduo+A/TW+lx1VzT+DStnNz1JLoZ2VBTWAKe+3Q25SjM=
X-Google-Smtp-Source: AK7set8U22fTtAiAvoGmZia+tj+JgvsCoAxu6D9wTuc0d8JsGWv7/y/fhzl2ksI+jPG2VBrmtV6+JbMjrcDtyMs8iqY=
X-Received: by 2002:a05:6808:aa1:b0:384:2022:f9b1 with SMTP id
 r1-20020a0568080aa100b003842022f9b1mr193623oij.2.1677824345277; Thu, 02 Mar
 2023 22:19:05 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-7-arinc.unal@arinc9.com>
In-Reply-To: <20230303002850.51858-7-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Mar 2023 07:18:53 +0100
Message-ID: <CAMhs-H-N6KYUXA9kJPrbbZdLhNqFpPafkLWz=2nCzua=zzjHfA@mail.gmail.com>
Subject: Re: [PATCH 06/20] pinctrl: mediatek: remove OF_GPIO as reverse dependency
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_221906_577386_3EB47931 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 3, 2023 at 1:30 AM <arinc9.unal@gmail.com> wrote:
>
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> The OF_GPIO option is enabled by default when GPIOLIB is enabled, and
> cannot be disabled. Remove it as a reverse dependency where GPIOLIB is al=
so
> set as a reverse dependency.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/pinctrl/mediatek/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
>

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

