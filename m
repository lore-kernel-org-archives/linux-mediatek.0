Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F6E4C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 19:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DX3yF2JNvu6/Fxu4Za4yQXD/UPEj9fRLrpyFbqNUgko=; b=qxp6qXaZZzDC0/68FEM7aLblv6
	KB7oU/F1Pa62/+e6wdramxuvqx+Rf0hzSY9ypHrbRvMsVWp/+RsUgjHTCEb7fxvzgi6fpnvCMlPzB
	tRuXp80BjmQY62xIqoFzwYG4i4SMTTT7kvXvUilzS2HZQN64WbD/VP3e02XNsFCEFyoV+XDB4+VY8
	BtD/UMUHo44SYh8npSq5W4roRBRa8FEFIwSDjl6Fkn4dKmXGDbJm+i3JTOwfVsbKHZagyg1PR+APw
	nH7EmfadAkctnxvjUUd+oVSzGmB8/Vorwgka5wq9zNXMbiuord5W/ozK4u8PEb6QV7y5K8Qq2Mrpa
	3F56/NJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMvZ6-0064s0-0J;
	Mon, 08 Jan 2024 19:45:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMvZ1-0064rG-2Z
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jan 2024 19:45:38 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-50eabfac2b7so2268047e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jan 2024 11:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704743133; x=1705347933; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DX3yF2JNvu6/Fxu4Za4yQXD/UPEj9fRLrpyFbqNUgko=;
        b=J4rJzvgv3/xP8qJ3Nke8AMRywQ8KnUIXAJqHSR8zopFJaQz+TPWaBhHIBHwn8TidUK
         J6xC8h0H74ag7VgUwwx5NWIj10PCXL6Uh3IsbF3cmVWmP1tgGrZg9m0worbclfNq9nMa
         OFljV9XwdiYrCpiUWsVt+rhdCZVw3b0Vsn4+ImDU1GLnK7r4nrbLT1qt7131zRF3xDpU
         Me7jWl4zLuPeMCiGM+MayVIIatJbnoQ2aqvoOhgNDACmluJjw/Sf1/IDzRFpp+Kjw9Jr
         RDhCrdw+UfjEckQ29wvb5wa7971BGuXKRxxkIs/3cb71IveibhbIqt01Q4Kxq0ZQFbj+
         pCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704743133; x=1705347933;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DX3yF2JNvu6/Fxu4Za4yQXD/UPEj9fRLrpyFbqNUgko=;
        b=gDRLKkJvRfYHTA3ybKBUawD13zfmLQqs+pQSjIxziwmABPz5ZtriIFx/uHrAf0EdnC
         8o4EwwVXhZKorhZXxiRwzwlNpyIchFU0ayTwkEcJCTUCioBcNhOlM+t0+lOEgJuKp9w6
         uXqhUpsna5s4KvtZ3ziSxLX6PbBlsnnuhQdNCC3yoRoMeGd3uDW8kAyT1TjvSrquWjRz
         CgDK9eHQMm2xqxKiH7e/oQHhVYdWXh2Et0gQXNH5jrukLKE3g9gO5uro1jfv1DcaqdvX
         RifZi0IRxSf6RMVQI/b1t89Uu/XbB/gn/Aamfc3B8MGxAUj9ycKATGwU3tOwvDILCGRv
         KH3w==
X-Gm-Message-State: AOJu0YxQEIAsNWH3OsX2sTiz7Oys7S0oYOwQ6nEwqoH2zOWBIMqGmbED
	Ea9tNFZJOxsyLJu3tXuYuDPywvNyTBAwuw==
X-Google-Smtp-Source: AGHT+IFsDvX5CEXvMenXkidfIHO0DoXgGLeD/ILb7vLHTPacwac9o5fGcDSkGD9LnOXCpOfp3YahFg==
X-Received: by 2002:a05:6512:31c2:b0:50e:bcde:f47b with SMTP id j2-20020a05651231c200b0050ebcdef47bmr1614184lfe.58.1704743133389;
        Mon, 08 Jan 2024 11:45:33 -0800 (PST)
Received: from blmsp ([2001:4091:a246:821e:6f3b:6b50:4762:8343])
        by smtp.gmail.com with ESMTPSA id h26-20020a17090619da00b00a29beb20353sm189093ejd.192.2024.01.08.11.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 11:45:32 -0800 (PST)
Date: Mon, 8 Jan 2024 20:45:31 +0100
From: "msp@baylibre.com" <msp@baylibre.com>
To: Yu-chang Lee =?utf-8?B?KOadjuemueeSiyk=?= <Yu-chang.Lee@mediatek.com>
Cc: "fparent@baylibre.com" <fparent@baylibre.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Ben Lok =?utf-8?B?KOmZuOW/l+aBhik=?= <ben.lok@mediatek.com>, 
	Chris-qj Chen =?utf-8?B?KOmZs+Wlh+mAsik=?= <Chris-qj.Chen@mediatek.com>, Louis Yu =?utf-8?B?KOa4uOaUv+mMlSk=?= <louis.yu@mediatek.com>, 
	Bear Wang =?utf-8?B?KOiQqeWOn+aDn+W+tyk=?= <bear.wang@mediatek.com>, 
	MandyJH Liu =?utf-8?B?KOWKieS6uuWDlik=?= <MandyJH.Liu@mediatek.com>, "amergnat@baylibre.com" <amergnat@baylibre.com>, 
	"afgros@baylibre.com" <afgros@baylibre.com>, 
	Xiufeng Li =?utf-8?B?KOadjuengOWzsCk=?= <Xiufeng.Li@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	Fan Chen =?utf-8?B?KOmZs+WHoSk=?= <fan.chen@mediatek.com>, "abailon@baylibre.com" <abailon@baylibre.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: Need help to validate power domain driver modification on mt8365
Message-ID: <jqmcjyk7rthljefkgcsysmeys2uwjnt2otjg5cawzdxlkq4ui2@ycpciyzqwwfs>
References: <d4445c168a15c03ebfe3bc88dc12b219f08a81d5.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4445c168a15c03ebfe3bc88dc12b219f08a81d5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_114536_040384_E555F930 
X-CRM114-Status: GOOD (  14.19  )
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

Hi Yu-chang.lee,

On Tue, Dec 26, 2023 at 06:56:39AM +0000, Yu-chang Lee (李禹璋) wrote:
> Hi Markus,
> 
> Attachment 0003 is the proposal I make for the clamp protection issue
> we last discussed and others are some dependency patch. Since smi has
> have two type of protection but in different stage. So I eventually
> decide to separate it. May you help test these patch on mt8365, I test
> it a bit on mt8188 and it work fine. Still any advice and modification
> are welcome!

Could you please send your patches as a series using git send-email? It
is easier to discuss patches that way as I can do inline comments.
Thank you!

I personally actually liked the suggestion of Angelo to do a strict
ordering in bp_cfg. I see you split the config into a separate field
now, .clamp_smi.

Best,
Markus

> 
> SMI protection type
> 1. clamp 
> 2. bus protection
> 
> For example: power on 
> "clamp protection enable" (smi, with clamp flag)
>   -> regulator enable 
>     ...
>       -> clamp protection disaled (smi, with clamp flag)
>         -> bus protection disabled (smi -> infra)
> 
> For example: power off
> "clamp protection enable" (smi, with clamp flag)
>   -> bus protection enable (infra -> smi)
> 
> Best Regards,
> Yu-chang.lee





