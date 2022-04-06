Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6ECC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 02:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fg+cJZ3ORoZNgcy0mh1jKirb48OyTiTzPr8uenReG8U=; b=FMe8+JbZttR48X
	UhRsj8H864kVqplHmc4Yu6eOcTEl8tqLqDAwyd1KxKW+dB1Xw6shab3VNYpwLdn91OcDameN02WY8
	YQMB+RAkTx6sZnTtSZMZ05VKWdG2n/qAhfaRQm7opfawCESkezi86DZuAgmSIHZSZVPrbApfP6PI/
	sreM45BkpQ6RsJvvKV1Tpr4KrUqIdcubaI9CDZbsQv6ejQ45B2IkGbDBb6R9kYapj8+ONTe8djNUX
	/VlULfOwfFzooES7u6g8+XLsq0k3rzLuFvfcR0y+mVLhViM1aOH3+RSuEcwb0/7J3VN86/Jnav47U
	OBXs0L3Mz8WuVOU9AOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbvR6-003Qqs-AO; Wed, 06 Apr 2022 02:30:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbvQu-003QoN-Nw; Wed, 06 Apr 2022 02:30:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2E01061542;
 Wed,  6 Apr 2022 02:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77F4FC385A0;
 Wed,  6 Apr 2022 02:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649212204;
 bh=xmoV1wDYDm25L/wEd+wgpbgIUhjzDoq0K9phYwvAZFY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pmkqz/0noFRk7vacJLi7o3vg9unVDqrCyTAAmO94kuNLcZpRGMnELojxzt4z7WhJZ
 MQ3qDz1FiqDLxIYJRTjAk/M2pFxqYYRTQpr0Y0O4tL9+KgYbHjW6ayRs/K2ptMZvEz
 cVAANQyp3Ln6sbQO15qdCyNHeO0mFkgWRd5ASXpkkXbHXZC8mPQNGEhFa5PliOaizn
 MfIndUw2XCE0Bkvjc7W+0DeHOGuAeJOWnFaKxKnvQ7E8M75ru8vz9y8kLhvlLuBg3Z
 GPemXN5w4EG5VauaqfsPEk+rcXHHZZJUP4iyzD8sgcV+bf8lwW3RxwojcilIGweC0s
 Q8huiUdIzv4gQ==
Date: Wed, 6 Apr 2022 02:30:00 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, robh+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v8 2/4] ASoC: mediatek: mt8192: refactor for I2S3 DAI link of
 speaker
Message-ID: <Ykz7KB221jyfwKzQ@google.com>
References: <20220402051754.17513-1-jiaxin.yu@mediatek.com>
 <20220402051754.17513-3-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220402051754.17513-3-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220405_193008_857986_578AABE5 
X-CRM114-Status: UNSURE (   9.73  )
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

On Sat, Apr 02, 2022 at 01:17:52PM +0800, Jiaxin Yu wrote:
> MT8192 platform will use rt1015 or rt105p codec, so through the

s/rt105p/rt1015p/.

>  static int mt8192_mt6359_dev_probe(struct platform_device *pdev)
[...]
> +	hdmi_codec = of_parse_phandle(pdev->dev.of_node, "mediatek,hdmi-codec", 0);
> +	if (!hdmi_codec)
> +		dev_info(&pdev->dev, "The machine don't have hdmi-codec\n");

s/don't have/has no/.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
