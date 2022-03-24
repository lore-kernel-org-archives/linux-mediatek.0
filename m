Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79236C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 16:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZZrRuIA/zypZapG3RI9S4daT/76xw8D331/jW8uvqoU=; b=ROzrqWJCJf832e
	3BbxGjTQgVssftHa8RRAr1/6SsfqbS2/LqMg8TI5cxELtW3/YxxyVpSdwA96JLa9RN1V9yBjnFVZJ
	K8ETRdweV9h7I2ZAhHletIcLeNvcrSg0eHcJL8jcNpkbaQRgRrTm7eNJWBOTBXvIfkxfU8KqUXTYv
	zZjCebQU+7D94rTWhWOg8yIJ4smMHvIY+szFK4vXDcq4k60vnG4alUNLpzCWWX7gMvmAU4AI0wB51
	GPWgwhNA+/Y1i3HqqLyGwvvtxD5yJ1JWvPXdRgs8Hx1UKNJiV4VOAzIbnnEUoR9uzZfjNKO+xXzdk
	KlvNArNI1D6kYZ+Zqmiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXQ49-00HAA6-H5; Thu, 24 Mar 2022 16:12:01 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXQ3o-00HA1I-4d; Thu, 24 Mar 2022 16:11:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D00651F45890
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648138297;
 bh=326GQpe6Pue2Q7/zbKDs+rrjArsHHkgS+jpDRGw9S48=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lb96OBHHXuEZ2m2LlS0Xe5dnXMhqIrEt2g29/hMrrNVrjy4bYGfpukL51o3kSnelb
 ekjjR6a7w6e5HWn1N+EQq9teLNxhViG5o1IjRLB5956SAWA754snvzls6ImNZd6G0n
 m9ePqveP4Io14TttTGuUhOdcfO2cZqme+pZKj+tXI+3XD9J/U34SfZrW2ZuOYBdWfh
 Q+h26phTI+sLUGNMsIHQHb+5lPuZTMd/6xTxnhdByEoeyZ7kMIBrhFhee5dFW4uGZF
 BrAf2nsnyeA7kgW87stdvRXK7LUmK71fyNP03mCmLqibp2ioVTluDl0ktb2kltW+Rf
 DvOWCzMcu5N+A==
Message-ID: <c026dd04-3cc1-4408-e6e4-8ab8a8dbcb70@collabora.com>
Date: Thu, 24 Mar 2022 17:11:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 4/6] ASoC: mediatek: mt8195: rename card controls
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com, tzungbi@google.com,
 miles.chen@mediatek.com, yc.hung@mediatek.com
References: <20220324053851.27350-1-trevor.wu@mediatek.com>
 <20220324053851.27350-5-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220324053851.27350-5-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_091140_350537_CEFCEFAA 
X-CRM114-Status: UNSURE (   7.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/03/22 06:38, Trevor Wu ha scritto:
> In order to be able to reuse the same configurations in user space,
> rename the controls to generic names.
> 
> "Headphone Jack" -> "Headphone"
> "Speakers" -> "Ext Spk"
> "Left Speaker" -> "Left Spk"
> "Right Speaker" -> "Right SPk"
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
