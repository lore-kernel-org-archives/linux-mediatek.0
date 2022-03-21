Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F065C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 04:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UxLQw0EHmPGnZ2xPofCiYMshw/ovCaUtjqYM7q6zuxI=; b=HR7AD+GwEQ/5J1
	EJH4XWB6hA4SFfI+53WZHA4SPI4Qnl5U3JJ7XqEaEPeuHiu+8B0b4FMI5eCHVZp01v4R5H6zkmRkp
	cXtrLu6KGElrfvHZRwffseZW3oaDmmj6q1hGQN+lIRwT4JUPG3hNGHRixd+Xrfeiq45YSS8JtIrH1
	mTne0lJRkrfAr80kazcFcnLnIxvbW9q9c43eVoy3UZEKDXFeBz21zu9kZ5ZoVxWHu8mlnwxA9e1Wo
	FA8cSvIg8A+eWfHUQIMV5k88N6aC6BybMImOm7S7bBixXu5pGNDFn50QpgE8zwpYaRKl14ZeNHGCS
	phf2Iwl6ehPglrdmGqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nW9D2-006Q9F-IY; Mon, 21 Mar 2022 03:59:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nW9Cr-006Q5P-80; Mon, 21 Mar 2022 03:59:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3326A60C8B;
 Mon, 21 Mar 2022 03:59:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D741C340E8;
 Mon, 21 Mar 2022 03:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647835183;
 bh=6C2Rn2TiO19qVcy2kVX3WO5CMQAaiGC6EBfvsJ7KrWI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sNHA/biyCxRt6ihYlKG7yYtUAnAIa+4/rTM34JAZ2oVG1nMbaacKi1UA9fTlQpFiX
 HOakm6JDehmbET4ORvCXeWqk+LRKNUp2qdOTkiNxWShg8MmwTJo2I5KCC+8a5MGDCr
 nFFfpnBt60HU0/xklNUDWGFpY/+uXNOSMfrNLSHQSFlQa4rTwdaOjImDOjOsa6drMm
 0YRlgrl0nGbcbNmf6XWoZMGtyWvNuO+ta1WYKbwIzzLs6wa1iBpUIPjQdMRhZoO0vg
 L7qoSX+Y3TlUZ2m0FgqNs90Xvh74ElQ2tvFccRo2N7af7vUHho2tYfHulF50oBgSQG
 7DBUnpf1aBamQ==
Date: Mon, 21 Mar 2022 11:59:38 +0800
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
Subject: Re: [v5 3/4] ASoC: mediatek: mt8192: refactor for I2S8/I2S9 DAI
 links of headset
Message-ID: <Yjf4KjXpVJaNnvb8@google.com>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-4-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220319114111.11496-4-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220320_205945_347861_68D0C785 
X-CRM114-Status: GOOD (  11.41  )
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

On Sat, Mar 19, 2022 at 07:41:10PM +0800, Jiaxin Yu wrote:
> @@ -1145,6 +1140,13 @@ static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
>  		goto err_speaker_codec;
>  	}
>  
> +	headset_codec = of_get_child_by_name(pdev->dev.of_node, "mediatek,headset-codec");
> +	if (!headset_codec) {
> +		ret = -EINVAL;
> +		dev_err_probe(&pdev->dev, ret, "Property 'headset_codec' missing or invalid\n");
> +		goto err_headset_codec;
> +	}

(to be neat) Does it have any reason to prevent from using of_parse_phandle()
but of_get_child_by_name()?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
