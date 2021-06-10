Return-Path: <SRS0=J0kT=LE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E10C47094
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 09:46:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACF4F613E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jun 2021 09:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACF4F613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9iCn0CCQEstpPDD29JftzWlQnOd8wbJDikQYAWYlpw0=; b=2hxDF62oICyqKCUGhpMR1sTUXt
	95wtNV/9WrcSdwDYrqjZR3/h8ZT/CeiTyExNKhzCGfRImUQ3FzLKJBaSeviZySwkV7byTNfizL1Kl
	W/Q6VqvzDMTAoZvei8sCn3ZEnpIRS0N/vEJTmRb7Y9syrV2REDqTfMVyPELKJk/BdArNyIpZ02TO9
	MkF30/vi+0F2gWGILDU/9F1Jr2jaxaXLe8YsEu//AyUNhKid6Gs3XPuwOQat3tsr0JWjaiTnnVehP
	3qDTmOtccRg2rkGtXKvoN0q7nAhxeDwaiuPNbayP5LtNq6MIDVaYjDfbtwQvaep6XZvzmYBA7dHl5
	YEA4gz8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrHGB-000GLz-4W; Thu, 10 Jun 2021 09:45:59 +0000
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrGjr-0007xz-Tz; Thu, 10 Jun 2021 09:12:37 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso5944958wms.1; 
 Thu, 10 Jun 2021 02:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FBbTEMnsb2ggh860cgZ29dfHltR8ip05DHuNrwJxSGA=;
 b=HKPU4y/ltJX4LH6b2iBOVUVafQKjBqYwOGxnxqMCz7IdsQvtbGfu8NBJVrcAFNmVeY
 iHlbRQXEf6z5smPUvnlauCp+bzdb+JBhY3biq+TSYvPgzF2q6ZKLn9fSoeJoJmBcfWSu
 XLoMpgsCiQJzndS9HVfRcu2P38dkKgRWdNZknVa4ZrFbH/iWpDkpp09edTEk0JBedQWV
 SRcIXZTldJyiT/2yf9UPTbbJv1srBPXw1vYuT0NDxM5T0KbVv735Wp2HguaTDbwGgt9O
 MQgdGIEZa4rp/4QaYmSa1gCruQbdEbLDiDPaNW9FlKsZ94RAmsyMCUTo/8VTiAU7o9No
 KIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FBbTEMnsb2ggh860cgZ29dfHltR8ip05DHuNrwJxSGA=;
 b=bawleVKXARMXX0b7OgmGO/ZAoHCb1ELmPpv2LHGruXhUT+obyE54q9JD7AAyuDXqEn
 hgboiCOuy1KbrIkL8PMkYh1EKDz8sbZtjyzCsk0gEwjP2F6Ys8Zsq9CyyIZHVnziQKpQ
 d5ID8dmBBK1fjEImWkVz+wV01K5yW9d2vMJ2x9fZiYo8kRiQvDrDMw622EhZBw0zNUox
 21PV/f/rXPSAuy2Y42TETNjuOFoXi1Q1x6H3uPATKiZg2rzbb2j74xqQ7DNkgMKSmA/v
 wCSQiSJ7OyvHoHcF2JVbcFpBsCRXcW4HZDJd6roU2giEGigDBUAFEqTHPFFcazF0djdl
 BsBA==
X-Gm-Message-State: AOAM533Aw7hTFTBywsgOwNAGY9QW7ZN69w9CIn2zm4U5e6s3Ae5wmppv
 srvHtdAFT5tU6N0zmvxHhbM=
X-Google-Smtp-Source: ABdhPJyguF6nrGNiftYxWcwuL3XoumPAgYke+ltF2+g/NDmaScu9ZkK+KJiNz0fSi42lC/YWc5IA4g==
X-Received: by 2002:a1c:c3d7:: with SMTP id t206mr14053277wmf.23.1623316293433; 
 Thu, 10 Jun 2021 02:11:33 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id o5sm2799219wrw.65.2021.06.10.02.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 02:11:32 -0700 (PDT)
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: Add kukui-jacuzzi-cerise board
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20210604052312.1040707-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <5524c45b-0517-f2ff-b6dc-b2129fbd5d05@gmail.com>
Date: Thu, 10 Jun 2021 11:11:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210604052312.1040707-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_021236_045951_0FCFAF2F 
X-CRM114-Status: GOOD (  15.40  )
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



On 04/06/2021 07:23, Hsin-Yi Wang wrote:
> Cerise is known as ASUS Chromebook CZ1.
> Stern is known as ASUS Chromebook Flip CZ1.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> The difference of rev3 and non rev3 are the audio driver they use, which
> is not added in this series.
> ---
>  arch/arm64/boot/dts/mediatek/Makefile         |  4 +++
>  .../mt8183-kukui-jacuzzi-cerise-rev3.dts      | 24 +++++++++++++
>  .../mediatek/mt8183-kukui-jacuzzi-cerise.dts  | 24 +++++++++++++
>  .../mediatek/mt8183-kukui-jacuzzi-cerise.dtsi | 13 +++++++
>  .../mt8183-kukui-jacuzzi-stern-rev3.dts       | 34 +++++++++++++++++++
>  .../mediatek/mt8183-kukui-jacuzzi-stern.dts   | 34 +++++++++++++++++++
>  6 files changed, 133 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise-rev3.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dts

Both files are identical. Can we merge them and use a fallback compatible, or do
you expect changes to the different revisions in the near future?

>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cerise.dtsi
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern-rev3.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-stern.dts
> 

Same question here :)

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
