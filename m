Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFD7C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Jv4/sOIlFAAhrZ66YnY8sbnFa+pDeqfxTC5hkcUuNc=; b=mnYgJVDJYaIRV8
	h+9ftQsP3jBUwJzpG8VwCwnU65+wLghaQ+R+YGqytYxBrP8P84TFT2gOgioaJKKHgr9/x0S3h33Z/
	FUmNliwkJXSOGTgfO2R7letzPqKicRysWbSZaI3U+qfd+fvMsEUlvropV/xU4goPJI9sPYCNTwRuJ
	pPE5s4Q6VPyTl8yU16mJGnrV3cFKP4JyeFOVrzislNO049i7+Nr2L1BwJm/EyRaD9gZHCjdslfHLk
	f3mr2JsXblkYVAA3XfrwH2PMNadRcBGUi2HQLTimOCqmyLRBe8WPthyBQY+xZvYGm/iFvhG9sTgDP
	0x/9znUdFODNERdpKFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTiCV-0051Sb-Lr; Mon, 14 Mar 2022 10:45:19 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTiCG-0051MR-F8; Mon, 14 Mar 2022 10:45:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3EDC31F41E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647254703;
 bh=j588M5zB/9t7D4ivjAn/3OXlaIV0VdQg6MdXm4IofKk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Zk8FhjIpdGaMPLwBRGovJ8HzZIFKyOryuzdJ4lhXvVF1S7EC3W1O+6oudNWxJWXkm
 vs5koGvEsgQRb0F+l9de2Guee/Aq44N6hZ8NK92crkLMMwLqHMl56tS2K4nArbraU6
 ULrKVlWcEEfR8GB+SZfUgjYsq7iGEyKelmJNQAzqe1Be+gFlGobagf97SqCOAzENwN
 8gM9f7LVM33AK8Zq4sN2BpE1BLo+DC043tHTjIc/uWbbxQVf0zhxKrm2gXjGvUfJqu
 R5EiuzwOgRjSsyGd1CV8N4PoRA+G7laLxzSL5ccNBr4+C/8KVEeQqUScJQUrfoN1+C
 hcl4AWu6OL+KA==
Message-ID: <d13b7bb3-989c-55eb-c7b9-41836ccb95a9@collabora.com>
Date: Mon, 14 Mar 2022 11:44:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v3 15/19] ASoC: mediatek: mt8186: add machine driver with
 mt6366, da7219 and max98357
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-16-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220313151023.21229-16-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_034504_723629_2E7D4776 
X-CRM114-Status: GOOD (  11.37  )
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

Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> Add support for mt8186 board with mt6366, da7219 and max98357.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   .../mt8186/mt8186-mt6366-da7219-max98357.c    | 924 ++++++++++++++++++
>   1 file changed, 924 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
> 

Hello Jiaxin,

I see some duplication between this one and the mt6366-rt1019-rt5682s....
....for this reason, I would propose to split out the MT6366 bits into a
common file, something like mt8186-mt6366-common.c, as to reduce the duplication.

If it is expected to see MT8186 machines with DA7219 or MAX98357, then it'd be a
good idea to also do something about preventively commonizing these ones, like
it is being done in ... MT8192, if I remember correctly.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
