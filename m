Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC126C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 09:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IbgzvwEWY0paOvS4a1Cw5jqHB1lNTJk4ThEHr41IM7c=; b=exQCGQWPXrbVN4Dl4Ag218aWEu
	0aXBWMOKV4UPtDhqzXel9HRDcshyNs93IOrc01UZHaj53dfEzSxfmvD0LYcNbhaBpbJv92SDoOu3L
	k+JbgDT5r9g41zj3myb5f0pT/3rvhpHqtvQqxA5CrMkEIF8YJsudG8uFU+FcpA76Mebt5sN+gBqGE
	99o/Xz29NqfQYXSrJymITmo1K8954FDdewkAxB2BIviaGRPHyRPoa70CydduMxEr0ehEBg4WDP+0Q
	mNOl5dEJSDfsI9jc/qAz9leencj/4UqIFDoAcqkLOI5fl6KghWZuwrixzRUMkkgJyjizNLhLVsYy4
	wv5TbOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzDe-00BDu7-0p;
	Tue, 12 Dec 2023 09:38:26 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzDb-00BDtc-1x
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Dec 2023 09:38:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702373902;
	bh=oxKgRG6quJSZbHx7hNPWtIKRcBJUqNGwD9FJGRZkKHE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CVmSDqG3KenL7h+0OLy1a1lk+5fH2z99MwyzCMhg7wXCoFDJVwSa6WkzUDOzGBv26
	 STQDtJhkPEWudJB4/hJMO1oa6ekN6rEpVGYEtr7zLBuDxPUdcdCFXr19EFKK/iffp7
	 5RfC2wxN3hEceo+W2C7ij/avNO/lj+s2KU/RLlCFw3viBebVblEYckttIy2QRIlMZJ
	 Hv623Gg2EYz4JTrx9WIvmVTphCOcjih4cSdGWe3bXDXSd5PcT0Z+fT02dxZKvs0ReC
	 j2D89tIeIJ9rSHxVXpeX/8qs0kCNso0V7BhEhbtDXkjaUn0faWF1f22RlCej2lY38Y
	 qqS7vA5PnSZMQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 692973781423;
	Tue, 12 Dec 2023 09:38:21 +0000 (UTC)
Message-ID: <254e8913-7f42-4af0-af9b-ee32b4fccdc2@collabora.com>
Date: Tue, 12 Dec 2023 10:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v8 3/4] ASoC: mediatek: mt8188-mt6359: add es8326 support
Content-Language: en-US
To: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 trevor.wu@mediatek.com, allen-kh.cheng@mediatek.com,
 kuninori.morimoto.gx@renesas.com, linux-mediatek@lists.infradead.org
References: <20231208070933.720324-1-zhourui@huaqin.corp-partner.google.com>
 <20231208070933.720324-4-zhourui@huaqin.corp-partner.google.com>
 <db3429e0-0173-4f13-bccb-78ac56ad4ed9@collabora.com>
 <CABRjgzvUz6BTSFHCMAGL6e3LWMyGfnJsJJ0j1M_CvBr9wMb49A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CABRjgzvUz6BTSFHCMAGL6e3LWMyGfnJsJJ0j1M_CvBr9wMb49A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_013823_843297_A490D8E2 
X-CRM114-Status: UNSURE (   8.46  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/12/23 05:04, Rui Zhou ha scritto:
> Hi Angelo,
> Because the TDM interface defined by mt8188_max98390_ops sets a fixed 4
> slots, so if the current sound card only supports two amps, we need to skip
> this setting.
> By the way, do you think this comment is okay?
> /*
>   * The TDM protocol settings with fixed 4 slots are defined in
>   * mt8188_max98390_ops. Two amps is I2S mode,
>   * SOC and codec don't require TDM settings.
> */
> if (!(card_data->quirk & MAX98390_TWO_AMP)) {
> dai_link->ops = &mt8188_max98390_ops;
> }

That's perfect. Waiting for v9.

Cheers,
Angelo


