Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B36C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RFZAkgQVKGfDZFAsZcs3VpuVekeTrUTJT67TyCxEN30=; b=cnQl+qrDfdy6uy/EwEE4TtYdqw
	D5CFNrNmlybLehWYv+9To4O9KTIj/C4qZ/oTZGC+876HFFbS2zb0AomwV2wiImbbGw/f5w3g9AWy7
	T3+2SuKXgTd14/vbKJwT/WJtHErfThgD0YosTSDRTCcb2lg/P3pykRkVKhof8w84neIR+Vnp9x1B5
	fTSmzNjjbXg9ZiiKLfuV9fXr8bD9/z/C+RvaHqU6fPhPvZCzsXGtnMt6yU8TBYqlFsm+1lo2PChSm
	alxsjB2gdZYgUabthqi17WFb1TO0KWfZP/oNoiGI2Ndvnzud2CbTuBF91n6WDg+hag4+h2814Ko0t
	Ax9Y3eWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okOMd-00AqyK-65; Mon, 17 Oct 2022 11:32:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okOMS-00Aqvb-Sx
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 11:32:50 +0000
Received: by mail-pl1-x62f.google.com with SMTP id h2so3137304plb.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Oct 2022 04:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RFZAkgQVKGfDZFAsZcs3VpuVekeTrUTJT67TyCxEN30=;
        b=UA1It1zbSwRfJj28MU6PnRptI/IEZ8XuZ0lMn2NhltmuEwdyBwsCkDMYv8tKyM8iK4
         deeePjYDWgdFbxYqj4ZVC284OGhaHLIUQSfIUV+VOpMVZ29a7dht2Qx8p1eMSvNKQOo1
         K3BuUIjj0OpaSBFrGZB6sk4hvyeL5S6MRjCtHUIowlxwd+22Re7T0+kTRTXqNhJgeKzD
         55NC4I/uLff9s/SRzyjM4RPoYsiYy1YkXZYzPNc52dMF4r4dt9GAal631DJFMufUeZxe
         IMAtjgG7bXphJ5AYebX1z/JGNhSaTPjvQk42S/HGk+TWYuSz3LgXMi76r2Q5la+7vMXm
         HuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RFZAkgQVKGfDZFAsZcs3VpuVekeTrUTJT67TyCxEN30=;
        b=16nfLqPK6EU6U6PMWNakgc9iQqljuSF2ad1s+uy9s+vvMjC8LfkYma6DyG7s34L7Pt
         9aVUpR/S7ugu5wMVgdyOjcoSIAw9kp9yqVICn0/q4dU1hyF/6hMGb41ZoEfi1mEPRNQ6
         587L9Q+i38J/dw1n6Ergig5IZVOnwsG1hiRiG14bMGePq7Oh/9Gvd5Cr84EH93hqgIxK
         U1u3QSUskTTmlHdTR0Ttcqp44uaAEuFTcBYsZVaAqnOdmXjQN4lRvcCe/MHQrLjVyuoo
         F44pKMGFVfcQViYjj1NDxwSrMf38EULELtvX2QV+wZZfQ7dues/LdBZYua5O6ik8Hx2b
         9big==
X-Gm-Message-State: ACrzQf0JNlz+DaUwwYs6NGGgIdqHeHteUEwxpkKyC9HEpBrD0tSf3duF
	4FKTjGcxDDmWZqP8D1cjlsJ+Zye8tn2SvqzzF0WCIw==
X-Google-Smtp-Source: AMsMyM56W8HNW0wj/hARLIDv0QHhOGQAKyiiDcRuFr/Z9WfxiacZAshf2EGBYm8ugWgCI/qbnX/BXd/uGVdJdB34dFc=
X-Received: by 2002:a17:903:246:b0:179:96b5:1ad2 with SMTP id
 j6-20020a170903024600b0017996b51ad2mr11551113plh.37.1666006366377; Mon, 17
 Oct 2022 04:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221008165627.114782-1-linux@fw-web.de>
In-Reply-To: <20221008165627.114782-1-linux@fw-web.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 17 Oct 2022 13:32:08 +0200
Message-ID: <CAPDyKFrtW0Uz3beYyhGmrzF=Ge39T8_eCz8=mH4zasxhE9ZRVA@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add mmc-support for mt7986
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_043248_979225_B7203865 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 8 Oct 2022 at 18:56, Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> This small series adds dt-binding and driver change for supporting
> mmc-controller of mt7986.
>
> Sam Shih (2):
>   dt-bindings: mmc: Add compatible for Mediatek MT7986
>   mmc: mediatek: add support for MT7986 SoC
>
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml |  1 +
>  drivers/mmc/host/mtk-sd.c                         | 14 ++++++++++++++
>  2 files changed, 15 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe

