Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3269BC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 03:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMecl2xVbH3rYgPLC1js67hdB8OAbnOWJS6YkKd3n5w=; b=baCJNhXrajFCh/
	ZTGdZrHbdGcO//quIZ+G5OTOJ40+3/TuvpXKWlolKIvT3GEU6ANHfPkWTDTqIh3VW4Yd/QCnNv/7+
	GC961x0Iu93OpqNNO3RgbE60P1C/D5Uvo4IXlOpX1w6NDgcshUYuZFzhtM5nDdsIn9+eUSrhDSeZI
	i6yj8NPeDX3v/j8ZHyUbd2xCBY/GLcTWLrHvpkU9xIbOf+bLwDohjyWFo6pcdncuj+SjFtLeK1raV
	UNPsOnJpwjSkA4GcLZ5OZSgFCngU96wvN5/tLkak3dIKzRCoOh2VjYqHXnfmVK7N2JWWxoOO66jCh
	NGTFeHs+qaEo+6lOOBtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW9Cj-006Q3q-V8; Mon, 21 Mar 2022 03:59:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW9CY-006Q1u-Lx; Mon, 21 Mar 2022 03:59:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B40560B4D;
 Mon, 21 Mar 2022 03:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0256C340EE;
 Mon, 21 Mar 2022 03:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647835162;
 bh=Y4RPiSr+4ZFbLITcBxYisXPJwqdGgqpzoccbeNlhlz8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hbwrRg3dYYgVo5Vm2TvAvXfrFT8frw0Wgc6mDOmq/9KM9ZfGyxLu1VI5czKGhU6JO
 2+Y2MGwgodRQ30iyM+I4c+s/g5MnUGA6MHN8PLuL6q3voUYcZ8o6UIkSglFBBn1Tnh
 faphTUcxF9tZ3m2pXj3IIFyt81s07xTtLwQgUGuMpaHDvdUmvvS8OmXes7vyaV/if6
 fK4noFy9Xqf7p/3jA5XXnP4c02IcfYODnzIHDP6V/G6qwxRKp1QUlFPrcby8NuTUXW
 Z5GTM+y05VGUrlxfNDooAnuf1v3Ui7TuoUszGLiIU298vFP69UBE/H5jSW+BoIbW1N
 6xM9z2M47Z8CQ==
Date: Mon, 21 Mar 2022 11:59:17 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linmq006@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com,
 linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com
Subject: Re: [v5 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <Yjf4FXEirDkxPUd1@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319114111.11496-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_205926_790709_3A7184DB 
X-CRM114-Status: GOOD (  10.98  )
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

On Sat, Mar 19, 2022 at 07:41:09PM +0800, Jiaxin Yu wrote:
>  static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
[...]
> +	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
> +	if (!hdmi_codec) {
>  		ret = -EINVAL;
> -		goto put_platform_node;
> +		dev_err_probe(&pdev->dev, ret, "Property 'hdmi-codec' missing or invalid\n");
> +		goto err_hdmi_codec;
>  	}
> -	card->dev = &pdev->dev;
>  
> -	hdmi_codec = of_parse_phandle(pdev->dev.of_node,
> -				      "mediatek,hdmi-codec", 0);
> +	speaker_codec = of_get_child_by_name(pdev->dev.of_node, "mediatek,speaker-codec");
> +	if (!speaker_codec) {
> +		ret = -EINVAL;
> +		dev_err_probe(&pdev->dev, ret, "Property 'speaker_codec' missing or invalid\n");
> +		goto err_speaker_codec;
> +	}

(to be neat) Does it have any reason to prevent from using of_parse_phandle()
but of_get_child_by_name()?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
