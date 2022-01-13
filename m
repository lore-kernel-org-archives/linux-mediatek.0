Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB386C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 16:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eByFHtZU5SW+BdFIQ9uL7+fphcU/G+A1QeokgRp9PqA=; b=2JZ5DqIwvWHPKi
	81Jno9+s49z8xPGwu0Ls03f9r7YoG2Lny5amyqCKHpBFuYcpjgbI/qvTFYP8pQuZpmPM30kfUSfj6
	sCJN26TWdb+XHZazck7R0vPrcqkYEskg+FpG6C6PPoQ0Nz6LOA76t46SiXjaoGCqNVgRl4VNVTD2+
	V04HxjrgA+Yqyj6BkbFPKEmsfBdpWJlVkYGOmW0zuzbH3B7B2hf+Cf2ac2MvTyQVvL28aTKYGOcPD
	TUWzr+mIEr8Qfs3BWb58I7hK0mFKWWnvlFIzuQWtlyJXztQcq/fjsfNjHCfHahXU9+oKPohigVUgV
	cF7hSn3+RmuWfMEqqccw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82iH-006VxZ-4O; Thu, 13 Jan 2022 16:12:33 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82g9-006Udk-Q3; Thu, 13 Jan 2022 16:10:23 +0000
Received: by mail-wm1-x335.google.com with SMTP id
 ay4-20020a05600c1e0400b0034a81a94607so3060455wmb.1; 
 Thu, 13 Jan 2022 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SPmaJub/jt94ihGwagtrfHtir8UBrBvypTKNKojeyrA=;
 b=BVBB+Qut1wf0yDLs2pgabC7QOG2Sq+20jm8ssrux8M/cL6yIEQ1cLoONRsJ3tAFOB7
 mAVtexOZomadjCBu5HS3//ck38nB8thHf4Vsb7B2Gu4SmYo1PXrWLt2A/RhTYRAs6chT
 A2yuc9kt7p1baJ7py4FCWgs7rw24L85tVk/4W8LVfElgZ03rT963kaaa4VkbN1DiwUXJ
 qnZsvby+F23F9gT8jaP+rJib0mnv6iej7oPfza94pno6s+bMVe/moC6XsPcGH0KE1brn
 /SZzMZYnKFEdbiVSWGxvCwwKgWv2AzgqwSWAiyOixbcDRB9AlAXLXpExApLKl7EkW3Oy
 FPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SPmaJub/jt94ihGwagtrfHtir8UBrBvypTKNKojeyrA=;
 b=5n0Z/g1UeoGs/bUOMubyJ9ou/FoiuKrfE9w1dxv4wiEv37gYexiPli6r73g4KmKnVD
 L+BJ63itOvNNRnlgtbUXNLDYao4bpQSyMSNhJ7mfinW3uLSqPD4iU7zSb9LB5FglckzV
 7twpCsZGxa//EiQiOACFSm5WXkDru2nty0Gh01xptfB0XiX6GjgmwYNcoJ5hNzV2V66t
 C7ccoW4jPhI0OocLSF/0rKzDGdMfXc0n+ApLdcvAUyO7xAVLoxU146EiuMLvpo0xUWM1
 +XrIf6uUlR816xlI0uZviqevaCHKOyAq/ihEcnykN1w1+In6lSZvfjngmOXv4ANikWZ5
 2ljg==
X-Gm-Message-State: AOAM5338iWGATxTu++aQDBYIiabcriL3hWYUm+rgdwq5WjN7yqlUBesj
 hSK54UO7DOufuLDx89Wv0JgUyk7sfpI=
X-Google-Smtp-Source: ABdhPJz71D45GcRwagirhvSlyWM52OERaCgTDonsBE7CR9XIAMLCsE2GIYUK2N2X+W/NKuR3LQ9Flg==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr11718665wmb.5.1642090219767; 
 Thu, 13 Jan 2022 08:10:19 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id f8sm9488614wmg.3.2022.01.13.08.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 08:10:19 -0800 (PST)
Message-ID: <e940d705-2057-4d5e-0a21-8464ca04caaf@gmail.com>
Date: Thu, 13 Jan 2022 17:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, yf.wang@mediatek.com,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 anan.sun@mediatek.com, srv_heupstream@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 Robin Murphy <robin.murphy@arm.com>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
 <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
 <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_081021_923324_3668A683 
X-CRM114-Status: GOOD (  14.62  )
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

Hi Hans,

On 13/01/2022 11:15, Hans Verkuil wrote:
> On 13/01/2022 11:11, AngeloGioacchino Del Regno wrote:
>> Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
>>> Il 12/11/21 11:55, Yong Wu ha scritto:
>>>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>>>> then remove that function, use pm_runtime_disable instead.
>>>>
>>>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>>>> rename it from the _pm to _clk.
>>>>
>>>> No functional change.
>>>>
>>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>>> CC: Irui Wang <irui.wang@mediatek.com>
>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>
>> Hello Yong,
>> the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
>> scheduled that for v5.18.
>>
>> Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
>> media: mtk-vcodec: *) from this series?
>>
>> For the records, I think that after sending v10 this series is ready to be merged,
>> as it was well reviewed and also tested on many MTK platforms.
> 
> Good to know. When I have the v10 I'll try to prioritize reviewing it and running
> my usual tests.
> 
> Yong, please make sure you run 'checkpatch.pl --strict' over the v10 patches and fix
> any issues (using common sense).
> 

Can you please take me in the look when you take the patches. I'll take the DTS 
related as soon as you queue up the others.

Thanks!
Matthias

> Regards,
> 
> 	Hans
> 
>>
>> Thank you,
>> - Angelo
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
