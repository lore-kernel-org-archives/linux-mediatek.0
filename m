Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C946C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 07:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Tb2qAN2iHQnwI5opx2JlaJTjjl52AeJuUveOcZcQo4=; b=znZTOFWWSFZbLc
	HYwTNp9PxzAt6IQbmqzwJCuMYTuB+LvSqx5w4IT4gQu+7Vq8XMWYuvNroI8xNmoUo1X5ndSfuMfYF
	TQjmob4CVoq+sIoUBw959dcYmGNUxzxK48uB3NXha3IGVzzyOKa4wLY3HKUj33/QN2jYjkzjUoSfc
	lN9l90rQ3fEf9bRZmLNoDudS4UnskHPBqtutit2459BZWVsh5GWPw6aezhIwMfQWIOp4SA6z7z/Vb
	zoiZsaMJPbUKkkvdRdh7E7lYThkl8Ol4uPgIR0ls/xyF8Z4iFC2Nnt9vwmYaks32Z5P1RQWLwqkMp
	RPJba+umHASuMCojfoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXIA2-00Fybo-4k; Thu, 24 Mar 2022 07:45:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXI9q-00FyZl-3C; Thu, 24 Mar 2022 07:45:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82630B8217F;
 Thu, 24 Mar 2022 07:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE70C340EC;
 Thu, 24 Mar 2022 07:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648107919;
 bh=BnVHS6h5Gh84trbMb8OgFB+LCVYnDXlcMEKuxFAbQcU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bLutvu2QgVXaYjMT9E6LteYKjL0MKAyLoZowrNBoFir1ic9GvP5pxB8Qn+2krNKsT
 e1nlqE+9Bxi+0O3yEKZlZAGGVG82yli47FYUoYtax9xqqFh2rz96FWGBaZ5yU51wLI
 IkIMjFwjwpyNOziCmgcUrchi+2Sls7dW24IYek69lHVfmNdarcIh051zIU47N+5Q1F
 mLUnF3S6L/VLwxyL7tckyP/ZL+0xGa6McgkCyET9q1abHUFUWANes+Pr4ehah0j46m
 PhjzhAHi/9qhbAyijiH7i+11LmXPxdatS8iuWtRQZ/aeU+zusa3p8PAIUymuuILivI
 7IaVWPk3AYkhw==
Date: Thu, 24 Mar 2022 15:45:14 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, robh+dt@kernel.org,
 matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com,
 angelogioacchino.delregno@collabora.com, miles.chen@mediatek.com,
 yc.hung@mediatek.com
Subject: Re: [PATCH v4 2/6] ASoC: mediatek: mt8195: merge machine driver
Message-ID: <Yjwhiv5Go2d62JkJ@google.com>
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-3-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324053851.27350-3-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_004522_312756_644190D5 
X-CRM114-Status: GOOD (  10.74  )
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

On Thu, Mar 24, 2022 at 01:38:47PM +0800, Trevor Wu wrote:
> Because most functions can be reused in different codec combinations,
> mt8195 machine drivers are combined to one common file.
> 
> The model and compatible string are used to decide which codecs are
> being used.
> 
> As a result, We can prevent from copy-paste functions when new codec
> combination is introduced.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
