Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75872C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VttxQNRn5wLcDZe0QBlfyaPIZnI+zBiatgv1ExvlsSA=; b=AGxpzTMjwng0HRZbvmyltFr/wn
	MGQ/lW0WFd6UfgokSQNJuY/6aulYvk4qHT/HuFnn8KrpdgI8PyXmhSMK31E2zewL+r93p+C7w4VuA
	pg9fDhlKaK1+GwThnYwDB1M6q9Y/ifd3fe1pVZDLXoO04Fnab9yDOCDXR62m6hQVK/bjFD+xxbFoW
	+AhlnKRuR19TL8pMZhYmCNgkfDa0HS9PXK7k92QpD8rlpllwwn6lC+z3nlZIdnpVT2OXYGBZi8cc9
	NVU4aprMNZkMH4qH/hI6W+xH3ZMbSFGd/DtluJSh8bENPHbtF+cDTLW8hJH8JqREqWpMoeRQWmz6y
	3NbBtzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BOj-003Jfi-Ka; Mon, 05 Dec 2022 13:20:41 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BOg-003Jda-UU
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 13:20:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id k88-20020a17090a4ce100b00219d0b857bcso2795210pjh.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 05:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VttxQNRn5wLcDZe0QBlfyaPIZnI+zBiatgv1ExvlsSA=;
        b=xSQoB37UuJKY4tgp5wdRFk+Jl7R8ZVhz7LrwXSbrbklLb9YmO/YJV3aWfjWuMzXxvj
         omoun5S6Ud66T3ElLc81i5TsPhZoAR39ojH/1Wi5QSdttzgYrmTsy/M4lIBg/B3IOetD
         h3immFNZ5DIsJUSfnVrO9h21CRqUHIJN/0LBiCEmBco61C1XqF4DCSnQhvABC3ephT/4
         t6YCxd/sJ5lVnZo36pg543Hs6D6FRmWspx4S9qqt3OQQzZxATzMCC0hOnzJxbyH+GkjI
         OHTDUczl1V59I2H72EN1VUfq/Tfhm3rHppWTPBzCK7D5gJz+f1cu9mH1cgy2xVjA5cdz
         6OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VttxQNRn5wLcDZe0QBlfyaPIZnI+zBiatgv1ExvlsSA=;
        b=bIiJU3gaHQWimuzm0rkQnOkc42KKUCvoWzUid5u062KaMO6cnhL4N6n16Os+Is9mG9
         eVOrpaEfpmmWF+GBMvxWkPAF5hpD9qp4HriEBxM/f4gPa3tCtksMse2cbXVapB5RS8++
         /XfFHZbNffSH9ZWI1IeLqoFjzAKTu/PoOwA0yMcKGVMgKz7rcQvLUjItzMqespKWIvsQ
         DV/EmCusiikiaiEx2/Wo5rbD/GKZAuttIuJAhYEIXjQ5FZtOfZXPZLbXYZPESIT82Utw
         cuXfya69B9ldXqUx4wMaswnSVvv2mfan1gNGcgSL0Su6iHGBSiuI4XffEmU0qV0pmTlO
         7LbQ==
X-Gm-Message-State: ANoB5pnH7XmPxITSET9tS+ozAEAnE7kOkQ4yTW9G0GhprQQXRj87hooa
	iTadVdPXwNdrIakl5UnreO9M6g==
X-Google-Smtp-Source: AA0mqf4PU5MhibxptEdBYx/Cd3SYioOJVCBMu5pSY3SfrC83bIr+4Og81l5n1VthaeXFLy+b7Gr+uw==
X-Received: by 2002:a17:90a:5298:b0:217:e054:9ac8 with SMTP id w24-20020a17090a529800b00217e0549ac8mr96191538pjh.246.1670246434046;
        Mon, 05 Dec 2022 05:20:34 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id p7-20020a170902780700b001899007a721sm10496368pll.193.2022.12.05.05.20.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:20:33 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: matthias.bgg@gmail.com, Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?=
 <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, krzysztof.kozlowski@linaro.org,
 angelogioacchino.delregno@collabora.com, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org
Subject: Re: [PATCH v3 5/7] arm64: dts: mediatek: Remove pins-are-numbered
 property
In-Reply-To: <20221129023401.278780-6-bero@baylibre.com>
References: <20221129023401.278780-1-bero@baylibre.com>
 <20221129023401.278780-6-bero@baylibre.com>
Date: Mon, 05 Dec 2022 05:20:32 -0800
Message-ID: <7ho7si56n3.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_052039_043186_D0D5935B 
X-CRM114-Status: UNSURE (   4.32  )
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

Matthias,

Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com> writes:

> Remove the unnecessary pins-are-numbered property from
> arm64 Mediatek DeviceTrees
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Kevin Hilman <khilman@baylibre.com>

Now that the driver/binding parts are queued, I'm assuming you'll take this=
 patch
(and patch 6) via the mediatek tree?

Thanks,

Kevin

