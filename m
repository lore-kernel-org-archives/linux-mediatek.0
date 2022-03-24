Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17FB9C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 00:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=maebbvNOSNsEVKlJCAP6TCh+OWBM//P610w1H2iRAAo=; b=FHy3hB5MckF78V
	YVHUb09+Mh/QXzjbOrYqAvbVbTx8oC3kNGOWhZToA9zID6dU83r/ew/hbMxIl1BLhBliKjk+qWQen
	yoZ/WSiEP79ExbU7INFgPKCan4O7jgjawKB2+9V4YqEewVUe835wkELEz5Yx9qP5SosxDiAOA3BkD
	t+idIr9gYNhjDpcO1gaEbhwFTImlYBWKCTahJY0rrvvw4rPnZaSMMKtiR1q7+qKOBI1b9RnjmkA/G
	VTyqz0sOVRPo5PKpeJ6dlzDbbfxDUmRL5oeBN0usITS/I/00b23TspdzSwF41ZLxgiu+1fWc5jK+9
	QPnLBBgyf6PMX9L4DweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXBmh-00FFlq-FK; Thu, 24 Mar 2022 00:57:03 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXBmU-00FFiE-T9; Thu, 24 Mar 2022 00:56:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 905F9B821DA;
 Thu, 24 Mar 2022 00:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EACF7C340E8;
 Thu, 24 Mar 2022 00:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648083408;
 bh=56vaE5jbiPpw7MVnANHxMK6Guy2/JixLTTS08O3G2BE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JPSU4HvK4hOdpWGvKvRUp6oCwLtPlazGX4xUwQM1cIVgX9oUYZW2LQIWlIau0W8QW
 VavLtjNIDISByHRmgKPCYQ+wuFmTfgnEHELT9dZKRau/fut1ay3QTPjYUcffxizfvg
 iY26zm9V/Dcp30PLMpvtaKrEbxCDLxeAbSp++RGJCyIOhyfYNrpmkA2FpVrkIo07aO
 pabHz+aew5bG8U9q7T3RLImqkKKYgtrcblr9p805MDhZFjBlwPjc7NNZ+Tft7p+qJ/
 5jzm2ESZEohUxCnVjjSEC8pBu4dGHYb6iukxo394BfNk0RJcBt5DZAibFFR4hM8Q0f
 RkaqxPz5LoclA==
Date: Thu, 24 Mar 2022 08:56:43 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v6 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <YjvByyiuPWrVAFTW@google.com>
References: <20220323164442.921-1-jiaxin.yu@mediatek.com>
 <20220323164442.921-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220323164442.921-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_175651_093228_47290096 
X-CRM114-Status: UNSURE (   9.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 24, 2022 at 12:44:40AM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt105p codec, so through the
> snd_soc_of_get_dai_link_codecs() to complete the configuration
> of dai_link's codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Except the name: speaker-codec vs. speaker-codecs.  Have replied to the DT
bindings patch in the same series.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
