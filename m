Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D47C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBVQj6zu0U7jkHVLOzPHDFiH21K5735tKjSbqEv4spg=; b=mIfWtxnZiV+wFTr8o6G0BpBMxE
	mBEBSWiE1Cqzj50uMfiGNxxnnWnuqmtMYkHmH4mIMAw+8E5H/wFFWrlg7JzXpw5sA+FIFJxnD621j
	oEW3xkB0eGY57W0tv8LJpfthj9+0Fxjkm1vkPDIfVTOlbEPj5SDoMKdRtIzCI6ERy6/63uLVs8B8/
	bu9D0HKmhcl6igmq7zMhAVX47zFmUmROhyGU+LqY+MEZWAP8JD5/1KVQbgqLP7kEU6GJxTcAhKWqz
	XbbTiUK8CWAc3mXwQpRV5cFLwLHTBPMlp3IB7mOfcn+y4P0dRLOHMs/fMw2FaVS2I9IkM/SIgWER/
	DJazxn1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7E1R-0046c8-4A; Fri, 01 Jul 2022 10:37:13 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7E1O-0046ZQ-Bf
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:37:11 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-3178acf2a92so19339207b3.6
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jBVQj6zu0U7jkHVLOzPHDFiH21K5735tKjSbqEv4spg=;
        b=jr5qzoxv0EQ6ow5RimCUL0thLdOlKD2Mp38XOhb2QCXhk3ERPNY7lFT6qKHXl9VBDy
         3VztuzSi0gzHi5W2lZY6EJt+PWBD8VxpvAA9O3tF3+kniNwtzA+xS+BXdAnpZoD9nAjt
         7bEbC85ysE3WcOt7m4FVavxND3V930mWPz1zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jBVQj6zu0U7jkHVLOzPHDFiH21K5735tKjSbqEv4spg=;
        b=Pi/fC5ShIEVMuRRPCBV7Son1U/liSg4wXthxPDeX58qtVZens9ebCVVcGyjojg0Qd/
         UFTHN74xCMjJjjkhjWNs+cEb1dYR4a3z7kVqWMRW95xPRq+cpVrP1BTtmfR48qubTVxK
         1tiBAlZ5TYu37cnLmhDfS8zKAjRc8P7vZZZYmVj8ha9Abm3mBxL8UM8IO4dEpCdQH+Ux
         Oaipvp+ozK3/s09lw3kW6uNHDD7shLin2KicYq3mcTUsUxMmkhmQYnELZ3gMUHWq+Txi
         CwktUMgip0Cd31ghUqZJu+CJSPvRtc1tYUp3A5i8F3EUWR4SoxjS3VDO199LF+nPiss8
         aYNw==
X-Gm-Message-State: AJIora94MLhfAnMbIfoq0jylx7c6ng1zQ8YKzGbkWTwmi2km9Nl8k+nR
	rT20CZJn8ArL/ce1cX2QAwmvB8kZ0lWKKaJtdx0hng==
X-Google-Smtp-Source: AGRyM1uHIKIv2IBD8W2iw2DM4IM3lmhp0SNZnRvFfOIGzZkNmD+miY/TbPeNxObyuEbB3d9mNtWcA1MjAOFyTnhGSuE=
X-Received: by 2002:a81:19ca:0:b0:31b:732c:15e9 with SMTP id
 193-20020a8119ca000000b0031b732c15e9mr16065949ywz.167.1656671822866; Fri, 01
 Jul 2022 03:37:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220701090547.21429-1-allen-kh.cheng@mediatek.com> <20220701090547.21429-2-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220701090547.21429-2-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 18:36:51 +0800
Message-ID: <CAGXv+5FTXXWZU4FyqJ7uqoPGso7ofsb1=QS0mU8Ay2hSz7rFXQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/mediatek: Remove mt8192 display rdma compatible
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_033710_434183_81F2F874 
X-CRM114-Status: GOOD (  10.88  )
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

On Fri, Jul 1, 2022 at 5:05 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> The compatible =E2=80=9Cmediatek,mt8192-disp-rdma=E2=80=9D is being used =
for reading
> the data into DMA for back-end panel driver in mt8192 but there is
> no difference between mt8183 and mt8192 in rdma driver.
>
> Remove compatible =E2=80=9Cmediatek,mt8192-disp-rdma=E2=80=9D from the dr=
iver and
> should use =E2=80=9Cmediatek,mt8183-disp-rdma=E2=80=9D as fallback in 819=
2 DTS
> according to the mediatek,rdma.yaml.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

