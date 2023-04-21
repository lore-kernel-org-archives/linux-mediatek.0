Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD45C77B75
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Apr 2023 07:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSYmFIBvo/39//HYsPHxDg04iiAQgWsffOlw6b/gJqc=; b=k4xIO812YovqTRkdym3Lk/Og1l
	zQhmjnGX7qPC28nI0U29kpxu2anOxbODFGLP52lUcG9B3zFRiFuTcZya7Qcy4OKJkVMyFOeBsC0HN
	rwaz8l8tjCVq//MN8AQCgFy6V9zI7tYjqO3KZcvJxqXdrzyg0WCl7SNeoo3MUtXa2SUuLgxMCO5Sl
	vcLQvd7ihD1xNH2YnOI+1F38R7DzfnZ5fpaDxGTmuXUom4dM3OXgoxxQqcIuG8FEL3WBLBoJTk+GU
	iq1GfW2BVzEOzUnQKb/XBL+GBIX0SkTtfOhbdVyARWrNnbm0pYFKF9BsdYw0WOdW8Zf6Tsk+vQ6S7
	oE5njs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppkrv-009uwh-0U;
	Fri, 21 Apr 2023 07:07:43 +0000
Received: from mail-ua1-x934.google.com ([2607:f8b0:4864:20::934])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppkrh-009usx-2J
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Apr 2023 07:07:32 +0000
Received: by mail-ua1-x934.google.com with SMTP id a1e0cc1a2514c-77106047c7dso433476241.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Apr 2023 00:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682060848; x=1684652848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSYmFIBvo/39//HYsPHxDg04iiAQgWsffOlw6b/gJqc=;
        b=MSuKI7etY84g7qPA6Ywqcgqm89D6KVhjjgiAsSocKkQSQSFdYhnYHtJ0dMfO2sswY8
         yEAldvBimU9hLPOTZALoxeIWDfKszFJN4t2z3OSHPX4c5z4jD27y4UDG8XdekTUjEKGV
         9GzeLmCMTLHjYQ7YtEL8aA0Jtb4dAX8Do+TPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682060848; x=1684652848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSYmFIBvo/39//HYsPHxDg04iiAQgWsffOlw6b/gJqc=;
        b=lyIpIqs78m0n7Mk610s3CYgOdAJYEhGhsFIAkK1Q00w6EESwutw+Rv7XV48ceFduhM
         JIZxlf5GXNQxPLiWctaHNmB+lYv2QKOpstp9GBW27z8h3P6cJrriA9ZCRIPF9BlvW0u6
         oPFsvExiNlne/Ie/qXHNXzWZBSXn0JZVABT+TDcRyKdZrXXOJs+Ej4bRTIauSRFahR2A
         TSmDgyldeO4fg0hpKPSnMgke6FX6XZi5RgioyV/3qzK2Nw+G/8iVWY1beIr693tw/XJt
         Y+kN35JaXt4WRIZpQICNyZ3VAsne2acho474nvkGt3sFXnQpFjUbpfzPyqcxImUmddt8
         lwrg==
X-Gm-Message-State: AAQBX9d3g4m98QYGpwLL1uYlMjiBaE7OTV4XBWGe8iDp3hboEyaikCo5
	dRgnlY0UtIKlUnpttU7lk8XV7/EciE9Gw+VmIJ7O3A==
X-Google-Smtp-Source: AKy350acAl/SE2HRNGSc35n0Xobw7Q6eRphLA9qWh3FvDA1yrtZsodgQn6llJUsD9hRFeXzrI4cIXFlpeq/s5aOrZfI=
X-Received: by 2002:a67:b10b:0:b0:42c:79a7:f2ed with SMTP id
 w11-20020a67b10b000000b0042c79a7f2edmr2164074vsl.34.1682060848155; Fri, 21
 Apr 2023 00:07:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com> <20230420094433.42794-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230420094433.42794-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 21 Apr 2023 15:07:17 +0800
Message-ID: <CAGXv+5Fiqpzn-M2yEGSETCyReGJRnTk45wrOyNBi9k=qymOW1Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: mediatek: cherry: Enable PCI-Express
 ports for WiFi
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_000729_785304_4BFDD5EF 
X-CRM114-Status: UNSURE (   6.92  )
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

On Thu, Apr 20, 2023 at 5:45=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On the Cherry platform, a MT7621 WiFi+Bluetooth combo is connected
> over PCI-Express (for WiFi) and USB (for BT): enable the PCIe ports
> to enable enumerating this chip.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

