Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB91C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Mar 2022 02:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aMt4P8kBhs3rCReFbU0o80exLamT0QeHNpgpRKMts/M=; b=OMvWBlJ/PC1k69
	1G+MX3I66bh+KJmb2sU5QTRv2+CBKe/6IZWBzVWjuwsQPM2w+3m8QvcEo7Bdap6RpyhO5J1zG/onc
	vXrFTcriRJVsJ2KM775gGEUW8OKUr1s87ycj0DElRnSg1vFMK7z/LqTACeTHtNDwssjjORs8Ywly4
	YsXvG40ZMsdrqKTWiaQnJdgxwS+7qbY1EAgBrH//lsf6CHKtJvh4LLQ29Kdt4Bu80yeuicd8kXBga
	zE+SvOcEzPFXWQYplfC0BaudwVfa9zAS3j/VVL7nyPEGxIHIGl4nRM22LZtiKDLrzvBn7oZHGbb8U
	4WzT3NAz4mYSK3mLWADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZOVM-00E4Ls-Qi; Wed, 30 Mar 2022 02:56:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZOVA-00E4KD-Hf; Wed, 30 Mar 2022 02:56:06 +0000
X-UUID: 16946b657a22433e8bf9061e19bacc11-20220329
X-UUID: 16946b657a22433e8bf9061e19bacc11-20220329
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2043842547; Tue, 29 Mar 2022 19:55:59 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Mar 2022 19:55:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Mar 2022 10:55:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Mar 2022 10:55:56 +0800
Message-ID: <ed60e1a69b4b61008b2bc76cfed93f46ac5efa2b.camel@mediatek.com>
Subject: Re: [PATCH v12 1/3] dt-bindings: mmc: mtk-sd: fix yamllint error
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@canonical.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Wenbin Mei <wenbin.mei@mediatek.com>
CC: <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>
Date: Wed, 30 Mar 2022 10:55:56 +0800
In-Reply-To: <97f2b11d-15c7-d28e-f7b5-e65f2f333580@collabora.com>
References: <20220329114540.17140-1-tinghan.shen@mediatek.com>
 <20220329114540.17140-2-tinghan.shen@mediatek.com>
 <97f2b11d-15c7-d28e-f7b5-e65f2f333580@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_195604_630012_B6E0A639 
X-CRM114-Status: GOOD (  15.76  )
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

Hi Angelo,

On Tue, 2022-03-29 at 14:47 +0200, AngeloGioacchino Del Regno wrote:
> Il 29/03/22 13:45, Tinghan Shen ha scritto:
> > Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> >    54:81     error    line too long (95 > 80 characters)  (line-length)
> > 
> 
> I can't reproduce this error that you're getting... this commit is not
> necessary, as the .yamllint file in the kernel allows a maximum line-length
> of 110 characters.
> 
> rules:
>    line-length:
>      # 80 chars should be enough, but don't fail if a line is longer
>      max: 110
> 
> 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/.yamllint?h=next-20220329__;!!CTRNKA9wMg0ARbw!1L9icT80FdI9EYV81qRGpzbEvV1NFP_pwk8YABV0eIiRf2ppttnPlRfu5aXEUsxODiE$
>  
> 
> Please drop this commit.

Thank you for your feedback.

I figured out why I have this error...
It's because I do the yamllint outside of the bindings folder and not specify the yamllint config
file.

I'll drop this at next version.

Best regards,
Tinghan
> 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> > ---
> >   Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
