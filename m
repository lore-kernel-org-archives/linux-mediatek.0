Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6399C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 23:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9b+ujubdxF1BVM3g6XPcKIqgtFN+RmPb0wI1Xk3k1Kk=; b=W3KBaB3cZmyqXO
	9aUIAodgq66XZP1nn00gLlGcDgJJRzBVw3zV5tOCJvnqGTi4RPqyvgmFjlHZ4XOfHFWwJCBO0TiA+
	THq2Dfxfj1N2zgZTWnfD1fsR7PrgUNv86DlwBNNZjKthCMmpjhSvrmaOCrdXd5TCM9fpGQNpAckkI
	Z56/FfqbCo4RSpULGraX2r7sOaWWsQB6JYlzmr+UnjjMw+Hyfl9vwoTXjrZKe/cTOdNCmRvQDxBO3
	PMiHiKw0PnTozdzMGZLWHXx7ubJ7oyjZZS0E3n705hgTzPzAC82gKVHrWy74HbM0hvn3BlZQDHRRC
	UOldmDkB3BQOVBYuZf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZL23-00Diet-BS; Tue, 29 Mar 2022 23:13:47 +0000
Received: from mail-oi1-f175.google.com ([209.85.167.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZL20-00Die5-U9; Tue, 29 Mar 2022 23:13:46 +0000
Received: by mail-oi1-f175.google.com with SMTP id q189so20493182oia.9;
 Tue, 29 Mar 2022 16:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IExzvSw3a194l6T1N/gwY3qoCvj4gnDhEAY3Ha2H9NY=;
 b=IVxmWTPQlGcJHkIeAo37OPCaQYPkmh5Fv9BqRpuZengds3M6ZI96kdy7F3pmDCz84n
 paLrIo3mvTB5qiQyGCaIhTZ7PdSzNiZXqRcSiI9fGePeugP71W6d912DXrj/Xh34Pf43
 M1IKVKteCIIcmvg88IxwWXzG71EFj3s58LmMfhypA8FjxYf21gqCd+/Er8PwQs9sOHdp
 VonRiCUHD3Y4Ul2htG76kpOTjuqOJnZF2QZp03lCyZU8qvogNKEqZvFT4CF1PDsqq1hT
 11fnpvfdEDEbhq8uEhkV6XI+8G6bhCjjsPpz1yD5M8j6Xsj1t2nmmtulPXDYjUsyfYvH
 Iq+g==
X-Gm-Message-State: AOAM532vLUs9Kcchrt5FirDjc7B4+bPvupy/2/b7z62/T4Z8LzbOVJBa
 HduRvnyZwP0bKwLsZEA9kw==
X-Google-Smtp-Source: ABdhPJyWbndVtnhZaOGxEK/6LBjkh8P9MSyR1tz8YaNIP/1OyKH/D8GFHdQieHcEBMcWDY8Iaw2XEw==
X-Received: by 2002:aca:4043:0:b0:2ef:f455:7ac9 with SMTP id
 n64-20020aca4043000000b002eff4557ac9mr679218oia.71.1648595623047; 
 Tue, 29 Mar 2022 16:13:43 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m16-20020a9d4c90000000b005cb214bef81sm9721558otf.43.2022.03.29.16.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 16:13:42 -0700 (PDT)
Received: (nullmailer pid 1531833 invoked by uid 1000);
 Tue, 29 Mar 2022 23:13:41 -0000
Date: Tue, 29 Mar 2022 18:13:41 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org, aaronyu@google.com,
 linmq006@gmail.com, linux-arm-kernel@lists.infradead.org, tzungbi@google.com,
 linux-kernel@vger.kernel.org, broonie@kernel.org, trevor.wu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, robh+dt@kernel.org
Subject: Re: [v7 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <YkOSpctgU9w9xhh0@robh.at.kernel.org>
References: <20220324064511.10665-1-jiaxin.yu@mediatek.com>
 <20220324064511.10665-2-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220324064511.10665-2-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_161344_997768_6AAC2CD0 
X-CRM114-Status: UNSURE (   9.25  )
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

On Thu, 24 Mar 2022 14:45:08 +0800, Jiaxin Yu wrote:
> 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machine
> with rt1015p and rt5682s.
> 2. Adds new property "headset-codec" for getting headset codec.
> 3. Adds new property "speaker-codecs" for getting speaker codecs.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
