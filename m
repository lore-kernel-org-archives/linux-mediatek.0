Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83276E7718B
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Dec 2024 08:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVcsrmKwkxIKz+eCCIw3WHKCv/X66XMcWh6vJ2SRqGw=; b=FCTybrcv7bAcO8
	ksiGw9XQWrO/Yg/buPa2tcQghcxikcdR0MLnTvwGb90EczaCDuwWWUsKVd9ow9+CxmVEur9iAul4e
	OgGonaqu994tPLe7OgpUoO4Znh5VXN5nck79JKvDSKbiU+dEjMoxBLKFS7QnqQ4OmSQ1k5SDwyBgL
	c7vQgSo57Pp8v55KpQ3fPTKUyyO5BThRmjlk5INHoXHND5sC/lJT8Re1vSzBdlMN1Goa2Evo2BaV/
	8yIaJgt/rxBCriA9ay8sesosoJMHjlWvO0p1IqAvESyevlcMVGshHUJxvILElsljBbKE+lDnPoWv0
	pIxNhHy5jqDVPIVPLC5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5d4-0000000HMUM-2XtC;
	Fri, 27 Dec 2024 08:23:30 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR5d1-0000000HMT3-08AA
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Dec 2024 08:23:28 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-53e389d8dc7so7589332e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Dec 2024 00:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735287805; x=1735892605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dVcsrmKwkxIKz+eCCIw3WHKCv/X66XMcWh6vJ2SRqGw=;
        b=bAFbxPpXRb0LF9laWfrIJnb9S/T5T2WRc7k6fm4b6RENrdLUbb6k+UnJy5dmrw8zw7
         JpJVBgIxqC93V3FtJCfY7wME4dtR3psOd9y2A8YbwWzCDHGuFnCw9qT3D3992ws3H7on
         BFVsOCWyfreezeu5pOPpBSeDZjwI37dvPi8KqPMzkocHRYMbHY4HQvxngDb0woOBuf3s
         lgMnslu67Y+m5PntmcnJHw0nmWRzw78qA+BqPZGTDFT4mvhzKq0bVFgkXSpKcFGG0jFC
         gEfa5hqf5b1P1XeW4jWhh3or2rHKp+xz6sI5dRNHm1eUSP30ZCyiqyqaKENdvevEU4R+
         KdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735287805; x=1735892605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dVcsrmKwkxIKz+eCCIw3WHKCv/X66XMcWh6vJ2SRqGw=;
        b=k+O/lR7RlsYA3VcccTTdAll0QZAv6Bca7w1AWoWnqHhRduM8Cmi+kvgKc5Wj7Xynjf
         +UTcNN1kKOaLcdpFnMeJLrqU/LJNexnzSrR7wqR+8hUinuSlLyun03GSsZKPMdpaALkH
         OOOo6RoETkHbD8UQ+2Ygw59lumYITiPeZb1fF2gokNSiKRp+wmQfufKN2SesFxp6J81P
         9Fps3wB9ldjs3Y5lIo1CquTHsKlyoDiRXK1UyBBHTImcwTlVnsKPoosDPXFqJZVxZKsM
         oX+F/JmCDiR7k6dCNy+zEGkN0oeQgTNv+PZQ1jhSP5I1YYTZXsnapU1R3ecBHnciAI/5
         V4sw==
X-Forwarded-Encrypted: i=1; AJvYcCULGmVZaBt61Do/d4emrJYr7ohrXj8hEnToIaqDGjEwgevm7dF6wnXZGi6zgUFedJDg9UmQT4Oq7y+ji3HZvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjtNa7BnaaAK7mh2beYuYG7+FNI11RZVmAshp/MJoFRLK4qiLU
	kZ1Y9YOkRWbVk0Bbv0728IkaRUEgagS20CpcO9iH5dHxv3QD2ac48ySPGImnbj2CDiPeDXYlqPN
	JWQfaKhKZ9aradCxpie9R2ifAkW2BQ9+hnbU33g==
X-Gm-Gg: ASbGncsQCAQm9+H2qkVaM1HwHO0gWy2npb7EvNY+67m3IpYrU0pMt8iFETPJOxOPjgm
	cbXoSW11QWKOQePgtA58d5PmzU5+UfsRetLUG
X-Google-Smtp-Source: AGHT+IFYIOklSZ9sJMM5TQ3zMjDwQ23DBG0sFeGBh5tQkGSxcVbvZSf9AiFrryAVoUGw4Nv3w5+5ALeURj3MiEoam9I=
X-Received: by 2002:a05:6512:1283:b0:53e:2f9d:6a7a with SMTP id
 2adb3069b0e04-54229562a50mr6753089e87.46.1735287805076; Fri, 27 Dec 2024
 00:23:25 -0800 (PST)
MIME-Version: 1.0
References: <20241217085435.9586-1-linux@fw-web.de>
In-Reply-To: <20241217085435.9586-1-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 27 Dec 2024 09:23:13 +0100
Message-ID: <CACRpkdakCrw3v=iEq_chxxhcEaUipqhyPA2GDZ9gp3tMTbuWBg@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] Add pinctrl support for mt7988
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_002327_086154_3E45A5D3 
X-CRM114-Status: UNSURE (   9.77  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 17, 2024 at 9:54=E2=80=AFAM Frank Wunderlich <linux@fw-web.de> =
wrote:

> This series adds pinctrl driver, dt-bindings and dts node for pinctrl
> on mediatek mt7988 SoC.
(...)
> Daniel Golle (2):
>   pinctrl: mediatek: add support for MTK_PULL_PD_TYPE
>   pinctrl: mediatek: add MT7988 pinctrl driver
>
> Frank Wunderlich (3):
>   dt-bindings: pinctrl: add binding for MT7988 SoC

These three patches applied to the pin control tree,
please funnel the last two patches through the SoC tree.

Yours,
Linus Walleij

